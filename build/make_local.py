#!/usr/bin/env python3
"""Wrap the editable fragment as a standalone UTF-8 document.

The artifact host supplies its own <head>, so the published copy is a
fragment. A file opened straight from disk has no such head — without an
explicit charset the browser falls back to Latin-1 and every - and ↗
turns into mojibake. This adds the head back for the local copy only.
"""
import sys

src, dst = sys.argv[1], sys.argv[2]
frag = open(src, encoding="utf-8").read()
cut = frag.index("</style>") + len("</style>")
doc = ('<!doctype html>\n<html lang="en">\n<head>\n'
       '<meta charset="utf-8">\n'
       '<meta name="viewport" content="width=device-width, initial-scale=1">\n'
       + frag[:cut] + '\n</head>\n<body>\n' + frag[cut:] + '\n</body>\n</html>\n')
open(dst, "w", encoding="utf-8").write(doc)
print("wrote %s (%.2f MB, charset utf-8)" % (dst, len(doc.encode()) / 1048576))
