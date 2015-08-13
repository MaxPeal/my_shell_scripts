#!/bin/bash

echo 'deb http://download.opensuse.org/repositories/home%3a/tpokorra%3a/mono/Debian_7.0/ /' | sudo tee /etc/apt/sources.list.d/monodevelop-opt.list || exit 1
echo 'deb-src http://download.opensuse.org/repositories/home%3a/tpokorra%3a/mono/Debian_7.0/ /' | sudo tee -a /etc/apt/sources.list.d/monodevelop-opt.list || exit 1

wget -q -O - http://download.opensuse.org/repositories/home:tpokorra:mono/Debian_7.0/Release.key | sudo apt-key add - || exit 1

sudo apt-get update && \
sudo apt-get install monodevelop-opt
