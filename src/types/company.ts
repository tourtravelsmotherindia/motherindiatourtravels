export interface WorkingHoursSchedule {
  days: string[];
  hours: { open: string; close: string }[];
}

export interface WorkingHours {
  timezone: string;
  schedule: WorkingHoursSchedule[];
  exceptions?: unknown[];
}

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

export interface CompanyData {
  name: string;
  tagline: string;
  website: string;
  phones: string[];
  phone: string[]; // legacy fallback
  email: string;
  address: string;
  workingHours: WorkingHours;
  working_hours: WorkingHours; // legacy fallback
  socialMedia: Record<string, string>;
  social_media: Record<string, string>; // legacy fallback
  certifications: string[];
  about: AboutData;
  whatsappNumber: string;
  whatsapp_number: string; // legacy fallback
  googleAnalytics: string;
  googleTagManager: string;
  latitude?: number | null;
  longitude?: number | null;
  gstin: string;
  messengerNumber: string;
}
