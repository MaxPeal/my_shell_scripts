#!/bin/bash
sudo update-alternatives --remove-all ControlPanel
sudo update-alternatives --remove \
  itweb-settings \
  /usr/lib/jvm/jdk-7-oracle-x64/jre/bin/ControlPanel
sudo update-alternatives --install \
  /usr/bin/itweb-settings \
  itweb-settings \
  /usr/lib/jvm/jdk-7-oracle-x64/jre/bin/ControlPanel \
  317
sudo rm -f /usr/bin/ControlPanel
sudo ln -s -f itweb-settings /usr/bin/ControlPanel
exit 0
