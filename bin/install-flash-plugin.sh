#!/bin/bash

if [ -z "$1" -o "$1" == "-h" ]; then
  echo -e "\nUsage: `basename $0` [ -h ] [ install | remove ]\n"
  exit -1
fi

if [ -n "$2" ]; then
  echo -e "\nUsage: `basename $0` [ -h ] [ install | remove ]\n"
  exit -1
fi

if [ "$1" != "install" -a "$1" != "remove" ]; then
  echo -e "\nUsage: `basename $0` [ -h ] [ install | remove ]\n"
  exit -1
fi

for p in iceape iceweasel mozilla firefox xulrunner midbrowser xulrunner-addons; do

  sudo update-alternatives --remove-all "$p-flashplugin"
  if [ "$1" == "install" ]; then
    sudo mkdir -p "/usr/lib/$p/plugins/"
    sudo update-alternatives --install "/usr/lib/$p/plugins/flashplugin-alternative.so" "$p-flashplugin" /opt/adobe-flashplugin/libflashplayer.so 50;
  fi

done

if [ -d /opt/google/chrome ]; then

  sudo update-alternatives --remove-all "chrome-flashplugin"
  [ "$1" == "install" ] && \
    sudo update-alternatives --install "/opt/google/chrome/flashplugin-alternative.so" "chrome-flashplugin" /opt/adobe-flashplugin/libflashplayer.so 50;

fi


