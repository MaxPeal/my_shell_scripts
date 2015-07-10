#!/bin/bash

gnome-screensaver-command --exit

dosbox -fullscreen \
	-c "MOUNT D /home/joaomanoel/dos"
#-c "PATH=%PATH%;D:\TC\BIN"
#-c "MOUNT C /home/joaomanoel/tp"

gnome-screensaver &
