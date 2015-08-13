#!/bin/bash

if [ -z "$1" ]; then
	echo -e "\n  Usage: `basename $0` <file-0.tif> [ <file-1.tif> ... ]\n"
	exit -1
fi

for i in $@; do
	[ "`basename $i`" == "`basename $i .tif`" ] && continue
	[ ! -f "$i" ] && continue
	echo -ne "\n  $i => `basename $i .tif`.txt ... "
	tesseract $i `basename $i .tif` -l por 2>/dev/null
	echo "OK"
done
