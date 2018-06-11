#!/bin/bash

set -e
echo 1 | sudo tee /sys/module/hid_apple/parameters/swap_opt_cmd
echo options hid_apple swap_opt_cmd=1 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all

