#!/usr/bin/env python
# -*- coding: utf-8 -*-

f = open('../VL-Gothic-Regular.ttf-list.txt', 'r')

for string in f:
    string = string.rstrip()
    string = int(string, 16)
    string = unichr(string)
    print(string.encode('utf_8'))
