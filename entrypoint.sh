#!/bin/sh

set -x

chmod +x /home/data/start_training.sh /home/data/start_eval.py /home/data/start_tensorboard.sh

echo "export PYTHONPATH=$PYTHONPATH:/home/object_detection_api/models/research:/home/object_detection_api/models/research/slim" >> ~/.bashrc
source ~/.bashrc

exec jupyter-notebook --allow-root --notebook-dir=/home/ --port=8887
