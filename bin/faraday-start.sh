#!/bin/bash
sudo invoke-rc.d couchdb start
cd ~/src/security/faraday
./faraday-server.py &
exec ./faraday.py
