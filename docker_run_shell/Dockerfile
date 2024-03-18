# Author: KimDoYoung1997 
# email: ehdud4520@naver.com

FROM osrf/ros:humble-desktop-full-jammy

# Install PCL & Eigen & essential libraries
RUN apt-get update && apt-get install -y cmake libatlas-base-dev libeigen3-dev libpcl-dev libgoogle-glog-dev libsuitesparse-dev libglew-dev wget unzip git python3-pip 
RUN apt-get install -y terminator nautilus
RUN apt-get install -y ros-humble-tf2 ros-humble-cv-bridge ros-humble-pcl-conversions ros-humble-xacro ros-humble-robot-state-publisher \
    ros-humble-rviz2 ros-humble-image-transport ros-humble-image-transport-plugins ros-humble-pcl-ros

# Install livox SDK
#WORKDIR /root/
# RUN git clone https://github.com/Livox-SDK/Livox-SDK2.git
#WORKDIR /root/Livox-SDK2
#RUN mkdir build
#WORKDIR /root/Livox-SDK2/build
#RUN cmake .. && make -j2 && make install

# Humble workspace
WORKDIR /root/
RUN mkdir humble_jammy_container


RUN /bin/bash -c '. /opt/ros/humble/setup.bash;'

WORKDIR /root/humble_jammy_container

# Load ROS environment at each run
COPY ./ros_entrypoint.sh /
RUN chmod 755 /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]
