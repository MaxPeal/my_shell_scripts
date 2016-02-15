#!/bin/bash
if [ -z "$1" -o -z "$2" -o -z "$3" -o -z "$4" -o -n "$5" ]; then
    echo -e "Uso:\n\t$(basename $0) <usuario> <dominio> <compartilhamento> <diretorio>"
    exit 1
fi
my_uid=$(id | sed 's/^.*uid=\([0-9]\+\).*$/\1/')
my_gid=$(id | sed 's/^.*gid=\([0-9]\+\).*$/\1/')
sudo mount -t cifs -o username=$1,dom=$2,uid=$my_uid,forceuid,gid=$my_gid,forcegid $3 $4
