#!/bin/sh
. ~/.bash_env
exec $JAVA_HOME/bin/java -cp $VNCVIEWER_JAR VncViewer HOST $1 PORT $2 forceProxy yes proxyHost $3 proxyPort $4
