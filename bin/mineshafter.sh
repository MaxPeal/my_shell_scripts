#!/bin/sh

# set MINESHAFTER_JAR
if [ -z "$1" ]
then
    MINESHAFTER_JAR="$HOME/Dropbox/Minecraft/Mineshafter-launcher.jar"
else
    MINESHAFTER_JAR="$1"
fi

# set JAVA_HOME
if [ -z "$2" ]
then
    JAVA_HOME="/usr/local/java/default"
else
    JAVA_HOME="$2"
fi

# play game
exec "$JAVA_HOME/bin/java" -jar "$MINESHAFTER_JAR"
