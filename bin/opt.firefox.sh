#!/bin/bash

pfm="no"

for i in "$@"; do
	if [ "$i" == "-ProfileManager" ]; then
		pfm="yes"
		break
	fi
done

if [ "$pfm" == "yes" ]; then
	/opt/firefox/firefox "$@"
else
	/opt/firefox/firefox -P default "$@"
fi
