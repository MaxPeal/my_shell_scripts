#!/bin/bash

[ -z "$1" ] && exit 1
[ -z "$2" ] && exit 2
[ -z "$3" ] && exit 3


mplayer -dvd-device /dev/dvd -vf scale -zoom dvd://$1 -aid $2 -dumpstream -dumpfile "$3".avi
