# dockerGpuStack
Generate a workable/stable image supporting Intel GPU container feature, to align Intel quarterly GPU driver release, including MESA, libva, etc

## Build the image
To build the image, Change to the directory like 2017Q1Stack/, just execute build.sh to build the ubuntu based image and install (all!) available opensource release drivers. <br>
		#!/bin/sh
		#add --build-arg http_proxy=xxxx if under internal proxy network
		sudo docker build  -t ubuntu_intel_gpu_stack:2017q1 .

if you're under proxy network, the address of proxy is like http://proxy-xx.xxx.com:xxx/, you need change the build.sh
		sudo docker build -t --build-arg http_proxy="http://proxy-xx.xxx.com:xxx/" --build-arg https_proxy="http://proxy-xx.xxx.com:xxx/" --build-arg no_proxy="localhost,127.0.0.1,.xxx.com" -t ubuntu_intel_gpu_stack:2017q1 .

## Create a container 
Execute ./run.sh in the corresponding subdirectory to get a bash prompt in the created docker container.

## Testing the samples
A few examples of Dockerfiles are provided in the samples/ folder, these images can be used to quickly test the gpu stack on your machine. The samples are not available on the Docker Hub, you will need to build the images locally:
		docker build --build-arg http_proxy="http://proxy-shz.intel.com:911/" -t sample:vainfoTest samples/vainfoTest/

use docker to  test the samples:
		docker run --rm --device /dev/dri/renderD128 sample:vainfoTest

Here is a possible output for a container based on the sample:vainfoTest image:
		error: XDG_RUNTIME_DIR not set in the environment.
		error: can't connect to X server!
		libva info: VA-API version 0.40.0
		libva info: va_getDriverName() returns 0
		libva info: Trying to open /opt/mesa-debug/lib/dri/i965_drv_video.so
		libva info: Found init function __vaDriverInit_0_40
		libva info: va_openDriver() returns 0
		vainfo: VA-API version: 0.40 (libva )
		vainfo: Driver version: Intel i965 driver for Intel(R) Skylake - 1.8.0
		vainfo: Supported profile and entrypoints
      			VAProfileMPEG2Simple            : VAEntrypointVLD
      			VAProfileMPEG2Simple            : VAEntrypointEncSlice
      			VAProfileMPEG2Main              : VAEntrypointVLD


