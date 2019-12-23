#!/bin/bash

echo "---------- apt upate ----------"
apt update
apt upgrade -y

echo "---------- apt install ----------"
apt install -y libglew-dev libpython2-dev libpython3-dev 
apt install -y ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev libavdevice-dev
apt install -y libdc1394-22-dev libraw1394-dev libuvc-dev libopenni2-dev
apt install -y libjpeg-dev libpng-dev libtiff-dev libopenexr-dev libv4l-dev
apt install -y pkg-config libegl1-mesa-dev libwayland-dev libxkbcommon-dev wayland-protocols


echo "---------- build ----------"
cd /work/Pangolin
rm -rf build || true
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
make -j4
make install

cd /work
chmod -R a+rw ./

echo "[Pangolin Complete!!!]"

