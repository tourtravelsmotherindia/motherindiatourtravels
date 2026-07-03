/** @type {import('next').NextConfig} */
const isBuild = process.env.NEXT_PHASE === "phase-production-build";

const nextConfig = {
  // Static export only during production build; dev uses server rendering
  ...(isBuild ? { output: "export" } : {}),
  images: {
    unoptimized: true,
    remotePatterns: [
      {
        protocol: "https",
        hostname: "travelxploria.com",
        pathname: "/uploads_media/**",
      },
    ],
  },
  eslint: {
    ignoreDuringBuilds: true,
  },
};

export default nextConfig;
