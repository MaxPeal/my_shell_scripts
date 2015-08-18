#!/bin/bash
if [ -n "$1" ]; then
	rpm -qa | grep "$1" | sed 's/^\([^0-9]\+\)\-[0-9]\{1\}.*$/\1/'
else
	echo -e "Uso:\t`basename $0`\ttermo-a-pesquisar"
fi
