<!-- BEGIN:nextjs-agent-rules -->

# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` before writing any code. Heed deprecation notices.
<!-- END:nextjs-agent-rules -->

# Design System Guidelines

Future agents working on this codebase **must** adhere to the following design system choices:

## Typography

This website uses a **two-font system** optimized for travel/experience branding:
*   **Display / Headings**: `Trip Sans`
    *   *Usage*: All `h1`, `h2`, `h3`, `h4`, `h5`, `h6` headings automatically use `Trip Sans`.
    *   *Classes*: Use the `.font-display` utility class for any non-heading element (like logo/branding text) that should use this font.
    *   *Weights*: Supports `Light` (300), `Regular` (400), `Medium` (500), and `Bold` (700) via variable and static font files.
*   **Body / UI**: `Poppins`
    *   *Usage*: Used for all body text, paragraphs, buttons, forms, navigation lists, calendar pickers, and general user interface elements.
    *   *Classes*: Standard body inherits this font via `--font-sans`.
    *   *Weights*: Configured with weights `300` (Light), `400` (Regular), `500` (Medium), `600` (Semibold), and `700` (Bold).

## Color Palette

The project utilizes specific CSS variables mapped to Tailwind colors in `src/app/globals.css`:

| Variable | Color Code | Name / Purpose | When & Where to Use |
| :--- | :--- | :--- | :--- |
| `--brand` | `#e05423` | **Primary Brand Orange** | Buttons, primary calls-to-action (CTAs), key active states, text highlights, custom scrollbar thumb. |
| `--brand-hover` | `#c54417` | **Brand Hover Orange** | Hover and active focus states of any primary brand component. |
| `--brand-light` | `#fff3ee` | **Soft Brand Accent** | Light orange background for tags, badges, decorative card backgrounds, and custom scrollbar track. |
| `--brand-dark` | `#111111` | **Dark Brand Accent** | Dark backgrounds, overlays, or deep brand text. |
| `--background` | `#ffffff` | **Page Background** | Main background of pages and sections (defaults to pure white). |
| `--foreground` | `#111111` | **Primary Foreground** | Main heading titles, body paragraphs, and general dark elements. |
| `--muted` | `#666666` | **Secondary Muted Grey** | Subtitles, description paragraphs, labels, placeholder text, and secondary details. |
| `--border-light` | `#ececec` | **Light Border / Divider** | Premium thin borders around cards, filter boxes, inputs, and section dividers. |

*Note: Avoid using hardcoded hex values in components. Always map to design system classes (`bg-brand`, `text-muted`, `border-border-light`, etc.) or tailwind-defined variables.*

