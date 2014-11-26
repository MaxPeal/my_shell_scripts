#!/bin/bash

#IFS=`printf ' \t\n'`
IFS=" "$'\t'$'\n'
lp=$'\0'

for i in `cat $1`; do
  lp="${lp} ${i}"
done

echo $lp


