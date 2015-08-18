#!/bin/bash

wget_ibiblio ()
{
    while true; do

	PS_WGET="`ps axw | egrep 'wget.*log' | grep -v 'grep' | nl | tail -n 1 | sed 's/^[[:blank:]]*\([^[:blank:]]*\).*$/\1/'`"
	test -z "$PS_WGET" && PS_WGET=$((0))

	for ((i=0; i<4-PS_WGET; i++)); do

	    wget -b -o "`basename $1`.log" -c "$1"
	    shift 1
	    test -z "$1" && return 0
	    sleep 30

	done

	sleep 60

    done

    return 0
}

if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]; then

    echo "Usage: `basename $0` url1 [ url2 [ ... ] ]"
    exit 0

fi

wget_ibiblio $@

exit 0
