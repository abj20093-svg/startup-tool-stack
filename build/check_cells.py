#!/usr/bin/env python3
"""Conformance harness for new chapter cells.

Loads the build script's own text functions (everything above the
'build chapters' marker) and runs them over a chapter JSON file, printing
the leads the build will actually derive, plus rule checks:
  - no same-chapter rival names inside any cell
  - length band (80-900 chars; <80 trips the build's THIN_LOG)
  - no ellipsis, no bare N/A
  - Built for = 'Built for: ...\nBest fit: ...' (vendor columns)
  - Choose = 'Ideal for: ...\nBest when: ...\nAvoid if: ...'
  - Ideal for first sentence <= 95 chars (wizard persona)
  - pricing lead sanity, benefit/limit leads
  - band assignment per factor label
usage: /usr/bin/python3 check_cells.py compliance_chapter.json
"""
import json, re, sys, os
HERE = os.path.dirname(os.path.abspath(__file__))
src = open(os.path.join(HERE, "build_full.py")).read()
cut = src.index("# ================================ build chapters")
ns = {"__file__": os.path.join(HERE, "build_full.py"), "__name__": "harness"}
exec(compile(src[:cut], "build_full_head", "exec"), ns)

data = json.load(open(sys.argv[1]))
tools = data["tools"]              # 7 names, last is 'Manual DIY'
rows = data["rows"]                # list of {"label": ..., "cells": [7 strings]}
problems = []
def prob(where, msg): problems.append(f"{where}: {msg}")

rivals = [t for t in tools if t.lower() != "manual diy"]
labels = [r["label"] for r in rows]
print("=== band assignment ===")
for lb in labels:
    core = re.sub(r"^\d+\.\s*", "", lb)
    if core in ("Built for", "What it is", "Where it stands out", "Limitations") or core.startswith("Choose this"):
        print(f"  {lb!r}: (special)")
    else:
        print(f"  {lb!r}: {ns['band_of'](core)}")

for r in rows:
    lb = r["label"]; core = re.sub(r"^\d+\.\s*", "", lb)
    if len(r["cells"]) != 7: prob(lb, f"{len(r['cells'])} cells, need 7")
    for i, t in enumerate(r["cells"]):
        tool = tools[i]; where = f"{tool} / {lb}"
        if not t or not t.strip(): prob(where, "EMPTY"); continue
        if "…" in t or "..." in t: prob(where, "ellipsis")
        if re.search(r"\bN/A\b", t): prob(where, "bare N/A")
        if len(t) < 80: prob(where, f"thin ({len(t)} chars)")
        # sentences ending on a token the build's split_sents treats as an abbreviation get merged
        for m in re.finditer(r"(?<![A-Za-z])([A-Za-z.]+)\.\s+(?=[A-Z0-9\"'$~(])", t):
            if m.group(1).rstrip(".").lower() in ns["ABBREV"]:
                prob(where, f"sentence ends on abbreviation '{m.group(1)}.' (build merges it with the next sentence): ...{t[max(0, m.start()-40):m.end()+20]!r}")
        for para in [x for x in t.split("\n") if x.strip()]:
            ss = ns["split_sents"](para)
            naive = [x for x in re.split(r"(?<=[.!?])\s+(?=[A-Z0-9\"'$~(])", para.strip()) if x]
            if len(ss) < len(naive):
                prob(where, f"build splits this paragraph into {len(ss)} sentences, a reader sees {len(naive)}: check abbreviations/brackets")
        if len(t) > 900: prob(where, f"very long ({len(t)} chars)")
        for rv in rivals:
            if rv == tool: continue
            if re.search(r"(?<![\w-])" + re.escape(rv) + r"(?![\w-])", t):
                prob(where, f"names rival '{rv}'")
        if core == "Built for" and tool.lower() != "manual diy":
            if not re.match(r"^Built for: .+\nBest fit: .+$", t, re.S): prob(where, "Built for shape wrong (need 'Built for: …\\nBest fit: …')")
        if core.startswith("Choose this"):
            if not re.match(r"^Ideal for: .+\nBest when: .+\nAvoid if: .+$", t, re.S): prob(where, "Choose shape wrong")
            ch = ns["parse_choose"](t)
            ideal = ns["strip_prefix"](ch["ideal"])
            s1 = ns["split_sents"](ideal)[0] if ideal else ""
            if len(s1) > 95: prob(where, f"Ideal sentence 1 is {len(s1)} chars (>95): {s1!r}")

print("\n=== derived leads (what the build will bold) ===")
for r in rows:
    lb = r["label"]; core = re.sub(r"^\d+\.\s*", "", lb)
    print(f"\n--- {lb} ---")
    for i, t in enumerate(r["cells"]):
        tool = tools[i]
        if not t: continue
        if core == "What it is":
            ss = ns["split_sents"](t)
            print(f"  [{tool}] IDENTITY (never rendered): {ss[0][:120]!r}")
            rest = " ".join(ss[1:])
            if rest:
                pre, lead, d, rst = ns["derive_lead"](rest)
                print(f"     body lead: {(pre+lead)!r}{d}")
            else:
                prob(f"{tool} / {lb}", "What it is has only one sentence: nothing would render in the profile body")
        elif core == "Built for":
            b = ns["strip_prefix"](t)
            pre, lead, d, rst = ns["derive_lead"](b)
            print(f"  [{tool}] {(pre+lead)!r}{d}")
        elif core.startswith("Choose this"):
            ch = ns["parse_choose"](t)
            c = ns["derive_choose"](ch["ideal"])
            print(f"  [{tool}] glance-choose lead: {c[0]!r} | persona: {ns['split_sents'](ns['strip_prefix'](ch['ideal']))[0][:95]!r}")
        elif core == "Where it stands out":
            l, dd = ns["derive_benefit"](t)
            print(f"  [{tool}] benefit lead ({len(l.split())} words): {l!r}")
        elif core == "Limitations":
            l, dd = ns["derive_limit"](t)
            print(f"  [{tool}] limit lead: {l!r}")
        elif ns["band_of"](core) == "Cost" and core == data.get("price_label", "Pricing & audit cost"):
            lead, detail, n = ns["derive_price"](t)
            print(f"  [{tool}] PRICE lead: {lead!r} | detail: {detail[:80]!r}")
        else:
            pre, lead, d, rst = ns["derive_lead"](t.split("\n")[0])
            print(f"  [{tool}] {(pre+lead)!r}{d}")

print("\n=== problems ===")
for p in problems: print("  !", p)
print(f"{len(problems)} problems")
sys.exit(1 if problems else 0)
