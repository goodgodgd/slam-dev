#!/bin/bash

WORK_ROOT=/work
SCRIPT_PATH=$WORK_ROOT/scripts/builders
ROS_VERSION="melodic"
CATKIN_WS=$WORK_ROOT/catkin_ws

echo -e "\n===== Remove all build files ======\n"
find $WORK_ROOT -name build -exec rm -rf {} +

echo -e "\n===== Build Pangolin ======\n"
$SCRIPT_PATH/build_pangolin.sh
if [ ! -f "/usr/lib/libpangolin.so" ]; then
	echo "Pangolin setup failed"
	exit 1
fi

echo -e "\n===== Build ORB_SLAM2 ======\n"
$SCRIPT_PATH/build_orb2.sh
if [ ! -f "/work/ORB_SLAM2/lib/libORB_SLAM2.so" ]; then
	echo "Pangolin setup failed"
	exit 1
fi

echo -e "\n===== Build Ceres Solver ======\n"
$SCRIPT_PATH/build_ceres.sh
if [ ! -f "/usr/lib/libceres.a" ]; then
	echo "Ceres solver setup failed"
	exit 1
fi

echo -e "\n===== Build VINS-Fusion ======\n"
$SCRIPT_PATH/build_vins.sh

cd $WORK_ROOT
chmod -R a+rw .

