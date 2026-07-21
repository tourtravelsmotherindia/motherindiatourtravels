import React from "react";

import PolicyLayout from "@/components/layout/PolicyLayout";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";

export const metadata = {
  title: "Cookie Policy | Mother India Tour Travels",
  description:
    "Read the Cookie Policy of Mother India Tour Travels. Learn how we use cookies, tracking pixels, and analytical tags to optimize your browsing experience.",
};

export default async function CookiePolicyPage() {
  const companyData = await getCompanyData();

  const sections = [
    {
      id: "what-are-cookies",
      title: "What are Cookies",
      content: (
        <>
          <p>
            Cookies are small text files containing numbers and letters that are downloaded and
            saved on your device (computer, smartphone, tablet) when you visit a website.
          </p>
          <p>
            Cookies help websites identify your browser, remember login states, save translation
            preferences, and analyze how visitors move through pages. They ensure website
            interactions are fast, secure, and personalized.
          </p>
        </>
      ),
    },
    {
      id: "how-we-use-them",
      title: "How we use Cookies",
      content: (
        <>
          <p>
            Mother India Tour Travels uses cookies, web beacons, and tracking scripts to make our
            website load faster, remember your regional details, and evaluate site metrics.
          </p>
          <p>Specifically, we use cookies to:</p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>Keep you logged in if you have access to admin dashboards.</li>
            <li>
              Maintain your selected language version across pages through our translation modules.
            </li>
            <li>Ensure our layout rendering performs smoothly on your screen size.</li>
            <li>
              Understand which holiday packages attract the most interest so we can optimize our
              offers.
            </li>
          </ul>
        </>
      ),
    },
    {
      id: "types-of-cookies",
      title: "Types of Cookies we use",
      content: (
        <>
          <p>The cookies active on our website are categorized as follows:</p>
          <ul className="list-disc pl-5 space-y-2.5 mt-2">
            <li>
              <strong>Strictly Necessary Cookies:</strong> These cookies are critical to run the
              basic operations of our site (e.g., page navigation, security filters, or forms).
              Without these cookies, parts of our travel agency portal would fail to function.
            </li>
            <li>
              <strong>Functionality Cookies:</strong> Used to recognize you when you return to our
              website. This lets us personalize our content for you and remember preferences like
              your language choices or consent options. For example, we set a cookie named{" "}
              <code>cookies_accepted</code> in your browser storage to avoid showing you the cookie
              consent popup on every visit once accepted.
            </li>
            <li>
              <strong>Performance & Analytical Cookies:</strong> These cookies collect anonymous
              data about how many users visit our site, which pages are opened most often, and if
              any loading errors occur. This details help us speed up our platform.
            </li>
          </ul>
        </>
      ),
    },
    {
      id: "managing-cookies",
      title: "Managing and Disabling Cookies",
      content: (
        <>
          <p>
            You have the right to accept or decline cookies. When you visit our website for the
            first time, a cookie consent banner will appear at the bottom right. You can choose to
            click &quot;Accept Cookies&quot; or &quot;Decline&quot;.
          </p>
          <p>
            In addition to our popup banner, you can control or block cookies through your browser
            settings:
          </p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>
              <strong>Google Chrome:</strong> Settings &gt; Privacy and Security &gt; Cookies and
              other site data.
            </li>
            <li>
              <strong>Mozilla Firefox:</strong> Options &gt; Privacy & Security &gt; Cookies and
              Site Data.
            </li>
            <li>
              <strong>Safari:</strong> Preferences &gt; Privacy &gt; Block all cookies.
            </li>
            <li>
              <strong>Microsoft Edge:</strong> Settings &gt; Site permissions &gt; Cookies and site
              data.
            </li>
          </ul>
          <p className="mt-4 text-xs md:text-sm text-neutral-500 italic">
            Please note: If you choose to completely block all cookies in your browser, some
            elements of our website (such as our multilingual translation widget or booking modules)
            may not function as intended.
          </p>
        </>
      ),
    },
    {
      id: "third-party-cookies",
      title: "Third-party Cookies",
      content: (
        <>
          <p>
            We integrate certain third-party plugins and analytics services on our website. These
            partners may place their own cookies on your devices when you browse our pages:
          </p>
          <ul className="list-disc pl-5 space-y-2 mt-2">
            <li>
              <strong>Google Analytics:</strong> We use Google Analytics (using tag ID{" "}
              <code>G-9R0JL5K333</code>) to monitor traffic statistics and device types. Google
              Analytics cookies trace user actions on our site but do not store identifiers like
              names or phone numbers.
            </li>
            <li>
              <strong>Google Tag Manager:</strong> Used to run scripting tags and analytics pixels
              (using container ID <code>GTM-W225BT8G</code>).
            </li>
            <li>
              <strong>Google Translate Widget:</strong> We run Google translation scripts to allow
              international clients to translate our packages. These scripts set cookies to remember
              your selected language settings.
            </li>
          </ul>
        </>
      ),
    },
    {
      id: "cookie-updates",
      title: "Changes to Cookie Policy",
      content: (
        <>
          <p>
            We may revise this Cookie Policy occasionally to reflect changes in our cookie
            implementations, operational updates, or legal amendments. We advise checking this page
            periodically to stay informed about how we use tracking technology.
          </p>
        </>
      ),
    },
    {
      id: "cookie-contact",
      title: "Contact Information",
      content: (
        <p>
          For questions about our Cookie Policy or how we use cookies, please feel free to{" "}
          <a
            href="/contact"
            className="text-neutral-900 font-bold underline hover:text-neutral-700 transition-colors"
          >
            contact us
          </a>{" "}
          directly or email us at{" "}
          <a
            href="mailto:tourtravelsmotherindia@gmail.com"
            className="text-neutral-900 font-bold underline hover:text-neutral-700 transition-colors"
          >
            tourtravelsmotherindia@gmail.com
          </a>
          .
        </p>
      ),
    },
  ];

  const introText =
    "At Mother India Tour Travels, we believe in being open and clear about how we handle your data. This Cookie Policy explains how cookies and similar tracking systems are used on our website and how you can manage your preferences.";

  return (
    <PolicyLayout
      title="Cookie Policy"
      lastUpdated="July 21st, 2026"
      introText={introText}
      sections={sections}
      companyData={companyData}
    />
  );
}
