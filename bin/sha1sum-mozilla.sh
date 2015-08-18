#!/bin/bash

help_and_exit()
{
    echo -e "\nUso:\n\t`basename $0` <firefox|thunderbird|xulrunner> <arquivo>"
    echo -e "\nPS: o arquivo \"SHA1SUMS\" deve existir no diretorio corrente.\n"
    exit 0
}

if [ "$1" != "firefox" -a "$1" != "thunderbird" -a "$1" != "xulrunner" ]; then
    help_and_exit
fi

if [ ! -f "$2" -o ! -f "SHA1SUMS" ]; then
    help_and_exit
fi

if [ "$1" = "firefox" -o "$1" = "thunderbird" ]; then
    egrep "linux-x86_64/pt-BR/${2}$" SHA1SUMS | sed 's,linux-x86_64/pt-BR/,,' | sha1sum -c >/dev/null 2>&1
    if [ "$?" != "0" ]; then
        echo -e "\nARQUIVO: \"$2\" ESTÁ CORROMPIDO!\n"
        exit 1
    fi
else
    egrep "${2}$" SHA1SUMS | sed 's,^\([a-f0-9]\{40\}\)[[:blank:]]\{1\,2\}[^/]\+/,\1  ,' | sha1sum -c >/dev/null 2>&1
    if [ "$?" != "0" ]; then
        echo -e "\nARQUIVO: \"$2\" ESTÁ CORROMPIDO!\n"
        exit 1
    fi
fi

echo -e "\nARQUIVO: \"$2\" ESTÁ OK!\n"
exit 0
