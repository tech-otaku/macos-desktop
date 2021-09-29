#!/usr/bin/env python

from __future__ import print_function

import argparse, errno, json, os, plistlib, sys
from operator import itemgetter

parser = argparse.ArgumentParser(description='List valid options for set-desktop.sh')
parser.add_argument("-s", "--sort", choices=["category", "name", "option"], help="Sort output using this key. Output is unsorted if omitted.")
parser.add_argument("-v", "--version", choices=["monterey", "big-sur", "catalina", "mojave"], required=True, help="List valid options for this version of macOS")
args = parser.parse_args()

if args.version == "big-sur":
    version="Big Sur"
else:
    version=args.version.capitalize()

try:

    if sys.version_info.major == 2:
    # plistlib for Python 2.7 can't read binary property list files and has a readPlist() function.
        with open("options.plist", "r") as f:
            data = plistlib.readPlist(f)
    else:
    # plistlib for Python 3 can read binary property list files. In addition, the readPlist() function has been deprecated in favour of the load() function.
        with open("options.bin.plist", "rb") as f:
            data = plistlib.load(f)

    print("* * * This version uses the option configuration file: {} * * *".format(os.path.basename(f.name)))
    
    for _version in data["versions"]:
        if _version["name"] == version: 
            if args.sort == "category":
                print("CATEGORY".ljust(30, ' '), "OPTION".ljust(30, ' '), "NAME".ljust(30, ' '), "COMMAND")
                for _option in sorted(_version["options"], key=itemgetter(args.sort, 'option')):
                    print(_option["category"].ljust(30,' '), _option["option"].ljust(30,' '), _option["name"].ljust(30,' '), "./set-desktop.sh " + _option["option"])
            elif args.sort == "name":
                print("NAME".ljust(30, ' '), "OPTION".ljust(30, ' '), "CATEGORY".ljust(30, ' '), "COMMAND")
                for _option in sorted(_version["options"], key=itemgetter(args.sort)):
                    print(_option["name"].ljust(30,' '), _option["option"].ljust(30,' '), _option["category"].ljust(30,' '), "./set-desktop.sh " + _option["option"])
            elif args.sort == "option":
                print("OPTION".ljust(30, ' '), "NAME".ljust(30, ' '), "CATEGORY".ljust(30, ' '), "COMMAND")
                for _option in sorted(_version["options"], key=itemgetter(args.sort)):
                    print(_option["option"].ljust(30,' '), _option["name"].ljust(30,' '), _option["category"].ljust(30,' '), "./set-desktop.sh " + _option["option"])
            else:
                print("OPTION".ljust(30, ' '), "NAME".ljust(30, ' '), "CATEGORY".ljust(30, ' '), "COMMAND")
                for _option in _version["options"]:
                    print(_option["option"].ljust(30,' '), _option["name"].ljust(30,' '), _option["category"].ljust(30,' '), "./set-desktop.sh " + _option["option"])

except EnvironmentError as e:
    print(os.strerror(e.errno))