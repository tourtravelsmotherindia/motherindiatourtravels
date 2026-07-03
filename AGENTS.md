# AGENTS.md — Mother India / TravelXploria

**Static PHP site** — Next.js → HTTrack export → PHP. No build step, no npm, no composer.

## Quick Start
```sh
php -S localhost:8000          # uses index.php as front controller (fallback)
php -S localhost:8000 router.php  # explicit router (identical behavior)
```

## Routing
- **Apache**: `.htaccess` rewrites clean URLs → `collection.php`, `package.php`, `blog.php`, static `.php` files.
- **Built-in server**: `index.php` lines 1-58 act as front controller (static assets returned `false`, routes dispatched). `router.php` is a standalone alternative.
- URL patterns: `/europe` → `collection.php`, `/package/beautiful-taj-mahal-tour` → `package.php`, `/blog/kashmir-couple-package-...` → `blog.php`, `/about-us` → `about-us.php`.

## Architecture

### Page types
| Page | Data source | Template |
|------|------------|----------|
| Homepage (`index.php`) | Inline 13MB HTML (static) | Self-contained |
| Collection (`/europe`) | `data/collections/{slug}.json` | `travelxploria/{slug}.html` (with fallback `europe.html`) |
| Package (`/package/...`) | `data/packages/{slug}.json` | `travelxploria/package/{slug}.html` |
| Blog (`/blog/...`) | `data/blogs/{slug}.json` | `includes/shell-head.php` + inline body |
| Static pages | `includes/shell-head.php` + `includes/shell-foot.php` wrappers | Self-contained PHP |

### Includes
- `includes/config.php` — constants from `data/site-config.json`
- `includes/functions.php` — helpers: `loadData()`, `getPageData()`, `e()`, `cleanImageUrl()`
- `includes/shell-head.php` — `<head>` + GTM + Clarity + header nav
- `includes/shell-head-fixed.php` — same but fixed-position header (used on homepage)
- `includes/shell-foot.php` — footer + scripts + `</body></html>`

### Data directory
- `data/collections/*.json` — collection details + embedded package list
- `data/packages/*.json` — price tiers, overview, itinerary, inclusions, exclusions
- `data/blogs/*.json` — blog posts with body_content HTML
- `data/menu.json` — navigation structure
- `data/slug-mappings.json` — known package slugs + blog title→slug mappings
- `data/site-config.json` — phone, email, social links, GTM/Clarity IDs

## Critical Gotchas

### Asset paths
The `travelxploria/` HTML files use **relative** `_next/static/...` URLs. At `/package/{slug}` these resolve to `/package/_next/...` (wrong). **Must** convert to absolute `/_next/static/...` in `package.php` and `collection.php`.

### JS in PHP
Do NOT concatenate JS inside PHP double-quoted strings — `$t.actual` gets interpreted as PHP variable interpolation. Use `ob_start()` / output buffer to write JS cleanly.

### Package data
JSON fields (`price`, `inclusions`, `exclusions`, `itinerary`) may be **double-encoded as strings** in raw data — check `json_decode()` result and decode again if needed.

### Image URLs
- `_next/image` optimizer URLs → extract `url=` query param, `urldecode()` to direct path
- `uploads_mediaDestination` / `uploads_mediaHotels` → fix missing `/` → `uploads_media/Destination`
- External images on `travelxploria.com/uploads_media/` kept as-is (no local copy)

### HTTrack artifacts
Strip `<!-- Added by HTTrack -->` comments and mirror-attribute `href="*.html"` links from data.

### `travelxploria/` is READ-ONLY
Do not modify `travelxploria/` directory — it's the reference export. User deletes it after migration.

### Index.php is 13MB
Edit operations on `index.php` are slow. Avoid regex on it — prefer targeted string replace.

## Verification
```sh
php -l index.php package.php collection.php blog.php  # syntax check all pages
node --check /tmp/js_check.js                          # check injected JS after extraction
```