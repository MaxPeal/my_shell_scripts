#!/bin/bash

echo 'deb http://mozilla.debian.net/ wheezy-backports iceweasel-release' | sudo tee /etc/apt/sources.list.d/iceweasel.list
echo 'deb-src http://mozilla.debian.net/ wheezy-backports iceweasel-release' | sudo tee -a /etc/apt/sources.list.d/iceweasel.list

wget -q -O - http://mozilla.debian.net/archive.asc | sudo apt-key add -

sudo apt-get update
sudo apt-get -y install -t wheezy-backports iceweasel #iceweasel-l10n-pt-br
sudo apt-get -y dist-upgrade
