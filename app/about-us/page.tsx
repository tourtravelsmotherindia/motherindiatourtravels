import { Metadata } from "next";
import { getSiteConfig } from "@/lib/data";

const siteConfig = getSiteConfig();

export const metadata: Metadata = {
  title: "About Us",
  description: `Learn more about ${siteConfig?.site_name || "TravelXploria"} - your trusted travel partner for curated holiday packages across the world.`,
};

export default function AboutUsPage() {
  return (
    <div>
      {/* Banner */}
      <section className="relative h-64 md:h-80 overflow-hidden bg-black">
        <div className="absolute inset-0 bg-gradient-to-r from-red to-yellow opacity-80" />
        <div className="absolute inset-0 flex items-center justify-center">
          <h1 className="text-4xl md:text-5xl font-bold text-white">
            About Us
          </h1>
        </div>
      </section>

      {/* Content */}
      <div className="max-w-4xl mx-auto px-4 py-16">
        <div className="prose prose-lg max-w-none">
          <h2>Who We Are</h2>
          <p>
            {siteConfig?.site_name || "TravelXploria"} is a premier travel
            company dedicated to crafting unforgettable travel experiences. We
            specialize in curated holiday packages across domestic and
            international destinations, offering personalized itineraries that
            cater to every type of traveler.
          </p>

          <h2>Our Mission</h2>
          <p>
            Our mission is to make travel accessible, affordable, and
            extraordinary for everyone. We believe that every journey should be
            as unique as the traveler, which is why we offer customized packages
            tailored to your preferences, budget, and travel style.
          </p>

          <h2>Why Choose Us</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8 not-prose my-8">
            {[
              {
                icon: "bi-shield-check",
                title: "Trusted Experience",
                desc: "Years of expertise in crafting perfect holidays for thousands of happy travelers.",
              },
              {
                icon: "bi-currency-rupee",
                title: "Best Prices",
                desc: "We negotiate the best rates with hotels, airlines, and local partners to give you unbeatable value.",
              },
              {
                icon: "bi-headset",
                title: "24/7 Support",
                desc: "Our team is available around the clock to assist you before, during, and after your trip.",
              },
              {
                icon: "bi-star-fill",
                title: "Custom Packages",
                desc: "Every itinerary is tailored to your preferences - from luxury escapes to budget adventures.",
              },
              {
                icon: "bi-geo-alt-fill",
                title: "Local Expertise",
                desc: "We work with local guides and partners to give you authentic, insider experiences.",
              },
              {
                icon: "bi-heart-fill",
                title: "Hassle-Free Travel",
                desc: "From visa assistance to airport transfers, we handle every detail so you can just enjoy.",
              },
            ].map((item) => (
              <div
                key={item.title}
                className="flex gap-4 p-4 bg-surface rounded-xl"
              >
                <div className="w-12 h-12 rounded-xl bg-red/10 text-red flex items-center justify-center flex-shrink-0">
                  <i className={`bi ${item.icon} text-xl`} />
                </div>
                <div>
                  <h3 className="font-semibold text-black mb-1">
                    {item.title}
                  </h3>
                  <p className="text-sm text-secondary">{item.desc}</p>
                </div>
              </div>
            ))}
          </div>

          <h2>Our Story</h2>
          <p>
            Founded with a passion for exploration and a commitment to
            exceptional service, {siteConfig?.site_name || "TravelXploria"} has
            grown from a small travel desk to a full-service travel company. We
            have helped thousands of travelers discover new destinations, create
            lasting memories, and experience the world in ways they never
            imagined.
          </p>
          <p>
            Whether you&apos;re planning a romantic honeymoon, a family
            vacation, an adventure trip, or a cultural exploration, our team of
            experienced travel consultants is here to turn your dream vacation
            into reality.
          </p>

          <h2>Get In Touch</h2>
          <p>
            Ready to start planning your next adventure? Contact us today and
            let our experts craft the perfect itinerary for you.
          </p>
          <div className="flex flex-wrap gap-4 not-prose">
            {siteConfig?.phone && (
              <a
                href={`tel:${siteConfig.phone}`}
                className="inline-flex items-center gap-2 bg-red text-white px-6 py-3 rounded-full font-medium hover:opacity-90 transition-opacity"
              >
                <i className="bi bi-telephone-fill" />
                {siteConfig.phone}
              </a>
            )}
            {siteConfig?.email && (
              <a
                href={`mailto:${siteConfig.email}`}
                className="inline-flex items-center gap-2 bg-black text-white px-6 py-3 rounded-full font-medium hover:opacity-90 transition-opacity"
              >
                <i className="bi bi-envelope-fill" />
                Email Us
              </a>
            )}
            {siteConfig?.whatsapp && (
              <a
                href={`https://wa.me/${siteConfig.whatsapp.replace(/\D/g, "")}`}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 bg-green text-black px-6 py-3 rounded-full font-medium hover:opacity-90 transition-opacity"
              >
                <i className="bi bi-whatsapp" />
                WhatsApp
              </a>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
