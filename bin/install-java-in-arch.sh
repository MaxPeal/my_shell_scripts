#!/bin/sh

for i in \
    jdk \
    jdk-demos \
    jdk-docs \
    jre server-jre \
    javafx-docs \
    javafx-scenebuilder \
    scenic-view \
    asciidocfx
do
    yaourt -S $i
done

exit 0
