#!/bin/bash

WORK_ROOT="/work"
ROS_VERSION="melodic"
CATKIN_WS="$WORK_ROOT/catkin_ws"

echo -e "\n[Build Catkin workspace] >>> $CATKIN_WS"
cd $CATKIN_WS
rm -rf devel build logs .catkin_tools || true
sleep 1

CMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}:/usr/bin

catkin init
catkin config --merge-devel # Necessary for catkin_tools >= 0.4.
catkin config --extend /opt/ros/$ROS_VERSION
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release

echo -e "\n[Build VINS-Fusion]"
catkin build
echo -e "[Build finished]"
sleep 1

source ~/.bashrc
echo "[Complete!!!]"

