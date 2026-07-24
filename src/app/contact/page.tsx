import { notFound } from "next/navigation";

import PageShell from "@/components/layout/PageShell";
import BreadcrumbJsonLd from "@/components/seo/BreadcrumbJsonLd";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";

import ContactClient from "./ContactClient";

export const metadata = {
  title: "Contact Us | Mother India Tour Travels",
  description:
    "Get in touch with Mother India Tour Travels for custom tour packages, car rentals, and travel itineraries across India. We're here to help you plan your perfect journey.",
  alternates: {
    canonical: "/contact/",
  },
};

export default async function ContactPage() {
  const companyData = await getCompanyData();

  if (!companyData) {
    notFound();
  }

  return (
    <PageShell companyData={companyData}>
      <BreadcrumbJsonLd path="/contact" />
      <ContactClient companyData={companyData} />
    </PageShell>
  );
}
