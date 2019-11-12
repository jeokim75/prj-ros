FROM ros:dashing-ros-base-bionic
SHELL ["/bin/bash", "-c"]
 
# install ros2 desktop packages
RUN apt-get update && apt-get install -y \
    ros-dashing-desktop=0.7.2-1* \
    && rm -rf /var/lib/apt/lists/*
 
# install ros2 base packages
RUN apt-get update && apt-get install -y \
    ros-dashing-ros-base=0.7.2-1* \
    && rm -rf /var/lib/apt/lists/*
 
# Install Cartographer dependencies
RUN apt-get update && apt-get install -q -y \
    google-mock \
    libceres-dev \
    liblua5.3-dev \
    libboost-dev \
    libboost-iostreams-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libcairo2-dev \
    libpcl-dev \
    python3-sphinx \
    net-tools \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*
 
# Install Gazebo9
RUN curl -sSL http://get.gazebosim.org | sh
RUN apt install -y ros-dashing-gazebo-*
# Install Cartographer
RUN apt install -y ros-dashing-cartographer
RUN apt install -y ros-dashing-cartographer-ros
# Install Navigation2
RUN apt install -y ros-dashing-navigation2
RUN apt install -y ros-dashing-nav2-bringup
# Install vcstool
RUN apt install -y python3-vcstool
 
# Install TurtleBot3 ROS 2 Packages
RUN apt install -y wget
 
RUN /bin/bash -c "source /opt/ros/dashing/setup.bash ;\
                  mkdir -p ~/turtlebot3_ws/src ;\
                  cd ~/turtlebot3_ws ;\
                  wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/ros2/turtlebot3.repos; \
                  vcs import src < turtlebot3.repos; \
                  colcon build --symlink-install"
 
# Save Bash Command for Setup
RUN echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
RUN echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
RUN echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc
RUN ["/bin/bash", "-c", "source ~/.bashrc"]
