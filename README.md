# The Startup Tool Stack

A comparison guide to 84 startup tools across 14 categories, plus the internal
build route in every category. 275 pages in print.

**Live site:** https://abj20093-svg.github.io/startup-tool-stack/
**Guided version** (asks what you need, then routes you to a tool):
https://abj20093-svg.github.io/startup-tool-stack/guided.html

Both pages update automatically about a minute after any push to `main`.

---

## What's in this repo

| File | What it is |
|---|---|
| `index.html` | The guide, exactly as a reader sees it. Self-contained. |
| `guided.html` | Same guide with a find-your-tool questionnaire on the cover. |
| `guide/Startup-Tool-Stack.pdf` | The print edition, 275 pages. |
| `guide/Startup-Tool-Stack-editable.html` | Review copy: click any line to edit; a Confirm edits button collects the changes. Not for publishing. |
| `build/` | The generator that produces all of the above. |

---

## Embedding this in the DECODE site

`index.html` is a single self-contained file: fonts, styles and behaviour are
all inline. No build step, no dependencies, no external requests. That makes it
easy to host but it does bring its own `<body>` styling, so read the two
options before dropping it in.

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

Note the guide is under 1 MB, most of it embedded fonts. `loading="lazy"`
keeps that off the critical path.

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

### Option C — custom domain on GitHub Pages

To serve this at a DECODE subdomain (e.g. `toolstack.decode.com`) without
hosting anything: add a DNS CNAME record pointing the subdomain at
`abj20093-svg.github.io`, then set the custom domain in this repo's
Pages settings. GitHub provisions HTTPS automatically.

### What to know either way

- The guide is responsive. Below 1000px the fixed rail collapses into a
  dropdown at the top.
- Print styles are included: the rail and all controls are hidden, and the
  document paginates to 275 pages. `guide/Startup-Tool-Stack.pdf` is that
  output.
- Every tool name in the At a glance tables links out to the vendor's own site
  in a new tab. 84 URLs, all verified.

---

## Rebuilding

Needs Python 3 with `openpyxl`, and Chrome for the PDF.

```
cd build
VARIANT=varied python3 build_full.py
# -> toolstack_varied.html (main) and toolstack_wizard.html (guided)
```

PDF:

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf=Startup-Tool-Stack.pdf \
  "file://$PWD/toolstack_varied.html"
```

---

## How the build works

`startup-tool-stack.xlsx` is the source of truth: 14 category blocks, seven
columns each (six products plus the internal build route), one row per
comparison factor. `build_full.py` reads it and generates every page — the At
a glance table, the 98 profiles, and the print pagination.

| File | What it does |
|---|---|
| `build/css.txt` | The stylesheet, injected at build time. Screen and print rules both live here. |
| `build/fonts/embedded.css` | Inter as base64, so the HTML makes no external requests. |
| `build/tool_urls.json` | Official vendor URL per tool. |
| `build/variance_proposal.json` | The editorial layer: maps a source paragraph to its edited replacement. |

**The workbook is never written to.** Content edits belong in
`variance_proposal.json` (or the rewrite maps in `build_full.py`), applied on
top.

**The HTML is generated output.** Editing it directly works for a one-off, but
a rebuild overwrites it. Anything meant to last goes in the workbook or the
editorial layer.
