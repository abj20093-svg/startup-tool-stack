#!/bin/zsh
# Copy the rebuilt guide into the GitHub Pages repo and refresh the Desktop mirrors.
# Does NOT commit or push. Run ./qa_build.sh first.
#   ./deploy_compliance.sh --dry   prints the plan and runs every check; writes nothing
#   ./deploy_compliance.sh         performs the copy (backs up Desktop mirrors first)
# Safe to re-run: the README step is idempotent and is checked BEFORE anything is copied.
set -e
cd "$(dirname "$0")"
P="$PWD"; R="$HOME/Desktop/startup-tool-stack-repo"; D="$HOME/Desktop"; B="$P/_pre-compliance-outputs"
DRY=0; [ "$1" = "--dry" ] && DRY=1

# Regenerated at deploy time (never in --dry), so checked by its inputs, not its own existence.
# GitHub Pages and the Desktop get the WRAPPED review copy (doctype + viewport); the bare
# fragment toolstack-sync.html is only for the artifact host, which supplies its own <head>.
LOCAL="Startup-Tool-Stack-FOR-JEREL.local.html"

typeset -a PLAN
PLAN=(
  "toolstack_varied.html|$R/index.html"
  "toolstack_varied.html|$R/guide/Startup-Tool-Stack.html"
  "toolstack_wizard.html|$R/guided.html"
  "$LOCAL|$R/guide/Startup-Tool-Stack-editable.html"
  "varied-print.pdf|$R/guide/Startup-Tool-Stack.pdf"
  "build_full.py|$R/build/build_full.py"
  "css.txt|$R/build/css.txt"
  "tool_urls.json|$R/build/tool_urls.json"
  "variance_proposal.json|$R/build/variance_proposal.json"
  "startup-tool-stack-v2.xlsx|$R/build/startup-tool-stack-v2.xlsx"
  "startup-tool-stack-v3.xlsx|$R/build/startup-tool-stack-v3.xlsx"
  "banking_chapter.json|$R/build/banking_chapter.json"
  "banking_sources.json|$R/build/banking_sources.json"
  "merge_condensed.py|$R/build/merge_condensed.py"
  "make_artifact.py|$R/build/make_artifact.py"
  "redesign/index.html|$R/redesign/index.html"
  "add_chapter.py|$R/build/add_chapter.py"
  "check_cells.py|$R/build/check_cells.py"
  "scan.py|$R/build/scan.py"
  "scan_known_findings.json|$R/build/scan_known_findings.json"
  "pass3_props.json|$R/build/pass3_props.json"
  "make_editable.py|$R/build/make_editable.py"
  "make_local.py|$R/build/make_local.py"
  "review_extras_style.html|$R/build/review_extras_style.html"
  "review_extras_script.html|$R/build/review_extras_script.html"
  "qa_build.sh|$R/build/qa_build.sh"
  "compliance_chapter.json|$R/build/compliance_chapter.json"
  "compliance_sources.json|$R/build/compliance_sources.json"
  "toolstack_varied.html|$D/Startup-Tool-Stack-purple-rail.html"
  "toolstack_wizard.html|$D/Startup-Tool-Stack-guided.html"
  "$LOCAL|$D/Startup-Tool-Stack-FOR-JEREL.html"
  "varied-print.pdf|$D/Startup-Tool-Stack.pdf"
)
missing=0
for item in $PLAN; do
  src="${item%%|*}"; dst="${item#*|}"
  if [ "$src" = "$LOCAL" ]; then
    printf "%-40s -> %s  (regenerated at deploy)\n" "$src" "$dst"
  elif [ ! -f "$src" ]; then
    echo "MISSING SOURCE: $src"; missing=1
  else
    printf "%-40s -> %s\n" "$src" "$dst"
  fi
done
if [ $missing = 1 ]; then echo "abort: missing sources"; exit 1; fi

