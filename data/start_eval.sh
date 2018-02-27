#!/usr/bin/env bash
# just provide file name of .config file for $1
rm -rf /home/data/eval_result/*

cd /home/object_detection_api/models/research/object_detection

python eval.py \
	--logtostderr \
	--pipeline_config_path=/home/data/configs/$1 \
	--checkpoint_dir=/home/data/train_result/ \
	--eval_dir=/home/data/eval_result/ &

cd ..

