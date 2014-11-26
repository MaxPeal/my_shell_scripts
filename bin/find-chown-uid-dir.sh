#!/bin/bash
find "${1}" -execdir /home/joaomanoel/bin/chown-uid-dir.sh "{}" ${2} ${3} \;
