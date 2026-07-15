import React from "react";

import DeployDashboard from "@/components/manage/DeployDashboard";

export const metadata = {
  title: "Deployments | Mother India Admin",
  description: "Trigger and monitor static deployments to cPanel or Cloudflare Pages.",
};

export default function DeployPage() {
  return <DeployDashboard />;
}
