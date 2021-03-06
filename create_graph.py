# Copied from https://github.com/emansim/baselines-mansimov/blob/master/baselines/a2c/visualize_atari.py
# and https://github.com/emansim/baselines-mansimov/blob/master/baselines/a2c/load.py
# Thanks to the author and OpenAI team!

import glob
import json
import os
import math
import argparse

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from scipy.signal import medfilt
matplotlib.rcParams.update({'font.size': 8})


def smooth_reward_curve(x, y):
    # Halfwidth of our smoothing convolution
    halfwidth = min(31, int(np.ceil(len(x) / 30)))
    k = halfwidth
    xsmoo = x[k:-k]
    ysmoo = np.convolve(y, np.ones(2 * k + 1), mode='valid') / \
        np.convolve(np.ones_like(y), np.ones(2 * k + 1), mode='valid')
    downsample = max(int(np.floor(len(xsmoo) / 1e3)), 1)
    return xsmoo[::downsample], ysmoo[::downsample]


def fix_point(x, y, interval):
    np.insert(x, 0, 0)
    np.insert(y, 0, 0)

    fx, fy = [], []
    pointer = 0

    ninterval = int(max(x) / interval + 1)

    for i in range(ninterval):
        tmpx = interval * i

        while pointer + 1 < len(x) and tmpx > x[pointer + 1]:
            pointer += 1

        if pointer + 1 < len(x):
            alpha = (y[pointer + 1] - y[pointer]) / \
                (x[pointer + 1] - x[pointer])
            tmpy = y[pointer] + alpha * (tmpx - x[pointer])
            fx.append(tmpx)
            fy.append(tmpy)

    return fx, fy


def load_data(indir, smooth, bin_size):
    datas = []
    infiles = glob.glob(os.path.join(indir, '*.monitor.csv'))

    for inf in infiles:
        with open(inf, 'r') as f:
            f.readline()
            f.readline()
            for line in f:
                tmp = line.split(',')
                t_time = float(tmp[2])
                tmp = [t_time, int(tmp[1]), float(tmp[0])]
                datas.append(tmp)

    datas = sorted(datas, key=lambda d_entry: d_entry[0])
    result = []
    timesteps = 0
    for i in range(len(datas)):
        result.append([timesteps, datas[i][-1]])
        timesteps += datas[i][1]

    if len(result) < bin_size:
        return [None, None]

    x, y = np.array(result)[:, 0], np.array(result)[:, 1]

    if smooth == 1:
        x, y = smooth_reward_curve(x, y)

    if smooth == 2:
        y = medfilt(y, kernel_size=9)

    x, y = fix_point(x, y, bin_size)
    return [x, y]


color_defaults = [
    '#1f77b4',  # muted blue
    '#ff7f0e',  # safety orange
    '#2ca02c',  # cooked asparagus green
    '#d62728',  # brick red
    '#9467bd',  # muted purple
    '#8c564b',  # chestnut brown
    '#e377c2',  # raspberry yogurt pink
    '#7f7f7f',  # middle gray
    '#bcbd22',  # curry yellow-green
    '#17becf'  # blue-teal
]

def load_from_txt(txt_pth):
    for filename in glob.glob(os.path.join(txt_pth, "/")):
        f = filename.open(os.path.join(txt_pth, filename), 'r')
        last_5_ep_rewards = []
        rewards = []
        last_timestep = [0]
        last_timestep_reward = [0]
        for l in f.readlines():
            if l.find('Episode Reward') != -1:
                v = int(l.split("  ")[0])
                if len(last_5_ep_rewards) == 5:
                    last_5_ep_rewards.pop(0)
                last_5_ep_rewards.append(v)
                rewards.append(np.sum(last_5_ep_rewards) / len(rewards))
            if l.find('num timesteps') != -1:
                last_timstep.append(int(l.split(',')[1].split(' ')[-1]))
                last_timestep_reward.append(len(rewards) - 1)
        timesteps = []
        for ri, rin, t, tn in zip(last_timestep_reward[:-1], last_timestep_reward[1:], last_timestep[:-1], last_timestep[1:]):
            for i in range(ri, rin):
                timesteps.append(i * (tn-t)/(rin - ri) + t)
        return timesteps, rewards

