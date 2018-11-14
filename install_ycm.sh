#!/bin/bash
set -e

sudo apt install -y \
	build-essential \
	cmake \
	python3-dev

ORIGINAL_DIR=$(pwd)
cd $HOME/.vim/plugged/YouCompleteMe
./install.py --clang-completer
cd $ORIGINAL_DIR
