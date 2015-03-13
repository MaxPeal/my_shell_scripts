#!/bin/sh
JAVA_HOME="$HOME/.local/java/latest"
VNCVIEWER_JAR="/usr/share/vnc-java/vncviewer.jar"
exec $JAVA_HOME/bin/java -cp $VNCVIEWER_JAR VncViewer HOST $1 PORT $2 forceProxy yes proxyHost $3 proxyPort $4
