#!/bin/sh

if [ -z "$3" -o -n "$4" ]; then
    echo "\n\a\tUsage: `basename $0` <user> <server> <size>\n"
    exit 1
fi

exec xfreerdp /flag +window-drag +clipboard /u:$1 /v:$2 /size:$3 /drive:home,/home/user
