#!/bin/sh

set -x

echo "export PYTHONPATH=$PYTHONPATH:/home/object_detection_api/models/research:/home/object_detection_api/models/research/slim" >> ~/.bashrc
source ~/.bashrc

exec jupyter-notebook --allow-root --notebook-dir=/home/ --port=8887
