import numpy as np
import os
import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.autograd import Variable
import imageio as imio
from Models.models import pytorch_model



class RawEnvironment():
    def __init__(self):
        self.num_actions = None # this must be defined
        self.itr = 0 # this is used for saving, and is set externally
        self.save_path = "" # save dir also is set externally

    def step(self, action):
        '''
        self.save_path is the path to which to save files, and self.itr is the iteration number to be used for saving.
        The format of saving is: folders contain the raw state, names are numbers, contain 2000 raw states each
        obj_dumps contains the factored state
        empty string for save_path means no saving state
        Takes in an action and returns:
            next raw_state (image or observation)
            next factor_state (dictionary of name of object to tuple of object bounding box and object property)
            done flag: if an episode ends, done is True
        '''
        pass

    def getState(self):
        '''
        Takes in an action and returns:
            current raw_state (dictionary of name of object to raw state)
            current factor_state (dictionary of name of object to tuple of object bounding box and object property)
        '''
        pass

    def set_save(self, itr, save_dir, recycle):
        self.save_path=save_dir
        self.itr = itr
        self.recycle = recycle
        try:
            os.makedirs(save_dir)
        except OSError:
            pass


class ChainMDP(RawEnvironment):
    def __init__(self, num_states):
        super(ChainMDP, self).__init__()
        self.minmax = (0,num_states)
        self.num_states = num_states
        self.initial_state = np.array([self.num_states//2])
        self.current_state = self.initial_state

    def step(self, action):
        if action == 0 and self.current_state[0] > 0:
            v = self.current_state[0] - 1
            self.current_state = np.array([v])
        elif action == 1:
            pass
        elif action == 2 and self.current_state[0] < self.num_states-1:
            v = self.current_state[0] + 1
            self.current_state = np.array([v])
        done = self.current_state[0] == self.num_states - 1
        if len(self.save_path) != 0:
            state_path = os.path.join(self.save_path, str(self.itr//2000))
            try:
                os.makedirs(state_path)
            except OSError:
                pass
            # imio.imsave(os.path.join(state_path, "state" + str(self.itr % 2000) + ".png"), self.current_state)
            # print(self.save_path, state_path)
            if self.itr != 0:
                object_dumps = open(self.save_path + "/object_dumps.txt", 'a')
            else:
                object_dumps = open(self.save_path + "/object_dumps.txt", 'w') # create file if it does not exist
            # print("writing", self.save_path + "/object_dumps.txt")
            object_dumps.write("chain:"+str(self.current_state[0]) + "\t\n")
            object_dumps.close()
        self.itr += 1
        if self.itr % 20 == 0:
            self.current_state =self.initial_state

        # if done:
        #     self.current_state[0] = 0
        return self.current_state, {"chain": (self.current_state, 1)}, done

    def getState(self):
        return self.current_state, {"chain": (self.current_state, 1)}


class ProxyEnvironment():
    def __init__(self, name= "0"):
        '''
        create a dummy placeholder
        '''
        self.name = name

    def initialize(self, args, proxy_chain, reward_fns, state_get, behavior_policy):
        '''
        an environment with (sub)states that are a subspace of the true states, actions that are options with a shared state space,
        and rewards which are based on the substates
        proxy_chain is the remainder of the proxy chain, after this environment
        reward_fns are the reward functions that specify options at this edge represented by this proxy environment
        state_get is the state extraction class for this edge
        In order to create a classic RL system, just use a single element list containing the true environment as the proxy chain
        '''
        self.proxy_chain = proxy_chain
        self.reward_fns = reward_fns
        self.stateExtractor = state_get
        self.iscuda = args.cuda

        self.swap_form = args.swap_form
        self.delayed_swap = False
        if args.swap_form in ['reward']:
            self.delayed_swap = True
        self.swap = True
        self.current_action = 0
        self.num_hist = args.num_stack
        self.state_size = self.stateExtractor.shape
        self.action_size = self.stateExtractor.action_num
        self.lag_num = args.lag_num
        self.behavior_policy = behavior_policy
        self.reset_history()
        self.extracted_state = pytorch_model.wrap(self.stateExtractor.get_state(proxy_chain[0].getState())[0], cuda=args.cuda)
        self.resp = pytorch_model.wrap([0 for i in range(len(self.stateExtractor.fnames))], cuda=args.cuda)
        self.insert_extracted()
        self.changepoint_queue_len = args.changepoint_queue_len
        self.changepoint_shape = self.reward_fns[0].get_trajectories([proxy_chain[0].getState()]).shape[1:]
        self.changepoint_queue = torch.zeros(self.changepoint_queue_len, *self.changepoint_shape).detach()
        self.changepoint_resp_queue = torch.zeros(self.changepoint_queue_len, *self.resp.shape).detach()
        self.changepoint_action_queue = torch.zeros(self.changepoint_queue_len, 1).long().detach() # TODO: add responsibility to changepoints
        if self.iscuda:
            self.changepoint_queue = self.changepoint_queue.cuda()
            self.changepoint_action_queue = self.changepoint_action_queue.cuda()
            self.changepoint_resp_queue = self.changepoint_resp_queue.cuda()

        self.changepoint_at = 0
        self.cp_filled = False

        print("num_reward_functions", len(self.reward_fns))

    def get_names(self):
        if len(self.proxy_chain) > 1:
            return self.proxy_chain[-1].get_names() + [self.name]
        else: 
            return [self.name]

    def set_save(self, itr, save_dir, recycle):
        '''
        sets the files for saving the action data
        '''
        self.save_path=save_dir
        self.itr = itr
        self.recycle = recycle
        if len(self.save_path) > 0:
            try:
                os.makedirs(save_dir)
            except OSError:
                pass
            self.save_files = []
            for name in self.get_names():
                f = open(os.path.join(self.save_path, name + "_actions.txt"), 'w')
                print(os.path.join(self.save_path, name + "_actions.txt"))
                self.save_files.append(f)

    def save_actions(self, action_list):
        if len(self.save_path) > 0:
            for i, action in enumerate(action_list):
                self.save_files[i].write(str(int(pytorch_model.unwrap(action.squeeze()))) + '\n')

    def close_files(self):
        if len(self.save_path) > 0:
            for f in self.save_files:
                f.close()

    def set_models(self, models):
        self.models = models

    def duplicate(self, args):
        if len(self.reward_fns) > len(self.models.models) or args.adjustment_model:
            self.reward_fns[0].parameter_minmax = None
            self.models.duplicate(len(self.reward_fns), args, self.stateExtractor, self.reward_fns[0].parameter_minmax)

    def set_proxy_chain(self, proxy_chain):
        self.proxy_chain = proxy_chain

    def set_test(self):
        self.behavior_policy.set_test()

    def set_checkpoint(self):
        '''
        sets a save point that can be returned to later
        '''
        self.saved_current_state = self.current_state.clone().detach()
        self.saved_extracted_state = self.extracted_state.clone().detach()
        self.proxy_chain[-1].set_checkpoint()

    def load_checkpoint(self):
        self.current_state = self.saved_current_state
        self.extracted_state = self.saved_extracted_state
        self.proxy_chain[-1].set_checkpoint()

    def reset_history(self):
        self.current_state = pytorch_model.wrap(np.zeros((self.num_hist * int(np.prod(self.state_size)), )), cuda = self.iscuda)
        self.current_resp = pytorch_model.wrap([[0 for i in range(len(self.stateExtractor.fnames))] for _ in range(self.num_hist)], cuda = self.iscuda)
        # TODO: add multi-process code someday

    def insert_extracted(self):
        '''
        self.current_state has history, and is of shape: [hist len * state size] TODO: [batch/processor number, hist len * state size]
        '''
        shape_dim0 = self.num_hist # make sure this is 1 if no history is to be used
        state_size = int(np.prod(self.state_size))
        if self.num_hist > 1:
            self.current_state[:(shape_dim0-1)*state_size] = self.current_state[-(shape_dim0-1)*state_size:]
            self.current_resp[:-1] = self.current_resp[1:]
        self.current_state[-state_size:] = self.extracted_state # unsqueeze 0 is for dummy multi-process code
        # print(self.current_resp, self.resp)
        self.current_resp[-1] = self.resp
        return self.current_state

    def getState(self):
        return self.extracted_state

    def getResp(self):
        return self.resp

    def getHistState(self):
        return self.current_state, self.current_resp

    def step(self, action, model=False, action_list=[]):
        '''
        steps the true environment. The last environment in the proxy chain is the true environment,
        and has a different step function.
        raw_state is the tuple (raw_state, factor_state)
        model determines if action is a model 
        extracted state is the proxy extracted state, raw state is the full raw state (raw_state, factored state),
        done defines if a trajectory ends, action_list is all the actions taken by all the options in the chain
        '''
        if self.swap:
            self.current_action = action
        else:
            action = self.current_action
        if model:
            if self.swap:
                values, dist_entropy, probs, Q_vals = self.models.determine_action(self.current_state, self.current_resp)
                action_probs, Q_vs = models.get_action(probs, Q_vals, index = action)
                action = self.behavior_policy.take_action(probs, Q_vals)
                self.current_action = action
            else:
                action = self.current_action
            # if issubclass(self.models.currentModel(), DopamineModel): 
            #     reward = self.computeReward(rollout, 1)
            #     action = self.models.currentModel().forward(self.current_state, reward[self.models.option_index])
        if len(self.proxy_chain) > 1:
            state, base_state, resp, done, action_list = self.proxy_chain[-1].step(action, model=True, action_list = [action] + action_list)
        else:
            raw_state, factored_state, done = self.proxy_chain[-1].step(action)
            action_list = [action] + action_list

        if done:
            self.reset_history()
        self.raw_state = (raw_state, factored_state)
        # TODO: implement multiprocessing support
        state, resp = self.stateExtractor.get_state(self.raw_state)
        self.resp = pytorch_model.wrap(resp, cuda=self.iscuda)
        self.extracted_state = pytorch_model.wrap(state, cuda=self.iscuda).unsqueeze(0)
        self.insert_extracted()
        if not model: # at the top level
            self.save_actions(action_list)
        self.insert_changepoint_queue(self.cp_state, pytorch_model.wrap(action, cuda=self.iscuda), pytorch_model.wrap(resp, cuda=self.iscuda))
        if self.delayed_swap and self.swap: # we just swapped and we are using delayed swapping
            self.swap = False
        return self.extracted_state, self.raw_state, self.resp, done, action_list, 

    def step_dope(self, action, rollout, model=False, action_list=[]):
        '''
        steps the true environment, using dopamine models. The last environment in the proxy chain is the true environment,
        and has a different step function (performs model updates and most state saving inside dopamine)
        '''
        if model:
            reward = self.computeReward(rollout, 1)
            action = self.models.currentModel().forward(self.current_state, reward[self.models.option_index])
        if len(self.proxy_chain) > 1:
            state, base_state, done, action_list = self.proxy_chain[-1].step(action, model=True, action_list = [action] + action_list)
        else:
            raw_state, factored_state, done = self.proxy_chain[-1].step(action)
            action_list = [action] + action_list

        if done:
            self.reset_history()
        self.raw_state = (raw_state, factored_state)
        # TODO: implement multiprocessing support
        state, resp = self.stateExtractor.get_state(self.raw_state)
        self.extracted_state = pytorch_model.wrap(state, cuda=self.iscuda).unsqueeze(0)
        self.insert_extracted()
        self.insert_changepoint_queue(self.cp_state, pytorch_model.wrap(action, cuda=self.iscuda), pytorch_model.wrap(resp, cuda=self.iscuda))
        return self.extracted_state, self.raw_state, done, action_list

    def computeReward(self, length):
        # TODO: probably doesn't have to be in here
        if self.cp_filled:
            states = torch.cat([self.changepoint_queue[self.changepoint_at+1:], self.changepoint_queue[:self.changepoint_at+1]], dim=0) # multiple policies training
            actions = torch.cat([self.changepoint_action_queue[self.changepoint_at+1:], self.changepoint_action_queue[:self.changepoint_at+1]], dim=0)
        else:
            states = self.changepoint_queue[:self.changepoint_at+1] # multiple policies training
            actions = self.changepoint_action_queue[:self.changepoint_at+1]
        rewards = []
        # print(rollout.changepoint_queue.shape)
        # print(states)
        for reward_fn in self.reward_fns:
            rwd = reward_fn.compute_reward(states,actions)
            if len(rwd) < length: #queue not yet filled enough
                ext = torch.zeros((length - len(rwd), )).cuda().detach()
                # print(ext.shape)
                rwd = torch.cat([ext, rwd], dim = 0)
            # print(rwd.shape, length)
            rewards.append(rwd)
        # print(torch.stack(rewards, dim=0)[:,-length:].shape)
        # print(states, rollout.extracted_state)
        # print(length, torch.stack(rewards, dim=0).shape, torch.stack(rewards, dim=0)[:,-length:].shape)
        # error
        # print(rewards, rollout.lag_num, -length-rollout.lag_num)
        # if rewards > 0:
        #     error
        self.current_rewards = torch.stack(rewards, dim=0)[:,-length-self.lag_num:-self.lag_num]
        return self.current_rewards

    def determine_swaps(self, length, needs_rewards=True):
        if len(self.proxy_chain) > 1:
            self.proxy_chain[-1].determine_swaps()
        if self.swap_form == "dense": # TODO: swap based on rewards for all
            self.swap = True
        elif self.swap_form == "reward":
            if needs_rewards:
                rewards = self.computeReward(length)
            self.swap = rewards.sum() > 0.3

    def changepoint_state(self, raw_state):
        self.cp_state = self.reward_fns[0].get_trajectories(raw_state)
        if self.iscuda:
            self.cp_state = self.cp_state.cuda()
        return self.cp_state

    def insert_changepoint_queue(self, state, action, resp):
        if self.changepoint_queue_len > 0:
            self.changepoint_action_queue[self.changepoint_at].copy_(action.squeeze().detach())
            self.changepoint_resp_queue[self.changepoint_at].copy_(resp.squeeze().detach())
            self.changepoint_queue[self.changepoint_at].copy_(state.squeeze().detach())
            if self.changepoint_at == self.changepoint_queue_len - 1:
                self.cp_filled = True
                self.changepoint_at = 0
            else:
                self.changepoint_at += 1
