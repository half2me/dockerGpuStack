FROM ubuntu:16.04
LABEL maintainer  "Libo Zhu <libo.zhu@intel.com>"

ADD sources.list /etc/apt/sources.list
ENV http_proxy http://proxy-shz.intel.com:911/
ENV https_proxy http://proxy-shz.intel.com:911/
ENV ftp_proxy http://proxy-shz.intel.com:911/
ENV no_proxy localhost,127.0.0.1,.intel.com
RUN apt-get update

#dependency pakcages, add connect-proxy just in case. remove it for external user
RUN apt-get build-dep libdrm mesa -y
RUN apt-get install -y linux-headers-`uname -r` \
	libxi-dev libxmu-dev x11proto-xf86vidmode-dev \
	git autoconf automake libtool \
	connect-proxy \
	&& rm -rf /var/lib/apt/lists/*

LABEL GPU_STACK_VERSION "2017Q1"

RUN mkdir -p /opt/mesa-debug

WORKDIR /opt/mesa-debug

ENV mesa_installation_dir=/opt/mesa-debug
ENV LIBGL_DRIVERS_PATH=$mesa_installation_dir/lib/dri
ENV LD_LIBRARY_PATH=$mesa_installation_dir/lib

#add git proxy in case
ADD git-proxy.sh /usr/local/bin/git-proxy.sh
RUN chmod +x /usr/local/bin/git-proxy.sh 
ENV GIT_PROXY_COMMAND /usr/local/bin/git-proxy.sh

#libdrm 2.4.75
RUN git clone git://anongit.freedesktop.org/git/mesa/drm --branch libdrm-2.4.75 --single-branch
RUN cd $mesa_installation_dir/drm && \
	./autogen.sh CFLAGS='-O2' CXXFLAGS='-O2' --prefix=$mesa_installation_dir && \
	make && \
	make install
#mesa 17.0.1

#libva 1.8.0

#vaapi intel driver 1.8.0
