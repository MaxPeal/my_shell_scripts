#!/bin/bash

# install mozilla flash-plugins

sudo rpm -Uvh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
sudo yum install gnash-plugin totem-mozplugin-vegas flash-plugin

# configure gnu gnash-plugin

if [ -f /usr/lib64/mozilla/plugins/libgnashplugin.so ]
then
    sudo mkdir -p /usr/lib64/gnash-plugin
    sudo mv -f /usr/lib64/mozilla/plugins/libgnashplugin.so \
	/usr/lib64/gnash-plugin/libgnashplugin.so
    sudo rm -f /usr/lib64/mozilla/plugins/libgnashplugin.so
fi

sudo update-remove libflashplugin.so /usr/lib64/gnash-plugin/libgnashplugin.so >/dev/null 2>&1
sudo update-alternatives --install \
    /usr/lib64/mozilla/plugins/libflashplugin.so \
    libflashplugin.so \
    /usr/lib64/gnash-plugin/libgnashplugin.so \
    101999

# configure totem vegas-plugin

if [ -f /usr/lib64/mozilla/plugins/libtotem-vegas-plugin.so ]
then
    sudo mkdir -p /usr/lib64/totem-vegas-plugin
    sudo mv -f /usr/lib64/mozilla/plugins/libtotem-vegas-plugin.so \
	/usr/lib64/totem-vegas-plugin/libtotem-vegas-plugin.so
    sudo rm -f /usr/lib64/mozilla/plugins/libtotem-vegas-plugin.so
fi

sudo update-alternatives --remove libflashplugin.so /usr/lib64/totem-vegas-plugin/libtotem-vegas-plugin.so >/dev/null 2>&1
sudo update-alternatives --install \
    /usr/lib64/mozilla/plugins/libflashplugin.so \
    libflashplugin.so \
    /usr/lib64/totem-vegas-plugin/libtotem-vegas-plugin.so \
    111102

# configure adobe flash-plugin

if [ -h /usr/lib64/mozilla/plugins/libflashplayer.so ]
then
    sudo rm -f /usr/lib64/mozilla/plugins/libflashplayer.so
elif [ -f /usr/lib64/mozilla/plugins/libflashplayer.so ]
then
    sudo mkdir -p /usr/lib64/flash-plugin
    sudo mv -f /usr/lib64/mozilla/plugins/libflashplayer.so /usr/lib64/flash-plugin/libflashplayer.so
    sudo rm -f /usr/lib64/mozilla/plugins/libflashplayer.so
fi

sudo update-alternatives --remove libflashplugin.so /usr/lib64/flash-plugin/libflashplayer.so >/dev/null 2>&1
sudo update-alternatives --install \
    /usr/lib64/mozilla/plugins/libflashplugin.so \
    libflashplugin.so \
    /usr/lib64/flash-plugin/libflashplayer.so \
    112202

exit 0
