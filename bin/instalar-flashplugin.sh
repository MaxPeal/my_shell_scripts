#!/bin/bash

# Verificando se o usuario eh o root
if [ "`id -u`" != "0" ]; then
	echo 'Execute este script como root!!!'
	exit -1
fi

# instalando o flashplugin para mozilla com opcao de depuração
tar --no-same-owner -xzf flashplayer_11_plugin_debug.i386.tar.gz -C /
mkdir -p /opt/adobe-flashplugin
mv /libflashplayer.so /readme.txt /opt/adobe-flashplugin/
update-alternatives --install /usr/lib/mozilla/plugins/libflashplayer.so mozilla-flashplugin /opt/adobe-flashplugin/libflashplayer.so 1000
if [ "`uname -m`" = "x86_64" ]; then
	apt-get install -q -y nspluginwrapper
	nspluginwrapper -i /opt/adobe-flashplugin/libflashplayer.so
fi

# instalando o flashplayerdebugger
tar --no-same-owner -xzf flashplayer_11_sa_debug.i386.tar.gz -C /opt/adobe-flashplugin/
ln -f -s /opt/adobe-flashplugin/flashplayerdebugger /usr/local/bin/

# instalando o flashplayer
tar --no-same-owner -xzf flashplayer_11_sa.i386.tar.gz -C /opt/adobe-flashplugin/
ln -f -s /opt/adobe-flashplugin/flashplayer /usr/local/bin/

# instalando o local_content_updater (binarios e fontes)
apt-get -y -q install libstdc++5
tar --no-same-owner -xzf local_content_updater-linux.tgz -C /opt/adobe-flashplugin/
ln -f -s /opt/adobe-flashplugin/LocalContentUpdater/LocalContentUpdater /usr/local/bin/
tar --no-same-owner -xzf local_content_updater-src.tgz -C /opt/adobe-flashplugin/
