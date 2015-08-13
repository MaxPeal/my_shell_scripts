#!/bin/bash
sudo update-alternatives --remove libjavaplugin.so.x86_64 /usr/java/default/jre/lib/amd64/libnpjp2.so
sudo update-alternatives \
    --install /usr/lib64/mozilla/plugins/libjavaplugin.so libjavaplugin.so.x86_64 /usr/java/default/jre/lib/amd64/libnpjp2.so 18005 \
    --slave   /usr/bin/javaws                             javaws                  /usr/java/default/jre/bin/javaws \
    --slave   /usr/share/man/man1/javaws.1.gz             javaws.1.gz             /usr/java/default/man/man1/javaws.1
sudo update-alternatives --set libjavaplugin.so.x86_64 /usr/java/default/jre/lib/amd64/libnpjp2.so
exit 0