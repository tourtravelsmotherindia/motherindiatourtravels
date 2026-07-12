// FAQ domain types — v2.0

export interface FAQItem {
  id: string;
  question: string;
  answer: string;
  sortOrder: number;
}

export interface FAQSectionData {
  tagline: string;
  subtitle: string;
  image?: string | null;
  items: FAQItem[];
}
