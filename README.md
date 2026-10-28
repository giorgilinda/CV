# Linda Giorgi's CV

Single-page HTML résumé, deployed on Vercel.

## Files

- `index.html`: the whole CV. The first block is the one-page résumé, the `#projectPage` section is the detailed project list.
- `main.css`: screen and print styles. The print rules target A4 and scale the first page (`--print-scale`, currently 0.9) so it fits on one sheet.
- There is no PDF in the repo on purpose. The print path is Ctrl+P on the live page (or the "Save as PDF" link in the contact bar), so the print CSS must always produce a clean result on its own: page one on a single A4 sheet, the project list on the following pages.

## Conventions

- Semantic structure: one `h1` (name), `h2` per section, `h3` per role or skill group, `h4` per project. Role and company lines are paragraphs with the `role` and `company` classes.
- Uppercase headings are done with CSS `text-transform`; the markup keeps normal casing.
- `#qr` is a print-only QR code (inline SVG, generated once with the `qrcode` npm package, error correction M) pointing to the live URL, with the URL as text under it. Regenerate it if the domain changes. `.print-only` / `.no-print` toggle elements between paper and screen.
- Icons are inline SVGs (Material Symbols Rounded, weight 400, 48px, from the google/material-design-icons repo) with the `icon` class and `aria-hidden="true"`. No icon font is loaded, so nothing is fetched and no ligature names leak into extracted PDF text.
- Dates use `<time datetime="YYYY[-MM]">`. An open-ended end date is written as `Present`; none is open at the moment.
- The headline (`#professionalTitle`, meta description, OG title, JSON-LD `jobTitle`) is the positioning claim. Role lines inside Experience are the titles actually held.
- Page one holds a short outcome version of each story; the project page holds the full version. Do not repeat a sentence in both.
- Skills live in the sidebar as grouped rows of pills (same look as the project stack tags), ordered by strength, no numeric ratings. Project stack tags list only what page one does not already cover. Languages carry a one-word level.
- A `schema.org/Person` JSON-LD block in `<head>` mirrors the visible content. Keep it in sync when the title, employer, or skills change.
- Line endings are CRLF.

## To-do

- January 2027: remove the `worksFor` block from the JSON-LD (the Rebike contract ends December 2026), and update the availability line in `#contacts` once a new role starts.

## Hiding contact details

Append `?hidecontacts=1` to the URL to hide the phone number and email, for example when sharing a link publicly. This is best-effort: it only hides the two list items, the values stay in the page source and in the JSON-LD block.

## Checking the print layout

Open the page in Chrome, press Ctrl+P, paper size A4, margins "Default", headers and footers off. The first page must stay on one sheet; the project list follows on the next pages.
