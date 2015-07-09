#!/bin/bash

[ -z "$1" -o -n "$2" ] && exit -1
[ ! -f "$1" ] && exit -1
[ ! -w "$1" ] && exit -1

sort -u $1 > $1.tmp
echo "" > $1

IFS=" "$'\t'$'\n'

for i in `cat $1.tmp`; do
  echo $i >> $1
  echo "" >> $1
done

rm -f $1.tmp