# README counts. "check" verifies every anchor and writes nothing; "apply" writes.
# Page counts are refreshed on every run; the one-time edits are skipped once applied.
PAGES=$(pdfinfo varied-print.pdf | awk '/^Pages/{print $2}')
readme_update() {
/usr/bin/python3 - "$R/README.md" "$PAGES" "$1" <<'PY'
import re, sys
p, pages, mode = sys.argv[1:4]
s = before = open(p, encoding="utf-8").read()
problems = []
for pat, new in [
    (r"\d+ pages in print\.", f"{pages} pages in print."),
    (r"The print edition, \d+ pages\.", f"The print edition, {pages} pages."),
    (r"document paginates to \d+ pages\.", f"document paginates to {pages} pages."),
]:
    if len(re.findall(pat, s)) != 1:
        problems.append(f"page-count anchor not found exactly once: {pat}")
    else:
        s = re.sub(pat, new, s)
old_row = "| `build/variance_proposal.json` | The editorial layer: maps a source paragraph to its edited replacement. |"
QA_OLD = "| `build/qa_build.sh` | Builds both variants, prints the PDF and runs the ellipsis / N/A / count checks. |"
QA_NEW = "| `build/qa_build.sh` | Builds both variants, prints the PDF, and fails on any ellipsis / N/A / count / cell-check failure, or any scanner finding not pinned in `scan_known_findings.json`. |"
BANK_OLD = "| `build/scan_known_findings.json` |"
BANK_ROW = "| `build/banking_chapter.json` | Chapter 16, Business Banking: the condensed cells appended to the v3 workbook. |\n| `build/banking_sources.json` | For every banking cell: the printed text, the longer verified research text, and the evidence records (URL, quote, date) behind it. |"
if "| `build/add_chapter.py` |" not in s:
    if s.count(old_row) != 1:
        problems.append("README file table: variance_proposal.json row not found exactly once")
    else:
        s = s.replace(old_row, old_row + "\n| `build/add_chapter.py` | Appends a chapter JSON to a copy of the workbook and proves every original cell is unchanged. |\n| `build/check_cells.py` | Runs the build's own lead-derivation on a chapter JSON and flags shape, rival-name and sentence-split problems before a build. |\n" + QA_NEW)
once = [
 ("A comparison guide to 84 startup tools across 14 categories", "A comparison guide to 90 startup tools across 15 categories"),
 ("in a new tab. 84 URLs, all verified.", "in a new tab. 90 URLs, all verified."),
 ("`startup-tool-stack.xlsx` is the source of truth: 14 category blocks, seven",
  "`startup-tool-stack-v2.xlsx` is the source of truth: 15 category blocks, seven"),
 ("a glance table, the 98 profiles, and the print pagination.",
  "a glance table, the 105 profiles, and the print pagination. The v2 workbook is\nthe original `startup-tool-stack.xlsx` (kept, unchanged) with the Compliance\nAutomation block appended at rows 213-227 by `add_chapter.py` from\n`compliance_chapter.json`; `compliance_sources.json` lists the source for every\nfact in that block."),
 (QA_OLD, QA_NEW),
 # chapter 16 (Oct 2026): these run after the chapter-15 edits above, so each old text is the chapter-15 new text
 ("A comparison guide to 90 startup tools across 15 categories", "A comparison guide to 96 startup tools across 16 categories"),
 ("in a new tab. 90 URLs, all verified.", "in a new tab. 96 URLs, all verified."),
 ("`startup-tool-stack-v2.xlsx` is the source of truth: 15 category blocks, seven", "`startup-tool-stack-v3.xlsx` is the source of truth: 16 category blocks, seven"),
 ("a glance table, the 105 profiles, and the print pagination.", "a glance table, the 112 profiles, and the print pagination."),
 ("`compliance_chapter.json`; `compliance_sources.json` lists the source for every\nfact in that block.", "`compliance_chapter.json`, and the v3 workbook adds the Business Banking block at\nrows 229-243 from `banking_chapter.json`; the two `*_sources.json` files list the\nsource for every fact in those blocks."),
]
def chain_ok(b):
    """b, or any later edit that starts from b, is already in the README."""
    if b.split("\n")[0] in s:
        return True
    return any((a2 == b or b.startswith(a2)) and chain_ok(b2) for a2, b2 in once)
for a, b in once:
    if s.count(a) == 1:
        s = s.replace(a, b)
    elif not chain_ok(b):
        problems.append(f"README has neither the old nor the new text for: {a[:60]}")
if "| `build/banking_chapter.json` |" not in s:
    if s.count(BANK_OLD) != 1:
        problems.append("README file table: scan_known_findings.json row not found exactly once")
    else:
        i = s.index(BANK_OLD); j = s.index("\n", i)
        s = s[:j] + "\n" + BANK_ROW + s[j:]
if problems:
    for pr in problems:
        print("README:", pr)
    sys.exit(1)
if mode == "apply" and s != before:
    open(p, "w", encoding="utf-8").write(s)
print("README %s, pages = %s%s" % ("ok" if mode == "check" else "updated", pages,
      "" if s != before else " (already current)"))
PY
}
readme_update check

if [ $DRY = 1 ]; then echo "(dry run: nothing written or copied)"; exit 0; fi

# regenerate the click-to-edit review copy from the fresh main build
/usr/bin/python3 make_editable.py toolstack_varied.html toolstack-sync.html
/usr/bin/python3 make_local.py toolstack-sync.html "$P/$LOCAL"

mkdir -p "$B/desktop"
for f in Startup-Tool-Stack-purple-rail.html Startup-Tool-Stack-guided.html Startup-Tool-Stack-FOR-JEREL.html Startup-Tool-Stack.pdf; do
  if [ -f "$D/$f" ] && [ ! -f "$B/desktop/$f" ]; then cp -p "$D/$f" "$B/desktop/$f"; fi
done
for item in $PLAN; do cp "${item%%|*}" "${item#*|}"; done
readme_update apply
cd "$R" && git add -A && git status --short
