#!/bin/bash
find "${1}" -execdir /home/joaomanoel/bin/chown-dir.sh "{}" ${2} ${3} \;
