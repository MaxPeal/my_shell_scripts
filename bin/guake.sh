#!/bin/sh
echo $@ >> ~/.guake.log
exec /usr/bin/guake $@
