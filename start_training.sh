#!/usr/bin/env bash

rm -rf /home/data/train_result/*

cd /home/object_detection_api/models/research/object_detection

python train.py \
	--logtostderr \
	--pipeline_config_path=/home/data/config/faster_rcnn_resnet101_numbers.config \
	--train_dir=/home/data/train_result/ &

cd ..


