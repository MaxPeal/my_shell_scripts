#!/bin/sh

if [ -n "$1" ]
then
    if [ -d "$1" ]
    then
        workdir="$1"
    elif [ -f "$1" ]
    then
        workdir="$(dirname "$1")"
    fi
else
    workdir="$HOME"
fi

shift

exec /usr/sbin/terminator.wrapper --working-directory="$workdir" $@
