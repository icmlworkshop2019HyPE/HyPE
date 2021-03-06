import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.autograd import Variable
import torch.optim as optim
import sys, glob, copy, os, collections, time
from arguments import get_args
from ReinforcementLearning.learning_algorithms import learning_algorithms
from Models.models import models 
from ReinforcementLearning.test_policies import testRL
from Environments.environment_specification import ChainMDP, ProxyEnvironment
from Environments.state_definition import GetRaw, GetState, compute_minmax
from Environments.multioption import MultiOption
from SelfBreakout.paddle import Paddle
from BehaviorPolicies.behavior_policies import behavior_policies
from OptionChain.option_chain import OptionChain
from file_management import get_edge, load_from_pickle
import collections


if __name__ == "__main__":
    # Example Command Line
    # python test_template.py --train-edge "Action->chain" --num-stack 1 --num-iters 1000 --changepoint-dir data/optgraph --save-dir data/testtest/ --record-rollouts data/testchain/ --greedy-epsilon 0
    args = get_args()
    true_environment = Paddle()
    dataset_path = args.record_rollouts
    changepoint_path = args.changepoint_dir
    option_chain = OptionChain(true_environment, args.changepoint_dir, args.train_edge, args)


    head, tail = get_edge(args.train_edge)

    # reward_classes = [bounce_rewards(0), bounce_rewards(1), bounce_rewards(2), bounce_rewards(3)]
    reward_paths = glob.glob(os.path.join(option_chain.save_dir, "*rwd.pkl"))
    if len(reward_paths) > 0:
        print(reward_paths)
        reward_paths.sort(key=lambda x: int(x.split("__")[2]))
        reward_classes = [load_from_pickle(pth) for pth in reward_paths]
    else:
        reward_classes = None

    environments = option_chain.initialize(args)
    proxy_environment = environments.pop(-1)
    print(proxy_environment.reward_fns)
    proxy_chain = environments
    if args.load_weights:
        train_models = proxy_environment.models
    if len(environments) > 1: # there is a difference in the properties of a proxy environment and the true environment
        num_actions = len(environments[-1].reward_fns)
    else:
        num_actions = environments[-1].num_actions
    print(args.state_names, args.state_forms)
    state_class = GetState(num_actions, head, state_forms=list(zip(args.state_names, args.state_forms)))
    if args.normalize:
        state_class.minmax = compute_minmax(state_class, dataset_path)
    print(state_class.minmax)
    behavior_policy = behavior_policies[args.behavior_policy]()
    # behavior_policy = EpsilonGreedyProbs()
    testRL(args, option_chain.save_dir, true_environment, proxy_chain, proxy_environment,
            state_class, behavior_policy=behavior_policy, reward_classes = reward_classes)
