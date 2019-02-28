#!/bin/bash

## Install grpc
ORIGINAL_DIR=$(pwd)
VERSION=1.12.0

# Check for required dependencies before continuing:
if [[ ! -a $(which autoreconf) ]]; then
    echo "Error: autoconf is not installed. Please install autoconf first.";
    exit 1
fi

if [[ ! -a $(which libtoolize) ]]; then
    echo "Error: libtool is not installed. Please install libtool first.";
    exit 1
fi

if [[ ! -a $(which git) ]]; then
    echo "Error: git is not installed. Please install git first.";
    exit 1
fi

cd
echo "Downloading grpc..."
git clone -q -b v$VERSION https://github.com/grpc/grpc
cd grpc
git submodule update --init
make
sudo make install

cd $ORIGINAL_DIR
