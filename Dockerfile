FROM ros:noetic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y ros-noetic-desktop-full \
    ros-noetic-catkin ros-noetic-teleop-twist-keyboard ros-noetic-teleop-twist-joy \
    ros-noetic-roslib ros-noetic-rosbridge-server \
    netcat \
    telnet \
    python3.8 \
    python3-catkin-tools python3-osrf-pycommon \
    python3-wstool python3-pip bash-completion && \
    rm -rf /var/lib/apt/lists/* 

# ADD . /root/catkin_ws/

WORKDIR /root/catkin_ws

# RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip install websockets asyncio 

RUN echo "source /opt/ros/$ROS_DISTRO/setup.sh" >> /root/.bashrc
RUN echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc

ENV ROS_LOG_DIR=/root/ros_logs/ 


CMD ["/ros_entrypoint.sh", "~/catkin_ws/launch_robin.sh"]


# TODO 
# - Map ports across from outside to inside container (or run --network=host to auto assign ports)
# - Add device support to allow access to PS3 controller
