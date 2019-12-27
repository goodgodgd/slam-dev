#!/bin/bash
# ref: http://wiki.ros.org/melodic/Installation/Ubuntu

ubuntu_version="bionic"
ros_version="melodic"
catkin_ws="/work/catkin_ws"
echo -e "\n===== Install ROS ${ros_version}] =====\n"

echo "[Update the package lists and upgrade them]"
apt-get update -y
# apt-get upgrade -y

echo "[Install build environment, the chrony, ntpdate and set the ntpdate]"
apt-get install -y chrony ntpdate build-essential gnupg2
ntpdate ntp.ubuntu.com

echo "[Add the ROS repository]"
if [ ! -e /etc/apt/sources.list.d/ros-latest.list ]; then
  sh -c "echo \"deb http://packages.ros.org/ros/ubuntu ${ubuntu_version} main\" > /etc/apt/sources.list.d/ros-latest.list"
  cat /etc/apt/sources.list.d/ros-latest.list
fi

echo "[Download the ROS keys]"
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

echo -e "\n[Update the package lists and upgrade them]"
apt-get update
apt-get upgrade -y

echo -e "\n[Install the ros-desktop-full and all rqt plugins]"
apt-get install -y ros-$ros_version-desktop

echo -e "\n[Initialize rosdep]"
rosdep init
rosdep update

echo -e "\n[Setup environment variables]"
echo "source /opt/ros/${ros_version}/setup.bash" >> ~/.bashrc
echo "source ${catkin_ws}/devel/setup.bash" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc
source ~/.bashrc

echo "[Complete!!!]"
exit 0

