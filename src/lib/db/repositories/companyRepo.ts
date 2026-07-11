import { prisma } from "@/lib/db/prisma";
import type { AboutData, CompanyData, WorkingHoursSchedule } from "@/types/company";

export async function getCompanyData(): Promise<CompanyData | null> {
  const c = await prisma.company.findFirst({
    where: { id: 1 },
  });
  if (!c) return null;

  let aboutData: AboutData;
  try {
    aboutData =
      typeof c.about === "string" ? JSON.parse(c.about) : (c.about as unknown as AboutData);
  } catch (e) {
    console.error("Failed to parse about field:", e);
    aboutData = {} as AboutData;
  }

  // Parse schedule & exceptions from JSON properties
  let scheduleParsed: WorkingHoursSchedule[] = [];
  try {
    scheduleParsed =
      typeof c.schedule === "string"
        ? JSON.parse(c.schedule)
        : (c.schedule as unknown as WorkingHoursSchedule[]);
  } catch (e) {
    console.error("Failed to parse schedule field:", e);
  }

  let exceptionsParsed: unknown[] = [];
  try {
    exceptionsParsed =
      typeof c.exceptions === "string"
        ? JSON.parse(c.exceptions)
        : (c.exceptions as unknown as unknown[]);
  } catch (e) {
    console.error("Failed to parse exceptions field:", e);
  }

  let socialMediaParsed: Record<string, string> = {};
  try {
    socialMediaParsed =
      typeof c.socialMedia === "string"
        ? JSON.parse(c.socialMedia)
        : (c.socialMedia as unknown as Record<string, string>);
  } catch (e) {
    console.error("Failed to parse socialMedia field:", e);
  }

  const workingHoursObj = {
    timezone: c.timezone,
    schedule: scheduleParsed,
    exceptions: exceptionsParsed,
  };

  return {
    name: c.name,
    tagline: c.tagline,
    website: c.website,
    phones: c.phones, // Native PostgreSQL string array
    phone: c.phones, // Legacy fallback
    email: c.email,
    address: c.address,
    workingHours: workingHoursObj,
    working_hours: workingHoursObj, // Legacy fallback
    socialMedia: socialMediaParsed,
    social_media: socialMediaParsed, // Legacy fallback
    certifications: c.certifications, // Native PostgreSQL string array
    about: aboutData,
    whatsappNumber: c.whatsappNumber,
    whatsapp_number: c.whatsappNumber, // Legacy fallback
    googleAnalytics: c.googleAnalytics,
    googleTagManager: c.googleTagManager,
    latitude: c.latitude,
    longitude: c.longitude,
  };
}
