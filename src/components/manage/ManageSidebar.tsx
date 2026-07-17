"use client";

import {
  Building,
  CalendarRange,
  Camera,
  CloudLightning,
  Compass,
  FileText,
  Folder,
  Globe,
  Grid,
  HelpCircle,
  Home,
  Image as ImageIcon,
  Layers,
  LayoutTemplate,
  LogOut,
  Mail,
  MailCheck,
  Map,
  MapPin,
  MapPinned,
  MessageSquare,
  Network,
  Package,
  Receipt,
  Shuffle,
  Sliders,
  Tag,
  Users,
  X,
} from "lucide-react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import React from "react";

import { logout } from "@/lib/adminApi";
import { ADMIN_SIDEBAR_GROUPS, ADMIN_TABLES } from "@/lib/adminSchema";

export const IconMap: Record<string, React.ComponentType<{ className?: string }>> = {
  Globe,
  Map,
  MapPin,
  Compass,
  Tag,
  Package,
  Layers,
  CalendarRange,
  Sliders,
  Image: ImageIcon,
  LayoutTemplate,
  HelpCircle,
  Camera,
  Folder,
  FileText,
  Receipt,
  Mail,
  MailCheck,
  MessageSquare,
  Users,
  Building,
  Shuffle,
  Network,
  Grid,
  MapPinned,
};

interface ManageSidebarProps {
  isMobileOpen?: boolean;
  onCloseMobile?: () => void;
}

export default function ManageSidebar({ isMobileOpen, onCloseMobile }: ManageSidebarProps) {
  const pathname = usePathname();
  const email =
    typeof window !== "undefined"
      ? localStorage.getItem("admin_email") || "Admin User"
      : "Admin User";

  const renderNavItems = () => {
    return ADMIN_SIDEBAR_GROUPS.map((group) => (
      <div key={group.name} className="mb-6">
        <h3 className="px-4 text-xs font-bold text-neutral-600 uppercase tracking-wider mb-2">
          {group.name}
        </h3>
        <ul className="space-y-1">
          {group.items.map((slug) => {
            const table = ADMIN_TABLES[slug];
            if (!table) return null;

            const Icon = IconMap[table.icon] || Compass;
            const targetPath = `/manage/${slug}/`;
            const isActive = pathname === targetPath || pathname.startsWith(targetPath);

            return (
              <li key={slug}>
                <Link
                  href={targetPath}
                  onClick={onCloseMobile}
                  className={`flex items-center gap-3 px-4 py-2 text-sm font-semibold rounded-full transition-all duration-200 ${
                    isActive
                      ? "bg-brand text-white shadow-premium"
                      : "text-neutral-400 hover:bg-neutral-900/50 hover:text-white"
                  }`}
                >
                  <Icon
                    className={`w-4 h-4 ${isActive ? "text-white" : "text-neutral-500 group-hover:text-white"}`}
                  />
                  <span>{table.label}</span>
                </Link>
              </li>
            );
          })}
        </ul>
      </div>
    ));
  };

  const sidebarContent = (
    <div className="flex flex-col h-full bg-black border-r border-neutral-900">
      {/* Brand Header */}
      <div className="px-5 py-5 border-b border-neutral-900">
        <Link href="/manage/" className="flex items-center gap-3 select-none">
          <img
            src="/logo.png?v=234567"
            alt="Mother India Tour Travels Logo"
            className="w-9 h-9 object-contain shrink-0"
          />
          <div className="flex flex-col min-w-0">
            <span className="block font-display text-xs lg:text-sm font-bold tracking-[0.18em] uppercase leading-none text-white">
              Mother India
            </span>
            <span className="block font-sans text-[8px] lg:text-[9px] font-semibold tracking-[0.25em] uppercase leading-none mt-1 text-neutral-500">
              Tour Travels
            </span>
          </div>
        </Link>
      </div>

      {/* Navigation Items */}
      <nav className="flex-1 overflow-y-auto p-4 dropdown-scrollbar space-y-1">
        {/* Dashboard Home Shortcut */}
        <div className="mb-6">
          <ul className="space-y-1">
            <li>
              <Link
                href="/manage/"
                onClick={onCloseMobile}
                className={`flex items-center gap-3 px-4 py-2.5 text-sm font-semibold rounded-full transition-all duration-200 ${
                  pathname === "/manage" || pathname === "/manage/"
                    ? "bg-brand text-white shadow-premium"
                    : "text-neutral-400 hover:bg-neutral-900/50 hover:text-white"
                }`}
              >
                <Home className="w-4.5 h-4.5" />
                <span>Dashboard Overview</span>
              </Link>
            </li>
            <li>
              <Link
                href="/manage/deploy/"
                onClick={onCloseMobile}
                className={`flex items-center gap-3 px-4 py-2.5 text-sm font-semibold rounded-full transition-all duration-200 ${
                  pathname === "/manage/deploy" || pathname === "/manage/deploy/"
                    ? "bg-brand text-white shadow-premium"
                    : "text-neutral-400 hover:bg-neutral-900/50 hover:text-white"
                }`}
              >
                <CloudLightning className="w-4.5 h-4.5" />
                <span>Deployment</span>
              </Link>
            </li>
          </ul>
        </div>

        {renderNavItems()}
      </nav>

      {/* User Card & Logout */}
      <div className="p-4 border-t border-neutral-900">
        <div className="flex items-center gap-3 mb-3 px-2">
          <div className="w-8 h-8 rounded-full bg-neutral-900 flex items-center justify-center border border-neutral-800">
            <span className="text-brand font-bold text-xs">{email.slice(0, 2).toUpperCase()}</span>
          </div>
          <div className="flex-1 min-w-0">
            <p className="text-xs font-semibold text-neutral-200 truncate" title={email}>
              {email}
            </p>
            <p className="text-[10px] text-neutral-500 font-semibold">Administrator</p>
          </div>
        </div>

        <button
          onClick={() => {
            logout();
            onCloseMobile?.();
          }}
          className="w-full flex items-center justify-center gap-2 px-4 py-2 text-xs font-semibold text-red-500 hover:text-red-400 border border-neutral-800 hover:border-red-950/30 hover:bg-red-950/15 rounded-full transition-all duration-200 cursor-pointer"
        >
          <LogOut className="w-4 h-4" />
          <span>Sign Out</span>
        </button>
      </div>
    </div>
  );

  return (
    <>
      {/* Desktop Sidebar (Permanent) */}
      <aside className="hidden lg:block w-64 h-screen sticky top-0 flex-shrink-0 z-20">
        {sidebarContent}
      </aside>

      {/* Mobile Drawer (Overlay) */}
      {isMobileOpen && (
        <div className="fixed inset-0 z-50 flex lg:hidden">
          {/* Backdrop Overlay */}
          <div
            className="fixed inset-0 bg-neutral-900/40 backdrop-blur-xs transition-opacity duration-300"
            onClick={onCloseMobile}
          />

          {/* Sliding Content */}
          <div className="relative flex flex-col w-72 max-w-[80vw] h-full shadow-premium animate-in slide-in-from-left duration-300">
            {/* Close button float */}
            <button
              onClick={onCloseMobile}
              className="absolute right-4 top-4 w-8 h-8 rounded-full bg-black border border-neutral-800 flex items-center justify-center text-neutral-400 hover:text-white hover:shadow-sm z-50 cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>
            {sidebarContent}
          </div>
        </div>
      )}
    </>
  );
}
