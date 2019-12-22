#!/bin/bash

PROJECT=/home/ian/workspace/slam-dev

docker run --gpus all -it \
    --name slam-dev \
    -e "DISPLAY" \
	-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	-v "$PROJECT:/work" \
	nvgl-dev-bionic:slam bash

