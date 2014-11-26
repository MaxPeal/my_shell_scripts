#!/bin/sh -e
export FIRMWARE_INSTALL_DIR="/lib/firmware"
#wget http://www.lwfinger.com/b43-firmware/broadcom-wl-5.100.138.tar.bz2
rm -rf broadcom-wl-5.100.138
tar xjf broadcom-wl-5.100.138.tar.bz2
sudo /usr/local/bin/b43-fwcutter -w "$FIRMWARE_INSTALL_DIR" broadcom-wl-5.100.138/linux/wl_apsta.o
rm -rf broadcom-wl-5.100.138
