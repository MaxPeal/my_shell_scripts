#!/bin/bash

if [ ! -f "${1}" -o -z "${2}" -o -n "${3}" ]; then
	echo "usage: `basename ${0}` <movie_file> <audio_bitrate>"
	exit -1
fi

abit="${2}"

vbit=$(video_bitrate.sh "${1}" "${abit}" | cut -d \= -f 2)
vbit=$(echo "${vbit} + 1" | bc -l)
vbit=$(echo "${vbit}" | cut -d \. -f 1)

if [ -z "${vbit}" ]; then
	exit -2
fi

if (( "${vbit}" < 1 )); then
	exit -3
fi

mencoder "${1}" -of lavf -lavfopts format=avi -o /dev/null \
	-oac lavc -lavcopts acodec=ac3:abitrate=$abit \
	-ovc lavc -lavcopts vcodec=mpeg4:vbitrate=$vbit:vpass=1

extension=$(extname.sh "${1}")
movie=$(basename "${1}" ."${extension}")

mencoder "${1}" -of lavf -lavfopts format=avi -o "${movie}.avi" \
	-oac lavc -lavcopts acodec=ac3:abitrate=$abit \
	-ovc lavc -lavcopts vcodec=mpeg4:vbitrate=$vbit:mbd=2:trell:vpass=2

rm -f divx2pass.log
