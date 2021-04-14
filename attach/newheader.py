#!/usr/bin/env python3

""" Script to generate source files for a new class. """

import sys
import os
import datetime

lang = sys.argv[1]
baseName = sys.argv[2]

if os.name == "nt":
    user = os.environ.get("USERNAME")
else:
    user = os.environ.get("USER")

cppHeader = """/**
 * PANDA 3D SOFTWARE
 * Copyright (c) Carnegie Mellon University.  All rights reserved.
 *
 * All use of this software is subject to the terms of the revised BSD
 * license.  You should have received a copy of this license along
 * with this source code in a file named "LICENSE."
 *
 * @file %s
 * @author %s
 * @date %s
 */
"""
cppDate = datetime.datetime.now().strftime("%Y-%m-%d")

pyHeader = "\"\"\"%s module: contains the %s class.\"\"\""

def createCppFiles():
    hFile = open(baseName + ".h", 'w')
    hFile.write(cppHeader % (baseName + ".h", user, cppDate))
    hFile.write("\n")
    hFile.write("#ifndef %s_H\n" % baseName.upper())
    hFile.write("#define %s_H\n" % baseName.upper())
    hFile.write("\n")
    hFile.write("#include \"%s.I\"\n" % baseName)
    hFile.write("\n")
    hFile.write("#endif // %s_H\n" % baseName.upper())
    hFile.close()
    print("Wrote %s.h" % baseName)

    iFile = open(baseName + ".I", 'w')
    iFile.write(cppHeader % (baseName + ".I", user, cppDate))
    iFile.close()
    print("Wrote %s.I" % baseName)

    cxxFile = open(baseName + ".cxx", 'w')
    cxxFile.write(cppHeader % (baseName + ".cxx", user, cppDate))
    cxxFile.write("\n")
    cxxFile.write("#include \"%s.h\"\n" % baseName)
    cxxFile.close()
    print("Wrote %s.cxx" % baseName)

def createPyFiles():
    pyFile = open(baseName + ".py", 'w')
    pyFile.write(pyHeader % (baseName, baseName))
    pyFile.write("\n")
    pyFile.close()
    print("Wrote %s.py" % baseName)

if lang == 'cxx':
    createCppFiles()
elif lang == 'py':
    createPyFiles()
else:
    print("error: unknown language %s" % lang)
    sys.exit(1)
