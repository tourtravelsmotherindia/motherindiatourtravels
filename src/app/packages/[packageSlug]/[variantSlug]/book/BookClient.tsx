"use client";

import {
  Bed,
  Check,
  ChevronRight,
  HelpCircle,
  Hotel,
  Mail,
  MapPin,
  Navigation,
  User,
} from "lucide-react";
import Link from "next/link";
import React, { useMemo, useState } from "react";

import Breadcrumbs from "@/components/layout/Breadcrumbs";
import PageShell from "@/components/layout/PageShell";
import DatePickerField from "@/components/shared/DatePickerField";
import PackageCard from "@/components/shared/PackageCard";
import SectionHeader from "@/components/shared/SectionHeader";
import TravelersField from "@/components/shared/TravelersField";
import Dropdown from "@/components/ui/Dropdown";
import FormField from "@/components/ui/FormField";
import PhoneInput from "@/components/ui/PhoneInput";
import { useToast } from "@/context/ToastContext";
import { useSubmitBooking } from "@/lib/hooks/mutations";
import { useFavorites } from "@/lib/hooks/useFavorites";
import { type CompanyData } from "@/types/company";
import {
  type PackageDetailItem,
  type PackageItem,
  type PackageVariantDetail,
} from "@/types/package";

interface BookClientProps {
  packageData: PackageDetailItem;
  activeVariant: PackageVariantDetail;
  allPackages: PackageItem[];
  companyData: CompanyData | null;
}

