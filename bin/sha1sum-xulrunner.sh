#!/bin/bash
[ ! -f "$1" ] && \
    echo "Usage: `basename $0` file-to-check" && \
    exit 1
grep "$1" SHA1SUMS | sed 's/^\([^[:blank:]]*\)[[:blank:]]*[^\/]*\//\1 \*/' | sha1sum -c
exit 0
