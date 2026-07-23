import { notFound } from "next/navigation";

import PageShell from "@/components/layout/PageShell";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";

import AboutClient from "./AboutClient";

export const metadata = {
  title: "About Us | Mother India Tour Travels",
  description:
    "Learn more about Mother India Tour Travels, the best travel operators in Delhi. Discover our mission, vision, history, and how we curate perfect travel experiences.",
  alternates: {
    canonical: "/about/",
  },
};

export default async function AboutPage() {
  const companyData = await getCompanyData();

  if (!companyData) {
    notFound();
  }

  return (
    <PageShell companyData={companyData}>
      <AboutClient companyData={companyData} />
    </PageShell>
  );
}
