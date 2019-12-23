#!/bin/bash

WORK_ROOT="/work"
ROS_VERSION="melodic"
CATKIN_WS="$WORK_ROOT/catkin_ws"

echo -e "\n[Build Catkin workspace] >>> $CATKIN_WS"
cd $CATKIN_WS
rm -rf devel build logs .catkin_tools || true
sleep 1

catkin init
catkin config --merge-devel # Necessary for catkin_tools >= 0.4.
catkin config --extend /opt/ros/$ROS_VERSION
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release

echo -e "\n[Build VINS-Fusion]"
catkin build
echo -e "[Build finished]"
sleep 1

source ~/.bashrc

echo -e "\n[Download binary data]"

download_gdrive() {
	fileid=$1
	filename=$2
	curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
	curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
	rm ./cookie
}

if [ ! -f brief_k10L6.bin ]; then
    cd $CATKIN_WS/src/VINS-Fusion/support_files
    download_gdrive "1EZiVqo2ioMYTffDj3wG7R2QqoMDfFlMS" "brief_k10L6.bin"
fi

cd /work
chmod -R a+rw ./

echo "[VINS-Fusion Complete!!!]"

