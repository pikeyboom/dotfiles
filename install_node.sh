#!bin/bash

set -e

if [[ ! -a $(which curl) ]]; then
    echo "Error: curl is not installed. Please install autoconf first.";
    exit 1
fi

curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt-get install nodejs
