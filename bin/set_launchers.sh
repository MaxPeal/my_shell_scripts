#!/bin/bash
let s=`gconftool-2 /apps/docky-2/Docky/Interface/DockPreferences/Dock1/Launchers --get-list-size`
l="[`gconftool-2 /apps/docky-2/Docky/Interface/DockPreferences/Dock1/Launchers --get-list-element 0`"
for (( c=1; c < $s; c++ )); do
  l="${l},`gconftool-2 /apps/docky-2/Docky/Interface/DockPreferences/Dock1/Launchers --get-list-element $c`"
done
for i in $@; do
  if [ -f /usr/share/applications/$i ]; then
    l="${l},file:///usr/share/applications/${i}"
  fi
done
l="${l}]"
gconftool-2 /apps/docky-2/Docky/Interface/DockPreferences/Dock1/Launchers --type=list --list-type=string --set $l

