#!/bin/sh

# set MINECRAFT_JAR
if [ -z "$1" ]
then
    MINECRAFT_JAR="$HOME/Dropbox/Minecraft/Mineshafter-launcher.jar"
else
    MINECRAFT_JAR="$1"
fi

# set JAVA_HOME
if [ -z "$2" ]
then
    JAVA_HOME="/usr/lib/jvm/default-java"
else
    JAVA_HOME="$2"
fi

# play game
exec "$JAVA_HOME/bin/java" -jar "$MINECRAFT_JAR"
