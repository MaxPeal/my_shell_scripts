#!/bin/sh -e
export FIRMWARE_INSTALL_DIR="/lib/firmware"
export B43_FWCUTTER="`whereis -b b43-fwcutter | sed 's/^[^:]*:[[:blank:]]*\([^[:blank:]]*\)[[:blank:]]*.*$/\1/'`"
if test -z "$B43_FWCUTTER"
then
	echo -e "Sorry, b43-fwcutter not found!\nPlease install b43-fwcutter to execute this script."
	exit 1
fi
#wget http://mirror2.openwrt.org/sources/broadcom-wl-5.10.56.27.3_mipsel.tar.bz2
rm -rf broadcom-wl-5.10.56.27.3
tar xjf broadcom-wl-5.10.56.27.3_mipsel.tar.bz2
sudo "$B43_FWCUTTER" -w "$FIRMWARE_INSTALL_DIR" broadcom-wl-5.10.56.27.3/driver/wl_apsta/wl_prebuilt.o
rm -rf broadcom-wl-5.10.56.27.3
exit 0
