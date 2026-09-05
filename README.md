# The Startup Tool Stack

A comparison guide to 84 startup tools across 14 categories, plus the
self-managed route in every category. 238 pages in print.

---

## Embedding this in the DECODE site

`guide/Startup-Tool-Stack.html` is a single self-contained file: fonts, styles
and behaviour are all inline. No build step, no dependencies, no external
requests. That makes it easy to host but it does bring its own `<body>`
styling, so read the two options before dropping it in.

### Option A — iframe (recommended)

Put the file anywhere on the site and frame it:

```html
<iframe src="/guides/startup-tool-stack.html"
        title="The Startup Tool Stack"
        style="width:100%;height:100vh;border:0"
        loading="lazy"></iframe>
```

Styles stay isolated, so nothing collides with the site's CSS, and the guide
keeps its own scrolling and left navigation. This is the fastest route and the
one least likely to break.

Note the guide is ~1 MB, most of it embedded fonts. `loading="lazy"` keeps that
off the critical path.

### Option B — inline it into a page template

If it has to live inside the site's own layout rather than a frame:

1. Take the `<style>` block from `<head>` and the contents of `<body>`.
2. Paste both into the page template.
3. Scope the guide's CSS — every rule is unprefixed and will otherwise leak.
   Wrap the markup in `<div class="tool-stack">` and prefix the selectors, or
   compile the block through a scoping step.

The left rail is `position: fixed` and the layout reserves 264px for it above
1000px viewport width. Inside a site shell with its own header, that needs
adjusting.

### What to know either way

- The guide is responsive. Below 1000px the fixed rail collapses into a
  dropdown at the top.
- Print styles are included: the rail and all controls are hidden, and the
  document paginates to 238 pages. `Startup-Tool-Stack.pdf` is that output.
- Every tool name in the At a glance tables links out to the vendor's own site
  in a new tab. 84 URLs, all verified.
- `guide/Startup-Tool-Stack-editable.html` is a review copy: the prose is
  click-to-edit and a button collects the changes. Do not ship that one.

---

## Editing the words

Everything is in `content/`, one file per chapter, as plain text. No HTML.

1. Click a file in `content/` — say `01-crm-lead-gen.md`
2. Click the pencil icon, top right
3. Edit the text
4. Click **Commit changes** and note what you changed

Leave the `##` and `###` headings alone — they tell the build where each piece
of text belongs. Everything under them is fair game.

Editing `content/` does not regenerate the guide by itself. The rebuild below
is what turns it into HTML and PDF.

---

## Rebuilding

Needs Python 3 with `openpyxl`, and Chrome for the PDF.

```
cd build
VARIANT=varied python3 build_full.py    # -> toolstack_varied.html
python3 scan.py                         # integrity check; non-zero exit on any finding
```

PDF:

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf=Startup-Tool-Stack.pdf \
  "file://$PWD/toolstack_varied.html"
```

`make_local.py` wraps the editable fragment as a standalone UTF-8 document —
without it, a file opened from disk has no charset and renders mojibake.

---

## How the build works

`startup-tool-stack.xlsx` is the source of truth: 14 category blocks, seven
columns each (six products plus the self-managed route), one row per comparison
factor. `build_full.py` reads it and generates every page — the At a glance
table, the 98 profiles, the cross-links between competing tools, and the print
pagination.

| File | What it does |
|---|---|
| `build/css.txt` | The stylesheet, injected at build time. Screen and print rules both live here. |
| `build/fonts/embedded.css` | Inter and Source Serif 4 as base64, so the HTML makes no external requests. |
| `build/tool_urls.json` | Official vendor URL per tool. |
| `build/variance_proposal.json` | The editorial layer: maps a source paragraph to its edited replacement. |
| `build/scan.py` | Verifies figures survived, excluded regions are untouched, no em dashes, workbook hash unchanged. |

**The workbook is never written to.** `scan.py` checks its SHA-256 on every run.
Content edits belong in `variance_proposal.json`, applied on top.

**The HTML is generated output.** Editing it directly works for a one-off, but a
rebuild overwrites it. Anything meant to last goes in the workbook or the
variance map.
