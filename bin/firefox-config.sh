#!/bin/bash

sudo update-alternatives --install "/usr/bin/gnome-www-browser" "gnome-www-browser" /opt/firefox/firefox 50
sudo update-alternatives --install "/usr/bin/x-www-browser"     "x-www-browser"     /opt/firefox/firefox 50
