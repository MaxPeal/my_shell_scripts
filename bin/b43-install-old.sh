#!/bin/sh -e
export FIRMWARE_INSTALL_DIR="/lib/firmware"
#wget http://mirror2.openwrt.org/sources/broadcom-wl-5.10.56.27.3_mipsel.tar.bz2
rm -rf broadcom-wl-5.10.56.27.3
tar xjf broadcom-wl-5.10.56.27.3_mipsel.tar.bz2
sudo /usr/local/bin/b43-fwcutter -w "$FIRMWARE_INSTALL_DIR" broadcom-wl-5.10.56.27.3/driver/wl_apsta/wl_prebuilt.o
rm -rf broadcom-wl-5.10.56.27.3
