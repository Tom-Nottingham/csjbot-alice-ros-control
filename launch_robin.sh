#!/bin/bash

source ~/.bashrc

cd ~/catkin_ws/
wstool update -t src
catkin build
source ~/catkin_ws/devel/setup.bash
roslaunch lily_interface robin.launch