#!/bin/bash

set -e
OLD_PWD=$(pwd)
cd /tmp
curl -OL https://github.com/google/flatbuffers/archive/v1.5.0.zip
unzip v1.5.0.zip
cd flatbuffers-1.5.0
mkdir build && cd build
cmake ..
make && sudo make install
cd $OLD_PWD
