#!/usr/bin/env python3
"""Merge the condensed chapter cells with the verified research.

Reads   _compliance-research/condensed/<tool>.txt   ("=== <label>" then the cell text)
        _compliance-research/deepdive_result.json   (verified long cells + evidence records)
Writes  compliance_chapter.json   condensed cells, the build input
        compliance_sources.json   per cell: condensed text, full research text, evidence records

Subset guard (condensing may select, never add):
  - every number in a condensed cell must appear in that tool's verified research text
  - every capitalised word must appear (case-insensitive) in that tool's research text
  - every 'single-quoted' phrase must appear verbatim in that tool's research text
Both outputs are written only after every check passes; a failed run leaves the
existing files untouched.
usage: /usr/bin/python3 merge_condensed.py [compliance|banking]
"""
import json, os, re, sys, shutil, statistics
HERE = os.path.dirname(os.path.abspath(__file__))
CHAPTERS = {
    "compliance": dict(dir="_compliance-research", name="Compliance Automation", group="OPERATING",
                       out="compliance", generated="2026-09-14",
                       files=[("vanta", "Vanta"), ("sprinto", "Sprinto"), ("drata", "Drata"), ("secureframe", "Secureframe"),
                              ("thoropass", "Thoropass"), ("oneleet", "Oneleet"), ("manual-diy", "Manual DIY")]),
    "banking": dict(dir="_banking-research", name="Business Banking", group="OPERATING",
                    out="banking", generated="2026-10-05", price_label="Fees & minimums",
                    files=[("mercury", "Mercury"), ("brex", "Brex"), ("rho", "Rho"), ("relay", "Relay"),
                           ("chase", "Chase"), ("silicon-valley-bank", "Silicon Valley Bank"), ("manual-diy", "Manual DIY")]),
}
CFG = CHAPTERS[sys.argv[1] if len(sys.argv) > 1 else "compliance"]
R = os.path.join(HERE, CFG["dir"])
OUT_CHAPTER, OUT_SOURCES = CFG["out"] + "_chapter.json", CFG["out"] + "_sources.json"
raw = json.load(open(os.path.join(R, "deepdive_result.json"), encoding="utf-8"))
res = raw.get("result", raw)
LABELS = res["factors"]
FILES = CFG["files"]
TOOLS = [t for _, t in FILES]

long_backup = os.path.join(R, CFG["out"] + "_chapter_long.json")
if not os.path.exists(long_backup) and os.path.exists(os.path.join(HERE, OUT_CHAPTER)):
    shutil.copy(os.path.join(HERE, OUT_CHAPTER), long_backup)

def parse(path):
    cells, cur, buf = {}, None, []
    for line in open(path, encoding="utf-8").read().splitlines():
        if line.startswith("=== "):
            if cur is not None:
                cells[cur] = "\n".join(buf).strip()
            cur, buf = line[4:].strip(), []
        else:
            buf.append(line.rstrip())
    if cur is not None:
        cells[cur] = "\n".join(buf).strip()
    return cells

condensed, problems = {}, []
for fn, tool in FILES:
    c = parse(os.path.join(R, "condensed", fn + ".txt"))
    if list(c.keys()) != LABELS:
        problems.append(f"{tool}: labels differ from research order: {list(c.keys())}")
    condensed[tool] = c

def report():
    print("\nsubset-guard problems:", len(problems))
    for pr in problems:
        print("  !", pr)

if problems:                      # label mismatch: the per-label checks below cannot run
    report(); print("nothing written"); sys.exit(1)

num_re = re.compile(r"\d[\d,]*(?:\.\d+)?")
cap_re = re.compile(r"\b[A-Z][A-Za-z0-9&+'’-]*(?:\.[A-Za-z0-9]+)*")
quote_re = re.compile(r"(?<![A-Za-z])'([^']{3,}?)'(?![A-Za-z])")
LEADS = {"Built", "Best", "Ideal", "Avoid", "When", "If"}

