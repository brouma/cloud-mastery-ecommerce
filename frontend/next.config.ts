import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: "standalone",
  images: {
    domains: ["loremflickr.com", "placehold.co"],
  },
};

export default nextConfig;
