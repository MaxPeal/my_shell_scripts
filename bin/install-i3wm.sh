#!/bin/sh

echo 'deb http://build.i3wm.org/debian/sid sid main' | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
echo 'deb-src http://build.i3wm.org/debian/sid sid main' | sudo tee -a /etc/apt/sources.list.d/i3-autobuild.list

echo 'Package: i3*' | sudo tee /etc/apt/preferences.d/00-i3-autobuild.pref
echo 'Pin: origin "build.i3wm.org"' | sudo tee -a /etc/apt/preferences.d/00-i3-autobuild.pref
echo 'Pin-Priority: 1001' | sudo tee -a /etc/apt/preferences.d/00-i3-autobuild.pref

sudo apt-get update
sudo apt-get --allow-unauthenticated install i3-autobuild-keyring
sudo apt-get update
sudo apt-get install '^i3.*$'

exit 0
