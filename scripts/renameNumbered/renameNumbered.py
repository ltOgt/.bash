#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys

def main():
    try:
        args = sys.argv[1:]
        path = args[0]
        prefix = args[1]
        dryrun = False
        try:
            args[2]
            dryrun = True
        except:
            pass

        import glob
        import os

        full = os.path.abspath(path)
        files = os.listdir(full)
        files.sort(key=lambda x: os.stat(os.path.join(full, x)).st_mtime)
        i = 0
        n = len(files)
        for file in files:
            old = os.path.join(full, file)
            new = os.path.join(full, prefix + str(i).zfill(len(str(n)))) + ".png"
            print(old)
            print(new)
            i = i +1
            if dryrun:
                continue
            os.rename(old, new)
    except Exception as e:
        print(e)
        print('usage: [path_to_dir] [prefix] (dryrun)')
        return


if __name__ == '__main__':
    main()

