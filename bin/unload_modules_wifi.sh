#!/bin/sh
if [ -n "$(lsmod  | grep "brcmsmac")" ]; then
	sudo rmmod brcmsmac
fi
if [ -n "$(lsmod  | grep "b43")" ]; then
	sudo rmmod b43
fi
if [ -n "$(lsmod  | grep "ssb")" ]; then
	sudo rmmod ssb
fi
if [ -n "$(lsmod  | grep "bcma")" ]; then
	sudo rmmod bcma
fi
if [ -n "$(lsmod  | grep "wl")" ]; then
	sudo rmmod wl
fi
exit 0
