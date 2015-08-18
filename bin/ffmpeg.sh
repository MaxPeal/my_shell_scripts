#!/bin/bash

[ -z "$1" ] && exit -1
[ "`basename $1 .vob`" == "$1" ] && exit -1
[ ! -f "$1" ] && exit -1

if [ -z "$2" -o "$2" == "-dvd" ]; then
	ffmpeg -i $1 -f avi -vcodec mpeg4 -b 2400k -g 300 -bf 2 -acodec libmp3lame -ab 384k `basename $1 .vob`.avi
elif [ "$2" == "-cd" ]; then
	ffmpeg -i $1 -f avi -vcodec mpeg4 -b 800k -g 300 -bf 2 -acodec libmp3lame -ab 128k `basename $1 .vob`.avi
fi