'''
USAGE:
python visualize.py trained_models/pongW2pongH/ --plotall
OR
python visualize.py trained_models/pong_vanilla/ trained_models/pongH2pong
'''
if __name__=='__main__':
    parser = argparse.ArgumentParser(description='RL')
    parser.add_argument('--log_dir', metavar='log_dir', nargs='+')
    parser.add_argument('--txt_dir', metavar='text_dir', nargs='+')
    parser.add_argument('--model', default='a2c')
    parser.add_argument('--title', default='Graph')
    parser.add_argument('--plotall', action = 'store_true', default=False)
    parser.add_argument('--labels', metavar='labels', nargs='+')
    parser.add_argument('--xlim', type=float, default=10e6)
    parser.add_argument('--target', default='plot.png')    
    args = parser.parse_args()

    xlim = 0
    for m_idx, root_dir in enumerate(args.log_dir[1:]):

        # look for all the possible sub log dirs
        dirs = [root_dir] + glob.glob(root_dir+'/*/')
        dirs = [d for d in dirs if len(glob.glob(d+'/*.csv'))>0]
        print (dirs)

        curves = []
        names = []
        for root in dirs:
            tx, ty = load_data(root, 1, 100)
            if tx is not None:
                curves.append((tx, ty))
                names.append(root.strip('/').split('/')[-1])
                xlim = max(xlim, max(tx))


        if args.plotall:
            for idx, (x,y) in enumerate(curves):
                plt.plot(x, y, label = names[idx])
        
        else:
            # show average curve + std
            tx, ty = zip(*curves)
            
            # min_len = min(map(len, tx))
            # tx, ty = tx[0][:min_len], [t[:min_len] for t in ty]

            max_len = max(map(len, tx))
            tx = max(tx, key=lambda x: len(x))
            ty = [t+[t[-1]]*(max_len-len(t)) for t in ty]

            ty = np.array(ty)
            y_mean = np.mean(ty, 0)
            y_err = np.std(ty, 0)

            root_name = root_dir.strip('/').split('/')[-1]
            if args.labels is not None:
                root_name = args.labels[m_idx]

            plt.plot(tx, y_mean, label=root_name, color=color_defaults[m_idx])
            plt.fill_between(tx, y_mean+y_err, y_mean-y_err, alpha=0.1, color=color_defaults[m_idx])

    for m_idx, root_dir in enumerate(args.txt_dir[1:]):

        # look for all the possible sub log dirs
        pths = glob.glob(root_dir+'/*.txt')
        curves = []
        names = []
        for pth in pths:
            tx, ty = load_from_txt(pth)
            if tx is not None:
                curves.append((tx, ty))
                names.append(root.strip('/').split('/')[-1])
                xlim = max(xlim, max(tx))

        else:
            # show average curve + std
            tx, ty = zip(*curves)
            
            # min_len = min(map(len, tx))
            # tx, ty = tx[0][:min_len], [t[:min_len] for t in ty]

            max_len = max(map(len, tx))
            tx = max(tx, key=lambda x: len(x))
            ty = [t+[t[-1]]*(max_len-len(t)) for t in ty]

            ty = np.array(ty)
            y_mean = np.mean(ty, 0)
            y_err = np.std(ty, 0)

            root_name = root_dir.strip('/').split('/')[-1]
            if args.labels is not None:
                root_name = args.labels[m_idx]

            plt.plot(tx, y_mean, label=root_name, color=color_defaults[m_idx])
            plt.fill_between(tx, y_mean+y_err, y_mean-y_err, alpha=0.1, color=color_defaults[m_idx])

    plt.xticks([1e6, 2e6, 4e6, 6e6, 8e6, 10e6], ["1M", "2M", "4M", "6M", "8M", "10M"])
    xlim = min(xlim, args.xlim)
    # plt.xlim(0, math.ceil(xlim/1e6)*1e6)
    plt.xlim(0, xlim)
    plt.ylim(0, 100)
    plt.xlabel('Number of Timesteps')
    plt.ylabel('Rewards')
    plt.title(args.title)
    plt.legend(loc=2)

    plt.savefig(args.target)