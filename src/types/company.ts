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
  phone: string[];
  email: string;
  address: string;
  working_hours: WorkingHours;
  social_media: Record<string, string>;
  certifications: string[];
  about: AboutData | string | { footer?: string };
  whatsapp_number: string;
  google_analytics: string;
  google_tag_manager: string;
  latitude?: number | null;
  longitude?: number | null;
}
