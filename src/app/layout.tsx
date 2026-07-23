import "./globals.css";

import type { Metadata } from "next";
import { Poppins } from "next/font/google";
import localFont from "next/font/local";

import PopupModal from "@/components/layout/PopupModal";
import TranslationScript from "@/components/layout/TranslationScript";
import { ToastProvider } from "@/context/ToastContext";
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

export const metadata: Metadata = {
  metadataBase: new URL("https://www.motherindiatourtravels.com"),
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

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      data-scroll-behavior="smooth"
      className={`${poppins.variable} ${tripSans.variable} h-full antialiased`}
    >
      <body className="min-h-full flex flex-col" suppressHydrationWarning>
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
