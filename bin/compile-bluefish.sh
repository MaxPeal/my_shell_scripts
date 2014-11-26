#!/bin/bash

sudo apt-get install dpkg-dev fakeroot build-essential
sudo apt-get build-dep bluefish
mkdir -p ~/dev/bluefish
cd ~/dev/bluefish
apt-get source bluefish
wget http://www.bennewitz.com/bluefish/stable/source/bluefish-2.2.6.tar.bz2
tar xjvf bluefish-2.2.6.tar.bz2
cd bluefish-2.2.6
tar xzvf ../bluefish_2.2.3-4.debian.tar.gz
rm -rf debian/patches
dpkg-buildpackage
cd ..
sudo dpkg -i *.deb
sudo apt-get -f install
