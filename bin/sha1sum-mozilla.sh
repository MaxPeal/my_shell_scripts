#!/bin/bash
[ ! -f "$1" ] && \
    echo "Usage: `basename $0` file-to-check" && \
    exit 1
grep "linux-x86_64/pt-BR/$1" SHA1SUMS | sed 's/linux\-x86_64\/pt\-BR\///' | sha1sum -c
exit 0
