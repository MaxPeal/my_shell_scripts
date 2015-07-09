#!/bin/bash
echo "# mirror for debian-multimedia repository" | sudo tee -a /etc/apt/sources.list
echo "deb http://sft.if.usp.br/debian-multimedia/ squeeze main non-free" | sudo tee -a /etc/apt/sources.list
sudo apt-get -q -y --force-yes update
sudo apt-get -q -y --force-yes install deb-multimedia-keyring
sudo apt-get -q -y --force-yes update
sudo apt-get -q -y --force-yes install w64codecs libdvdcss2 libdvdcss-dev
