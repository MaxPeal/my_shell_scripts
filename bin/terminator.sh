#!/bin/sh
if [ -d "$1" ]
then
    workdir="$1"
else
    workdir="$(dirname "$1")"
fi
shift
exec /usr/sbin/terminator.wrapper --working-directory="$workdir" $@
