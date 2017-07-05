#!/bin/sh

sudo docker build --build-arg http_proxy="http://proxy-shz.intel.com:911/" -t ubuntu_intel_gpu_stack:2017q1 .
