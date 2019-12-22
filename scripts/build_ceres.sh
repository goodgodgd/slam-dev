#!/bin/bash

cd /work/ceres-solver
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/bin
make -j4
make install

