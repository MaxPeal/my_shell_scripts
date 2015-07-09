#!/usr/bin/python2
# -*- coding: utf-8 -*-


import sys
import urllib


def print_help():

    print "Uso: urlencode.py string"
    return None


if __name__ == '__main__':

    try:
        string = sys.argv[1]
    except:
        print_help()
        sys.exit(1)

    if (not string):
        print_help()
        sys.exit(1)

    print urllib.quote(string)

    sys.exit(0)
