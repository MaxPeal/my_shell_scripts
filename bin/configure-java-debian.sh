#!/bin/bash
if [ "$1" = "oraclejdk7" ]; then
    sudo update-alternatives --set mozilla-javaplugin.so /usr/lib/jvm/jdk-7-oracle-x64/jre/lib/amd64/libnpjp2.so
    sudo update-alternatives --set itweb-settings        /usr/lib/jvm/jdk-7-oracle-x64/jre/bin/ControlPanel
    sudo update-alternatives --set java    /usr/lib/jvm/jdk-7-oracle-x64/jre/bin/java
    sudo update-alternatives --set javac   /usr/lib/jvm/jdk-7-oracle-x64/bin/javac
    sudo update-alternatives --set javadoc /usr/lib/jvm/jdk-7-oracle-x64/bin/javadoc
    sudo update-alternatives --set javap   /usr/lib/jvm/jdk-7-oracle-x64/bin/javap
    sudo update-alternatives --set javah   /usr/lib/jvm/jdk-7-oracle-x64/bin/javah
    sudo update-alternatives --set javaws  /usr/lib/jvm/jdk-7-oracle-x64/jre/bin/javaws
elif [ "$1" = "openjdk7" ]; then
    sudo update-alternatives --set mozilla-javaplugin.so /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so
    sudo update-alternatives --set itweb-settings        /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/itweb-settings
    sudo update-alternatives --set java    /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
    sudo update-alternatives --set javac   /usr/lib/jvm/java-7-openjdk-amd64/bin/javac
    sudo update-alternatives --set javadoc /usr/lib/jvm/java-7-openjdk-amd64/bin/javadoc
    sudo update-alternatives --set javap   /usr/lib/jvm/java-7-openjdk-amd64/bin/javap
    sudo update-alternatives --set javah   /usr/lib/jvm/java-7-openjdk-amd64/bin/javah
    sudo update-alternatives --set javaws  /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/javaws
elif [ "$1" = "openjdk6" ]; then
    sudo update-alternatives --set mozilla-javaplugin.so /usr/lib/jvm/java-6-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so
    sudo update-alternatives --set itweb-settings        /usr/lib/jvm/java-6-openjdk-amd64/jre/bin/itweb-settings
    sudo update-alternatives --set java    /usr/lib/jvm/java-6-openjdk-amd64/jre/bin/java
    sudo update-alternatives --set javac   /usr/lib/jvm/java-6-openjdk-amd64/bin/javac
    sudo update-alternatives --set javadoc /usr/lib/jvm/java-6-openjdk-amd64/bin/javadoc
    sudo update-alternatives --set javap   /usr/lib/jvm/java-6-openjdk-amd64/bin/javap
    sudo update-alternatives --set javah   /usr/lib/jvm/java-6-openjdk-amd64/bin/javah
    sudo update-alternatives --set javaws  /usr/lib/jvm/java-6-openjdk-amd64/jre/bin/javaws
else
    echo -e "Usage:\n\t`basename $0` oraclejdk7|openjdk7|openjdk6"
fi
