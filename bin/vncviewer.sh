#!/bin/sh

JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
VNCVIEWER_JAR="/usr/share/vnc/classes/VncViewer.jar"

exec "$JAVA_HOME/bin/java" -cp "$VNCVIEWER_JAR" VncViewer HOST "$1" PORT "$2"
