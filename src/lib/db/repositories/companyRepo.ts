import { prisma } from "@/lib/db/prisma";

export async function getCompanyData() {
  const c = await prisma.company.findFirst();
  if (!c) return null;

  return {
    name: c.name,
    tagline: c.tagline,
    website: c.website,
    phone: JSON.parse(c.phones),
    email: c.email,
    address: c.address,
    working_hours: {
      timezone: c.timezone,
      schedule: JSON.parse(c.schedule),
      exceptions: JSON.parse(c.exceptions || "[]"),
    },
    social_media: JSON.parse(c.socialMedia),
    certifications: JSON.parse(c.certifications),
    about: c.about,
    whatsapp_number: c.whatsappNumber,
    google_analytics: c.googleAnalytics,
    google_tag_manager: c.googleTagManager,
  };
}
