import { Metadata } from "next";
import { getSiteConfig } from "@/lib/data";

const siteConfig = getSiteConfig();
const siteName = siteConfig?.site_name || "TravelXploria";

export const metadata: Metadata = {
  title: "Privacy Policy",
  description: `Read ${siteName}'s privacy policy to understand how we collect, use, and protect your personal information.`,
};

export default function PrivacyPolicyPage() {
  return (
    <div>
      <section className="relative h-64 md:h-80 overflow-hidden bg-black">
        <div className="absolute inset-0 bg-gradient-to-r from-red to-yellow opacity-80" />
        <div className="absolute inset-0 flex items-center justify-center">
          <h1 className="text-4xl md:text-5xl font-bold text-white">
            Privacy Policy
          </h1>
        </div>
      </section>

      <div className="max-w-4xl mx-auto px-4 py-16">
        <div className="prose prose-lg max-w-none">
          <p className="lead">
            At {siteName}, we take your privacy seriously. This Privacy Policy
            explains how we collect, use, disclose, and safeguard your
            information when you visit our website or use our services.
          </p>

          <h2>1. Information We Collect</h2>
          <p>
            We may collect personal information that you voluntarily provide when
            you:
          </p>
          <ul>
            <li>Fill out our contact or enquiry form</li>
            <li>Book a travel package</li>
            <li>Subscribe to our newsletter</li>
            <li>Contact us via phone, email, or WhatsApp</li>
          </ul>
          <p>
            This information may include your name, email address, phone number,
            travel preferences, and payment details.
          </p>

          <h2>2. How We Use Your Information</h2>
          <p>We use the information we collect to:</p>
          <ul>
            <li>Process and manage your travel bookings</li>
            <li>Respond to your enquiries and provide customer support</li>
            <li>Send you relevant travel offers and updates (with your consent)</li>
            <li>Improve our website and services</li>
            <li>Comply with legal obligations</li>
          </ul>

          <h2>3. Information Sharing</h2>
          <p>
            We do not sell, trade, or rent your personal information to third
            parties. We may share your information with:
          </p>
          <ul>
            <li>Travel partners (hotels, airlines, local operators) necessary to fulfil your booking</li>
            <li>Payment processors for secure transaction handling</li>
            <li>Legal authorities when required by law</li>
          </ul>

          <h2>4. Data Security</h2>
          <p>
            We implement appropriate technical and organizational measures to
            protect your personal information against unauthorized access,
            alteration, disclosure, or destruction.
          </p>

          <h2>5. Cookies</h2>
          <p>
            Our website uses cookies to enhance your browsing experience. You can
            control cookie settings through your browser preferences. Essential
            cookies are required for the website to function properly.
          </p>

          <h2>6. Third-Party Links</h2>
          <p>
            Our website may contain links to third-party websites. We are not
            responsible for the privacy practices of these external sites. We
            encourage you to review their privacy policies.
          </p>

          <h2>7. Your Rights</h2>
          <p>You have the right to:</p>
          <ul>
            <li>Access the personal data we hold about you</li>
            <li>Request correction of inaccurate data</li>
            <li>Request deletion of your data</li>
            <li>Withdraw consent for marketing communications</li>
          </ul>

          <h2>8. Contact Us</h2>
          <p>
            If you have any questions about this Privacy Policy, please contact
            us at:
          </p>
          <ul>
            {siteConfig?.email && <li>Email: {siteConfig.email}</li>}
            {siteConfig?.phone && <li>Phone: {siteConfig.phone}</li>}
          </ul>

          <p className="text-sm text-secondary2 mt-8">
            Last updated: January 2025
          </p>
        </div>
      </div>
    </div>
  );
}
