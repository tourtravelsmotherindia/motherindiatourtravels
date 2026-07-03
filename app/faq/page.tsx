import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Frequently Asked Questions",
  description: "Find answers to commonly asked questions about our travel packages, bookings, cancellations, and more.",
};

const faqs = [
  {
    q: "How do I book a tour package?",
    a: "You can book a tour package by contacting us via phone, WhatsApp, email, or by filling out the contact form on our website. Our travel experts will guide you through the booking process and help you choose the best package for your needs.",
  },
  {
    q: "What is included in the tour package price?",
    a: "Tour package inclusions vary by package. Typically, they include accommodation, meals (as specified), sightseeing, transfers, and guide services. Please refer to the specific package details for exact inclusions and exclusions.",
  },
  {
    q: "Can I customize a tour package?",
    a: "Absolutely! We specialize in customized travel experiences. You can modify the itinerary, add or remove destinations, upgrade hotels, or adjust the duration to match your preferences and budget.",
  },
  {
    q: "What is the cancellation policy?",
    a: "Our cancellation policy varies depending on the package and how far in advance you cancel. Generally, cancellations made 30+ days before departure receive a higher refund percentage. Please refer to our Cancellation Policy page for detailed terms.",
  },
  {
    q: "Do you provide visa assistance?",
    a: "Yes, we provide visa assistance and guidance for most international destinations. Our team can help you understand the visa requirements, prepare documentation, and guide you through the application process.",
  },
  {
    q: "Is travel insurance included?",
    a: "Travel insurance is typically not included in our standard packages, but we strongly recommend purchasing comprehensive travel insurance. We can assist you in obtaining suitable travel insurance for your trip.",
  },
  {
    q: "How do I make a payment?",
    a: "We accept payments via bank transfer, UPI, credit/debit cards, and select digital wallets. A deposit is required to confirm your booking, with the balance payable before departure as per the payment schedule.",
  },
  {
    q: "Can I change my travel dates after booking?",
    a: "Date changes are subject to availability and may incur modification fees. Contact us as early as possible if you need to change your travel dates, and we will do our best to accommodate your request.",
  },
  {
    q: "Do you offer group discounts?",
    a: "Yes! We offer special rates and discounts for group bookings. The discount amount depends on the group size and package. Contact us with your group size for a customized quote.",
  },
  {
    q: "What safety measures do you follow?",
    a: "We partner with trusted hotels, verified transport providers, and experienced local guides. We monitor travel advisories and maintain emergency contact lines for all our travelers throughout their journey.",
  },
];

export default function FaqPage() {
  return (
    <div>
      {/* Banner */}
      <section className="relative h-64 md:h-80 overflow-hidden bg-black">
        <div className="absolute inset-0 bg-gradient-to-r from-red to-yellow opacity-80" />
        <div className="absolute inset-0 flex items-center justify-center">
          <h1 className="text-4xl md:text-5xl font-bold text-white">FAQ</h1>
        </div>
      </section>

      <div className="max-w-3xl mx-auto px-4 py-16">
        <p className="text-center text-secondary mb-12">
          Find answers to the most commonly asked questions about our travel
          packages and services. Can&apos;t find what you&apos;re looking for?{" "}
          <a href="/contact" className="text-red hover:underline">
            Contact us
          </a>
          .
        </p>

        <div className="space-y-3">
          {faqs.map((faq, idx) => (
            <details
              key={idx}
              className="group border border-line rounded-xl overflow-hidden"
            >
              <summary className="flex items-center justify-between p-5 cursor-pointer hover:bg-surface transition-colors list-none">
                <span className="font-medium text-black pr-4">{faq.q}</span>
                <i className="bi bi-plus-lg text-secondary group-open:hidden flex-shrink-0" />
                <i className="bi bi-dash-lg text-secondary hidden group-open:block flex-shrink-0" />
              </summary>
              <div className="px-5 pb-5 text-secondary text-sm leading-relaxed">
                {faq.a}
              </div>
            </details>
          ))}
        </div>
      </div>
    </div>
  );
}
