#!/bin/bash

for i in $@; do
	echo -ne "\t$i => `basename $i .tif`.txt ... "
	tesseract $i `basename $i .tif` -l por 2> /dev/null
	echo "OK"
done


