#!/bin/bash
find "${1}" -execdir /home/joaomanoel/bin/chgrp-dir.sh "{}" ${2} ${3} \;
