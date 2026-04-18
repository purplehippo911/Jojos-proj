#!/bin/zsh
set -e

# install packages if have here. or have locally in C

# TODO: FIX to check if windows and different directory or if apple

# create directory
make
sudo make install PREFIX=/usr/local

echo "\ndone"
