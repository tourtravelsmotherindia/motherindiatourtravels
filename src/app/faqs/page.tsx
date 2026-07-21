import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getAllFAQs } from "@/lib/db/repositories/faqRepo";

import FAQsClient from "./FAQsClient";

export const metadata = {
  title: "Frequently Asked Questions | Mother India Tour Travels",
  description:
    "Find answers to frequently asked questions about tour packages, customization, bookings, cancellations, payments, and privacy policies with Mother India Tour Travels.",
};

export default async function FAQsPage() {
  const [faqs, companyData] = await Promise.all([getAllFAQs(), getCompanyData()]);

  return <FAQsClient initialFaqs={faqs} companyData={companyData} />;
}
