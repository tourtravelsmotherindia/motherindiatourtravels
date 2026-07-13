"use client";

import {
  AlertTriangle,
  ArrowRight,
  ArrowUpRight,
  CheckCircle2,
  Clock,
  Compass,
  Database,
  FileText,
  Globe,
  HardDrive,
  Loader2,
  Mail,
  Network,
  Package,
  Receipt,
  RefreshCw,
  TrendingUp,
  XCircle,
} from "lucide-react";

interface BookingItem {
  id: string;
  name: string;
  email: string;
  phone: string;
  createdAt: string;
  status: string;
  numberOfPeople?: number;
  adults: number;
  children: number;
  infants: number;
  rooms: number;
}
import Link from "next/link";
import React, { useEffect, useState } from "react";

import { useToast } from "@/context/ToastContext";
import { adminPost, getRecord, getRecords } from "@/lib/adminApi";
import type { SystemStatus } from "@/types/system-status";

interface MetricCardProps {
  title: string;
  value: string | number;
  change?: string;
  icon: React.ReactNode;
  bgIconColor: string;
  textColor: string;
}

function MetricCard({ title, value, change, icon, bgIconColor, textColor }: MetricCardProps) {
  return (
    <div className="bg-white rounded-[2rem] border border-border-light p-6">
      <div className="flex items-start justify-between">
        <div className="space-y-3">
          <p className="text-xs font-semibold text-neutral-400 uppercase tracking-wider">{title}</p>
          <h3 className="text-2xl md:text-3xl font-display font-bold text-foreground leading-none">
            {value}
          </h3>
          {change && (
            <div className="flex items-center gap-1.5 text-xs text-emerald-600 font-semibold bg-emerald-50 px-2.5 py-0.5 rounded-full w-fit">
              <TrendingUp className="w-3.5 h-3.5" />
              <span>{change}</span>
            </div>
          )}
        </div>
        <div
          className={`w-12 h-12 rounded-full ${bgIconColor} ${textColor} flex items-center justify-center border border-current/10 flex-shrink-0`}
        >
          {icon}
        </div>
      </div>
    </div>
  );
}

