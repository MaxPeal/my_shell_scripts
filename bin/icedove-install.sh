#!/bin/bash

echo 'deb http://mozilla.debian.net/ wheezy-backports icedove-esr' | sudo tee /etc/apt/sources.list.d/icedove.list
echo 'deb-src http://mozilla.debian.net/ wheezy-backports icedove-esr' | sudo tee -a /etc/apt/sources.list.d/icedove.list

wget -q -O - http://mozilla.debian.net/archive.asc | sudo apt-key add -

sudo apt-get update
sudo apt-get -y install -t wheezy-backports icedove #icedove-l10n-pt-br
sudo apt-get -y dist-upgrade
