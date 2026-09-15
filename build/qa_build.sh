#!/bin/zsh
# Build both variants, print the PDF, and run the mechanical QA greps.
# usage: ./qa_build.sh   (from the project folder)
set -e
cd "$(dirname "$0")"
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
echo "== greps (must be 0) =="
pdftotext varied-print.pdf /tmp/varied.txt
printf "ellipsis chars: "; grep -c "…" /tmp/varied.txt || true
printf "bare N/A: "; grep -cw "N/A" /tmp/varied.txt || true
printf "ellipsis in html: "; grep -o "…" toolstack_varied.html | wc -l
printf "'Manual DIY' in html: "; grep -o "Manual DIY" toolstack_varied.html | wc -l
echo "== counts =="
printf "profiles: "; grep -o '<article class="profile"' toolstack_varied.html | wc -l
printf "chapters: "; grep -o '<section class="chapter"' toolstack_varied.html | wc -l
grep -o "<title>[^<]*</title>" toolstack_varied.html
echo "== compliance chapter pages in PDF =="
grep -n "Compliance Automation" /tmp/varied.txt | head -3
