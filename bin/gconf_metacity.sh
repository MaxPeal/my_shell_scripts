#!/bin/bash
exec gconftool -s /desktop/gnome/session/required_components/windowmanager \
                -t string metacity
