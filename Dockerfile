FROM ros:dashing-ros-base-bionic
SHELL ["/bin/bash", "-c"]
 
# install ros2 desktop packages
RUN apt-get update && apt-get install -y \
    ros-dashing-desktop=0.7.2-1* \
    && rm -rf /var/lib/apt/lists/*
 

