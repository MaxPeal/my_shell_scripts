#!/bin/bash

if [ -z "$1" ]; then
    echo -e "\n\tUsage:\t$(basename $0) --install|--remove\n"
    exit 0
fi

if [ "$1" != "--install" -a "$1" != "--remove" ]; then
    echo -e "\a\n\tError: parameter \"$1\" is invalid!"
    echo -e "\n\tUsage:\t$(basename $0) --install|--remove\n"
    exit 1
fi

# jre
for i in `update-java-alternatives -v -l | grep -e '^hl .*\/jre\/bin\/.*$' | sed 's/^hl \([^[:blank:]]\+\).*\/jre\/bin\/.*$/\1/'`; do
    if [ "$1" == "--install" ]; then
        sudo update-alternatives --install /usr/bin/$i $i /usr/lib/jvm/java-8-oraclejdk-amd64/jre/bin/$i 180121
    elif [ "$1" == "--remove" ]; then
        sudo update-alternatives --remove $i /usr/lib/jvm/java-8-oraclejdk-amd64/jre/bin/$i
    fi
done
for i in `update-java-alternatives -v -l | grep -e '^hl .*\/jre\/lib\/.*$' | sed 's/^hl \([^[:blank:]]\+\).*\/jre\/lib\/.*$/\1/'`; do
    if [ "$1" == "--install" ]; then
        sudo update-alternatives --install /usr/bin/$i $i /usr/lib/jvm/java-8-oraclejdk-amd64/jre/lib/$i 180121
    elif [ "$1" == "--remove" ]; then
        sudo update-alternatives --remove $i /usr/lib/jvm/java-8-oraclejdk-amd64/jre/lib/$i
    fi
done
for i in `update-java-alternatives -v -l | grep -e '^jre ' | sed 's/^jre \([^[:blank:]]\+\).*$/\1/'`; do
    if [ "$1" == "--install" ]; then
        sudo update-alternatives --install /usr/bin/$i $i /usr/lib/jvm/java-8-oraclejdk-amd64/jre/bin/$i 180121
    elif [ "$1" == "--remove" ]; then
        sudo update-alternatives --remove $i /usr/lib/jvm/java-8-oraclejdk-amd64/jre/bin/$i
    fi
done

# jdk
for i in `update-java-alternatives -v -l | grep -e '^jdk ' | sed 's/^jdk \([^[:blank:]]\+\).*$/\1/'`; do
    if [ "$1" == "--install" ]; then
        sudo update-alternatives --install /usr/bin/$i $i /usr/lib/jvm/java-8-oraclejdk-amd64/bin/$i 180121
    elif [ "$1" == "--remove" ]; then
        sudo update-alternatives --remove $i /usr/lib/jvm/java-8-oraclejdk-amd64/bin/$i
    fi
done

# plugin
for i in `update-java-alternatives -v -l | grep -e '^plugin ' | sed 's/^plugin \([^[:blank:]]\+\).*$/\1/'`; do
    if [ "$1" == "--install" ]; then
        sudo update-alternatives --install /usr/lib/mozilla/plugins/libjavaplugin.so $i /usr/lib/jvm/java-8-oraclejdk-amd64/jre/lib/amd64/libnpjp2.so 180121
    elif [ "$1" == "--remove" ]; then
        sudo update-alternatives --remove $i /usr/lib/jvm/java-8-oraclejdk-amd64/jre/lib/amd64/libnpjp2.so
    fi
done

exit 0
