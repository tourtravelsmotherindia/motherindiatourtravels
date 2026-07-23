import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "All Tour Packages | Mother India Tour Travels",
  description:
    "Explore our wide range of domestic and international tour packages. Custom itineraries for Kerala, Kashmir, Rajasthan, Goa, Andaman, Dubai, and more.",
  alternates: {
    canonical: "/packages/",
  },
};

export default function PackagesLayout({ children }: { children: React.ReactNode }) {
  return <>{children}</>;
}
