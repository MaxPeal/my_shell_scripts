#!/bin/bash

#*** java jre ***
sudo update-alternatives --remove java /usr/java/default/jre/bin/java
sudo update-alternatives \
	--install /usr/bin/java                        java             /usr/java/default/jre/bin/java 180005 \
	--slave   /usr/bin/jjs                         jjs              /usr/java/default/jre/bin/jjs \
	--slave   /usr/bin/keytool                     keytool          /usr/java/default/jre/bin/keytool \
	--slave   /usr/bin/orbd                        orbd             /usr/java/default/jre/bin/orbd \
	--slave   /usr/bin/pack200                     pack200          /usr/java/default/jre/bin/pack200 \
	--slave   /usr/bin/rmid                        rmid             /usr/java/default/jre/bin/rmid \
	--slave   /usr/bin/rmiregistry                 rmiregistry      /usr/java/default/jre/bin/rmiregistry \
	--slave   /usr/bin/servertool                  servertool       /usr/java/default/jre/bin/servertool \
	--slave   /usr/bin/tnameserv                   tnameserv        /usr/java/default/jre/bin/tnameserv \
	--slave   /usr/bin/unpack200                   unpack200        /usr/java/default/jre/bin/unpack200 \
	--slave   /usr/lib/jvm/jre                     jre              /usr/java/default/jre \
	--slave   /usr/lib/jvm-exports/jre             jre_exports      /usr/java-exports/default \
	--slave   /usr/share/man/man1/java.1.gz        java.1.gz        /usr/java/default/man/man1/java.1 \
	--slave   /usr/share/man/man1/jjs.1.gz         jjs.1.gz         /usr/java/default/man/man1/jjs.1 \
	--slave   /usr/share/man/man1/keytool.1.gz     keytool.1.gz     /usr/java/default/man/man1/keytool.1 \
	--slave   /usr/share/man/man1/orbd.1.gz        orbd.1.gz        /usr/java/default/man/man1/orbd.1 \
	--slave   /usr/share/man/man1/pack200.1.gz     pack200.1.gz     /usr/java/default/man/man1/pack200.1 \
	--slave   /usr/share/man/man1/rmid.1.gz        rmid.1.gz        /usr/java/default/man/man1/rmid.1 \
	--slave   /usr/share/man/man1/rmiregistry.1.gz rmiregistry.1.gz /usr/java/default/man/man1/rmiregistry.1 \
	--slave   /usr/share/man/man1/servertool.1.gz  servertool.1.gz  /usr/java/default/man/man1/servertool.1 \
	--slave   /usr/share/man/man1/tnameserv.1.gz   tnameserv.1.gz   /usr/java/default/man/man1/tnameserv.1 \
	--slave   /usr/share/man/man1/unpack200.1.gz   unpack200.1.gz   /usr/java/default/man/man1/unpack200.1
sudo update-alternatives --set java /usr/java/default/jre/bin/java

