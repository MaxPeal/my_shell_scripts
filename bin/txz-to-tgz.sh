#!/bin/bash

! [ -x /bin/xz -a -x /bin/gzip ] && exit -1

[ -z "$1" ] && exit 1

[ ! -f "$1" ] && exit 2

for (( i=1; i>0; i++ )); do
   ext="`echo "$1" | cut -f 1-$i -d '.' --complement`"
   [ -z $ext ] && exit 3
   [ "$ext" == "txz" ] && break
done

xz -d -q -f -c "$1" | gzip -f -c - > "`basename "$1" xz`"gz || exit 4

