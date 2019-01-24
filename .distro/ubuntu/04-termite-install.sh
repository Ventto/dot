#!/bin/sh

set -e

# Install termite's dependencies
sudo apt-get install -y \
	git \
	g++ \
	libgtk-3-dev \
	gtk-doc-tools \
	gnutls-bin \
	valac \
	intltool \
	libpcre2-dev \
	libglib3.0-cil-dev \
	libgnutls28-dev \
	libgirepository1.0-dev \
	libxml2-utils \
	gperf \
    libvterm-dev \
    libvterm-bin

# Download termite's sources
git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git

# Install termite
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && ./autogen.sh && make && sudo make install
cd ../termite && make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x; sudo ln -s \
/usr/local/share/terminfo/x/xterm-termite \
/lib/terminfo/x/xterm-termite

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 60

# Install fonts
sudo apt-get install -y \
    fonts-hack-ttf \
    fonts-hack-otf \
    fonts-font-awesome
