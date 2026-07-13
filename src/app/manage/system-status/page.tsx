import React from "react";

import SystemStatusDashboard from "@/components/manage/SystemStatusDashboard";

export const metadata = {
  title: "System Status & Diagnostics | Mother India Admin",
  description: "Browse logs and health metrics for the Mother India Tour Travels platform.",
};

export default function SystemStatusPage() {
  return <SystemStatusDashboard />;
}
