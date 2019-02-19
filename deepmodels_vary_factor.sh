python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf64_1.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf64_1.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf64_1.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf64_1.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf8_1.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf8_1.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf8_1.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf8_1.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf2_1.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf2_1.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf2_1.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf2_1.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf64_2.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf64_2.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf64_2.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf64_2.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf8_2.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf8_2.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf8_2.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf8_2.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf2_2.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf2_2.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf2_2.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf2_2.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf64_3.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf64_3.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf64_3.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf64_3.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf8_3.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf8_3.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf8_3.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf8_3.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf2_3.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf2_3.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPG3f2_.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf2_3.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf64_4.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf64_4.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf64_4.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 64 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf64_4.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf8_4.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf8_4.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf8_4.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 8 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf8_4.txt
python paddle_bounce.py --model-form basic --optimizer-form PPO --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPPOf2_4.txt
python paddle_bounce.py --model-form basic --optimizer-form A2C --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outA2Cf2_4.txt
python paddle_bounce.py --model-form basic --optimizer-form PG --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy esp --reward-form bounce --grad-epoch 4 --optim Adam > outPGf2_4.txt
python paddle_bounce.py --model-form basic --optimizer-form DQN --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraph --factor 2 --num-layers 1 --greedy-epsilon .2 --lr .0001 --normalize --behavior-policy egq --reward-form bounce --grad-epoch 4 --optim Adam > outDQNf2_4.txt