#!/bin/sh

TEMP_DIR="$(mktemp -d /tmp/manjaro-update.XXXXXX)"
cd "$TEMP_DIR"

#sudo pacman -Sy $(pacman -Qu | sed 's/^\([^[:blank:]]\+\).*$/\1 /' | grep -v 'networkmanager' | sed ':i ; $!N ; s/\n// ; ti')
sudo pacman -Sy $(pacman -Qu | sed 's/^\([^[:blank:]]\+\).*$/\1 /' | sed ':i ; $!N ; s/\n// ; ti')

cd "$HOME"
rmdir "$TEMP_DIR"

exit 0
