#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess

with f = open('../VL-Gothic-Regular.ttf_glyph.txt', 'r'):
    text = []
    string = f.read()
    while string:
        text = text + "--text" + string

print(string)

# fontimage --pixelsize 250 -o ../test2.png ./VL-Gothic-Regular.ttf --text
#args = ['fontimage', '--pixelsize', '250', '-o', '../test2.png', './VL-Gothic-Regular.ttf', text]
#subprocess.call(args)
