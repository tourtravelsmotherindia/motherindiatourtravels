import { prisma } from "@/lib/db/prisma";

export interface AboutSectionImageCollage {
  title: string;
  description: string;
  items: string[];
  images: string[];
}

export interface AboutData {
  footer: string;
  header: {
    badge: string;
    title: string;
    description: string;
    image: string;
    introText: string;
    stats: {
      value: string;
      label: string;
    }[];
  };
  mission: AboutSectionImageCollage;
  vision: AboutSectionImageCollage;
  history: AboutSectionImageCollage;
  howWeWork: {
    title: string;
    subtitle: string;
    videoImage: string;
    videoUrl: string;
  };
}

export async function getCompanyData() {
  const c = await prisma.company.findFirst();
  if (!c) return null;

  let aboutData: AboutData;
  try {
    aboutData =
      typeof c.about === "string" ? JSON.parse(c.about) : (c.about as unknown as AboutData);
  } catch (e) {
    console.error("Failed to parse about field:", e);
    aboutData = {} as AboutData;
  }

  return {
    name: c.name,
    tagline: c.tagline,
    website: c.website,
    phone: JSON.parse(c.phones) as string[],
    email: c.email,
    address: c.address,
    working_hours: {
      timezone: c.timezone,
      schedule: JSON.parse(c.schedule),
      exceptions: JSON.parse(c.exceptions || "[]"),
    },
    social_media: JSON.parse(c.socialMedia),
    certifications: JSON.parse(c.certifications) as string[],
    about: aboutData,
    whatsapp_number: c.whatsappNumber,
    google_analytics: c.googleAnalytics,
    google_tag_manager: c.googleTagManager,
    latitude: c.latitude,
    longitude: c.longitude,
  };
}
