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

# scan.py compares the edited build against the baseline and writes every failing
# check with its COMPLETE detail to scan_findings.json. A finding is tolerated only
# while its whole detail is identical to the pinned copy in scan_known_findings.json
# (which also records why each one is accepted). A new finding, or any change inside
# a known one (one more lost figure, one more unexplained block), fails the run.
echo "== integrity scan (scan.py) =="
/usr/bin/python3 scan.py >"$LOG" 2>&1 || true
grep -q "FINDINGS:" "$LOG" || { echo "  FAIL  scan.py did not finish:"; tail -12 "$LOG"; FAIL=1; }
/usr/bin/python3 - scan_findings.json scan_known_findings.json <<'PY' || FAIL=1
import json, sys
found = json.load(open(sys.argv[1], encoding="utf-8"))
known = json.load(open(sys.argv[2], encoding="utf-8"))
bad = 0
for name, detail in found.items():
    k = known.get(name)
    if k is None:
        print("  NEW     " + name); bad += 1
    elif k["detail"] != detail:
        print("  CHANGED " + name)
        if isinstance(detail, list) and isinstance(k["detail"], list):
            for x in sorted(set(detail) - set(k["detail"])): print("      + " + str(x)[:120])
            for x in sorted(set(k["detail"]) - set(detail)): print("      - " + str(x)[:120])
        else:
            print("      now " + str(detail)[:160]); print("      was " + str(k["detail"])[:160])
        bad += 1
    else:
        n = len(detail) if isinstance(detail, (list, dict)) else ""
        print("  known   %s%s" % (name, " (%s items)" % n if n != "" else ""))
for name in known:
    if name not in found and not name.startswith("_"):
        print("  note    no longer reported, drop from scan_known_findings.json: " + name)
print("  %d known, %d new or changed" % (len(found) - bad, bad))
sys.exit(1 if bad else 0)
PY

if [ $FAIL = 1 ]; then echo "QA FAILED"; exit 1; fi
echo "QA PASSED"
