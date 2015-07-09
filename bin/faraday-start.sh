#!/bin/bash
sudo invoke-rc.d couchdb start
cd ~/src/security/faraday
exec ./faraday.py
