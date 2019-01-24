#!/bin/sh

set -e

sudo apt-get install -y \
    i3lock \
    xss-lock \
    feh \
    xcompmgr \
    dunst

cd "$HOME"
mkdir -p git

cd git
git clone --recursive https://github.com/ventto/batify.git
cd batify
sudo make install
cd "$HOME"

cd git
git clone --recursive https://github.com/ventto/lux.git
cd lux
sudo make install
cd "$HOME"

cd git
git clone --recursive https://github.com/ventto/mons.git
cd mons
sudo make install
cd "$HOME"
