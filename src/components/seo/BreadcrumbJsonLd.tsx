import { generateBreadcrumbJsonLd } from "@/lib/seo/breadcrumb";

interface BreadcrumbJsonLdProps {
  path: string;
  customLabels?: Record<string, string>;
}

export default function BreadcrumbJsonLd({ path, customLabels }: BreadcrumbJsonLdProps) {
  const schema = generateBreadcrumbJsonLd(path, customLabels);

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(schema) }}
    />
  );
}
