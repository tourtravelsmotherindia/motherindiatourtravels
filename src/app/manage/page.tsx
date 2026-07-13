"use client";

import {
  ArrowRight,
  ArrowUpRight,
  Clock,
  Compass,
  FileText,
  Loader2,
  Mail,
  Package,
  Receipt,
  TrendingUp,
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
import { getRecords } from "@/lib/adminApi";

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

  useEffect(() => {
    const loadDashboardData = async () => {
      try {
        setLoading(true);
        // Fetch counts from CRUD tables
        const [bookings, packages, blogs, contacts] = await Promise.all([
          getRecords<BookingItem>("bookings"),
          getRecords<unknown>("packages"),
          getRecords<unknown>("blog-posts"),
          getRecords<unknown>("contacts"),
        ]);

        const newBookingsCount = bookings.filter((b) => b.status === "NEW").length;

        setMetrics({
          bookingsCount: bookings.length,
          newBookings: newBookingsCount,
          packagesCount: packages.length,
          blogsCount: blogs.length,
          contactsCount: contacts.length,
        });

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
      </div>
    </div>
  );
}
