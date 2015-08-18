#!/usr/bin/python2
# -*- coding: utf-8 -*-


import sys
import urllib


def print_help():

    print "Uso: urldecode.py string"
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

    print urllib.unquote(string)

    sys.exit(0)
