#!/bin/bash

if [ -f "$1" ]; then
  gawk -f $HOME/bin/upper.awk $1
else
  gawk -f $HOME/bin/upper.awk
fi
