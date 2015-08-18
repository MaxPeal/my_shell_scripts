#!/bin/bash
sudo invoke-rc.d couchdb stop
sudo killall -9 couchdb
sudo killall -9 beam.smp
pid_faraday="$(ps axw | grep faraday.py | grep -v grep | cut -d ' ' -f 1)"
[ -n "$pid_faraday" ] && sudo kill -9 "$pid_faraday"
