FROM ubuntu_intel_gpu_stack:2017q1

#vainfo 1.8.0
RUN cd $mesa_installation_dir/ && \
        git clone https://github.com/01org/libva-utils --depth 1 --branch 1.8.0
RUN cd $mesa_installation_dir/libva-utils && \
	./autogen.sh --prefix=$mesa_installation_dir &&\
	make -j8 && \
	make install

WORKDIR $mesa_installation_dir/bin
ENV PATH $mesa_installation_dir/bin:${PATH}
CMD ./vainfo


