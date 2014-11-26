#!/bin/bash
while [ "$1" ]; do
	if [ -f "$1" ]; then
		sed 's/\.asp\([^x]\{1\}\)/\.aspx\1/g' -i "$1"
	fi
	shift 1
done
