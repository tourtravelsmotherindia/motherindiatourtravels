import { notFound } from "next/navigation";

import Footer from "@/components/Footer";
import Navbar from "@/components/Navbar";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";

import ContactClient from "./ContactClient";

export const metadata = {
  title: "Contact Us | Mother India Tour Travels",
  description:
    "Get in touch with Mother India Tour Travels for custom tour packages, car rentals, and travel itineraries across India. We're here to help you plan your perfect journey.",
};

export default async function ContactPage() {
  const companyData = await getCompanyData();

  if (!companyData) {
    notFound();
  }

  return (
    <div className="relative min-h-screen bg-white flex flex-col pt-24">
      <Navbar />
      <main className="flex-1">
        <ContactClient companyData={companyData} />
      </main>
      <Footer companyData={companyData} />
    </div>
  );
}
