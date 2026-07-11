/** @type {import('next').NextConfig} */
const nextConfig = {
  // Static export — outputs an out/ folder you can drop into any static file server
  // (cPanel, Apache, nginx, etc.). Pages are pre-rendered at build time.
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
    ],
    localPatterns: [
      {
        pathname: "/**",
      },
    ],
  },
  // Skip server-only features not needed for static export
  skipTrailingSlashRedirect: true,
  generateBuildId: async () => {
    return "mother-india-static";
  },
};

export default nextConfig;
