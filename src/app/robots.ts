import { MetadataRoute } from "next";

export const dynamic = "force-static";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: "*",
      allow: "/",
      disallow: ["/manage/", "/packages/*/book/", "/cdn-cgi/"],
    },
    sitemap: "https://motherindiatourtravels.com/sitemap.xml",
  };
}
