#!/bin/sh

sudo docker build --build-arg http_proxy="http://proxy-shz.intel.com:911/" -t ubuntu_with_opensource_drivers .
