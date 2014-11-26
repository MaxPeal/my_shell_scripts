#!/bin/bash

test ! -d "$1" && exit -1
cd "$1"/..
dvd_dir=$(basename "$1")
ls -1 "$dvd_dir" > "$dvd_dir".iso.list && \
genisoimage -input-charset iso8859-1 -udf -o "$dvd_dir".iso "$dvd_dir" && \
sha1sum "$dvd_dir".iso > "$dvd_dir".iso.sha1 && \
rm -rf "$dvd_dir"
