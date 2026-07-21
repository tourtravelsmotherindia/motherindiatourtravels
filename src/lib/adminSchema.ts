export interface FieldConfig {
  name: string;
  label: string;
  type:
    | "text"
    | "number"
    | "boolean"
    | "select"
    | "textarea"
    | "image"
    | "images-list"
    | "array-string"
    | "json"
    | "datetime";
  relation?: {
    table: string; // The table slug in API (e.g. "countries")
    labelField: string; // User-friendly field (e.g. "name")
    valueField: string; // PK field (e.g. "id")
  };
  options?: { label: string; value: string | number | boolean }[]; // Static enum/status options
  required?: boolean;
  defaultValue?: unknown;
  placeholder?: string;
  hideInTable?: boolean;
  // Custom labels for boolean fields — overrides "Active"/"Inactive" in table view
  trueLabel?: string;
  falseLabel?: string;
}

export interface TableConfig {
  slug: string; // e.g. "countries"
  label: string; // e.g. "Countries"
  dbName: string; // e.g. "Country"
  icon: string; // Lucide icon name string
  fields: FieldConfig[];
  searchField?: string; // Field to search on (e.g. "name")
  displayColumns: string[]; // Fields to show in list table
  compositeKeys?: string[]; // If composite table, list the keys (e.g. ["variantId", "destinationId"])
  disableCreate?: boolean;
  disableUpdate?: boolean;
  disableDelete?: boolean;
  disableSearch?: boolean;
}

export interface SidebarGroup {
  name: string;
  items: string[]; // Slugs of tables
}

export const ADMIN_SIDEBAR_GROUPS: SidebarGroup[] = [
  {
    name: "Core Geography",
    items: ["countries", "states", "destinations", "attractions"],
  },
  {
    name: "Tour Packages",
    items: [
      "packages",
      "package-variants",
      "itinerary-days",
      "categories",
      "package-destinations",
      "package-categories",
      "package-attractions",
    ],
  },
  {
    name: "CMS & Content",
    items: [
      "blog-posts",
      "blog-categories",
      "gallery-images",
      "faqs",
      "testimonials",
      "hero-configs",
      "hero-slides",
      "site-sections",
      "company",
    ],
  },
  {
    name: "Leads & System",
    items: [
      "bookings",
      "contacts",
      "subscribers",
      "users",
      "destination-neighbours",
      "system-status",
    ],
  },
];

