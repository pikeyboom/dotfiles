#!/bin/zsh

declare base=${HOME}/dotfiles

if [[ ! -a $(which cpp) ]]; then
    echo "Error: Install cpp compiler first"
    exit 1
fi
if [[ ! -a $(which curl) ]]; then
    echo "Error: Install curl first"
    exit 1
fi

# Get font
if [ ! -f ~/.fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf ]; then
  curl -fLo ~/.fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf --create-dirs \
    https://github.com/powerline/fonts/raw/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
  fc-cache -vf ~/.fonts/
fi

# Copy perl script to copy selection to clipboard
sudo cp ${base}/xkr-clipboard.pl /usr/lib/urxvt/perl/xkr-clipboard

cpp ${base}/Xresources > ~/.Xresources
cd ~; ln -s ~/.Xresources .Xdefaults-$(hostname)

xrdb -load ~/.Xresources
