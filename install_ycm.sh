#!/bin/bash
set -e

sudo apt install -y \
	build-essential \
	cmake \
	python3-dev

/home/$HOME/.vim/plugged/YouCompleteMe/install.py --clang-completer
