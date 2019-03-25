#!/bin/bash

## Install protobuf
ORIGINAL_DIR=$(pwd)
VERSION=3.5.0

# Check for required dependencies before continuing:
if [[ ! -a $(which autoreconf) ]]; then
    echo "Error: autoconf is not installed. Please install autoconf first.";
    exit 1
fi

if [[ ! -a $(which libtoolize) ]]; then
    echo "Error: libtool is not installed. Please install libtool first.";
    exit 1
fi

cd
echo "Downloading protobuf..."
curl -OL https://github.com/google/protobuf/archive/v$VERSION.tar.gz
tar xvf v$VERSION.tar.gz
cd protobuf-$VERSION
./autogen.sh
./configure
make
make check
sudo make install
sudo ldconfig # refresh shared library cache.
cd $ORIGINAL_DIR
