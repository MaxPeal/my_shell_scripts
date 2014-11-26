#!/bin/bash

# define version
VER="0.18.0-2"

# get checksums
wget -c http://free.nchc.org.tw/gparted-live/stable/CHECKSUMS.TXT

# get iso, zip, txt
for i in i486 i686-pae amd64; do
	wget -c "http://ufpr.dl.sourceforge.net/project/gparted/gparted-live-stable/${VER}/gparted-live-${VER}-${i}.iso"
	wget -c "http://ufpr.dl.sourceforge.net/project/gparted/gparted-live-stable/${VER}/gparted-live-${VER}-${i}.zip"
	wget -c "http://ufpr.dl.sourceforge.net/project/gparted/gparted-live-stable/${VER}/packages-${VER}-${i}.txt"
done

exit 0
