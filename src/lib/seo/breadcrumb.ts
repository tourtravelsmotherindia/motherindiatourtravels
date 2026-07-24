import { BreadcrumbListItem } from "@/types/seo";

const DOMAIN = "https://motherindiatourtravels.com";

// Static mapping for route segments to clean display names
const STATIC_SEGMENT_MAP: Record<string, string> = {
  packages: "Tour Packages",
  destinations: "Destinations",
  regions: "Regions",
  about: "About Us",
  contact: "Contact Us",
  faqs: "FAQs",
  "cancellation-policy": "Cancellation Policy",
  "cookie-policy": "Cookie Policy",
  "privacy-policy": "Privacy Policy",
  "terms-of-service": "Terms of Service",
  sitemap: "Sitemap",
  book: "Book Package",
};

/** Formats a raw slug to a Title Cased string */
export function formatSlug(slug: string): string {
  if (!slug) return "";
  return slug
    .split("-")
    .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
    .join(" ");
}

export interface BreadcrumbItem {
  name: string;
  item: string; // The canonical URL
}

/** Generates dynamic breadcrumb items based on path and custom labels */
export function getBreadcrumbItems(
  pathname: string,
  customLabels: Record<string, string> = {},
): BreadcrumbItem[] {
  // Normalize: remove leading/trailing slashes and query strings, then split
  const cleanPathname = pathname.split("?")[0].replace(/\/$/, "");
  const segments = cleanPathname.split("/").filter(Boolean);

  const items: BreadcrumbItem[] = [
    {
      name: "Home",
      item: `${DOMAIN}/`,
    },
  ];

  let currentPath = "";

  for (let i = 0; i < segments.length; i++) {
    const segment = segments[i];
    currentPath += `/${segment}`;

    // Look up label from exact path match or segment name match
    let name = customLabels[currentPath] || customLabels[segment];

    if (!name) {
      name = STATIC_SEGMENT_MAP[segment];
    }

    if (!name) {
      name = formatSlug(segment);
    }

    // Ensure trailing slash for canonical URLs
    const itemUrl = `${DOMAIN}${currentPath}/`;

    items.push({
      name,
      item: itemUrl,
    });
  }

  return items;
}

/** Helper to generate BreadcrumbList JSON-LD schema objects */
export function generateBreadcrumbJsonLd(pathname: string, customLabels?: Record<string, string>) {
  const items = getBreadcrumbItems(pathname, customLabels);

  return {
    "@context": "https://schema.org" as const,
    "@type": "BreadcrumbList" as const,
    itemListElement: items.map(
      (item, index) =>
        ({
          "@type": "ListItem" as const,
          position: index + 1,
          name: item.name,
          item: item.item,
        }) satisfies BreadcrumbListItem,
    ),
  };
}