for tool in TOOLS:
    research = "\n".join(v["text"] for v in res["final"][tool].values())
    r_nums = {n.replace(",", "") for n in num_re.findall(research)}
    r_words = {w.lower() for w in re.findall(r"[A-Za-z0-9&+'’.-]+", research)}
    r_words |= {w.strip(".'’").lower() for w in r_words}
    for lab in LABELS:
        t = condensed[tool].get(lab, "")
        for n in num_re.findall(t):
            if n.replace(",", "") not in r_nums:
                problems.append(f"{tool} / {lab}: number '{n}' not in research")
        for w in cap_re.findall(t):
            base = w.strip("'’").rstrip("s").lower() if w.endswith("'s") or w.endswith("’s") else w.strip("'’").lower()
            if w in LEADS:
                continue
            if w.lower() not in r_words and base not in r_words and re.sub(r"['’]s$", "", w).lower() not in r_words:
                problems.append(f"{tool} / {lab}: word '{w}' not in research")
        for q in quote_re.findall(t):
            if q not in research:
                problems.append(f"{tool} / {lab}: quoted phrase not verbatim in research: '{q}'")

# lengths
print("per-tool totals (existing chapters: vendor median 3,586, DIY median 3,264, max 6,873):")
for tool in TOOLS:
    tot = sum(len(condensed[tool][l]) for l in LABELS)
    longest = max(LABELS, key=lambda l: len(condensed[tool][l]) if not l.startswith("Choose") else 0)
    print(f"  {tool:12s} {tot:5d} chars | longest non-Choose cell: {longest} ({len(condensed[tool][longest])})")
allc = [len(condensed[t][l]) for t in TOOLS for l in LABELS if not l.startswith("Choose")]
print(f"non-Choose cells: median {statistics.median(allc):.0f}, max {max(allc)} (existing median ~250, p75 ~300)")

# outputs
chapter = {"group": CFG["group"], "name": CFG["name"], "tools": TOOLS, "price_label": CFG.get("price_label", "Pricing & audit cost"),
           "rows": [{"label": l, "cells": [condensed[t][l] for t in TOOLS]} for l in LABELS]}

by_tool = {p["tool"]: p for p in res["per_tool"]}
sources = {"generated": CFG["generated"],
           "note": (CFG["name"] + " block. 'text' is the cell as printed; 'research_text' is the longer verified "
                    "cell it was condensed from (selection only, nothing added); 'sources' are the evidence records "
                    "behind the research text. Tags: official / user_report / press / analyst / community."),
           "tools": {}}
for tool in TOOLS:
    p = by_tool[tool]
    conf = {r.get("id"): r for r in p.get("confirmed_records", [])}
    drop = {r.get("id"): r for r in p.get("dropped_records", [])}
    unv = {r.get("id"): r for r in p.get("unverifiable_records", [])}
    adds = {f"ADD-{i}": a for i, a in enumerate(p.get("additions_records", []))}
    adds.update({a["id"]: a for a in p.get("additions_records", []) if a.get("id")})   # verifier-assigned ids (ADD-01...)
    entry = {"verification": {k: p.get(k) for k in ("gathered", "confirmed", "dropped", "additions", "trace_rounds")},
             "pages_opened": len(p.get("urls") or []), "cells": {}}
    for lab in LABELS:
        refs = []
        for sid in res["final"][tool][lab].get("sources") or []:
            r = conf.get(sid) or adds.get(sid)
            rec = {"id": sid}
            if r is None and sid in drop:
                r = drop[sid]
                rec["correction"] = drop[sid].get("corrections")
            if r is None and sid in unv:
                r = unv[sid]
                rec["verification"] = "unverifiable: page would not open or claim rested on a snippet"
            if r is None:
                problems.append(f"{tool} / {lab}: source id {sid} unresolved"); continue
            rec.update({"claim": r.get("claim"), "url": r.get("source_url"), "tag": r.get("tag"),
                        "date": r.get("date_of_source"), "quote": (r.get("quote") or "")[:300]})
            refs.append(rec)
        entry["cells"][lab] = {"text": condensed[tool][lab], "research_text": res["final"][tool][lab]["text"], "sources": refs}
    sources["tools"][tool] = entry

report()
if problems:
    print("nothing written: %s and %s are unchanged" % (OUT_CHAPTER, OUT_SOURCES))
    sys.exit(1)
# validated: stage both files, then swap them in together
staged = []
for name, obj in ((OUT_CHAPTER, chapter), (OUT_SOURCES, sources)):
    tmp = os.path.join(HERE, name + ".tmp")
    with open(tmp, "w", encoding="utf-8") as f:
        json.dump(obj, f, indent=1, ensure_ascii=False)
    staged.append((tmp, os.path.join(HERE, name)))
for tmp, final in staged:
    os.replace(tmp, final)
print("wrote %s and %s" % (OUT_CHAPTER, OUT_SOURCES))
