import { notFound } from "next/navigation";

import Footer from "@/components/Footer";
import Navbar from "@/components/Navbar";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";

import AboutClient from "./AboutClient";

export const metadata = {
  title: "About Us | Mother India Tour Travels",
  description:
    "Learn more about Mother India Tour Travels, the best travel operators in Delhi. Discover our mission, vision, history, and how we curate perfect travel experiences.",
};

export default async function AboutPage() {
  const companyData = await getCompanyData();

  if (!companyData) {
    notFound();
  }

  return (
    <div className="relative min-h-screen bg-white flex flex-col pt-24">
      <Navbar />
      <main className="flex-1">
        <AboutClient companyData={companyData} />
      </main>
      <Footer companyData={companyData} />
    </div>
  );
}
