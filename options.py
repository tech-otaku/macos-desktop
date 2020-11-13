#!/usr/bin/env python

from __future__ import print_function

import argparse, errno, json, os
from operator import itemgetter

parser = argparse.ArgumentParser(description='List valid options for set-desktop.sh')
parser.add_argument("-s", "--sort", choices=["category", "name", "option"], help="Sort output using this key. Output is unsorted if omitted.")
parser.add_argument("-v", "--version", choices=["big-sur", "catalina", "mojave"], required=True, help="List valid options for this version of macOS")
args = parser.parse_args()

if args.version == "big-sur":
    version="Big Sur"
else:
    version=args.version.capitalize()

try:

    with open("options.json") as f:
        data = json.load(f)
    
    for _version in data["versions"]:
        if _version["name"] == version: 
            if args.sort == "category":
                print("CATEGORY".ljust(30, ' '), "OPTION".ljust(30, ' '), "NAME")
                for _option in sorted(_version["options"], key=itemgetter(args.sort, 'option')):
                    print(_option["category"].ljust(30,' '), _option["option"].ljust(30,' '), _option["name"])
            elif args.sort == "name":
                print("NAME".ljust(30, ' '), "OPTION".ljust(30, ' '), "CATEGORY")
                for _option in sorted(_version["options"], key=itemgetter(args.sort)):
                    print(_option["name"].ljust(30,' '), _option["option"].ljust(30,' '), _option["category"])
            elif args.sort == "option":
                print("OPTION".ljust(30, ' '), "NAME".ljust(30, ' '), "CATEGORY")
                for _option in sorted(_version["options"], key=itemgetter(args.sort)):
                    print(_option["option"].ljust(30,' '), _option["name"].ljust(30,' '), _option["category"])
            else:
                print("OPTION".ljust(30, ' '), "NAME".ljust(30, ' '), "CATEGORY")
                for _option in _version["options"]:
                    print(_option["option"].ljust(30,' '), _option["name"].ljust(30,' '), _option["category"])

except EnvironmentError as e:
    print(os.strerror(e.errno))