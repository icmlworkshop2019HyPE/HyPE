from SelfBreakout.paddle import Paddle
from SelfBreakout.noblock import PaddleNoBlocks
from arguments import get_args
import numpy as np
from Models.pretrain_models import random_actions, action_criteria, pretrain, range_Qvals,\
                                 Q_criteria, get_states, get_option_actions, get_option_rewards, \
                                 generate_trace_training, generate_soft_dataset, supervised_criteria
from RewardFunctions.dummy_rewards import BounceReward, Xreward




if __name__ == "__main__":
    '''
    record rollouts
    changepoint dir
    learning rate
    eps
    betas 
    weight decay
    save interval
    save models
    train edge
    state names
    state forms
    reward_form
    trace len
    pretrain_target
    save-dir
    '''
    args = get_args()
    if args.reward_form == 'x':
        reward_classes = [Xreward(args)]
    elif args.reward_form == 'bounce':
        reward_classes = [BounceReward(-1, args)]
    elif args.reward_form == 'dir':
        reward_classes = [BounceReward(0, args), BounceReward(1, args), BounceReward(2, args), BounceReward(3, args)]
    true_environment = Paddle()
    if args.pretrain_target == 0:
        states, resps, num_actions, state_class = get_states(args, true_environment, length_constraint = args.num_frames)
        actions = get_option_actions(args.record_rollouts, args.train_edge, num_actions, args.weighting_lambda, length_constraint = args.num_frames)
        rewards = get_option_rewards(args.record_rollouts, reward_classes, actions, length_constraint = args.num_frames)
        actions, states, resps = generate_trace_training(actions, rewards, states, resps, args.trace_len)
        criteria = supervised_criteria
    elif args.pretrain_target == 1:
        states, resps, num_actions, state_class = get_states(args, true_environment, length_constraint = args.num_frames)
        try:
            actions = np.load("actions.npy") # delete this in filesystem when you need new actions
        except FileNotFoundError as e:
            actions = generate_soft_dataset(states, resps, true_environment, reward_classes, args)
            np.save("actions.npy", actions)
        states, resps = [states.copy() for _ in range(len(reward_classes))], [resps.copy() for _ in range(len(reward_classes))]
        criteria = supervised_criteria
    # elif args.optimizer_form in ["DQN", "SARSA", "Dist"]: # dist might have mode collapse to protect against
    #     pass # TODO: implement
    pretrain(args, true_environment, actions, num_actions, state_class, states, resps, criteria, reward_classes)