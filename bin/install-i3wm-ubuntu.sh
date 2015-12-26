#!/bin/sh

echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" | sudo tee /etc/apt/sources.list.d/i3wm.list && \
echo "deb-src http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" | sudo tee -a /etc/apt/sources.list.d/i3wm.list && \
echo 'Package: *' | sudo tee /etc/apt/preferences.d/00-i3wm.pref && \
echo 'Pin: origin "debian.sur5r.net"' | sudo tee -a /etc/apt/preferences.d/00-i3wm.pref && \
echo 'Pin-Priority: 1001' | sudo tee -a /etc/apt/preferences.d/00-i3wm.pref && \
sudo apt-get update && \
sudo apt-get --allow-unauthenticated --yes install sur5r-keyring && \
sudo apt-get update && \
sudo apt-get --yes install i3 i3-wm i3-wm-dbg i3lock i3status libanyevent-i3-perl libxkbcommon-dev libxkbcommon-x11-0 libxkbcommon-x11-dev libxkbcommon0 suckless-tools

exit 0
