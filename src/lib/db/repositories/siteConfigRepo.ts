import { prisma } from "@/lib/db/prisma";

export async function getSiteConfig() {
  const config = await prisma.siteConfig.findFirst();
  if (!config) return null;

  return {
    site_name: config.siteName,
    domain: config.domain,
    navigation: JSON.parse(config.navigation),
    seo: {
      home_title: config.homeTitle,
      home_description: config.homeDescription,
      og_image: config.ogImage,
    },
    cross_linking_rules: JSON.parse(config.crossLinkingRules),
    url_structure: JSON.parse(config.urlStructure),
    seo_principles: JSON.parse(config.seoPrinciples),
  };
}
