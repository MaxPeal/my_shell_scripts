#!/bin/bash
if [ -z "$1" ]; then
	cat | \
	sed 's///' | \
	sed 's///' | \
	sed 's///' | \
	sed 's///' | \
	sed 's///' | \
	sed 's///'
elif [ -f "$1" -a -w "$1" ]; then
	sed -e 's///' -i "$1"
	sed -e 's///' -i "$1"
	sed -e 's///' -i "$1"
	sed -e 's///' -i "$1"
	sed -e 's///' -i "$1"
	sed -e 's///' -i "$1"
else
	echo "$1" \
	sed 's///' | \
	sed 's///' | \
	sed 's///' | \
	sed 's///' | \
	sed 's///' | \
	sed 's///'
fi
