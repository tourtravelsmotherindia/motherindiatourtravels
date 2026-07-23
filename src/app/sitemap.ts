import { MetadataRoute } from "next";

import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllDestinations } from "@/lib/db/repositories/destinationRepo";
import { getAllPackages } from "@/lib/db/repositories/packageRepo";

export const dynamic = "force-static";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const companyData = await getCompanyData();
  const rawBaseUrl = companyData?.website || "https://motherindiatourtravels.com";
  const baseUrl = rawBaseUrl.replace(/\/$/, "").replace("www.", "");

  // 1. Static Pages
  const staticPaths = [
    { url: "", priority: 1.0, changefreq: "daily" },
    { url: "about", priority: 0.8, changefreq: "weekly" },
    { url: "contact", priority: 0.8, changefreq: "weekly" },
    { url: "packages", priority: 0.9, changefreq: "daily" },
    { url: "destinations", priority: 0.9, changefreq: "daily" },
    { url: "regions", priority: 0.8, changefreq: "weekly" },
    { url: "faqs", priority: 0.7, changefreq: "weekly" },
    { url: "privacy-policy", priority: 0.3, changefreq: "monthly" },
    { url: "terms-of-service", priority: 0.3, changefreq: "monthly" },
    { url: "cookie-policy", priority: 0.3, changefreq: "monthly" },
    { url: "cancellation-policy", priority: 0.3, changefreq: "monthly" },
    { url: "sitemap", priority: 0.5, changefreq: "monthly" },
  ];

  const staticEntries = staticPaths.map((p) => ({
    url: `${baseUrl}/${p.url ? p.url + "/" : ""}`,
    lastModified: new Date(),
    changeFrequency: p.changefreq as
      "always" | "hourly" | "daily" | "weekly" | "monthly" | "yearly" | "never",
    priority: p.priority,
  }));

  // 2. Destinations
  const destinations = await getAllDestinations();
  const destinationEntries = destinations.map((d) => ({
    url: `${baseUrl}/destinations/${d.slug}/`,
    lastModified: d.updatedAt ? new Date(d.updatedAt) : new Date(),
    changeFrequency: "weekly" as const,
    priority: 0.8,
  }));

  // 3. Packages
  const packages = await getAllPackages();
  const packageEntries = packages.map((p) => ({
    url: `${baseUrl}/packages/${p.slug}/`,
    lastModified: p.updatedAt ? new Date(p.updatedAt) : new Date(),
    changeFrequency: "weekly" as const,
    priority: 0.8,
  }));

  // 4. Package Variants
  const variantEntries = packages.flatMap((p) =>
    p.variants.map((v) => ({
      url: `${baseUrl}/packages/${p.slug}/${v.slug}/`,
      lastModified: p.updatedAt ? new Date(p.updatedAt) : new Date(),
      changeFrequency: "weekly" as const,
      priority: 0.7,
    })),
  );

  return [...staticEntries, ...destinationEntries, ...packageEntries, ...variantEntries];
}
