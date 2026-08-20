# The Startup Tool Stack

A comparison guide to 84 startup tools across 14 categories, plus the
do-it-yourself route in every one. 238 pages in print.

---

## Jerel — start here

**To read it:** open `guide/Startup-Tool-Stack.pdf`, or download
`guide/Startup-Tool-Stack.html` and open it in a browser.

**To change the wording:** everything is in the `content/` folder, one file per
chapter, as plain text. No HTML, no code.

1. Click any file in `content/` — say `01-crm-lead-gen.md`
2. Click the pencil icon (top right)
3. Edit the text like a document
4. Click **Commit changes** at the bottom, and add a line saying what you changed

That's it. Change as much or as little as you like — a word, a sentence, a whole
section. Nothing can break, and every version is saved, so anything can be undone.

**One thing to leave alone:** the `##` and `###` headings, like `## HubSpot CRM`
or `### Pricing & tier-gating`. Those tell the build where each piece of text
belongs. Everything underneath them is yours to rewrite.

If something reads wrong but you're not sure how to fix it, just write a note in
the text — `[Jerel: this feels too long]` — and it'll get picked up.

---

## What's in here

| Folder | What it holds |
|---|---|
| `content/` | The guide's text, one file per chapter. **This is the part to edit.** |
| `guide/` | The built guide — HTML and PDF. Generated, don't edit by hand. |
| `build/` | The scripts and source workbook that turn `content/` into `guide/`. |

## Rebuilding (Aryan)

```
cd build
VARIANT=varied /usr/bin/python3 build_full.py
/usr/bin/python3 scan.py
```

Then Chrome headless for the PDF. `scan.py` checks figures are preserved,
excluded regions are untouched, no em dashes crept in, and the source workbook
hash is unchanged — it exits non-zero on any finding.
