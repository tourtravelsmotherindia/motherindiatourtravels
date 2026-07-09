<!-- BEGIN:nextjs-agent-rules -->

# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` before writing any code. Heed deprecation notices.
<!-- END:nextjs-agent-rules -->

# Design System Guidelines

Future agents working on this codebase **must** adhere to the following design system choices:

## Typography

This website uses a **two-font system** optimized for travel/experience branding:

- **Display / Headings**: `Trip Sans`
  - _Usage_: All `h1`, `h2`, `h3`, `h4`, `h5`, `h6` headings automatically use `Trip Sans`.
  - _Classes_: Use the `.font-display` utility class for any non-heading element (like logo/branding text) that should use this font.
  - _Weights_: Supports `Light` (300), `Regular` (400), `Medium` (500), and `Bold` (700) via variable and static font files.
- **Body / UI**: `Poppins`
  - _Usage_: Used for all body text, paragraphs, buttons, forms, navigation lists, calendar pickers, and general user interface elements.
  - _Classes_: Standard body inherits this font via `--font-sans`.
  - _Weights_: Configured with weights `300` (Light), `400` (Regular), `500` (Medium), `600` (Semibold), and `700` (Bold).

## Color Palette

The project utilizes specific CSS variables mapped to Tailwind colors in `src/app/globals.css`:

| Variable         | Color Code | Name / Purpose             | When & Where to Use                                                                                  |
| :--------------- | :--------- | :------------------------- | :--------------------------------------------------------------------------------------------------- |
| `--brand`        | `#e05423`  | **Primary Brand Orange**   | Buttons, primary calls-to-action (CTAs), key active states, text highlights, custom scrollbar thumb. |
| `--brand-hover`  | `#c54417`  | **Brand Hover Orange**     | Hover and active focus states of any primary brand component.                                        |
| `--brand-light`  | `#fff3ee`  | **Soft Brand Accent**      | Light orange background for tags, badges, decorative card backgrounds, and custom scrollbar track.   |
| `--brand-dark`   | `#111111`  | **Dark Brand Accent**      | Dark backgrounds, overlays, or deep brand text.                                                      |
| `--background`   | `#ffffff`  | **Page Background**        | Main background of pages and sections (defaults to pure white).                                      |
| `--foreground`   | `#111111`  | **Primary Foreground**     | Main heading titles, body paragraphs, and general dark elements.                                     |
| `--muted`        | `#666666`  | **Secondary Muted Grey**   | Subtitles, description paragraphs, labels, placeholder text, and secondary details.                  |
| `--border-light` | `#ececec`  | **Light Border / Divider** | Premium thin borders around cards, filter boxes, inputs, and section dividers.                       |

_Note: Avoid using hardcoded hex values in components. Always map to design system classes (`bg-brand`, `text-muted`, `border-border-light`, etc.) or tailwind-defined variables._

## UI/UX Topology & Visual Hierarchy Rules

To maintain the premium look and feel of the website, future agents **must** adhere to the following layout topology constraints:

### 1. Border Radius Strategy
- **Organic Highly Rounded Shapes**: To prevent a boxy feel and maintain a smooth, flowing, premium visual aesthetic, we use highly rounded corners across the codebase:
  - **Pill-shaped elements**: The Navbar container, input fields, dropdown triggers, sliding segmented tab switches, pagination capsules, CTA details buttons, and partner airline cards must use `rounded-full`.
  - **Primary Card Panels**: Testimonial cards, destination trip cards, gallery item wrappers, and the hero search popover must use `rounded-[2rem]` (32px) or `rounded-[2.5rem]` (40px).
  - **Nested card images**: Nested elements (like package card image containers) must use `rounded-[1.5rem]` (24px) to contour cleanly inside their parent card wrappers.
  - **Clean Brand Logo Integration**: Brand logo images in the Navbar and Footer should not have any surrounding frame, background box, or borders.

### 2. Shadows & Borders
- **Invisible Subtle Shadows**: Use `0 8px 30px rgba(0, 0, 0, 0.04)` (`shadow-premium` or `shadow-card` variables) for floating elements. Never use dark or heavy shadows.
- **Dividers & Borders**: Rely on clean, thin outlines: `1px #ECECEC` (`border-border-light`).

### 3. Orange Accent Limitation
- **CTA and Interactive Elements ONLY**: The primary brand orange (`#e05423` or `--brand`) must be restricted to action-oriented elements:
  - CTA Buttons (Find Packages, details buttons on hover, active switch tabs)
  - Prices and active categories
  - Hover states of links
- **Black Headings & Muted Icons**: Headings must remain clean black (`text-foreground`). Never highlight heading words with brand orange. Non-interactive icons (like MapPin markers) and static labels/badges must use muted grey (`text-neutral-400` or neutral fills) to avoid cluttering.

### 4. Rhythm & Section Spacing
- **Consistent Rhythm**: Main sections on landing pages must be separated by a standard vertical padding of `96px` (`py-24` in Tailwind) to prevent layout disconnect or congestion.
- **Typography Weights**: Maintain a clean contrast hierarchy:
  - Headings: `700` (`font-bold`)
  - Body text: `400` (`font-normal`)
  - CTA/Buttons: `600` (`font-semibold`)
