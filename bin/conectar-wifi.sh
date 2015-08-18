#!/bin/bash

sudo killall -9 dhclient
sleep 2

sudo killall -9 wpa_supplicant
sleep 2

sudo ifconfig wlan0 down
sleep 2

sudo ifconfig wlan0 up
sleep 2

sudo wpa_supplicant -D wext -i wlan0 -c ${HOME}/conf/wifi/wpa_supplicant.conf > ${HOME}/conf/wifi/wpa_supplicant.log 2>&1 &
sleep 2

sudo dhclient -4 -d wlan0 > ${HOME}/conf/wifi/dhclient.log 2>&1 &