export default function BookClient({
  packageData,
  activeVariant,
  allPackages,
  companyData,
}: BookClientProps) {
  const { showToast } = useToast();
  const { isFavorite, toggleFavorite } = useFavorites();
  const bookingMutation = useSubmitBooking();

  const [fullName, setFullName] = useState("");
  const [emailAddress, setEmailAddress] = useState("");
  const [countryCodeVal, setCountryCodeVal] = useState("IN:+91");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [pickupLocation, setPickupLocation] = useState("");
  const [dropLocation, setDropLocation] = useState("");
  const [message, setMessage] = useState("");

  // Spacing helper inputs
  const pkgName = packageData.name || "Tour Package";

  // Dropdown States
  const [activeDropdown, setActiveDropdown] = useState<"dates" | "guests" | null>(null);

  // Date States
  const [dateMode, setDateMode] = useState<"calendar" | "flexible">("calendar");
  const [selectedCheckIn, setSelectedCheckIn] = useState<Date | null>(null);
  const [selectedCheckOut, setSelectedCheckOut] = useState<Date | null>(null);

  const [flexibleDurationDays, setFlexibleDurationDays] = useState<string>("7");
  const [selectedFlexibleMonth, setSelectedFlexibleMonth] = useState<Date>(() => {
    const today = new Date();
    return new Date(today.getFullYear(), today.getMonth(), 1);
  });

  // Travelers States
  const [adults, setAdults] = useState(1);
  const [childrenCount, setChildrenCount] = useState(0);
  const [kids, setKids] = useState(0);
  const [rooms, setRooms] = useState(1);

  // Hotel Category States
  const [hotelCategory, setHotelCategory] = useState("4star");

  const hotelCategoryOptions = [
    { value: "3star", label: "3 Star (Standard)" },
    { value: "4star", label: "4 Star (Premium)" },
    { value: "5star", label: "5 Star (Luxury)" },
  ];

  // Derived style info
  const tourStyle = packageData.tourStyle || "Classic";

  // Recommended packages selection (ensuring absolute uniqueness of keys)
  const recommendedPackages = useMemo(() => {
    const others = allPackages.filter((p) => p.slug !== packageData.slug);
    const matchType = others.filter((p) => p.isPopular);
    const pool = matchType.length >= 3 ? matchType : others;

    const unique = Array.from(new Set(pool.map((p) => p.id)))
      .map((id) => pool.find((p) => p.id === id))
      .filter((p): p is PackageItem => !!p);

    const offset = packageData.slug.length % unique.length;
    const result = [];
    for (let i = 0; i < Math.min(3, unique.length); i++) {
      result.push(unique[(offset + i) % unique.length]);
    }
    return result;
  }, [allPackages, packageData]);

  // Submit form handler
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (
      !fullName ||
      !emailAddress ||
      !phoneNumber ||
      !selectedCheckIn ||
      !pickupLocation ||
      !dropLocation
    ) {
      showToast("error", "Validation Failed", "Please fill in all required fields.");
      return;
    }

    try {
      // Build country-code-prefixed phone string
      const dialCode = countryCodeVal.split(":")[1] ?? "";
      const fullPhone = `${dialCode}${phoneNumber}`.trim();

      // Resolve flexible date fields
      const isFlexible = dateMode === "flexible";
      const flexMonth = isFlexible
        ? `${selectedFlexibleMonth.getFullYear()}-${String(selectedFlexibleMonth.getMonth() + 1).padStart(2, "0")}`
        : "";

      await bookingMutation.mutateAsync({
        name: fullName,
        email: emailAddress,
        phone: fullPhone,
        packageId: packageData.id,
        variantId: activeVariant.id,
        travelDate: selectedCheckIn?.toISOString() ?? null,
        travelDateEnd: selectedCheckOut?.toISOString() ?? null,
        dateMode: isFlexible ? "flexible" : "calendar",
        flexibleMonth: flexMonth,
        flexibleDays: isFlexible ? Number(flexibleDurationDays) : undefined,
        adults,
        children: childrenCount,
        infants: kids,
        rooms,
        hotelCategory: hotelCategory as "3star" | "4star" | "5star",
        pickupLocation,
        dropLocation,
        message,
        source: "BOOKING_FORM",
      });

      showToast(
        "success",
        "Booking Request Received!",
        `We have received your booking request for "${pkgName} - ${activeVariant.label}". Our tour expert will contact you shortly.`,
      );

      // Reset form
      setFullName("");
      setEmailAddress("");
      setCountryCodeVal("IN:+91");
      setPhoneNumber("");
      setPickupLocation("");
      setDropLocation("");
      setMessage("");
      setSelectedCheckIn(null);
      setSelectedCheckOut(null);
      setAdults(1);
      setChildrenCount(0);
      setKids(0);
      setRooms(1);
      setHotelCategory("4star");
      setActiveDropdown(null);
    } catch (err) {
      const message =
        err instanceof Error ? err.message : "Something went wrong. Please try again.";
      showToast("error", "Submission Failed", message);
    }
  };

  return (
    <PageShell companyData={companyData} ptClass="pt-28" bgClass="bg-white" className="pb-24">
      <div className="layout-container font-sans">
        {/* Breadcrumbs */}
        <Breadcrumbs
          items={[
            { label: "Home", href: "/" },
            { label: "Packages", href: "/packages" },
            { label: pkgName, href: `/packages/${packageData.slug}` },
            {
              label: activeVariant.label,
              href: `/packages/${packageData.slug}/${activeVariant.slug}`,
            },
            { label: "Book" },
          ]}
        />

        {/* Header Block (Spans full width for top alignment of grid) */}
        <div className="mb-8 mt-4">
          <h1 className="font-display text-4xl sm:text-5xl font-bold text-foreground leading-[1.1] tracking-tight">
            Book your tour —
            <br />
            <span className="text-brand font-display">{pkgName}</span>
          </h1>
          <p className="text-neutral-800 font-sans text-sm sm:text-base leading-relaxed max-w-lg mt-4 font-medium">
            Please provide your contact information and travel coordinates. Our tour specialists
            will tailor the package itinerary and revert with customized coordinates.
          </p>
        </div>

        {/* TWO-COLUMN DETAILS GRID */}
        <div className="grid grid-cols-1 lg:grid-cols-[1fr_380px] gap-12 lg:gap-16 items-start">
          {/* LEFT COLUMN: Booking form */}
          <div className="bg-white border border-border-light rounded-[2.5rem] p-6 sm:p-10 shadow-premium relative overflow-visible">
            <form onSubmit={handleSubmit} className="flex flex-col gap-5 sm:gap-6">
              <FormField
                id="fullName"
                label="Full Name"
                type="text"
                required
                value={fullName}
                onChange={setFullName}
                placeholder="Enter your full name..."
                icon={User}
              />

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <FormField
                  id="emailAddress"
                  label="Email Address"
                  type="email"
                  required
                  value={emailAddress}
                  onChange={setEmailAddress}
                  placeholder="Enter your email..."
                  icon={Mail}
                />

                <PhoneInput
                  id="phoneNumber"
                  label="Phone Number"
                  phoneNumber={phoneNumber}
                  onChange={setPhoneNumber}
                  countryCodeVal={countryCodeVal}
                  onChangeCountryCode={setCountryCodeVal}
                  placeholder="Enter your phone..."
                  required
                />
              </div>

              {/* Shared DatePicker Component */}
              <DatePickerField
                variant="form"
                dateMode={dateMode}
                setDateMode={setDateMode}
                selectedCheckIn={selectedCheckIn}
                setSelectedCheckIn={setSelectedCheckIn}
                selectedCheckOut={selectedCheckOut}
                setSelectedCheckOut={setSelectedCheckOut}
                flexibleDurationDays={flexibleDurationDays}
                setFlexibleDurationDays={setFlexibleDurationDays}
                selectedFlexibleMonth={selectedFlexibleMonth}
                setSelectedFlexibleMonth={setSelectedFlexibleMonth}
                activeDropdown={activeDropdown}
                setActiveDropdown={setActiveDropdown}
              />

              {/* Travelers Row */}
              <div className="w-full">
                <TravelersField
                  variant="form"
                  adults={adults}
                  setAdults={setAdults}
                  childrenCount={childrenCount}
                  setChildrenCount={setChildrenCount}
                  kids={kids}
                  setKids={setKids}
                  activeDropdown={activeDropdown}
                  setActiveDropdown={setActiveDropdown}
                />
              </div>

              {/* Rooms & Hotel Category Row */}
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div className="relative flex flex-col gap-2">
                  <span className="text-xs font-semibold text-neutral-800 ml-1">
                    Hotel Type / Category
                  </span>
                  <Dropdown
                    options={hotelCategoryOptions}
                    value={hotelCategory}
                    onChange={(val) => setHotelCategory(val)}
                    align="left"
                    triggerClassName="w-full border border-neutral-200 hover:border-brand/40 transition-all duration-200 py-3 lg:py-3 text-sm font-semibold text-neutral-800 bg-white"
                    menuClassName="w-full rounded-2xl p-1"
                    icon={Hotel}
                  />
                </div>

                <div className="relative flex flex-col gap-2">
                  <span className="text-xs font-semibold text-neutral-800 ml-1">Rooms</span>
                  <Dropdown
                    options={[
                      { value: "1", label: "1 Room" },
                      { value: "2", label: "2 Rooms" },
                      { value: "3", label: "3 Rooms" },
                      { value: "4", label: "4 Rooms" },
                      { value: "5", label: "5 Rooms" },
                      { value: "6", label: "6 Rooms" },
                      { value: "7", label: "7 Rooms" },
                      { value: "8", label: "8 Rooms" },
                      { value: "9", label: "9 Rooms" },
                      { value: "10+", label: "10+ Rooms" },
                    ]}
                    value={String(rooms)}
                    onChange={(val) => setRooms(Number(val))}
                    align="left"
                    triggerClassName="w-full border border-neutral-200 hover:border-brand/40 transition-all duration-200 py-3 lg:py-3 text-sm font-semibold text-neutral-800 bg-white"
                    menuClassName="w-full rounded-2xl p-1"
                    icon={Bed}
                  />
                </div>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <FormField
                  id="pickupLocation"
                  label="Pickup Location"
                  type="text"
                  required
                  value={pickupLocation}
                  onChange={setPickupLocation}
                  placeholder="Enter pickup location..."
                  icon={MapPin}
                />
                <FormField
                  id="dropLocation"
                  label="Drop Location"
                  type="text"
                  required
                  value={dropLocation}
                  onChange={setDropLocation}
                  placeholder="Enter drop location..."
                  icon={Navigation}
                />
              </div>

              <FormField
                id="message"
                label="Additional Message"
                type="textarea"
                required
                value={message}
                onChange={setMessage}
                placeholder="Tell us about special requirements, group discounts, or custom arrangements..."
              />

              <button
                type="submit"
                disabled={bookingMutation.isPending}
                className="w-full bg-brand hover:bg-brand-hover text-white font-bold py-4 rounded-full text-xs uppercase tracking-wider shadow-md hover:shadow-lg transition-all duration-300 cursor-pointer text-center select-none border-none outline-none mt-2 active:scale-98 disabled:opacity-60 disabled:cursor-not-allowed"
              >
                {bookingMutation.isPending ? "Submitting Booking..." : "Submit Booking Request"}
              </button>
            </form>
          </div>

          {/* RIGHT COLUMN: Sticky summary form layout */}
          <aside className="lg:sticky lg:top-28 flex flex-col gap-6">
            {/* Package details / summary card */}
            <div className="bg-white border border-border-light rounded-[2rem] p-6 shadow-premium">
              <div className="flex flex-col gap-4">
                <div className="bg-neutral-50 rounded-2xl p-4 flex flex-col border border-neutral-100">
                  <span className="text-[10px] font-bold text-neutral-400 uppercase tracking-wider font-sans mb-1">
                    Booking Summary
                  </span>
                  <div className="font-display font-bold text-foreground text-sm flex flex-wrap items-center gap-1.5 leading-snug mt-1">
                    {packageData.destinations.map((dest, idx) => (
                      <React.Fragment key={dest.destinationId}>
                        {idx > 0 && <ChevronRight className="w-3 h-3 text-neutral-300 shrink-0" />}
                        <span className="text-foreground">{dest.destinationName}</span>
                      </React.Fragment>
                    ))}
                  </div>
                </div>

                <div className="flex flex-col gap-2.5 font-sans mt-2">
                  <div className="flex items-center justify-between text-xs font-semibold text-neutral-800 border-b border-neutral-100 pb-2">
                    <span>Tour Style</span>
                    <span className="text-neutral-800 font-bold uppercase">{tourStyle}</span>
                  </div>
                  <div className="flex items-center justify-between text-xs font-semibold text-neutral-800 border-b border-neutral-100 pb-2">
                    <span>Duration</span>
                    <span className="text-neutral-800 font-bold">
                      {activeVariant.days} Days / {activeVariant.nights} Nights
                    </span>
                  </div>
                  <div className="flex items-center justify-between text-xs font-semibold text-neutral-800 pb-1">
                    <span>Pricing</span>
                    <span className="text-brand font-extrabold font-display text-sm leading-none">
                      Price On Request
                    </span>
                  </div>
                </div>
              </div>
            </div>

            {/* Travel details / trust card */}
            <div className="bg-neutral-50 border border-neutral-100 rounded-[2rem] p-6 flex flex-col gap-4 font-sans text-xs md:text-sm">
              <h4 className="font-bold text-neutral-800 font-display text-sm md:text-base">
                Why book with us?
              </h4>
              <ul className="flex flex-col gap-3 font-semibold text-neutral-800">
                <li className="flex items-center gap-2">
                  <Check className="w-4.5 h-4.5 text-brand shrink-0 stroke-[2.5]" />
                  <span>100% Tailored itineraries</span>
                </li>
                <li className="flex items-center gap-2">
                  <Check className="w-4.5 h-4.5 text-brand shrink-0 stroke-[2.5]" />
                  <span>Zero hidden costs guaranteed</span>
                </li>
                <li className="flex items-center gap-2">
                  <Check className="w-4.5 h-4.5 text-brand shrink-0 stroke-[2.5]" />
                  <span>Premium private AC vehicles</span>
                </li>
                <li className="flex items-center gap-2">
                  <Check className="w-4.5 h-4.5 text-brand shrink-0 stroke-[2.5]" />
                  <span>24/7 Live customer care</span>
                </li>
              </ul>
            </div>

            {/* Help & Support Card */}
            <div className="bg-neutral-50/50 border border-border-light rounded-[2rem] p-6 text-center">
              <HelpCircle className="w-6 h-6 text-neutral-400 mx-auto mb-3" />
              <h4 className="font-bold text-foreground text-base mb-2">Need Help Planning?</h4>
              <p className="text-xs text-neutral-800 font-medium leading-relaxed mb-4">
                Talk to our travel specialists for custom itineraries, group discounts, or special
                requirements.
              </p>
              {companyData && companyData.whatsappNumber && (
                <a
                  href={`https://wa.me/${companyData.whatsappNumber}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 border border-neutral-900 text-neutral-900 hover:bg-neutral-900 hover:text-white font-semibold text-xs uppercase tracking-wider px-6 py-3 rounded-full transition-all duration-300 cursor-pointer select-none"
                >
                  WhatsApp Experts
                </a>
              )}
            </div>
          </aside>
        </div>

        {/* RECOMMENDED PACKAGES SECTION */}
        <section className="mt-24 border-t border-border-light pt-24">
          <SectionHeader
            title="Recommended for you"
            badge="Explore More"
            rightSlot={
              <Link
                href="/packages"
                className="group inline-flex items-center gap-1.5 text-neutral-900 hover:text-brand font-semibold text-sm transition-colors mt-4 md:mt-0 cursor-pointer"
              >
                View all tours
                <ChevronRight className="w-4 h-4 transition-transform duration-300 group-hover:translate-x-1" />
              </Link>
            }
          />

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {recommendedPackages.map((pkg) => {
              const defaultVariant = pkg.variants.find((v) => v.isDefault) || pkg.variants[0];
              return (
                <PackageCard
                  key={pkg.id}
                  id={pkg.id}
                  slug={pkg.slug}
                  name={pkg.name}
                  heroImage={pkg.heroImage}
                  durationText={defaultVariant ? defaultVariant.label : undefined}
                  destinations={pkg.destinations}
                  variant="white"
                  isFavorite={isFavorite(pkg.slug)}
                  onToggleFavorite={toggleFavorite}
                />
              );
            })}
          </div>
        </section>
      </div>
    </PageShell>
  );
}