#*** java sdk ***
sudo update-alternatives --remove javac /usr/java/default/bin/javac
sudo update-alternatives \
  --install /usr/bin/javac                        javac             /usr/java/default/bin/javac 180005 \
  --slave   /usr/bin/appletviewer                 appletviewer      /usr/java/default/bin/appletviewer \
  --slave   /usr/bin/extcheck                     extcheck          /usr/java/default/bin/extcheck \
  --slave   /usr/bin/idlj                         idlj              /usr/java/default/bin/idlj \
  --slave   /usr/bin/jar                          jar               /usr/java/default/bin/jar \
  --slave   /usr/bin/jarsigner                    jarsigner         /usr/java/default/bin/jarsigner \
  --slave   /usr/bin/javadoc                      javadoc           /usr/java/default/bin/javadoc \
  --slave   /usr/bin/javah                        javah             /usr/java/default/bin/javah \
  --slave   /usr/bin/javap                        javap             /usr/java/default/bin/javap \
  --slave   /usr/bin/jcmd                         jcmd              /usr/java/default/bin/jcmd \
  --slave   /usr/bin/jconsole                     jconsole          /usr/java/default/bin/jconsole \
  --slave   /usr/bin/jdb                          jdb               /usr/java/default/bin/jdb \
  --slave   /usr/bin/jdeps                        jdeps             /usr/java/default/bin/jdeps \
  --slave   /usr/bin/jhat                         jhat              /usr/java/default/bin/jhat \
  --slave   /usr/bin/jinfo                        jinfo             /usr/java/default/bin/jinfo \
  --slave   /usr/bin/jmap                         jmap              /usr/java/default/bin/jmap \
  --slave   /usr/bin/jps                          jps               /usr/java/default/bin/jps \
  --slave   /usr/bin/jrunscript                   jrunscript        /usr/java/default/bin/jrunscript \
  --slave   /usr/bin/jsadebugd                    jsadebugd         /usr/java/default/bin/jsadebugd \
  --slave   /usr/bin/jstack                       jstack            /usr/java/default/bin/jstack \
  --slave   /usr/bin/jstat                        jstat             /usr/java/default/bin/jstat \
  --slave   /usr/bin/jstatd                       jstatd            /usr/java/default/bin/jstatd \
  --slave   /usr/bin/native2ascii                 native2ascii      /usr/java/default/bin/native2ascii \
  --slave   /usr/bin/policytool                   policytool        /usr/java/default/bin/policytool \
  --slave   /usr/bin/rmic                         rmic              /usr/java/default/bin/rmic \
  --slave   /usr/bin/schemagen                    schemagen         /usr/java/default/bin/schemagen \
  --slave   /usr/bin/serialver                    serialver         /usr/java/default/bin/serialver \
  --slave   /usr/bin/wsgen                        wsgen             /usr/java/default/bin/wsgen \
  --slave   /usr/bin/wsimport                     wsimport          /usr/java/default/bin/wsimport \
  --slave   /usr/bin/xjc                          xjc               /usr/java/default/bin/xjc \
  --slave   /usr/lib/jvm-exports/java             java_sdk_exports  /usr/java-exports/default \
  --slave   /usr/lib/jvm/java                     java_sdk          /usr/java/default \
  --slave   /usr/share/man/man1/appletviewer.1.gz appletviewer.1.gz /usr/java/default/man/man1/appletviewer.1 \
  --slave   /usr/share/man/man1/extcheck.1.gz     extcheck.1.gz     /usr/java/default/man/man1/extcheck.1 \
  --slave   /usr/share/man/man1/idlj.1.gz         idlj.1.gz         /usr/java/default/man/man1/idlj.1 \
  --slave   /usr/share/man/man1/jar.1.gz          jar.1.gz          /usr/java/default/man/man1/jar.1 \
  --slave   /usr/share/man/man1/jarsigner.1.gz    jarsigner.1.gz    /usr/java/default/man/man1/jarsigner.1 \
  --slave   /usr/share/man/man1/javac.1.gz        javac.1.gz        /usr/java/default/man/man1/javac.1 \
  --slave   /usr/share/man/man1/javadoc.1.gz      javadoc.1.gz      /usr/java/default/man/man1/javadoc.1 \
  --slave   /usr/share/man/man1/javah.1.gz        javah.1.gz        /usr/java/default/man/man1/javah.1 \
  --slave   /usr/share/man/man1/javap.1.gz        javap.1.gz        /usr/java/default/man/man1/javap.1 \
  --slave   /usr/share/man/man1/jcmd.1.gz         jcmd.1.gz         /usr/java/default/man/man1/jcmd.1 \
  --slave   /usr/share/man/man1/jconsole.1.gz     jconsole.1.gz     /usr/java/default/man/man1/jconsole.1 \
  --slave   /usr/share/man/man1/jdb.1.gz          jdb.1.gz          /usr/java/default/man/man1/jdb.1 \
  --slave   /usr/share/man/man1/jdeps.1.gz        jdeps.1.gz        /usr/java/default/man/man1/jdeps.1 \
  --slave   /usr/share/man/man1/jhat.1.gz         jhat.1.gz         /usr/java/default/man/man1/jhat.1 \
  --slave   /usr/share/man/man1/jinfo.1.gz        jinfo.1.gz        /usr/java/default/man/man1/jinfo.1 \
  --slave   /usr/share/man/man1/jmap.1.gz         jmap.1.gz         /usr/java/default/man/man1/jmap.1 \
  --slave   /usr/share/man/man1/jps.1.gz          jps.1.gz          /usr/java/default/man/man1/jps.1 \
  --slave   /usr/share/man/man1/jrunscript.1.gz   jrunscript.1.gz   /usr/java/default/man/man1/jrunscript.1 \
  --slave   /usr/share/man/man1/jsadebugd.1.gz    jsadebugd.1.gz    /usr/java/default/man/man1/jsadebugd.1 \
  --slave   /usr/share/man/man1/jstack.1.gz       jstack.1.gz       /usr/java/default/man/man1/jstack.1 \
  --slave   /usr/share/man/man1/jstat.1.gz        jstat.1.gz        /usr/java/default/man/man1/jstat.1 \
  --slave   /usr/share/man/man1/jstatd.1.gz       jstatd.1.gz       /usr/java/default/man/man1/jstatd.1 \
  --slave   /usr/share/man/man1/native2ascii.1.gz native2ascii.1.gz /usr/java/default/man/man1/native2ascii.1 \
  --slave   /usr/share/man/man1/policytool.1.gz   policytool.1.gz   /usr/java/default/man/man1/policytool.1 \
  --slave   /usr/share/man/man1/rmic.1.gz         rmic.1.gz         /usr/java/default/man/man1/rmic.1 \
  --slave   /usr/share/man/man1/schemagen.1.gz    schemagen.1.gz    /usr/java/default/man/man1/schemagen.1 \
  --slave   /usr/share/man/man1/serialver.1.gz    serialver.1.gz    /usr/java/default/man/man1/serialver.1 \
  --slave   /usr/share/man/man1/wsgen.1.gz        wsgen.1.gz        /usr/java/default/man/man1/wsgen.1 \
  --slave   /usr/share/man/man1/wsimport.1.gz     wsimport.1.gz     /usr/java/default/man/man1/wsimport.1 \
  --slave   /usr/share/man/man1/xjc.1.gz          xjc.1.gz          /usr/java/default/man/man1/xjc.1
sudo update-alternatives --set javac /usr/java/default/bin/javac

#*** java plugin ***
sudo update-alternatives --remove libjavaplugin.so.x86_64 /usr/java/default/jre/lib/amd64/libnpjp2.so
sudo update-alternatives \
	--install /usr/lib64/mozilla/plugins/libjavaplugin.so libjavaplugin.so.x86_64 /usr/java/default/jre/lib/amd64/libnpjp2.so 180005 \
	--slave   /usr/bin/javaws                             javaws                  /usr/java/default/jre/bin/javaws \
	--slave   /usr/share/man/man1/javaws.1.gz             javaws.1.gz             /usr/java/default/man/man1/javaws.1
sudo update-alternatives --set libjavaplugin.so.x86_64 /usr/java/default/jre/lib/amd64/libnpjp2.so

#*** javadoc dir ***
sudo update-alternatives --remove javadocdir /usr/java/default/docs/api
sudo update-alternatives --install /usr/share/javadoc/java javadocdir /usr/java/default/docs/api 180005
sudo update-alternatives --set javadocdir /usr/java/default/docs/api

exit 0
