#!/bin/sh

for i in colorama iniget yayson ddg jsonpare jsontool; do
    pip2.7  \
        --upgrade \
        --force-reinstall \
        --no-use-wheel \
        --compile \
        --no-cache-dir \
        install "$i"

exit 0
