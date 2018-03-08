#!/bin/bash

set -x -e

echo -n "Enter config file name: "
read config_file_name
echo -n "Enter .ckpt model number: "
read model_num

cd /home/object_detection_api/models-master/object_detection

python export_inference_graph.py \
    --input_type image_tensor \
    --pipeline_config_path /home/sg/data/$config_file_name \
    --trained_checkpoint_prefix /home/sg/data/train_result/model.ckpt-$model_num \
    --output_directory /home/sg/data \
    --inference_graph_path output_inference_graph.pb

