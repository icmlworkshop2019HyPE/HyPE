python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 10 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1f10_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 10 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .025 --reward-form bounce > outgaupp5f10_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 10 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaup1f10_1.txt
python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 20 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1f20_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 20 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .01 --reward-form bounce > outgaupp5f20_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 20 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .025 --reward-form bounce > outgaup1f20_1.txt
python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1f40_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .005 --reward-form bounce > outgaupp5f40_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .01 --reward-form bounce > outgaup1f40_1.txt

python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 40000 --state-forms prox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1fpx_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 40000 --state-forms prox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaupp5fpx_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 40000 --state-forms prox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .1 --reward-form bounce > outgaup1fpx_1.txt
python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 40000 --state-forms prox bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1fpxb_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 40000 --state-forms prox bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaupp5fpxb_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 40000 --state-forms prox bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .1 --reward-form bounce > outgaup1fpxb_1.txt
python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 40000 --state-forms xprox bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1fxb_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 40000 --state-forms xprox bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaupp5fxb_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 40000 --state-forms xprox bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .1 --reward-form bounce > outgaup1fxb_1.txt

python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 256 --num-layers 1 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1fnl1_1f256.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 256 --num-layers 1 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaupp5fnl1f256_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 256 --num-layers 1 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .1 --reward-form bounce > outgaup1fnl1f256_1.txt
python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 1 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1fnl1f40_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 1 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaupp5fnl1f40_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 1 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .1 --reward-form bounce > outgaup1fnl1f40_1.txt
python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 128 --num-layers 1 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1fnl1f128_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 128 --num-layers 1 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaupp5fnl1f128_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 128 --num-layers 1 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .1 --reward-form bounce > outgaup1fnl1f128_1.txt

python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 8 --num-layers 3 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1fnl3f8_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 8 --num-layers 3 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaupp5fnl3f8_1.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 8 --num-layers 3 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .1 --reward-form bounce > outgaup1fnl3f8_1.txt
python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 10 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1f10_2.txt

python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 10 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1f10_2.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 10 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .025 --reward-form bounce > outgaupp5f10_2.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 10 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaup1f10_2.txt
python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 20 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1f20_2.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 20 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .01 --reward-form bounce > outgaupp5f20_2.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 20 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .025 --reward-form bounce > outgaup1f20_2.txt
python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1f40_2.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .005 --reward-form bounce > outgaupp5f40_2.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox --state-names Paddle --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .01 --reward-form bounce > outgaup1f40_2.txt

python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1xb_2.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaupp5xb_2.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms xprox bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .1 --reward-form bounce > outgaup1xb_2.txt
python paddle_bounce.py --model-form fourier --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms bounds bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period 1 --reward-form bounce > outfop1bb_2.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms bounds bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .05 --reward-form bounce > outgaupp5bb_2.txt
python paddle_bounce.py --model-form gaussian --optimizer-form SARSA --record-rollouts "data/action/" --train-edge "Paddle->Ball" --num-stack 2 --train --num-iters 10000 --state-forms bounds bounds --state-names Paddle Ball --base-node Paddle --changepoint-dir ../datasets/caleb_data/cotest/paddlegraphpg --factor 40 --num-layers 2 --greedy-epsilon .2 --lr .0007 --normalize --behavior-policy egq --optim base --period .1 --reward-form bounce > outgaup1bb_2.txt