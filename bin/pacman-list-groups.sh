#!/bin/bash
if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]
then
    echo -e "\aUsage:\n\t$(basename $0) <group>"
    exit 0
fi
exec pacman -Sg | grep -e $1 | sort -u
