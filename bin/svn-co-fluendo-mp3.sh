#!/bin/bash
mkdir -p ~/dev/fluendo
cd ~/dev/fluendo
rm -rf fluendo-mp3
svn co https://core.fluendo.com/gstreamer/svn/trunk/ fluendo-mp3
