FROM ubuntu:16.04
LABEL maintainer  "Libo Zhu <libo.zhu@intel.com>"

ADD sources.list /etc/apt/sources.list
RUN apt-get update

#dependency pakcages, add connect-proxy just in case. remove it for external user
RUN apt-get build-dep libdrm mesa -y
RUN apt-get install -y linux-headers-`uname -r` \
	libxi-dev libxmu-dev x11proto-xf86vidmode-dev \
	autoconf automake libtool \
	curl \
	&& rm -rf /var/lib/apt/lists/*

LABEL GPU_STACK_VERSION "2017Q1"


WORKDIR /usr/local/

ENV mesa_installation_dir=/usr/local/ 
ENV LIBGL_DRIVERS_PATH=$mesa_installation_dir/lib/dri \
	LD_LIBRARY_PATH=$mesa_installation_dir/lib


#libdrm tag:libdrm-2.4.75
RUN curl https://dri.freedesktop.org/libdrm/libdrm-2.4.75.tar.gz -o $mesa_installation_dir/libdrm-2.4.75.tar.gz
RUN tar -xvzf libdrm-2.4.75.tar.gz && \
	cd $mesa_installation_dir/libdrm-2.4.75/ && \
	./configure CFLAGS='-O2' CXXFLAGS='-O2' --prefix=$mesa_installation_dir && \
	make -j8 && \
	make install

#mesa tag:mesa-17.0.1, 
RUN cd $mesa_installation_dir/ && curl https://mesa.freedesktop.org/archive/mesa-17.0.1.tar.gz -o $mesa_installation_dir/mesa-17.0.1.tar.gz
RUN tar -xvzf mesa-17.0.1.tar.gz && \
	cd $mesa_installation_dir/mesa-17.0.1 && \
	./autogen.sh CFLAGS='-O2' CXXFLAGS='-O2' --prefix=$mesa_installation_dir --with-dri-drivers="i915 i965" \
	--with-dri-driverdir=$prefix/lib/dri --enable-gles1 --enable-gles2 --enable-shared-glapi --with-gallium-drivers= \
	--with-egl-platforms=x11,drm --enable-texture-float --enable-gbm --enable-glx-tls --enable-dri3 --enable-debug && \
	make -j8 && \
	make install

#libva 1.8.0
RUN cd $mesa_installation_dir/ && curl https://www.freedesktop.org/software/vaapi/releases/libva/libva-1.8.0.tar.bz2 -o $mesa_installation_dir/libva-1.8.0.tar.bz2
RUN  bzip2 -d libva-1.8.0.tar.bz2 && \
	tar -xvf libva-1.8.0.tar && \
	cd $mesa_installation_dir/libva-1.8.0 && \
	./configure CFLAGS='-O2' CXXFLAGS='-O2' --prefix=$mesa_installation_dir --enable-wayland=0 && \
	make -j8 && \
	make install 
  
#vaapi intel driver 1.8.0
RUN cd $mesa_installation_dir/ && curl https://www.freedesktop.org/software/vaapi/releases/libva-intel-driver/intel-vaapi-driver-1.8.0.tar.bz2 -o $mesa_installation_dir/intel-vaapi-driver-1.8.0.tar.bz2
ENV PKG_CONFIG_PATH=$mesa_installation_dir/lib/pkgconfig/:$PKG_CONFIG_PATH
RUN bzip2 -d intel-vaapi-driver-1.8.0.tar.bz2 && \
	tar -xvf intel-vaapi-driver-1.8.0.tar && \
	cd $mesa_installation_dir/intel-vaapi-driver-1.8.0 && \
	./configure  CFLAGS='-O2' CXXFLAGS='-O2'  --prefix=$mesa_installation_dir --enable-wayland=0 && \
	make -j8 && \
	make install	
