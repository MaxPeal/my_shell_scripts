#!/bin/bash
find "${1}" -execdir /home/joaomanoel/bin/chown-and-chgrp-dir.sh "{}" ${2} ${3} \;
