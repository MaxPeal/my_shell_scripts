#!/bin/bash

# mkdir and change dir to $HOME/src/fluxbox
cd $HOME
mkdir -p src/fluxbox
cd src/fluxbox

# install dependences for fluxbox
sudo apt-get --yes install \
  build-essential \
  gdb \
  libxml-parser-perl \
  libxml-bare-perl \
  lib64expat1 \
  lib64expat1-dev \
  libexpat1 \
  libexpat1-dev \
  expat \
  libfribidi-dev \
  libimlib2-dev \
  libxpm-dev \
  libxrender-dev \
  shapelib \
  shapetools \
  shapetools-tutorial \
  libxft-dev \
  libxinerama-dev \
  xcompmgr

# get, build and install fluxbox
wget http://ufpr.dl.sourceforge.net/project/fluxbox/fluxbox/1.3.5/fluxbox-1.3.5.tar.lzma && \
[ "$(sha1sum fluxbox-1.3.5.tar.lzma | cut -d ' ' -f 1)" = "495d82ca428949cc2bc85814898b49cf4624b7cb" ] && \
tar xf fluxbox-1.3.5.tar.lzma --lzma && \
cd fluxbox-1.3.5 && \
./configure \
  CFLAGS=-Os \
  CXXFLAGS=-Os \
  --prefix=/usr \
  --enable-dependency-tracking \
  --enable-debug \
  --enable-nls \
  --enable-randr && \
make -j 4 &&
sudo make install &&
cd ..

# configure fluxbox with config-files-fluxbox
wget http://db.tt/z7tpp1F6 -O config-files-fluxbox.tar.lzma && \
wget http://db.tt/0BbJqaQB -O config-files-fluxbox.tar.lzma.sha1 && \
sha1sum -c config-files-fluxbox.tar.lzma.sha1 && \
tar xf config-files-fluxbox.tar.lzma --lzma && \
cd config-files-fluxbox && \
sudo ./fluxbox-config.sh --install && \
./fluxbox-home-config.sh --install && \
cd ..

# Exit no errors
exit 0
