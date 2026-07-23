import { MetadataRoute } from "next";

export const dynamic = "force-static";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: "*",
      allow: "/",
      disallow: ["/manage/", "/packages/*/book/"],
    },
    sitemap: "https://www.motherindiatourtravels.com/sitemap.xml",
  };
}
