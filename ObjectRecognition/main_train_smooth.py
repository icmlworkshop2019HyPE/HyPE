import os
import json
import numpy as np
import torch
import torch.nn as nn
import matplotlib.pyplot as plt
from functools import partial

from SelfBreakout.breakout_screen import RandomConsistentPolicy, RotatePolicy
from ObjectRecognition.dataset import DatasetSelfBreakout, DatasetAtari
from ObjectRecognition.model import ModelFocusCNN, ModelAttentionCNN
import ObjectRecognition.add_args as add_args
import ObjectRecognition.util as util


if __name__ == '__main__':
    net_path = 'ObjectRecognition/net_params/attn_base.json'
    model_path = 'results/cmaes_soln/focus_self/ball_bin_smooth.npy'
    image_shape = (84, 84)
    n_state = 100

    # get dataset
    dataset = DatasetSelfBreakout(
        'SelfBreakout/runs',  # object dump path
        'SelfBreakout/runs/0',  # run states2
        n_state=n_state,  # set max number of states
    )

    # get ball model
    prev_net_params_path = 'ObjectRecognition/net_params/two_layer.json'
    prev_weight_path = 'results/cmaes_soln/focus_self/ball_bin.npy'
    prev_net_params = json.loads(open(prev_net_params_path).read())
    prev_model = ModelFocusCNN(
        image_shape=(84, 84),
        net_params=prev_net_params,
    )
    prev_model.set_parameters(np.load(prev_weight_path))

    # create the model
    frames = dataset.get_frame(0, n_state)
    frames = torch.from_numpy(frames).float()
    net_params = json.loads(open(net_path).read())
    model = ModelAttentionCNN(image_shape, net_params)
    print(model)

    # train
    model.from_focus_model(prev_model, dataset, n_iter=1000)

    # forward
    focus = prev_model.forward(frames)
    focus_attn = util.focus2attn(focus, image_shape)
    attn = model.forward(frames, ret_numpy=True)

    # plots
    fig, axes = plt.subplots(ncols=10, nrows=3, figsize=(20, 6))
    for x, y, z, ax in zip(frames, focus_attn, attn, axes.T):
        xn = x[0].detach().numpy()
        ax[0].imshow(xn + y[0])
        ax[1].imshow(y[0])
        ax[2].imshow(z[0])
        print(np.max(xn[0]), np.min(xn[0]), np.max(z[0]), np.min(z[0]))
    plt.show()

    # save
    torch.save(model.state_dict(), model_path)

    # test loading
    model_2 = ModelAttentionCNN(image_shape, net_params)
    model_2.load_state_dict(torch.load(model_path))
    model_2.eval()
    attn_2 = model.forward(frames, ret_numpy=True)
    fig, axes = plt.subplots(ncols=10, nrows=2, figsize=(20, 2))
    for x, y, ax in zip(attn, attn_2, axes.T):
        ax[0].imshow(x[0])
        ax[1].imshow(y[0])
    plt.show()