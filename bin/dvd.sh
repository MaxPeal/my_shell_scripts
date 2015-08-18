#!/bin/bash

mplayer -dvd-device /dev/dvd -vf scale -zoom dvd://9 -aid 129 -dumpstream -dumpfile "$1".avi


