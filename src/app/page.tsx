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

export default function Home() {
  return (
    <div className="relative min-h-screen bg-white flex flex-col pt-24">
      {/* Navigation Header */}
      <Navbar />

      {/* Main Layout Content */}
      <main className="flex-1">
        {/* Hero Banner and Search Bar */}
        <Hero />

        {/* Why Choose Us trust section */}
        <WhyChooseUs />

        {/* Selected Trip Cards / Packages */}
        <TripCards />

        {/* Popular Destinations Slider */}
        <PopularDestinations />

        {/* Gallery */}
        <Gallery />

        {/* Traveler Moments / Testimonials */}
        <TestimonialsSection />

        {/* Search Top Airlines Grid */}
        <PartnerAirlines />

        {/* Destinations By Sub-Continent Regions */}
        <RegionsGrid />

        {/* FAQ Section */}
        <FAQ />
      </main>

      {/* Footer Branding & Links */}
      <Footer />
    </div>
  );
}
