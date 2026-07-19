import FAQ from "@/components/home/FAQ";
import Gallery from "@/components/home/Gallery";
import Hero from "@/components/home/Hero";
import PopularDestinations from "@/components/home/PopularDestinations";
import RegionsGrid from "@/components/home/RegionsGrid";
import TestimonialsSection from "@/components/home/TravelerMoments";
import TripCards from "@/components/home/TripCards";
import WhyChooseUs from "@/components/home/WhyChooseUs";
import PageShell from "@/components/layout/PageShell";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import {
  getDestinationsByRegion,
  getFeaturedDestinationsSectionData,
} from "@/lib/db/repositories/destinationRepo";
import { getFAQSectionData } from "@/lib/db/repositories/faqRepo";
import { getGallerySectionData } from "@/lib/db/repositories/galleryRepo";
import { getHeroConfig } from "@/lib/db/repositories/heroRepo";
import { getAllPackages } from "@/lib/db/repositories/packageRepo";

export default async function Home() {
  const [
    heroConfig,
    packages,
    faqData,
    companyData,
    destinationsSectionData,
    galleryData,
    regionsData,
  ] = await Promise.all([
    getHeroConfig(),
    getAllPackages(),
    getFAQSectionData(),
    getCompanyData(),
    getFeaturedDestinationsSectionData(),
    getGallerySectionData(),
    getDestinationsByRegion(),
  ]);

  return (
    <PageShell companyData={companyData} ptClass="pt-0">
      <Hero heroConfig={heroConfig} />
      <WhyChooseUs />
      <TripCards packages={packages} />
      <PopularDestinations sectionData={destinationsSectionData} />
      <Gallery galleryData={galleryData} />
      <TestimonialsSection />
      {/*<PartnerAirlines />*/}
      <RegionsGrid regions={regionsData} />
      <FAQ faqData={faqData} companyData={companyData} />
    </PageShell>
  );
}
