# dockerGpuStack
generate a workable/stable image supporting Intel GPU container feature, to align Intel quarterly GPU driver release, including MESA, libva, etc

# Build the image
To build the image, Change to the directory like 2017Q1Stack/
Execute build.sh to build the ubuntu based image and install (all!) available opensource release drivers.

# Create a container 
Execute ./run.sh in the corresponding subdirectory to get a bash prompt in the created docker container.

