#!/bin/bash

cd /work/ceres-solver
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
make -j4
make install

cd /work
chmod -R a+rw ./

echo "[Ceres Complete!!!]"