export const ADMIN_TABLES: Record<string, TableConfig> = {
  countries: {
    slug: "countries",
    label: "Countries",
    dbName: "Country",
    icon: "Globe",
    searchField: "name",
    displayColumns: ["name", "continent", "isDomestic", "isFeatured", "capital", "currency"],
    fields: [
      { name: "name", label: "Name", type: "text", required: true },
      { name: "slug", label: "Slug", type: "text", required: true, placeholder: "e.g. india" },
      { name: "continent", label: "Continent", type: "text", required: true, defaultValue: "Asia" },
      {
        name: "isDomestic",
        label: "Is Domestic",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Domestic",
        falseLabel: "International",
      },
      {
        name: "isFeatured",
        label: "Is Featured",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Featured",
        falseLabel: "Not Featured",
      },
      { name: "capital", label: "Capital", type: "text", defaultValue: "" },
      { name: "currency", label: "Currency Code", type: "text", defaultValue: "" },
      { name: "languages", label: "Languages", type: "array-string", defaultValue: [] },
      {
        name: "visaRequiredForIndians",
        label: "Visa Required",
        type: "boolean",
        defaultValue: true,
        trueLabel: "Required",
        falseLabel: "Not Required",
      },
      {
        name: "visaOnArrival",
        label: "Visa On Arrival",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Available",
        falseLabel: "N/A",
      },
      { name: "image", label: "Flag / Cover Image", type: "image", defaultValue: "" },
      {
        name: "description",
        label: "Description",
        type: "textarea",
        defaultValue: "",
        hideInTable: true,
      },
      { name: "latitude", label: "Latitude", type: "number", hideInTable: true },
      { name: "longitude", label: "Longitude", type: "number", hideInTable: true },
      { name: "seoTitle", label: "SEO Title", type: "text", defaultValue: "", hideInTable: true },
      {
        name: "seoDescription",
        label: "SEO Description",
        type: "textarea",
        defaultValue: "",
        hideInTable: true,
      },
    ],
  },
  states: {
    slug: "states",
    label: "States",
    dbName: "State",
    icon: "Map",
    searchField: "name",
    displayColumns: ["name", "slug", "countryId", "capital", "isFeatured"],
    fields: [
      { name: "name", label: "Name", type: "text", required: true },
      { name: "slug", label: "Slug", type: "text", required: true },
      {
        name: "countryId",
        label: "Country",
        type: "select",
        required: true,
        relation: { table: "countries", labelField: "name", valueField: "id" },
      },
      { name: "capital", label: "Capital", type: "text", defaultValue: "" },
      {
        name: "isFeatured",
        label: "Is Featured",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Featured",
        falseLabel: "Not Featured",
      },
      { name: "image", label: "Cover Image", type: "image", defaultValue: "", hideInTable: true },
      {
        name: "description",
        label: "Description",
        type: "textarea",
        defaultValue: "",
        hideInTable: true,
      },
      { name: "latitude", label: "Latitude", type: "number", hideInTable: true },
      { name: "longitude", label: "Longitude", type: "number", hideInTable: true },
    ],
  },
  destinations: {
    slug: "destinations",
    label: "Destinations",
    dbName: "Destination",
    icon: "MapPin",
    searchField: "name",
    displayColumns: ["name", "slug", "type", "countryId", "stateId", "isFeatured"],
    fields: [
      { name: "name", label: "Name", type: "text", required: true },
      { name: "slug", label: "Slug", type: "text", required: true },
      {
        name: "type",
        label: "Destination Type",
        type: "select",
        required: true,
        defaultValue: "CITY",
        options: [
          { label: "City", value: "CITY" },
          { label: "Region", value: "REGION" },
          { label: "Beach", value: "BEACH" },
          { label: "Hill Station", value: "HILL_STATION" },
          { label: "Wildlife", value: "WILDLIFE" },
          { label: "Pilgrimage", value: "PILGRIMAGE" },
          { label: "Island", value: "ISLAND" },
          { label: "Heritage", value: "HERITAGE" },
          { label: "Adventure", value: "ADVENTURE" },
        ],
      },
      {
        name: "countryId",
        label: "Country",
        type: "select",
        required: true,
        relation: { table: "countries", labelField: "name", valueField: "id" },
      },
      {
        name: "stateId",
        label: "State",
        type: "select",
        relation: { table: "states", labelField: "name", valueField: "id" },
      },
      {
        name: "isFeatured",
        label: "Is Featured",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Featured",
        falseLabel: "Not Featured",
      },
      { name: "bestTimeToVisit", label: "Best Time to Visit", type: "text", defaultValue: "" },
      { name: "climate", label: "Climate Info", type: "text", defaultValue: "" },
      { name: "image", label: "Cover Image", type: "image", defaultValue: "" },
      {
        name: "description",
        label: "Description",
        type: "textarea",
        defaultValue: "",
        hideInTable: true,
      },
      { name: "latitude", label: "Latitude", type: "number", hideInTable: true },
      { name: "longitude", label: "Longitude", type: "number", hideInTable: true },
      { name: "seoTitle", label: "SEO Title", type: "text", defaultValue: "", hideInTable: true },
      {
        name: "seoDescription",
        label: "SEO Description",
        type: "textarea",
        defaultValue: "",
        hideInTable: true,
      },
    ],
  },
  attractions: {
    slug: "attractions",
    label: "Attractions",
    dbName: "Attraction",
    icon: "Compass",
    searchField: "name",
    displayColumns: ["name", "slug", "destinationId", "sortOrder"],
    fields: [
      { name: "name", label: "Name", type: "text", required: true },
      { name: "slug", label: "Slug", type: "text", required: true },
      {
        name: "destinationId",
        label: "Destination",
        type: "select",
        required: true,
        relation: { table: "destinations", labelField: "name", valueField: "id" },
      },
      { name: "image", label: "Image", type: "image", defaultValue: "" },
      {
        name: "description",
        label: "Description",
        type: "textarea",
        defaultValue: "",
        hideInTable: true,
      },
      { name: "sortOrder", label: "Sort Order", type: "number", defaultValue: 0 },
      { name: "latitude", label: "Latitude", type: "number", hideInTable: true },
      { name: "longitude", label: "Longitude", type: "number", hideInTable: true },
    ],
  },
  categories: {
    slug: "categories",
    label: "Categories",
    dbName: "Category",
    icon: "Tag",
    searchField: "name",
    displayColumns: ["name", "slug", "icon", "sortOrder"],
    fields: [
      { name: "name", label: "Name", type: "text", required: true },
      { name: "slug", label: "Slug", type: "text", required: true },
      { name: "description", label: "Description", type: "textarea", defaultValue: "" },
      { name: "icon", label: "Lucide Icon Name", type: "text", defaultValue: "Compass" },
      { name: "sortOrder", label: "Sort Order", type: "number", defaultValue: 0 },
      { name: "seoTitle", label: "SEO Title", type: "text", defaultValue: "", hideInTable: true },
      {
        name: "seoDescription",
        label: "SEO Description",
        type: "textarea",
        defaultValue: "",
        hideInTable: true,
      },
    ],
  },
  packages: {
    slug: "packages",
    label: "Packages",
    dbName: "Package",
    icon: "Package",
    searchField: "name",
    displayColumns: [
      "name",
      "tourStyle",
      "isPopular",
      "isFeatured",
      "isDomestic",
      "countryId",
      "stateId",
    ],
    fields: [
      { name: "name", label: "Package Name", type: "text", required: true },
      { name: "slug", label: "Slug", type: "text", required: true },
      {
        name: "overview",
        label: "Overview Detail",
        type: "textarea",
        defaultValue: "",
        hideInTable: true,
      },
      {
        name: "highlights",
        label: "Highlights",
        type: "array-string",
        defaultValue: [],
        hideInTable: true,
      },
      {
        name: "inclusions",
        label: "Inclusions",
        type: "array-string",
        defaultValue: [],
        hideInTable: true,
      },
      {
        name: "exclusions",
        label: "Exclusions",
        type: "array-string",
        defaultValue: [],
        hideInTable: true,
      },
      {
        name: "notes",
        label: "Important Notes",
        type: "array-string",
        defaultValue: [],
        hideInTable: true,
      },
      { name: "heroImage", label: "Hero Banner Image", type: "image", defaultValue: "" },
      {
        name: "galleryImages",
        label: "Gallery Images",
        type: "images-list",
        defaultValue: [],
        hideInTable: true,
      },
      {
        name: "tourStyle",
        label: "Tour Style (e.g. Beach, Adventure)",
        type: "text",
        defaultValue: "Classic",
      },
      { name: "groupSizeMax", label: "Max Group Size", type: "number", defaultValue: 12 },
      { name: "groupSizeAvg", label: "Avg Group Size", type: "number", defaultValue: 10 },
      {
        name: "stayType",
        label: "Accommodation Style",
        type: "text",
        defaultValue: "Premium Hotels",
      },
      {
        name: "marketingPitch",
        label: "Short Pitch Tagline",
        type: "text",
        defaultValue: "",
        hideInTable: true,
      },
      {
        name: "isPopular",
        label: "Is Popular",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Popular",
        falseLabel: "Standard",
      },
      {
        name: "isFeatured",
        label: "Is Featured",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Featured",
        falseLabel: "Standard",
      },
      {
        name: "isDomestic",
        label: "Is Domestic Package",
        type: "boolean",
        defaultValue: true,
        trueLabel: "Domestic",
        falseLabel: "International",
      },
      { name: "tags", label: "Tags / Badges", type: "array-string", defaultValue: [] },
      {
        name: "countryId",
        label: "Country",
        type: "select",
        required: true,
        relation: { table: "countries", labelField: "name", valueField: "id" },
      },
      {
        name: "stateId",
        label: "State",
        type: "select",
        relation: { table: "states", labelField: "name", valueField: "id" },
      },
      { name: "seoTitle", label: "SEO Title", type: "text", defaultValue: "", hideInTable: true },
      {
        name: "seoDescription",
        label: "SEO Description",
        type: "textarea",
        defaultValue: "",
        hideInTable: true,
      },
      {
        name: "seoKeywords",
        label: "SEO Keywords",
        type: "array-string",
        defaultValue: [],
        hideInTable: true,
      },
    ],
  },
  "package-variants": {
    slug: "package-variants",
    label: "Package Variants",
    dbName: "PackageVariant",
    icon: "Layers",
    searchField: "label",
    displayColumns: [
      "packageId",
      "slug",
      "label",
      "nights",
      "days",
      "basePrice",
      "discountedPrice",
    ],
    fields: [
      {
        name: "packageId",
        label: "Parent Package",
        type: "select",
        required: true,
        relation: { table: "packages", labelField: "name", valueField: "id" },
      },
      { name: "slug", label: "Slug Variant (e.g. 3n-4d)", type: "text", required: true },
      {
        name: "label",
        label: "Display Label (e.g. 3 Nights / 4 Days)",
        type: "text",
        required: true,
      },
      { name: "nights", label: "Nights Duration", type: "number", required: true, defaultValue: 3 },
      { name: "days", label: "Days Duration", type: "number", required: true, defaultValue: 4 },
      { name: "durationText", label: "Duration Override Text", type: "text", defaultValue: "" },
      { name: "basePrice", label: "Base Price (₹)", type: "number" },
      { name: "discountedPrice", label: "Discounted Price (₹)", type: "number" },
      { name: "sortOrder", label: "Sort Order", type: "number", defaultValue: 0 },
      {
        name: "isDefault",
        label: "Is Default Variant",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Default",
        falseLabel: "Optional",
      },
      {
        name: "heroImage",
        label: "Variant Image Override",
        type: "image",
        defaultValue: "",
        hideInTable: true,
      },
      {
        name: "galleryImages",
        label: "Variant Gallery Images",
        type: "images-list",
        defaultValue: [],
        hideInTable: true,
      },
    ],
  },
  "itinerary-days": {
    slug: "itinerary-days",
    label: "Itinerary Days",
    dbName: "ItineraryDay",
    icon: "CalendarRange",
    searchField: "title",
    displayColumns: ["variantId", "day", "title"],
    fields: [
      {
        name: "variantId",
        label: "Package Variant",
        type: "select",
        required: true,
        relation: { table: "package-variants", labelField: "label", valueField: "id" },
      },
      { name: "day", label: "Day Number", type: "number", required: true },
      { name: "title", label: "Day Title", type: "text", required: true },
      { name: "description", label: "Day Activities", type: "textarea", required: true },
      { name: "images", label: "Sightseeing Images", type: "images-list", defaultValue: [] },
    ],
  },
  "hero-configs": {
    slug: "hero-configs",
    label: "Hero Config",
    dbName: "HeroConfig",
    icon: "Sliders",
    displayColumns: ["id", "mode", "videoUrl"],
    fields: [
      { name: "id", label: "ID (Must be 1)", type: "number", required: true, defaultValue: 1 },
      {
        name: "mode",
        label: "Hero Mode",
        type: "select",
        required: true,
        defaultValue: "SLIDES",
        options: [
          { label: "Rotating Image Slides", value: "SLIDES" },
          { label: "Background Video", value: "VIDEO" },
        ],
      },
      { name: "videoUrl", label: "Video Stream URL", type: "text", defaultValue: "" },
    ],
  },
  "hero-slides": {
    slug: "hero-slides",
    label: "Hero Slides",
    dbName: "HeroSlide",
    icon: "Image",
    searchField: "title",
    displayColumns: ["title", "tag", "sortOrder", "image"],
    fields: [
      {
        name: "heroConfigId",
        label: "Hero Config ID",
        type: "number",
        defaultValue: 1,
        required: true,
      },
      { name: "image", label: "Slide Image", type: "image", required: true },
      { name: "tag", label: "Tag Subtext (orange badge)", type: "text", defaultValue: "" },
      { name: "title", label: "Slide Heading", type: "text", required: true },
      { name: "description", label: "Slide Description", type: "textarea", defaultValue: "" },
      { name: "sortOrder", label: "Sort Order", type: "number", defaultValue: 0 },
    ],
  },
  "site-sections": {
    slug: "site-sections",
    label: "Site Sections",
    dbName: "SiteSection",
    icon: "LayoutTemplate",
    searchField: "key",
    displayColumns: ["key", "tagline", "subtitle"],
    fields: [
      { name: "key", label: "Section Key (Unique)", type: "text", required: true },
      { name: "tagline", label: "Section Tagline", type: "text", defaultValue: "" },
      { name: "subtitle", label: "Section Subtitle", type: "textarea", defaultValue: "" },
      { name: "image", label: "Section Image Accent", type: "image" },
      { name: "metaJson", label: "Section Metadata (JSON)", type: "json" },
    ],
  },
  faqs: {
    slug: "faqs",
    label: "FAQs",
    dbName: "FAQ",
    icon: "HelpCircle",
    searchField: "question",
    displayColumns: ["question", "sortOrder", "isFeatured"],
    fields: [
      { name: "question", label: "Question", type: "text", required: true },
      { name: "answer", label: "Answer Detail", type: "textarea", required: true },
      { name: "sortOrder", label: "Sort Order", type: "number", defaultValue: 0 },
      {
        name: "isFeatured",
        label: "Featured on Homepage",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Featured",
        falseLabel: "Standard",
      },
    ],
  },
  "gallery-images": {
    slug: "gallery-images",
    label: "Gallery",
    dbName: "GalleryImage",
    icon: "Camera",
    searchField: "title",
    displayColumns: ["title", "location", "sortOrder", "image", "destinationId"],
    fields: [
      { name: "title", label: "Image Title", type: "text", required: true },
      { name: "location", label: "Location Text", type: "text", defaultValue: "" },
      { name: "image", label: "Image", type: "image", required: true },
      { name: "altText", label: "ALT Tag Text", type: "text", defaultValue: "" },
      { name: "sortOrder", label: "Sort Order", type: "number", defaultValue: 0 },
      {
        name: "destinationId",
        label: "Associated Destination",
        type: "select",
        relation: { table: "destinations", labelField: "name", valueField: "id" },
      },
    ],
  },
  "blog-categories": {
    slug: "blog-categories",
    label: "Blog Categories",
    dbName: "BlogPostCategory",
    icon: "Folder",
    searchField: "name",
    displayColumns: ["name", "slug"],
    fields: [
      { name: "name", label: "Category Name", type: "text", required: true },
      { name: "slug", label: "Slug", type: "text", required: true },
    ],
  },
  "blog-posts": {
    slug: "blog-posts",
    label: "Blog Posts",
    dbName: "BlogPost",
    icon: "FileText",
    searchField: "title",
    displayColumns: ["title", "authorName", "isPublished", "isFeatured", "publishedAt"],
    fields: [
      { name: "title", label: "Article Title", type: "text", required: true },
      { name: "slug", label: "Slug", type: "text", required: true },
      { name: "excerpt", label: "Short Summary Excerpt", type: "textarea", defaultValue: "" },
      {
        name: "content",
        label: "Article Content (Markdown)",
        type: "textarea",
        defaultValue: "",
        hideInTable: true,
      },
      { name: "coverImage", label: "Cover Image", type: "image", defaultValue: "" },
      { name: "authorName", label: "Author Name", type: "text", defaultValue: "" },
      {
        name: "authorImage",
        label: "Author Avatar Image",
        type: "image",
        defaultValue: "",
        hideInTable: true,
      },
      { name: "readingTimeMinutes", label: "Reading Time (mins)", type: "number", defaultValue: 5 },
      {
        name: "isPublished",
        label: "Is Published",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Published",
        falseLabel: "Draft",
      },
      {
        name: "isFeatured",
        label: "Is Featured Article",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Featured",
        falseLabel: "Not Featured",
      },
      { name: "tags", label: "Tags / Labels", type: "array-string", defaultValue: [] },
      {
        name: "destinationId",
        label: "Target Destination",
        type: "select",
        relation: { table: "destinations", labelField: "name", valueField: "id" },
      },
      {
        name: "categoryId",
        label: "Blog Category",
        type: "select",
        relation: { table: "blog-categories", labelField: "name", valueField: "id" },
      },
      { name: "publishedAt", label: "Published At", type: "datetime" },
    ],
  },
  bookings: {
    slug: "bookings",
    label: "Bookings",
    dbName: "BookingInquiry",
    icon: "Receipt",
    searchField: "name",
    displayColumns: ["name", "email", "phone", "status", "source", "createdAt"],
    fields: [
      {
        name: "packageId",
        label: "Package Interested",
        type: "select",
        relation: { table: "packages", labelField: "name", valueField: "id" },
      },
      {
        name: "variantId",
        label: "Package Variant",
        type: "select",
        relation: { table: "package-variants", labelField: "label", valueField: "id" },
      },
      { name: "packageInterest", label: "Fallback Package Label", type: "text", defaultValue: "" },
      { name: "name", label: "Guest Name", type: "text", required: true },
      { name: "email", label: "Guest Email", type: "text", required: true },
      { name: "phone", label: "Guest Phone", type: "text", required: true },
      { name: "travelDate", label: "Travel Start Date", type: "datetime" },
      { name: "travelDateEnd", label: "Travel End Date", type: "datetime" },
      {
        name: "dateMode",
        label: "Date Mode",
        type: "select",
        defaultValue: "calendar",
        options: [
          { label: "Exact Dates Calendar", value: "calendar" },
          { label: "Flexible Month", value: "flexible" },
        ],
      },
      {
        name: "flexibleMonth",
        label: "Flexible Month (e.g. 2025-05)",
        type: "text",
        defaultValue: "",
      },
      { name: "flexibleDays", label: "Flexible Duration (Days)", type: "number" },
      { name: "adults", label: "Adults Count", type: "number", defaultValue: 1 },
      { name: "children", label: "Children Count", type: "number", defaultValue: 0 },
      { name: "infants", label: "Infants Count", type: "number", defaultValue: 0 },
      { name: "rooms", label: "Rooms Count", type: "number", defaultValue: 1 },
      {
        name: "hotelCategory",
        label: "Hotel Grade Preference",
        type: "select",
        defaultValue: "4star",
        options: [
          { label: "3 Star Budget", value: "3star" },
          { label: "4 Star Premium", value: "4star" },
          { label: "5 Star Luxury", value: "5star" },
        ],
      },
      { name: "pickupLocation", label: "Pickup City", type: "text", defaultValue: "" },
      { name: "dropLocation", label: "Drop City", type: "text", defaultValue: "" },
      { name: "message", label: "Message / Custom Requests", type: "textarea", defaultValue: "" },
      {
        name: "status",
        label: "Inquiry Status",
        type: "select",
        required: true,
        defaultValue: "NEW",
        options: [
          { label: "New Inquiry", value: "NEW" },
          { label: "Read / Acknowledged", value: "READ" },
          { label: "Contacted Client", value: "CONTACTED" },
          { label: "Closed / Finished", value: "CLOSED" },
        ],
      },
      {
        name: "source",
        label: "Booking Source",
        type: "select",
        required: true,
        defaultValue: "BOOKING_FORM",
        options: [
          { label: "Booking Form Submit", value: "BOOKING_FORM" },
          { label: "Quick Popup Modal", value: "POPUP" },
          { label: "WhatsApp Direct Link", value: "WHATSAPP" },
          { label: "Phone Call / Manual Entry", value: "PHONE" },
        ],
      },
    ],
  },
  contacts: {
    slug: "contacts",
    label: "Contact Forms",
    dbName: "ContactSubmission",
    icon: "Mail",
    searchField: "name",
    displayColumns: ["name", "email", "phone", "subject", "status", "createdAt"],
    fields: [
      { name: "name", label: "Contact Name", type: "text", required: true },
      { name: "email", label: "Contact Email", type: "text", required: true },
      { name: "phone", label: "Contact Phone", type: "text", defaultValue: "" },
      { name: "subject", label: "Subject", type: "text", defaultValue: "" },
      { name: "message", label: "Message Body", type: "textarea", required: true },
      {
        name: "status",
        label: "Status",
        type: "select",
        required: true,
        defaultValue: "NEW",
        options: [
          { label: "New Message", value: "NEW" },
          { label: "Read / Reviewed", value: "READ" },
          { label: "Replied", value: "REPLIED" },
        ],
      },
    ],
  },
  subscribers: {
    slug: "subscribers",
    label: "Newsletter",
    dbName: "NewsletterSubscriber",
    icon: "MailCheck",
    searchField: "email",
    displayColumns: ["email", "name", "isVerified", "subscribedAt"],
    fields: [
      { name: "email", label: "Subscriber Email", type: "text", required: true },
      { name: "name", label: "Subscriber Name", type: "text", defaultValue: "" },
      {
        name: "isVerified",
        label: "Verified Subscriber",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Verified",
        falseLabel: "Unverified",
      },
    ],
  },
  testimonials: {
    slug: "testimonials",
    label: "Testimonials",
    dbName: "Testimonial",
    icon: "MessageSquare",
    searchField: "reviewer",
    displayColumns: ["reviewer", "rating", "packageName", "source", "isApproved", "isFeatured"],
    fields: [
      { name: "reviewer", label: "Reviewer Name", type: "text", required: true },
      { name: "review", label: "Review Content", type: "textarea", required: true },
      {
        name: "rating",
        label: "Rating Stars (1-5)",
        type: "number",
        required: true,
        defaultValue: 5,
      },
      { name: "packageName", label: "Loose Package Text Label", type: "text", defaultValue: "" },
      { name: "source", label: "Review Platform Source", type: "text", defaultValue: "Google" },
      {
        name: "isApproved",
        label: "Is Approved",
        type: "boolean",
        defaultValue: true,
        trueLabel: "Approved",
        falseLabel: "Pending",
      },
      {
        name: "isFeatured",
        label: "Is Featured Testimonial",
        type: "boolean",
        defaultValue: false,
        trueLabel: "Featured",
        falseLabel: "Not Featured",
      },
    ],
  },
  users: {
    slug: "users",
    label: "Users",
    dbName: "User",
    icon: "Users",
    searchField: "email",
    displayColumns: ["email", "role", "createdAt"],
    fields: [
      { name: "email", label: "Admin Email", type: "text", required: true },
      {
        name: "role",
        label: "User Role Type",
        type: "select",
        required: true,
        defaultValue: "USER",
        options: [
          { label: "Standard Web User", value: "USER" },
          { label: "System Admin", value: "ADMIN" },
        ],
      },
    ],
  },
  company: {
    slug: "company",
    label: "Company Details",
    dbName: "Company",
    icon: "Building",
    displayColumns: ["id", "name", "email", "timezone"],
    fields: [
      { name: "id", label: "ID (Must be 1)", type: "number", required: true, defaultValue: 1 },
      { name: "name", label: "Company Name", type: "text", required: true },
      { name: "tagline", label: "Brand Tagline", type: "text", defaultValue: "" },
      { name: "website", label: "Website URL", type: "text", defaultValue: "" },
      { name: "phones", label: "Hotlines Phones", type: "array-string", defaultValue: [] },
      { name: "email", label: "Primary Contact Email", type: "text", defaultValue: "" },
      { name: "address", label: "Corporate Address", type: "textarea", defaultValue: "" },
      { name: "whatsappNumber", label: "WhatsApp Contact Number", type: "text", defaultValue: "" },
      { name: "timezone", label: "System Timezone", type: "text", defaultValue: "Asia/Kolkata" },
      { name: "schedule", label: "Business Schedule (JSON)", type: "json" },
      { name: "exceptions", label: "Holiday Exceptions (JSON)", type: "json" },
      { name: "socialMedia", label: "Social Profile Handles (JSON)", type: "json" },
      {
        name: "certifications",
        label: "Affiliations / Certs",
        type: "array-string",
        defaultValue: [],
      },
      { name: "about", label: "About Us Narrative Block (JSON)", type: "json" },
      { name: "gstin", label: "GSTIN Number", type: "text", defaultValue: "" },
      { name: "messengerNumber", label: "Messenger Number / Link", type: "text", defaultValue: "" },
      {
        name: "googleAnalytics",
        label: "Google Analytics UA/G-ID",
        type: "text",
        defaultValue: "",
      },
      {
        name: "googleTagManager",
        label: "Google Tag Manager Container ID",
        type: "text",
        defaultValue: "",
      },
      { name: "latitude", label: "Office Latitude", type: "number" },
      { name: "longitude", label: "Office Longitude", type: "number" },
    ],
  },
  "destination-neighbours": {
    slug: "destination-neighbours",
    label: "Destination Neighbours",
    dbName: "DestinationNeighbour",
    icon: "Shuffle",
    displayColumns: ["destinationId", "neighbourId"],
    compositeKeys: ["destinationId", "neighbourId"],
    fields: [
      {
        name: "destinationId",
        label: "Source Destination",
        type: "select",
        required: true,
        relation: { table: "destinations", labelField: "name", valueField: "id" },
      },
      {
        name: "neighbourId",
        label: "Neighbour Destination",
        type: "select",
        required: true,
        relation: { table: "destinations", labelField: "name", valueField: "id" },
      },
    ],
  },
  "package-destinations": {
    slug: "package-destinations",
    label: "Package Destinations",
    dbName: "PackageDestination",
    icon: "Network",
    displayColumns: ["variantId", "destinationId", "sortOrder"],
    compositeKeys: ["variantId", "destinationId"],
    fields: [
      {
        name: "variantId",
        label: "Package Variant",
        type: "select",
        required: true,
        relation: { table: "package-variants", labelField: "label", valueField: "id" },
      },
      {
        name: "destinationId",
        label: "Target Destination",
        type: "select",
        required: true,
        relation: { table: "destinations", labelField: "name", valueField: "id" },
      },
      { name: "sortOrder", label: "Sort Order in Route", type: "number", defaultValue: 0 },
    ],
  },
  "package-categories": {
    slug: "package-categories",
    label: "Package Categories",
    dbName: "PackageCategory",
    icon: "Grid",
    displayColumns: ["packageId", "categoryId"],
    compositeKeys: ["packageId", "categoryId"],
    fields: [
      {
        name: "packageId",
        label: "Tour Package",
        type: "select",
        required: true,
        relation: { table: "packages", labelField: "name", valueField: "id" },
      },
      {
        name: "categoryId",
        label: "Category Tag",
        type: "select",
        required: true,
        relation: { table: "categories", labelField: "name", valueField: "id" },
      },
    ],
  },
  "package-attractions": {
    slug: "package-attractions",
    label: "Package Attractions",
    dbName: "PackageAttraction",
    icon: "MapPinned",
    displayColumns: ["variantId", "attractionId"],
    compositeKeys: ["variantId", "attractionId"],
    fields: [
      {
        name: "variantId",
        label: "Package Variant",
        type: "select",
        required: true,
        relation: { table: "package-variants", labelField: "label", valueField: "id" },
      },
      {
        name: "attractionId",
        label: "Attraction Location",
        type: "select",
        required: true,
        relation: { table: "attractions", labelField: "name", valueField: "id" },
      },
    ],
  },
  "system-status": {
    slug: "system-status",
    label: "System Status",
    dbName: "SystemStatus",
    icon: "Network",
    disableCreate: true,
    disableUpdate: true,
    disableDelete: true,
    disableSearch: true,
    displayColumns: [
      "id",
      "status",
      "lastPing",
      "websiteStatus",
      "apiStatus",
      "imagesStatus",
      "dbStatus",
    ],
    fields: [
      {
        name: "id",
        label: "ID (singleton)",
        type: "text",
        required: true,
        defaultValue: "singleton",
      },
      {
        name: "status",
        label: "Overall Status",
        type: "text",
        required: true,
        defaultValue: "healthy",
      },
      { name: "lastPing", label: "Last Ping", type: "datetime" },
      { name: "websiteStatus", label: "Website Status", type: "text", defaultValue: "up" },
      { name: "apiStatus", label: "API Status", type: "text", defaultValue: "up" },
      { name: "imagesStatus", label: "Images Status", type: "text", defaultValue: "up" },
      { name: "dbStatus", label: "Database Status", type: "text", defaultValue: "up" },
      { name: "metadata", label: "System Metrics Metadata (JSON)", type: "json" },
    ],
  },
};

