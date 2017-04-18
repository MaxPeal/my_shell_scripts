#!/bin/sh -e

if [ -x "$1" ]
then
	EDITOR="$1"
	shift 1
else
	EDITOR="/c/Program Files/Vim/74/gvim.exe"
	#EDITOR="/c/windows/system32/gvim.bat"
fi

exec ~/git/edit-server/edit-server "$EDITOR" $@
