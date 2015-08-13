#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys

day = (sys.stdin.read()).rstrip()

if   (day == "Sun"):
	print "Dom"
elif (day == "Mon"):
	print "Seg"
elif (day == "Tue"):
	print "Ter"
elif (day == "Wed"):
	print "Qua"
elif (day == "Thu"):
	print "Qui"
elif (day == "Fri"):
	print "Sex"
elif (day == "Sat"):
	print "Sáb"
