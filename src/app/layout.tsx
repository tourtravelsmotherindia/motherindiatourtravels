import "./globals.css";

import type { Metadata, Viewport } from "next";
import { Poppins } from "next/font/google";
import localFont from "next/font/local";

import PopupModal from "@/components/layout/PopupModal";
import TranslationScript from "@/components/layout/TranslationScript";
import { ToastProvider } from "@/context/ToastContext";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { QueryProvider } from "@/lib/providers/QueryProvider";

const poppins = Poppins({
  variable: "--font-poppins",
  subsets: ["latin"],
  weight: ["300", "400", "500", "600", "700"],
  display: "swap",
});

const tripSans = localFont({
  src: [
    {
      path: "../../public/fonts/TripSans-Regular.woff2",
      weight: "400",
      style: "normal",
    },
    {
      path: "../../public/fonts/TripSans-Medium.woff2",
      weight: "500",
      style: "normal",
    },
    {
      path: "../../public/fonts/TripSans-Bold.woff2",
      weight: "700",
      style: "normal",
    },
    {
      path: "../../public/fonts/TripSans-VF.woff2",
      weight: "100 900",
      style: "normal",
    },
  ],
  variable: "--font-trip-sans",
  display: "swap",
});

export const viewport: Viewport = {
  width: "device-width",
  initialScale: 1,
  viewportFit: "cover",
};

export const metadata: Metadata = {
  metadataBase: new URL("https://motherindiatourtravels.com"),
  title: "Mother India Tour Travels | Escape the City, Find Your Peace",
  description:
    "Discover unforgettable adventures in India's most beautiful places. Custom guided tours, serene Kerala backwaters, desert safaris, and Himalayan heights.",
  alternates: {
    canonical: "/",
  },
  icons: {
    icon: [
      { url: "/favicon.ico", sizes: "32x32" },
      { url: "/icon-192.png", sizes: "192x192", type: "image/png" },
      { url: "/icon-512.png", sizes: "512x512", type: "image/png" },
      { url: "/favicon.svg", type: "image/svg+xml" },
    ],
    apple: [{ url: "/apple-touch-icon.png", sizes: "180x180", type: "image/png" }],
  },
};

export default async function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const companyData = await getCompanyData();
  const gtmId = companyData?.googleTagManager || "GTM-592ZJMN3";

  return (
    <html
      lang="en"
      data-scroll-behavior="smooth"
      style={{ backgroundColor: "#051b2e" }}
      className={`${poppins.variable} ${tripSans.variable} h-full antialiased`}
    >
      <head>
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <meta name="theme-color" content="#051b2e" />
        {/* Google Consent Mode Defaults */}
        <script
          dangerouslySetInnerHTML={{
            __html: `
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              
              var consentState = 'denied';
              var hasChoice = false;
              try {
                var localConsent = localStorage.getItem('cookies_accepted');
                if (localConsent === 'true') {
                  consentState = 'granted';
                  hasChoice = true;
                } else if (localConsent === 'false') {
                  consentState = 'denied';
                  hasChoice = true;
                }
              } catch (e) {}

              if (hasChoice) {
                gtag('consent', 'default', {
                  'ad_storage': consentState,
                  'ad_user_data': consentState,
                  'ad_personalization': consentState,
                  'analytics_storage': consentState
                });
              } else {
                // Default to granted globally to prevent measurement loss in non-EEA regions
                gtag('consent', 'default', {
                  'ad_storage': 'granted',
                  'ad_user_data': 'granted',
                  'ad_personalization': 'granted',
                  'analytics_storage': 'granted'
                });
                // Default to denied for EEA countries, UK, and Switzerland
                gtag('consent', 'default', {
                  'ad_storage': 'denied',
                  'ad_user_data': 'denied',
                  'ad_personalization': 'denied',
                  'analytics_storage': 'denied',
                  'region': ['AT', 'BE', 'BG', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FI', 'FR', 'DE', 'GR', 'HU', 'IE', 'IT', 'LV', 'LT', 'LU', 'MT', 'NL', 'PL', 'PT', 'RO', 'SK', 'SI', 'ES', 'SE', 'IS', 'LI', 'NO', 'GB', 'CH']
                });
              }
            `,
          }}
        />
        {/* Google Tag Manager */}
        <script
          dangerouslySetInnerHTML={{
            __html: `
              (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
              new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
              j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
              'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
              })(window,document,'script','dataLayer','${gtmId}');
            `,
          }}
        />
      </head>
      <body className="min-h-full flex flex-col" suppressHydrationWarning>
        {/* Google Tag Manager (noscript) */}
        <noscript>
          <iframe
            src={`https://www.googletagmanager.com/ns.html?id=${gtmId}`}
            height="0"
            width="0"
            style={{ display: "none", visibility: "hidden" }}
          />
        </noscript>
        <QueryProvider>
          <ToastProvider>
            {children}
            <PopupModal />
            <TranslationScript />
          </ToastProvider>
        </QueryProvider>
      </body>
    </html>
  );
}
