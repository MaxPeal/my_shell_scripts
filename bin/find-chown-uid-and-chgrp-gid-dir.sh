#!/bin/bash
find "${1}" -execdir /home/joaomanoel/bin/chown-uid-and-chgrp-gid-dir.sh "{}" ${2} ${3} \;
