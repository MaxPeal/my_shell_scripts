#!/bin/bash

[ -z "$1" ] && exit -1

exec transcode -i /dev/dvd -x dvd -j 16,0 -B 5,0 -Y 40,8 -s 4.47 -U "$1" -y xvid -w 1618
