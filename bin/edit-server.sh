#!/bin/sh

test -d ~/git/edit-server && \
cd ~/git/edit-server && \
./edit-server $@

exit 0
