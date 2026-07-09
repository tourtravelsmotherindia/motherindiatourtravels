import { dirname } from "path";
import { fileURLToPath } from "url";

const __dirname = dirname(fileURLToPath(import.meta.url));

/** @type {import('next').NextConfig} */
const nextConfig = {
  // Static export — outputs an out/ folder you can drop into any static file server
  // (cPanel, Apache, nginx, etc.). Pages are pre-rendered at build time.
  output: "export",
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
};

export default nextConfig;
