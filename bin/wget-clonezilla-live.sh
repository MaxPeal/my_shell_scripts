#!/bin/bash

# define version
VER="2.2.2-37"

# get iso, zip
for i in i486 i686-pae amd64; do
	wget -c "http://ufpr.dl.sourceforge.net/project/clonezilla/clonezilla_live_stable/${VER}/clonezilla-live-${VER}-${i}.iso"
	wget -c "http://ufpr.dl.sourceforge.net/project/clonezilla/clonezilla_live_stable/${VER}/clonezilla-live-${VER}-${i}.zip"
done

exit 0
