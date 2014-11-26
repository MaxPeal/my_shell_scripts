#!/bin/bash
sudo killall -9 dhclient
sudo killall -9 dhclient3
sudo killall -9 wpa_supplicant
sudo ifconfig wlan0 down
