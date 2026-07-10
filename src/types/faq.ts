export interface FAQItem {
  question: string;
  answer: string;
}

export interface FAQData {
  tagline: string;
  faqs: FAQItem[];
}
