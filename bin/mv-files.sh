#!/bin/bash
[ -z "$2" ] && exit 0
for i in $1.*; do
	mv -i $i `echo $i | sed "s/^[^\.]\+\.\(.\+\)$/$2\.\1/"`
done
