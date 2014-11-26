#!/bin/bash

[ ! -f "$1" ] && exit 0
[ ! -w "$1" ] && exit 0

filename="$1"
shift 1
lista="$@"
IFS=$' \t\n'

for i in $lista
do
    sed -i -e "s/$i//g" $filename
done
