/** @type {import('next').NextConfig} */

const nextConfig = {
  allowedDevOrigins: ["192.168.0.170"],

  // Static export
  output: process.env.NODE_ENV === "production" ? "export" : undefined,
  trailingSlash: true,

  images: {
    unoptimized: true,
    remotePatterns: [
      {
        protocol: "https",
        hostname: "images.unsplash.com",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "img.freepik.com",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "images.motherindiatourtravels.com",
        pathname: "/**",
      },
    ],
    localPatterns: [
      {
        pathname: "/**",
      },
    ],
  },

  skipTrailingSlashRedirect: true,

  generateBuildId: async () => {
    return "motherindiatourtravels-static";
  },
};

export default nextConfig;
