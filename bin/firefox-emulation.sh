#!/bin/sh

if [ "$1" = "-remote" ]; then
    if [ -n $(echo "$2" | grep "openURL") ]; then
	url=$(echo "$2" | awk -F 'openURL' '{print substr($2,2,length($2)-2)}')
	exec google-chrome "$url"
    else
	exec google-chrome "$2"
    fi
fi

exec google-chrome "$@"
