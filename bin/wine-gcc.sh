#!/bin/bash
env WINEPREFIX="/home/joaomanoel/.wine"
exec wine "C:\\MinGW\\bin\\gcc.exe" $@
