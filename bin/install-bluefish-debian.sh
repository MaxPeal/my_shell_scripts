#!/bin/bash
echo 'deb     http://debian.wgdd.de/debian wheezy main contrib non-free' | sudo tee /etc/apt/sources.list.d/bluefish.list || exit 1
sudo apt-get update || exit 1
sudo apt-get --yes --allow-unauthenticated install wgdd-archive-keyring || exit 1
sudo apt-get update || exit 1
sudo apt-get --yes install bluefish || exit 1 
exit 0
