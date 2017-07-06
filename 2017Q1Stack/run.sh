#!/bin/sh

COMMAND=/bin/bash

#media
docker run -it --device /dev/dri/renderD128 ubuntu_intel_gpu_stack:2017q1 $COMMAND
#display X 
#xhost + # allow connections to X server
#docker run --privileged -e "DISPLAY=unix:0.0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  -it ubuntu_intel_gpu_stack:2017q1 $COMMAND
