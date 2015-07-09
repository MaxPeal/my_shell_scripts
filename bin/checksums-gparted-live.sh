#!/bin/bash

# define version
VER="0.18.0-2"

# check sha256sums
for i in i486 i686-pae amd64; do
	grep "gparted-live-${VER}-${i}.iso" CHECKSUMS.TXT | sed '3p' -n | sha256sum -c
	grep "gparted-live-${VER}-${i}.zip" CHECKSUMS.TXT | sed '3p' -n | sha256sum -c
done

exit 0
