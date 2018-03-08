#!/usr/bin/env bash
# just provide file name of .config file for $1

set -x -e

rm -rf /home/data/eval_result/*

echo -n "Enter config file name: "
read config_file_name

#cd /home/object_detection_api/models/research/object_detection
cd /home/object_detection_api/models-master/object_detection

python eval.py \
	--logtostderr \
	--pipeline_config_path=/home/data/configs/$config_file_name \
	--checkpoint_dir=/home/data/train_result/ \
	--eval_dir=/home/data/eval_result/
