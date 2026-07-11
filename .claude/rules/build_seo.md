# Build, Image & SEO Guidelines

This file covers Next.js static builds, asset optimizations, and SEO/accessibility requirements.

---

## Static Export Rules

This project uses Next.js static HTML export (`output: "export"` inside `next.config.mjs`). The entire site is fully pre-rendered into HTML files at build-time. There is no dynamic Node.js server running in production.

- **Dynamic Routes**: All dynamic page routes (such as `/packages/[slug]/page.tsx`) **must** export `generateStaticParams()` returning the array of all valid slug objects. Pages missing this helper will fail static compilation.
- **No Node.js Server APIs**: Do not use APIs that require a running server process, such as `headers()`, `cookies()`, `noStore()`, or dynamic route headers. Doing so will result in compile-time build errors.
- **Data Build-Time Injection**: Query all databases, config variables, and site contents inside `generateStaticParams()` or during initial page load rendering, as the data is compiled once at deployment.
- **No ISR / Revalidation**: Avoid using `revalidate` flags or incremental static regeneration features, as they do not apply to client-side static files.
- **404 Handling**: Utilizing Next.js `notFound()` inside pages is fully supported; Next.js will generate a static fallback page to route users appropriately.

---

## Next.js Image Optimization Rules

- **Sizes Property**: Any `Image` component that utilizes the `fill` layout property **must** include a descriptive `sizes` attribute (e.g. `sizes="(max-width: 768px) 100vw, 33vw"`). This is a build constraint enforced by Next.js.
- **Priority Property**: Apply `priority={true}` to the first 1 or 2 images visible above the fold (such as the main Hero banner or the first destination card) for LCP (Largest Contentful Paint) optimization.
- **Asset Sources**: All local images are loaded from the `/public/images/` path. Remote image addresses must be whitelisted in `next.config.mjs` (currently `images.unsplash.com` and `img.freepik.com` are allowed).

---

## SEO & Semantic HTML Rules

Follow these standards to ensure search engine optimization and standard-compliant markup:

1. **Title & Meta Headers**:
   - Every page must render descriptive `<title>` and `<meta name="description">` headers via Next.js metadata API.
   - Summarize the contents concisely while naturally integrating regional keywords.
2. **Heading Hierarchy**:
   - Each page must have exactly one unique `<h1>` element serving as the main entry heading.
   - Standardize subsections using logical descending order (`<h1>` → `<h2>` → `<h3>` etc.) without skipping levels.
3. **Semantic Tags**:
   - Structure layout layouts using semantic tags (`<header>`, `<main>`, `<section>`, `<article>`, `<aside>`, `<footer>`) instead of nested default `<div>` blocks.
   - Wrap the primary page contents inside a single `<main>` container for screen readers.
4. **Image Alt Tags**:
   - Provide clear, descriptive `alt` string descriptions for all `Image` components. Never leave an `alt` field empty or write generic names like "image" or "photo".
5. **Form Field Identifiers**:
   - Ensure all interactive inputs, form fields, drop-down menus, and action buttons have unique, descriptive `id` and `name` attributes.
6. **Internal Links**:
   - Use Next.js `<Link>` components for all internal route transitions to allow search crawler indexing.
