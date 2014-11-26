#!/bin/bash

DOCKS="wmclock wmtimer wmload wmtop wmcpu wmcpuload wmxres wmmixer wmxmms2 wmcalc wmpuzzle"

for i in $DOCKS; do
        case $i in
        "wmload"|"wmmixer")
                exec $i -w &
        ;;
        *)
                exec $i &
        ;;
        esac
done
