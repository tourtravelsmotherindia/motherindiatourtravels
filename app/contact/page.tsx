import { Metadata } from "next";
import { getSiteConfig } from "@/lib/data";
import ContactForm from "@/components/ContactForm";

const siteConfig = getSiteConfig();

export const metadata: Metadata = {
  title: "Contact Us",
  description: `Get in touch with ${siteConfig?.site_name || "TravelXploria"} for customized travel packages, queries, and bookings.`,
};

export default function ContactPage() {
  return (
    <div>
      {/* Banner */}
      <section className="relative h-64 md:h-80 overflow-hidden bg-black">
        <div className="absolute inset-0 bg-gradient-to-r from-red to-yellow opacity-80" />
        <div className="absolute inset-0 flex items-center justify-center">
          <h1 className="text-4xl md:text-5xl font-bold text-white">
            Contact Us
          </h1>
        </div>
      </section>

      <div className="max-w-7xl mx-auto px-4 py-16">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
          {/* Contact Form */}
          <div>
            <h2 className="text-2xl font-bold text-black mb-6">
              Send Us a Message
            </h2>
            <ContactForm />
          </div>

          {/* Contact Info */}
          <div>
            <h2 className="text-2xl font-bold text-black mb-6">
              Get In Touch
            </h2>
            <div className="space-y-6">
              {siteConfig?.phone && (
                <div className="flex items-start gap-4 p-4 bg-surface rounded-xl">
                  <div className="w-12 h-12 rounded-xl bg-red/10 text-red flex items-center justify-center flex-shrink-0">
                    <i className="bi bi-telephone-fill text-xl" />
                  </div>
                  <div>
                    <h3 className="font-semibold text-black">Phone</h3>
                    <a
                      href={`tel:${siteConfig.phone}`}
                      className="text-secondary hover:text-red transition-colors"
                    >
                      {siteConfig.phone}
                    </a>
                  </div>
                </div>
              )}

              {siteConfig?.email && (
                <div className="flex items-start gap-4 p-4 bg-surface rounded-xl">
                  <div className="w-12 h-12 rounded-xl bg-green/20 text-green flex items-center justify-center flex-shrink-0">
                    <i className="bi bi-envelope-fill text-xl" />
                  </div>
                  <div>
                    <h3 className="font-semibold text-black">Email</h3>
                    <a
                      href={`mailto:${siteConfig.email}`}
                      className="text-secondary hover:text-red transition-colors"
                    >
                      {siteConfig.email}
                    </a>
                  </div>
                </div>
              )}

              {siteConfig?.whatsapp && (
                <div className="flex items-start gap-4 p-4 bg-surface rounded-xl">
                  <div className="w-12 h-12 rounded-xl bg-green/30 text-green flex items-center justify-center flex-shrink-0">
                    <i className="bi bi-whatsapp text-xl" />
                  </div>
                  <div>
                    <h3 className="font-semibold text-black">WhatsApp</h3>
                    <a
                      href={`https://wa.me/${siteConfig.whatsapp.replace(/\D/g, "")}`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-secondary hover:text-red transition-colors"
                    >
                      {siteConfig.whatsapp}
                    </a>
                  </div>
                </div>
              )}

              {siteConfig?.facebook && (
                <div className="flex items-start gap-4 p-4 bg-surface rounded-xl">
                  <div className="w-12 h-12 rounded-xl bg-blue-t/20 text-blue-t flex items-center justify-center flex-shrink-0">
                    <i className="bi bi-facebook text-xl" />
                  </div>
                  <div>
                    <h3 className="font-semibold text-black">Facebook</h3>
                    <a
                      href={siteConfig.facebook}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-secondary hover:text-red transition-colors"
                    >
                      Follow Us
                    </a>
                  </div>
                </div>
              )}

              {siteConfig?.instagram && (
                <div className="flex items-start gap-4 p-4 bg-surface rounded-xl">
                  <div className="w-12 h-12 rounded-xl bg-pink/20 text-pink flex items-center justify-center flex-shrink-0">
                    <i className="bi bi-instagram text-xl" />
                  </div>
                  <div>
                    <h3 className="font-semibold text-black">Instagram</h3>
                    <a
                      href={siteConfig.instagram}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-secondary hover:text-red transition-colors"
                    >
                      Follow Us
                    </a>
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
