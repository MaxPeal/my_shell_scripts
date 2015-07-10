#!/bin/bash

if [ -z "$1" ]; then
	echo -e "\n  Usage: $0 <file1> [ <file2> ... ]\n"
	exit -1
fi

pkg_names=`dpkg -l | awk '{ print $2 }'`

for a in `echo $pkg_names`; do
	for b in $@; do
		dpkg -S $a | grep $b
	done
done
