#!/bin/bash
unalias ls 2>/dev/null
ls -alF "$1" | head -n 2 | grep \/ | awk '{print $4}'
