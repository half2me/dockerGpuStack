#!/bin/sh
#add --build-arg http_proxy=xxxx if under internal proxy network
sudo docker build  -t ubuntu_intel_gpu_stack:2017q1 .