/**
 * Helper to get the singular form of a table label.
 * Handles exceptions like 'Gallery' or plural endings like 'Categories'.
 */
export function getSingularLabel(label: string): string {
  if (!label) return "";
  const lower = label.toLowerCase();

  if (lower === "gallery") return "Gallery";
  if (lower === "system status") return "System Status";
  if (lower === "company") return "Company";

  // Plurals ending in -ies -> -y (e.g. Countries -> Country, Categories -> Category)
  if (label.endsWith("ies")) {
    return label.slice(0, -3) + "y";
  }

  // Preserve status endings
  if (label.endsWith("status") || label.endsWith("Status")) {
    return label;
  }

  // Standard s-stripping
  if (label.endsWith("s") || label.endsWith("S")) {
    return label.slice(0, -1);
  }

  return label;
}

/**
 * Helper to convert database/technical field names or raw labels
 * into short, friendly, and clean display names for UI columns/filters.
 */
export function getFriendlyLabel(name: string, fallbackLabel?: string): string {
  // Direct overrides for technical/boolean field names
  const mapping: Record<string, string> = {
    isDomestic: "Domestic",
    isFeatured: "Featured",
    isPopular: "Popular",
    isPinned: "Pinned",
    countryId: "Country",
    stateId: "State",
    destinationId: "Destination",
    categoryId: "Category",
    packageId: "Package",
    variantId: "Variant",
    attractionId: "Attraction",
    tourStyle: "Tour Style",
    currency: "Currency",
    currencyCode: "Currency",
    "Currency Code": "Currency",
    visaRequiredForIndians: "Visa Required",
    visaOnArrival: "Visa on Arrival",
    "Is Domestic": "Domestic",
    "Is Featured": "Featured",
    "Is Popular": "Popular",
  };

  if (mapping[name]) {
    return mapping[name];
  }

  // Use the fallback label (e.g. from schema config) if available, otherwise the raw name
  const source = fallbackLabel || name;

  // If the source has a custom mapping
  if (mapping[source]) {
    return mapping[source];
  }

  // Convert camelCase/PascalCase to spaced words
  let friendly = source
    .replace(/([A-Z])/g, " $1")
    .replace(/[-_]+/g, " ")
    .trim();

  // Strip prefixes like "Is " or "is " or "Has "
  if (friendly.toLowerCase().startsWith("is ")) {
    friendly = friendly.slice(3);
  } else if (friendly.toLowerCase().startsWith("has ")) {
    friendly = friendly.slice(4);
  }

  // Strip suffixes like " Id" or " id"
  if (friendly.toLowerCase().endsWith(" id")) {
    friendly = friendly.slice(0, -3);
  }

  // Capitalize first letter of each word
  friendly = friendly
    .split(/\s+/)
    .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
    .join(" ");

  return friendly;
}
