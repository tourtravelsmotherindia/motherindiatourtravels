import type { Metadata } from "next";
import Script from "next/script";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { getSiteConfig } from "@/lib/data";
import "./globals.css";

const siteConfig = getSiteConfig();

export const metadata: Metadata = {
  metadataBase: new URL(siteConfig?.base_url || "https://travelxploria.com"),
  title: {
    default: siteConfig?.site_name || "TravelXploria",
    template: `%s | ${siteConfig?.site_name || "TravelXploria"}`,
  },
  description:
    siteConfig?.tagline ||
    "Discover curated travel packages across the world's most beautiful destinations",
  icons: {
    icon: "/favicon.ico",
  },
  verification: {
    google: siteConfig?.google_verification || "",
  },
  openGraph: {
    type: "website",
    siteName: siteConfig?.site_name || "TravelXploria",
    title: siteConfig?.site_name || "TravelXploria",
    description:
      siteConfig?.tagline ||
      "Discover curated travel packages across the world's most beautiful destinations",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const gtmId = siteConfig?.gtm_id || "";
  const clarityId = siteConfig?.clarity_id || "";

  return (
    <html lang="en">
      <head>
        {/* Bootstrap Icons CDN */}
        <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
        />
      </head>
      <body className="min-h-screen bg-white antialiased">
        {/* Google Tag Manager (noscript) */}
        {gtmId && (
          <noscript>
            <iframe
              src={`https://www.googletagmanager.com/ns.html?id=${gtmId}`}
              height="0"
              width="0"
              style={{ display: "none", visibility: "hidden" }}
            />
          </noscript>
        )}

        {/* Google Tag Manager (script) */}
        {gtmId && (
          <Script
            id="gtm-script"
            strategy="afterInteractive"
            dangerouslySetInnerHTML={{
              __html: `(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','${gtmId}');`,
            }}
          />
        )}

        {/* Microsoft Clarity */}
        {clarityId && (
          <Script
            id="clarity-script"
            strategy="afterInteractive"
            dangerouslySetInnerHTML={{
              __html: `(function(c,l,a,r,i,t,y){c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);})(window,document,"clarity","script","${clarityId}");`,
            }}
          />
        )}

        <Header />
        <main className="min-h-screen">{children}</main>
        <Footer />

        {/* Mobile menu and navigation scripts handled by client components */}
      </body>
    </html>
  );
}
