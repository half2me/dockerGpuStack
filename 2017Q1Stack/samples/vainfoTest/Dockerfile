FROM ubuntu_intel_gpu_stack:2017q1

#vainfo 1.8.0
RUN cd $mesa_installation_dir/ && curl https://www.freedesktop.org/software/vaapi/releases/libva/libva-utils-1.8.0.tar.bz2 -o $mesa_installation_dir/libva-utils-1.8.0.tar.bz2
RUN bzip2 -d libva-utils-1.8.0.tar.bz2 && \
	tar -xvf libva-utils-1.8.0.tar && \
	cd $mesa_installation_dir/libva-utils-1.8.0 && \
	./autogen.sh --prefix=$mesa_installation_dir &&\
	make -j8 && \
	make install

WORKDIR $mesa_installation_dir/bin
ENV PATH $mesa_installation_dir/bin:${PATH}
CMD ./vainfo


