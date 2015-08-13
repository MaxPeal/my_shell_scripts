#!/bin/bash
[ ! -f "$1" ] && exit -1
fn="`basename "$1" .sh`"
[ "${fn}" = "`basename "$1"`" ] && exit -1
dest="`dirname "$1"`/${fn}.bat"
cp "$1" "${dest}"
sed -i -e 's/^#!\/bin\/bash/echo off/' "${dest}"
sed -i -e 's/^#!\/bin\/sh/echo off/' "${dest}"
flip -m -b  "${dest}"
chmod 0755  "${dest}"
