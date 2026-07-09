import FAQ from "@/components/FAQ";
import Footer from "@/components/Footer";
import Gallery from "@/components/Gallery";
import Hero from "@/components/Hero";
import Navbar from "@/components/Navbar";
import PartnerAirlines from "@/components/PartnerAirlines";
import PopularDestinations from "@/components/PopularDestinations";
import RegionsGrid from "@/components/RegionsGrid";
import TestimonialsSection from "@/components/TravelerMoments";
import TripCards from "@/components/TripCards";
import WhyChooseUs from "@/components/WhyChooseUs";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getDestinations } from "@/lib/db/repositories/destinationRepo";
import { getFAQData } from "@/lib/db/repositories/faqRepo";
import { getHeroSlides } from "@/lib/db/repositories/heroRepo";
import { getPackagesIndex } from "@/lib/db/repositories/packageRepo";

export default async function Home() {
  // Fetch all data server-side from SQLite
  const [heroData, packagesData, faqData, companyData, destinationsData] = await Promise.all([
    getHeroSlides(),
    getPackagesIndex(),
    getFAQData(),
    getCompanyData(),
    getDestinations(),
  ]);

  const destinationsWrapped = { destinations: destinationsData, total: destinationsData.length };
  const packagesWrapped = { total: packagesData.total, packages: packagesData.packages };

  return (
    <div className="relative min-h-screen bg-white flex flex-col pt-24">
      <Navbar />

      <main className="flex-1">
        <Hero heroData={heroData} packagesData={packagesWrapped} />
        <WhyChooseUs />
        <TripCards packagesData={packagesWrapped} />
        <PopularDestinations
          destinationsData={destinationsWrapped}
          packagesData={packagesWrapped}
        />
        <Gallery />
        <TestimonialsSection />
        <PartnerAirlines />
        <RegionsGrid />
        <FAQ faqData={faqData} companyData={companyData} />
      </main>

      <Footer companyData={companyData} />
    </div>
  );
}
