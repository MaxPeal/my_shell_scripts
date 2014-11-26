#!/bin/bash
sudo ifconfig wlan0 up
sleep 10
sudo wpa_supplicant -iwlan0 -Dwext -c/home/joaomanoel/conf/wpa_supplicant.home.conf >/home/joaomanoel/log/wpa_supplicant.home.log 2>&1 &
sleep 10
sudo dhclient -v -d wlan0 >/home/joaomanoel/log/dhclient.home.log 2>&1 &
