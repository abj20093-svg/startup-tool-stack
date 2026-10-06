#!/usr/bin/env python3
"""Derive the artifact fragment from the built main page.

The artifact host supplies its own <!doctype>/<head>/<body>; publishing the full
document nests those tags and the rail and nav vanish in the shared link. So the
published file is a fragment: <title> + <style> from the build, then the body.
usage: /usr/bin/python3 make_artifact.py toolstack_varied.html artifact-toolstack.html
"""
import sys
src, dst = sys.argv[1], sys.argv[2]
main = open(src, encoding="utf-8").read()
i = main.index("<title>"); j = main.index("</style>") + len("</style>")
b0 = main.index("<body>") + len("<body>"); b1 = main.rindex("</body>")
out = main[i:j] + "\n" + main[b0:b1] + "\n"
assert "<html" not in out and "<head" not in out.replace("<header", "") and "<body" not in out
open(dst, "w", encoding="utf-8").write(out)
print("wrote %s (%.2f MB)" % (dst, len(out.encode()) / 1048576))
