#!/bin/bash

# define version
VER="2.2.2-37"

# check sha256sums
for i in i486 i686-pae amd64; do
	grep "clonezilla-live-${VER}-${i}.iso" CHECKSUMS.TXT | sed '3p' -n | sha256sum -c
	grep "clonezilla-live-${VER}-${i}.zip" CHECKSUMS.TXT | sed '3p' -n | sha256sum -c
done

exit 0
