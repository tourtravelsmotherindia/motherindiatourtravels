import Image from "next/image";
import Link from "next/link";

import Footer from "@/components/Footer";
import Navbar from "@/components/Navbar";
import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getSiteConfig } from "@/lib/db/repositories/siteConfigRepo";

export default async function NotFound() {
  const [companyData, siteConfig] = await Promise.all([getCompanyData(), getSiteConfig()]);

  const defaultBg =
    "https://images.unsplash.com/photo-1506929562872-bb421503ef21?auto=format&fit=crop&w=1920&q=80";
  const bgImage = siteConfig?.custom_404_image_url || defaultBg;

  return (
    <div className="relative min-h-screen flex flex-col">
      <Navbar />

      <main className="flex-1 relative flex items-center justify-center min-h-screen z-10">
        {/* Background Image Container */}
        <div className="absolute inset-0 z-0 select-none">
          <Image
            src={bgImage}
            alt="Oops! You landed on a remote island..."
            fill
            priority
            sizes="100vw"
            className="object-cover object-center"
          />
          {/* Dark Overlay to make white outline text and text readable */}
          <div className="absolute inset-0 bg-black/35 backdrop-blur-[0.5px]" />
        </div>

        {/* Content Container */}
        <div className="relative z-10 layout-container flex flex-col items-center justify-center text-center text-white pt-36 pb-24 px-6">
          {/* Large Outline 404 Heading */}
          <h1
            className="font-display text-[9rem] sm:text-[13rem] md:text-[17rem] lg:text-[21rem] font-light leading-none tracking-widest select-none drop-shadow-lg"
            style={{
              WebkitTextStroke: "2.5px rgba(255, 255, 255, 0.95)",
              color: "transparent",
            }}
          >
            404
          </h1>

          {/* Headline */}
          <h2 className="font-sans text-2xl sm:text-3xl md:text-4xl lg:text-5xl font-bold tracking-tight max-w-4xl mt-6 mb-3 leading-tight drop-shadow-md">
            oops! it looks like you landed on a remote island...
          </h2>

          {/* Description */}
          <p className="font-sans text-sm sm:text-base md:text-lg lg:text-xl text-white/90 font-medium max-w-2xl mb-10 md:mb-14 leading-relaxed drop-shadow-sm">
            But don&apos;t worry! we will guide you to reach your destination
          </p>

          {/* Action CTAs */}
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4 sm:gap-6 w-full max-w-lg">
            <Link
              href="/"
              className="w-full sm:w-auto bg-brand hover:bg-brand-hover text-white font-semibold text-sm md:text-base px-8 py-3.5 rounded-full transition-all duration-300 shadow-premium hover:scale-105 active:scale-95 text-center cursor-pointer select-none whitespace-nowrap"
            >
              Return to home
            </Link>
            <Link
              href="/packages"
              className="w-full sm:w-auto border-2 border-white/80 text-white hover:bg-white hover:text-foreground font-semibold text-sm md:text-base px-8 py-3.5 rounded-full transition-all duration-300 hover:scale-105 active:scale-95 text-center cursor-pointer select-none whitespace-nowrap"
            >
              Explore Packages
            </Link>
          </div>
        </div>
      </main>

      <Footer companyData={companyData} />
    </div>
  );
}
