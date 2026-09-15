#!/usr/bin/env python3
"""Derive the click-to-edit review copy from a built HTML file.

The review copy is a fragment (no <html>/<head>/<body>): <title> + <style>
from the build, the review <style>, the body content, then the review
<script>. The two extras live beside this script as review_extras_*.html.
usage: /usr/bin/python3 make_editable.py toolstack_varied.html toolstack-sync.html
"""
import os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
src, dst = sys.argv[1], sys.argv[2]
main = open(src, encoding="utf-8").read()
style = open(os.path.join(HERE, "review_extras_style.html"), encoding="utf-8").read()
script = open(os.path.join(HERE, "review_extras_script.html"), encoding="utf-8").read()
i = main.find("<title>"); j = main.find("</style>") + len("</style>")
b0 = main.find("<body>") + len("<body>"); b1 = main.rfind("</body>")
out = main[i:j] + "\n" + style + "\n\n" + main[b0:b1] + "\n" + script + "\n"
open(dst, "w", encoding="utf-8").write(out)
print("wrote %s (%.2f MB)" % (dst, len(out.encode()) / 1048576))
