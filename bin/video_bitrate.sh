#!/bin/bash

if [ ! -f "${1}" -o -z "${2}" -o -n "${3}" ]; then
	echo "usage: `basename ${0}` <movie_file> <audio_bitrate>"
	exit -1
fi

movie_abitrate="${2}"

mplayer "${1}" -frames 0 -identify > "${1}.identify.log" 2>&1
movie_seconds=$(grep ID_LENGTH "${1}.identify.log" | cut -d \= -f 2)
if [ -z "${movie_seconds}" ]; then
	exit -2
fi
rm -f "${1}.identify.log"

movie_bytes=$(du --block-size 1 "${1}" | cut -f 1)
if [ -z "${movie_bytes}" ]; then
	exit -3
fi

movie_vbitrate=$(echo "${movie_bytes} * 8 / (1000 * ${movie_seconds}) - ${movie_abitrate}" | bc -l)
if [ -z "${movie_vbitrate}" ]; then
	exit -4
fi

echo "video_bitrate=${movie_vbitrate}"


