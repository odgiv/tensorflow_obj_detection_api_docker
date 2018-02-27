#!/usr/bin/env bash
# just provide file name of .config file for $1

set -x -e

rm -rf /home/data/train_result/*

cd /home/object_detection_api/models/research/object_detection

python train.py \
	--logtostderr \
	--pipeline_config_path=/home/data/configs/$1 \
	--train_dir=/home/data/train_result/ &

cd ..