export default function DashboardOverview() {
  const { showToast } = useToast();
  const [metrics, setMetrics] = useState({
    bookingsCount: 0,
    newBookings: 0,
    packagesCount: 0,
    blogsCount: 0,
    contactsCount: 0,
  });
  const [recentBookings, setRecentBookings] = useState<BookingItem[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [systemStatus, setSystemStatus] = useState<SystemStatus | null>(null);
  const [pinging, setPinging] = useState<boolean>(false);

  useEffect(() => {
    const loadDashboardData = async () => {
      try {
        setLoading(true);
        // Fetch counts and system status
        const [bookings, packages, blogs, contacts, statusRecord] = await Promise.all([
          getRecords<BookingItem>("bookings"),
          getRecords<unknown>("packages"),
          getRecords<unknown>("blog-posts"),
          getRecords<unknown>("contacts"),
          getRecord<SystemStatus>("system-status", "singleton").catch((e) => {
            console.error("Failed to fetch system status:", e);
            return null;
          }),
        ]);

        const newBookingsCount = bookings.filter((b) => b.status === "NEW").length;

        setMetrics({
          bookingsCount: bookings.length,
          newBookings: newBookingsCount,
          packagesCount: packages.length,
          blogsCount: blogs.length,
          contactsCount: contacts.length,
        });

        setSystemStatus(statusRecord);

        // Set top 5 recent bookings
        const sorted = [...bookings].sort(
          (a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime(),
        );
        setRecentBookings(sorted.slice(0, 5));
      } catch (err: unknown) {
        console.error("Dashboard metrics load failed:", err);
        const errorMessage =
          err instanceof Error ? err.message : "Failed to load dashboard metrics";
        showToast("error", "Dashboard Metrics", errorMessage);
      } finally {
        setLoading(false);
      }
    };

    loadDashboardData();
  }, [showToast]);

  const handleManualPing = async () => {
    try {
      setPinging(true);
      const response = await adminPost<{ success: boolean; data: SystemStatus; error?: string }>(
        "/admin/system-status/ping",
        {},
      );
      if (response && response.success) {
        showToast("success", "System Diagnostic", "Uptime status updated successfully!");
        setSystemStatus(response.data);
      } else {
        throw new Error(response?.error || "Diagnostics failed");
      }
    } catch (err: unknown) {
      console.error("Diagnostic check failed:", err);
      const errMsg = err instanceof Error ? err.message : "Failed to trigger system status check.";
      showToast("error", "System Diagnostic", errMsg);
    } finally {
      setPinging(false);
    }
  };

  const getGreeting = () => {
    const hour = new Date().getHours();
    if (hour < 12) return "Good Morning!";
    if (hour < 17) return "Good Afternoon!";
    if (hour < 22) return "Good Evening!";
    return "Good Night!";
  };

  const quickShortcuts = [
    {
      title: "Add Tour Package",
      desc: "Create a new travel itinerary package listings",
      href: "/manage/packages/?action=new",
      icon: <Package className="w-5 h-5" />,
      color: "bg-brand text-white",
    },
    {
      title: "Review Booking Inquiries",
      desc: "Review guest travel requests and change status",
      href: "/manage/bookings/",
      icon: <Receipt className="w-5 h-5" />,
      color: "bg-amber-500 text-white",
    },
    {
      title: "Write Blog Article",
      desc: "Publish travel stories, articles and guides",
      href: "/manage/blog-posts/?action=new",
      icon: <FileText className="w-5 h-5" />,
      color: "bg-emerald-500 text-white",
    },
    {
      title: "Manage Destinations",
      desc: "Configure featured cities, regions and attractions",
      href: "/manage/destinations/",
      icon: <Compass className="w-5 h-5" />,
      color: "bg-blue-500 text-white",
    },
  ];

  return (
    <div className="space-y-8 animate-in fade-in duration-300">
      {/* Greetings Heading */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <h2 className="text-xl md:text-2xl font-bold font-display text-foreground">
            {getGreeting()}
          </h2>
          <p className="text-sm text-neutral-500 font-medium mt-1">
            Here&apos;s a snapshot of what&apos;s happening with the travel portal today.
          </p>
        </div>
        <div className="flex items-center gap-2.5 text-xs text-neutral-500 bg-white border border-border-light rounded-full px-4 py-2 font-medium">
          <Clock className="w-4 h-4 text-neutral-400" />
          <span>
            Last updated:{" "}
            {new Date().toLocaleDateString("en-IN", {
              day: "numeric",
              month: "short",
              year: "numeric",
            })}
          </span>
        </div>
      </div>

      {/* Metrics Row */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <MetricCard
          title="Total Bookings"
          value={loading ? "..." : metrics.bookingsCount}
          change={metrics.newBookings > 0 ? `${metrics.newBookings} new inquiries` : undefined}
          icon={<Receipt className="w-5 h-5" />}
          bgIconColor="bg-brand-light"
          textColor="text-brand"
        />
        <MetricCard
          title="Tour Packages"
          value={loading ? "..." : metrics.packagesCount}
          icon={<Package className="w-5 h-5" />}
          bgIconColor="bg-amber-50"
          textColor="text-amber-600"
        />
        <MetricCard
          title="Articles & Blogs"
          value={loading ? "..." : metrics.blogsCount}
          icon={<FileText className="w-5 h-5" />}
          bgIconColor="bg-emerald-50"
          textColor="text-emerald-600"
        />
        <MetricCard
          title="Contact Forms"
          value={loading ? "..." : metrics.contactsCount}
          icon={<Mail className="w-5 h-5" />}
          bgIconColor="bg-blue-50"
          textColor="text-blue-600"
        />
      </div>

      <div className="grid grid-cols-1 xl:grid-cols-3 gap-8">
        {/* Recent Bookings Table List */}
        <div className="xl:col-span-2 bg-white rounded-[2rem] border border-border-light p-6 md:p-8">
          <div className="flex items-center justify-between mb-6">
            <div>
              <h3 className="text-base font-bold font-display text-foreground">Recent Inquiries</h3>
              <p className="text-xs text-neutral-400 mt-0.5">
                List of the last 5 booking inquiries received.
              </p>
            </div>
            <Link
              href="/manage/bookings/"
              className="inline-flex items-center gap-1 text-xs font-semibold text-brand hover:text-brand-hover"
            >
              <span>View All</span>
              <ArrowRight className="w-3.5 h-3.5" />
            </Link>
          </div>

          <div className="overflow-x-auto no-scrollbar">
            {loading ? (
              <div className="py-12 flex justify-center">
                <Loader2 className="w-6 h-6 text-brand animate-spin" />
              </div>
            ) : recentBookings.length === 0 ? (
              <div className="py-12 text-center text-xs text-neutral-400 font-medium italic">
                No bookings found yet.
              </div>
            ) : (
              <table className="w-full text-left border-collapse text-xs">
                <thead>
                  <tr className="border-b border-border-light text-neutral-400 font-semibold">
                    <th className="pb-3 pr-4 font-semibold uppercase tracking-wider">Guest Name</th>
                    <th className="pb-3 px-4 font-semibold uppercase tracking-wider">Date</th>
                    <th className="pb-3 px-4 font-semibold uppercase tracking-wider">People</th>
                    <th className="pb-3 px-4 font-semibold uppercase tracking-wider">Rooms</th>
                    <th className="pb-3 px-4 font-semibold uppercase tracking-wider text-center">
                      Status
                    </th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-border-light">
                  {recentBookings.map((b) => (
                    <tr key={b.id} className="group hover:bg-neutral-50/50 transition-colors">
                      <td className="py-3.5 pr-4 font-semibold text-neutral-800">
                        <div>
                          <p>{b.name}</p>
                          <p className="text-[10px] text-neutral-400 font-normal mt-0.5">
                            {b.email}
                          </p>
                        </div>
                      </td>
                      <td className="py-3.5 px-4 text-neutral-500 font-medium">
                        {new Date(b.createdAt).toLocaleDateString("en-IN", {
                          day: "2-digit",
                          month: "short",
                          year: "2-digit",
                        })}
                      </td>
                      <td className="py-3.5 px-4 text-neutral-500 font-bold">
                        {b.numberOfPeople || b.adults + b.children + b.infants}
                      </td>
                      <td className="py-3.5 px-4 text-neutral-500 font-medium">
                        {b.rooms} Room(s)
                      </td>
                      <td className="py-3.5 px-4 text-center">
                        <span
                          className={`inline-flex px-3 py-1 text-[10px] font-bold rounded-full ${
                            b.status === "NEW"
                              ? "bg-brand-light text-brand border border-brand/10 animate-pulse"
                              : b.status === "READ"
                                ? "bg-neutral-100 text-neutral-600 border border-neutral-200"
                                : b.status === "CONTACTED"
                                  ? "bg-blue-50 text-blue-600 border border-blue-100"
                                  : "bg-emerald-50 text-emerald-600 border border-emerald-100"
                          }`}
                        >
                          {b.status}
                        </span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
          </div>
        </div>

        {/* Actions & System Column */}
        <div className="space-y-8">
          {/* Quick Shortcuts */}
          <div className="bg-white rounded-[2rem] border border-border-light p-6 md:p-8">
            <h3 className="text-base font-bold font-display text-foreground mb-6">Quick Actions</h3>
            <div className="space-y-4">
              {quickShortcuts.map((sc, idx) => (
                <Link
                  key={idx}
                  href={sc.href}
                  className="flex items-center gap-4 p-3 rounded-[1.5rem] border border-border-light hover:border-brand hover:bg-brand-light/30 transition-all duration-200 group"
                >
                  <div
                    className={`w-10 h-10 rounded-full flex items-center justify-center flex-shrink-0 ${sc.color}`}
                  >
                    {sc.icon}
                  </div>
                  <div className="flex-1 min-w-0">
                    <h4 className="text-xs font-bold text-neutral-800 group-hover:text-brand transition-colors">
                      {sc.title}
                    </h4>
                    <p className="text-[10px] text-neutral-400 mt-0.5 font-medium truncate">
                      {sc.desc}
                    </p>
                  </div>
                  <ArrowUpRight className="w-4 h-4 text-neutral-300 group-hover:text-brand transition-colors mr-1" />
                </Link>
              ))}
            </div>
          </div>

          {/* System Status & Uptime Monitoring */}
          <div className="bg-white rounded-[2rem] border border-border-light p-6 md:p-8 space-y-6">
            <div className="flex items-center justify-between">
              <div>
                <h3 className="text-base font-bold font-display text-foreground">System Health</h3>
                <p className="text-xs text-neutral-400 mt-0.5 font-medium">Real-time diagnostics</p>
              </div>
              <button
                onClick={handleManualPing}
                disabled={pinging || loading}
                className="p-2 rounded-full border border-border-light text-neutral-500 hover:text-brand hover:border-brand hover:bg-brand-light/30 transition-all duration-200 disabled:opacity-50 cursor-pointer"
                title="Run diagnostic check"
              >
                <RefreshCw className={`w-4 h-4 ${pinging ? "animate-spin text-brand" : ""}`} />
              </button>
            </div>

            {loading ? (
              <div className="py-6 flex justify-center">
                <Loader2 className="w-5 h-5 text-brand animate-spin" />
              </div>
            ) : !systemStatus ? (
              <div className="py-4 text-center text-xs text-neutral-400 font-medium italic border border-dashed border-border-light rounded-[1.5rem]">
                No status data available. Click reload to check.
              </div>
            ) : (
              <div className="space-y-5">
                {/* Overall Banner */}
                <div
                  className={`flex items-center gap-3 p-4 rounded-[1.5rem] border ${
                    systemStatus.status === "healthy"
                      ? "bg-emerald-50 text-emerald-800 border-emerald-100/50"
                      : systemStatus.status === "degraded"
                        ? "bg-amber-50 text-amber-800 border-amber-100/50"
                        : "bg-red-50 text-red-800 border-red-100/50"
                  }`}
                >
                  {systemStatus.status === "healthy" ? (
                    <CheckCircle2 className="w-5 h-5 text-emerald-600 flex-shrink-0" />
                  ) : systemStatus.status === "degraded" ? (
                    <AlertTriangle className="w-5 h-5 text-amber-600 flex-shrink-0" />
                  ) : (
                    <XCircle className="w-5 h-5 text-red-600 flex-shrink-0" />
                  )}
                  <div className="text-xs font-semibold">
                    <p className="font-bold">
                      {systemStatus.status === "healthy"
                        ? "All Systems Operational"
                        : systemStatus.status === "degraded"
                          ? "Performance Degraded"
                          : "Service Outage Detected"}
                    </p>
                    <p className="text-[9px] opacity-80 mt-0.5 font-normal">
                      Sync agent: {systemStatus.metadata?.updatedBy || "system-cron"}
                    </p>
                  </div>
                </div>

                {/* Individual Services */}
                <div className="space-y-3">
                  {[
                    {
                      name: "Supabase Postgres DB",
                      status: systemStatus.dbStatus,
                      latency: systemStatus.metadata?.dbPingTimeMs,
                      icon: <Database className="w-4 h-4" />,
                    },
                    {
                      name: "Public Static Website",
                      status: systemStatus.websiteStatus,
                      latency: systemStatus.metadata?.websitePingTimeMs,
                      icon: <Globe className="w-4 h-4" />,
                    },
                    {
                      name: "Cloudflare API Worker",
                      status: systemStatus.apiStatus,
                      latency: systemStatus.metadata?.apiPingTimeMs,
                      icon: <Network className="w-4 h-4" />,
                    },
                    {
                      name: "Cloudflare Images Worker",
                      status: systemStatus.imagesStatus,
                      latency: systemStatus.metadata?.imagesPingTimeMs,
                      icon: <HardDrive className="w-4 h-4" />,
                    },
                  ].map((service, idx) => (
                    <div
                      key={idx}
                      className="flex items-center justify-between p-3 rounded-[1.2rem] border border-border-light hover:bg-neutral-50/50 transition-all text-xs font-medium"
                    >
                      <div className="flex items-center gap-3">
                        <div className="text-neutral-400">{service.icon}</div>
                        <span className="text-neutral-700 font-semibold">{service.name}</span>
                      </div>
                      <div className="flex items-center gap-2">
                        {service.latency !== undefined && service.status === "up" && (
                          <span className="text-[10px] text-neutral-400">{service.latency}ms</span>
                        )}
                        <span
                          className={`inline-flex px-2 py-0.5 text-[9px] font-bold rounded-full border ${
                            service.status === "up"
                              ? "bg-emerald-50 text-emerald-600 border-emerald-100"
                              : "bg-red-50 text-red-600 border-red-100"
                          }`}
                        >
                          {service.status === "up" ? "Online" : "Offline"}
                        </span>
                      </div>
                    </div>
                  ))}
                </div>

                {/* Footer Sync Time */}
                <div className="flex items-center justify-between text-[9px] text-neutral-400 font-semibold pt-2 border-t border-border-light">
                  <span className="flex items-center gap-1">
                    <Clock className="w-3.5 h-3.5" />
                    Last diagnostic:
                  </span>
                  <span>
                    {new Date(systemStatus.lastPing).toLocaleTimeString("en-IN", {
                      hour: "2-digit",
                      minute: "2-digit",
                      second: "2-digit",
                    })}
                  </span>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
