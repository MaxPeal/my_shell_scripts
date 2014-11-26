#!/bin/bash
sudo yum install autoconf213 bison bzip2 ccache curl flex gawk gcc-c++ git glibc-devel glibc-static libstdc++-static libX11-devel make mesa-libGL-devel ncurses-devel patch zlib-devel ncurses-devel.{i686,x86_64} readline-devel.{i686,x86_64} zlib-devel.{i686,x86_64} libX11-devel.{i686,x86_64} mesa-libGL-devel.{i686,x86_64} glibc-devel.{i686,x86_64} libstdc++.{i686,x86_64} libXrandr.{i686,x86_64} zip perl-Digest-SHA wget compat-libmpc.{i686,x86_64} alsa*.{i686,x86_64} yasm*
wget -c http://people.mozilla.org/~gsvelto/gcc-4.6.4-fc19.tar.xz
sudo rm -rf /opt/gcc-4.6.4
sudo tar -xaf gcc-4.6.4-fc19.tar.xz -C /opt
export CC=/opt/gcc-4.6.4/bin/gcc
export CXX=/opt/gcc-4.6.4/bin/g++
export MOZCONFIG=~/dev/mozilla/firefox-os/mozconfig-firefox-os
export MOZBUILD_STATE_PATH=~/dev/mozilla/firefox-os/mybuild
mkdir -p $MOZBUILD_STATE_PATH
