#!/bin/sh

if [ -n "$1" ]
then
    if [ -d "$1" ]
    then
        workdir="$1"
        shift
    elif [ -f "$1" ]
    then
        workdir="$(dirname "$1")"
        shift
    else
        workdir="$HOME"
    fi
else
    workdir="$HOME"
fi

#exec /usr/bin/urxvt -cd "$workdir" $@
exec /usr/bin/terminator --working-directory="$workdir" $@
