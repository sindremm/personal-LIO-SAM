FROM osrf/ros:kinetic-desktop-full-xenial

RUN apt-get update \
    && apt-get install -y curl \
    && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \
    && apt-get update \
    && apt-get install -y ros-kinetic-navigation \
    && apt-get install -y ros-kinetic-robot-localization \
    && apt-get install -y ros-kinetic-robot-state-publisher \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt install -y software-properties-common \
    && add-apt-repository -y ppa:borglab/gtsam-release-4.0 \
    && apt-get update \
    && apt install -y libgtsam-dev libgtsam-unstable-dev \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-c"]

ARG HOME_DIR=/root/catkin_ws
ARG SRC_DIR=${HOME_DIR}/src/LIO-SAM

WORKDIR ${SRC_DIR}
ADD config ./config
ADD include ./include
ADD launch ./launch
ADD msg ./msg
ADD src ./src
ADD srv ./srv
ADD srv CMakeLists.txt package.xml ./
WORKDIR ${HOME_DIR}
RUN source /opt/ros/kinetic/setup.bash && catkin_make

RUN echo "source /opt/ros/kinetic/setup.bash" >> /root/.bashrc \
    && echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc

