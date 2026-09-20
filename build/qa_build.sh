#!/bin/zsh
# Build both variants, print the PDF, and run the mechanical QA gates.
# Exits non-zero if ANY gate fails, so it can sit in front of deploy_compliance.sh.
# usage: ./qa_build.sh   (from the project folder)
set -e
cd "$(dirname "$0")"
EXPECT_PROFILES=105   # bump both when a chapter is added
EXPECT_CHAPTERS=15
FAIL=0
gate() {  # gate <label> <actual> <expected>
  if [ "$2" = "$3" ]; then printf "  pass  %s: %s\n" "$1" "$2"
  else printf "  FAIL  %s: %s (expected %s)\n" "$1" "$2" "$3"; FAIL=1; fi
}
TXT=$(mktemp -t varied-pdf); LOG=$(mktemp -t qa-log)
trap 'rm -f "$TXT" "$LOG"' EXIT

echo "== chapter cells (check_cells.py) =="
if /usr/bin/python3 check_cells.py compliance_chapter.json >"$LOG" 2>&1; then echo "  pass  compliance_chapter.json"
else echo "  FAIL  compliance_chapter.json"; tail -15 "$LOG"; FAIL=1; fi

# Order matters: both variants write toolstack_wizard.html, and the deployed
# guided page is the VARIED one, so the varied build must run last.
echo "== build (original prose, for scan.py baseline) =="
/usr/bin/python3 build_full.py >/dev/null
echo "== build (varied = main) =="
VARIANT=varied /usr/bin/python3 build_full.py
echo "== print PDF =="
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$PWD/varied-print.pdf" "file://$PWD/toolstack_varied.html" 2>/dev/null
pdfinfo varied-print.pdf | grep -E "Pages|Page size"
pdftotext varied-print.pdf "$TXT"

echo "== greps (must be 0) =="
gate "ellipsis chars in PDF" "$(grep -c "…" "$TXT" || true)" 0
gate "bare N/A in PDF" "$(grep -cw "N/A" "$TXT" || true)" 0
gate "ellipsis in html" "$(grep -o "…" toolstack_varied.html | wc -l | tr -d ' ')" 0
gate "'Manual DIY' in html" "$(grep -o "Manual DIY" toolstack_varied.html | wc -l | tr -d ' ')" 0
echo "== counts =="
gate "profiles" "$(grep -o '<article class="profile"' toolstack_varied.html | wc -l | tr -d ' ')" $EXPECT_PROFILES
gate "chapters" "$(grep -o '<section class="chapter"' toolstack_varied.html | wc -l | tr -d ' ')" $EXPECT_CHAPTERS
grep -o "<title>[^<]*</title>" toolstack_varied.html
echo "== compliance chapter pages in PDF =="
grep -n "Compliance Automation" "$TXT" | head -3

# scan.py compares the edited build against the baseline. Findings listed in
# scan_known_findings.txt are reported but tolerated; anything new fails the run.
echo "== integrity scan (scan.py) =="
/usr/bin/python3 scan.py >"$LOG" 2>&1 || true
/usr/bin/python3 - "$LOG" scan_known_findings.txt <<'PY' || FAIL=1
import sys
out = open(sys.argv[1], encoding="utf-8").read()
known = [l.rstrip("\n") for l in open(sys.argv[2], encoding="utf-8") if l.strip() and not l.startswith("#")]
if "FINDINGS:" not in out:
    print("  FAIL  scan.py did not finish:\n" + out[-600:]); sys.exit(1)
lines, found = out.splitlines(), []
for i, l in enumerate(lines):
    if l.startswith("  FAIL  "):
        k = l[8:]
        if i + 1 < len(lines) and lines[i + 1].startswith("          "):
            k += " :: " + lines[i + 1].strip()
        found.append(k)
for f in found:
    print(("  known " if f in known else "  NEW   ") + f[:150])
for k in known:
    if k not in found:
        print("  note  no longer reported, remove from scan_known_findings.txt: " + k[:110])
new = [f for f in found if f not in known]
print("  %d known, %d new" % (len(found) - len(new), len(new)))
sys.exit(1 if new else 0)
PY

if [ $FAIL = 1 ]; then echo "QA FAILED"; exit 1; fi
echo "QA PASSED"
