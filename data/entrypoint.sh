#!/bin/sh

set -x

chmod +x /home/data/start_training.sh /home/data/start_eval.sh /home/data/start_tensorboard.sh

echo "export PYTHONPATH=$PYTHONPATH:/home/object_detection_api/models-master:/home/object_detection_api/models-master/slim" >> ~/.bashrc
source ~/.bashrc

exec jupyter-notebook --allow-root --notebook-dir=/home/ --port=8887
