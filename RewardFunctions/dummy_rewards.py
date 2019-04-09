import torch
from Models.models import pytorch_model
import numpy as np
from RewardFunctions.changepointReward import ChangepointReward
from file_management import get_edge


class BounceReward(ChangepointReward):
    def __init__(self, vel, args):
        super().__init__(None, args)
        self.anybounce = False
        self.desired_vels = [pytorch_model.wrap([-2.,-1.], cuda=args.cuda), pytorch_model.wrap([-1.,-1.], cuda=args.cuda), pytorch_model.wrap([-1.,1.], cuda=args.cuda), pytorch_model.wrap([-2.,1.], cuda=args.cuda)]
        if vel == -1:
            self.anybounce = True
        self.desired_vel = self.desired_vels[0]
        if vel == 0:
            self.desired_vel = self.desired_vels[0]
        elif vel == 1:
            self.desired_vel = self.desired_vels[1]
        elif vel == 2:
            self.desired_vel = self.desired_vels[2]
        elif vel == 3:
            self.desired_vel = self.desired_vels[3]
        self.form = args.reward_form


    def compute_reward(self, states, actions):
        '''
        states must have at least two in the stack: to keep size of rewards at num_states - 1
        assumes ball is the last state
        assuming input shape: [state_size = num_stack*traj_dim]
        '''
        rewards = []
        # print(states.shape)
        for last_state, state, action, nextstate in zip(states, states[1:], actions, states[2:]):
            last_state = last_state.squeeze()
            state = state.squeeze()
            nextstate = nextstate.squeeze()
            state_first = last_state[:2]
            state_second = state[:2]
            proximity = state[:2] - state[-2:]
            state_third = nextstate[:2]
            # print(state_second.shape, state.shape, state_first.shape)
            v1 = state_second - state_first
            v2 = state_third - state_second
            # print(state_first, state_second, state_third)
            rewarded = False
            if v1[0] > 0 and state_second[0] > 65: # was moving down, below the blocks
                if torch.norm(v2 - self.desired_vel) == 0:
                    rewards.append(1)
                    rewarded = True
                elif self.anybounce:
                    for v in self.desired_vels:
                        if torch.norm(v2 - v) == 0:
                            # print ("REWARD", v1, v2)
                            rewards.append(1)
                            rewarded = True
            if not rewarded:
                if self.form == 'dense':
                    # rewards.append(-abs(proximity[1] / (proximity[0] + .1) * .1))
                    rewards.append(-abs(proximity[0] + proximity[1]) * 0.001)
                if self.form.find('xdense') != -1:
                    if proximity[0] == 3 and self.form.find('neg') != -1:
                        rewards.append(-1)
                    # rewards.append(-abs(proximity[1] / (proximity[0] + .1) * .1))
                    else:
                        rewards.append(-abs(proximity[1]) * 0.001)
                else:
                    # print(proximity[0])
                    if proximity[0] == 3 and self.form == 'neg':
                        rewards.append(-1)
                    else:
                        rewards.append(0)
        return pytorch_model.wrap(rewards, cuda=self.cuda)

class Xreward(ChangepointReward):
    def __init__(self, args): 
        super().__init__(None, args)
        self.traj_dim = 2 # SET THIS
        self.head, self.tail = get_edge(args.train_edge)
        self.name = "x"


    def compute_reward(self, states, actions):
        '''
        states must have at least two in the stack: to keep size of rewards at num_states - 1
        assumes ball is the last state
        assuming input shape: [state_size = num_stack*traj_dim]
        '''
        rewards = []
        # print(states.shape)
        for last_state, state, action, nextstate in zip(states, states[1:], actions, states[2:]):
            base = state.squeeze()[:2]
            corr = state.squeeze()[-2:]
            # print(base, corr)
            state = base-corr
            # print(state, -abs(int(state[1])))
            rewards.append(-abs(int(state[1])))
        return pytorch_model.wrap(rewards, cuda=True)



class RewardRight(ChangepointReward):
    def compute_reward(self, states, actions):
        '''

        TODO: make support multiple processes
        possibly make this not iterative?
        '''
        rewards = []
        for state, action, nextstate in zip(states, actions, states[1:]):
            # print(state)
            if state - nextstate == -1:
                rewards.append(2)
            else:
                rewards.append(-1)
        return pytorch_model.wrap(rewards, cuda=True)

class RewardLeft(ChangepointReward):
    def compute_reward(self, states, actions):
        '''

        TODO: make support multiple processes
        possibly make this not iterative?
        '''
        rewards = []
        for state, action, nextstate in zip(states, actions, states[1:]):
            # print(state)
            if state - nextstate == 1:
                rewards.append(2)
            else:
                rewards.append(-1)
        return pytorch_model.wrap(rewards, cuda=True)


class RewardCenter(ChangepointReward):
    def compute_reward(self, states, actions):
        '''

        TODO: make support multiple processes
        possibly make this not iterative?
        '''
        rewards = []
        for state, action, nextstate in zip(states, actions, states[1:]):
            # print(state)
            if state - nextstate == 0:
                rewards.append(2)
            else:
                rewards.append(-1)
        return pytorch_model.wrap(rewards, cuda=True)
