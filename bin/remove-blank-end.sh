#!/bin/bash
[ ! -f "$1" ] && exit -1
[ ! -w "$1" ] && exit -1
sed -i -e 's/[[:blank:]]*$//' "$1"
