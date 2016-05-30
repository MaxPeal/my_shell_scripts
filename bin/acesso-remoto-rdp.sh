#!/bin/sh

if [ -z "$2" ]; then
    echo -e "\n\a\tUsage: `basename $0` <user> <server> [options]\n"
    exit 1
fi

user="$1"
server="$2"
shift 2

#exec xfreerdp \
#    /window-drag /clipboard /aero /drive:home,$HOME \
#    /size:100% /bpp:32 $@ /u:$user /v:$server

exec rdesktop \
    -g workarea -D -a 32 -d ifg.br -p - -k pt-br -K \
    -r sound:local:alsa -r clipboard:PRIMARYCLIPBOARD -r disk:home=$HOME $@ \
    -u $user $server
