#!/bin/sh

if [ -z "$3" -o -n "$4" ]; then
    echo -e "\n\a\tUsage: `basename $0` <size> <user> <server>\n"
    exit 1
fi

#exec xfreerdp \
#    /window-drag /clipboard /aero /drive:home,$HOME \
#    /size:$1 /u:$2 /v:$3

exec rdesktop \
    -g $1 -u $2 -d ifg.br -p - -k pt-br -K \
    -r sound:local:alsa -r clipboard:PRIMARYCLIPBOARD -r disk:home=$HOME $3
