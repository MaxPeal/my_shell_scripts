#!/bin/bash
IFS=$'\n'
for i in $@
do
	f=$(basename "$i" .mp3)
	if [ "$f" = "$i" ]
	then
		continue
	fi
	lame --decode "$i" "$f.wav"
done
IFS=$'\t\n '
