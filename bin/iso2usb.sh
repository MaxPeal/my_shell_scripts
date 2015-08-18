#!/bin/bash

function usage()
{
	echo -e "\n  usage: $0 file.iso device label-device\n"
	exit $1
}

if [ "$1" == "-h" -o "$1" == "--help" ]; then
	[ -z "$2" ] &&	usage 0
	usage -1
fi

if [ -z "$1" -o -z "$2" -o -z "$3" -o -n "$4" ]; then
	usage -1
fi

if [ "`basename $1`" == "`basename $1 .iso`" ]; then
	usage -1
fi

if [ "`file $1 | awk '{ print $2 " " $3 " " $4 " " $5 " " $6 }'`" != "ISO 9660 CD-ROM filesystem data" ]; then
	usage -1
fi

if [ ! -b "$2" ]; then
	usage -1
fi

sudo rm -rf /tmp/iso
sudo mkdir -p /tmp/iso
sudo mount -o loop $1 /tmp/iso

sudo rm -rf /tmp/usb
sudo mkdir -p /tmp/usb
sudo mkdosfs -n $3 -c -F 32 $2
sudo syslinux $2
sudo mount -t vfat $2 /tmp/usb

sudo cp -rf /tmp/iso/* /tmp/usb
sudo cp -rf /tmp/iso/.disk /tmp/usb
sudo mv -f /tmp/usb/isolinux /tmp/usb/syslinux
sudo $HOME/bin/isolinux2syslinux /tmp/usb/syslinux/isolinux.cfg
sudo rm -f /tmp/usb/syslinux/isolinux.cfg

sudo umount /tmp/usb
sudo umount /tmp/iso
