#!/bin/sh

if [ -x "$1" ]
then
    USE_EDITOR="$1"
    shift
else
    USE_EDITOR="/usr/bin/gedit"
fi

cd ~/git/edit-server && \
exec ./edit-server "$USE_EDITOR" $@
