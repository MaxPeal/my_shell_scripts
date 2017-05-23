#!/bin/sh

if [ -z "$3" ]; then
    echo -e "\n\a\tUsage: `basename $0` <user> <server> <domain> [geometry] [options]\n"
    exit 1
fi

user="$1"
server="$2"
domain="$3"
shift 3

if [ -n "$1" ]; then
    geometry="$1"
    shift 1
else
    geometry="100%"
fi

#exec xfreerdp \
#    /window-drag /clipboard /aero /drive:home,$HOME \
#    /size:$geometry /bpp:32 $@
#    /u:$user /v:$server /d:$domain

exec rdesktop \
    -g $geometry -a 32 -p - -k pt-br \
    -r sound:local:alsa -r clipboard:PRIMARYCLIPBOARD -r disk:home=$HOME $@ \
    -u $user $server -d $domain
