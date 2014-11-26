#!/bin/bash

# Install dependencies:
sudo apt-get install git libcsound64-5.2 libcsound64-dev libcsound64-doc python2.7 python2.7-dev python2.7-doc python2.7-examples python2.7-minimal make g++ gcc libasound2 libasound2-dev libasound2-doc libasound2-plugin-equal libasound2-plugins

# Clone the sources and build binaries:
mkdir -p ~/Activities
[ -d ~/Activities/tamtam ] && rm -rf ~/dev/sugar/tamtam.old && mv -f ~/Activities/tamtam ~/dev/sugar/tamtam.old
git clone --depth 1 git://git.sugarlabs.org/tamtam/tamtam.git ~/Activities/tamtam || exit 1
cd ~/Activities/tamtam/common/Util/Clooper
make clean
make

#If make was successful, create symlinks to all TamTam activities:
cd ~/Activities/tamtam
./setup.py dev
