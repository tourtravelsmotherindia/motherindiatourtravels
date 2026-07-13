# Mother India Tour Travels — Data Management Guide (MANAGE.md)

Welcome to the data management guide for the Mother India Tour Travels administration panel. This document is a step-by-step manual to help you set up and configure geographical data, packages, variants, itineraries, categories, hero sliders, and company configurations.

---

## 1. Dependency Order: How to Add a New Tour Package

To ensure database relationships remain valid and database joins function properly, follow this exact step-by-step workflow when introducing a new tour package to the website.

### Step 1: Core Geography Setup

Before creating a package, its geographic locations must exist in the database:

1. **Add Country**: Go to **Countries** and create a record (e.g., _India_, _Nepal_).
2. **Add State**: Go to **States** and link it to the country (e.g., _Rajasthan_ linked to _India_). Required for domestic packages.
3. **Add Destination**: Go to **Destinations** and link it to the state/country (e.g., _Jaipur_ linked to _Rajasthan_, _India_).
4. **Add Attraction**: Go to **Attractions** and link it to its parent destination (e.g., _Hawa Mahal_ linked to _Jaipur_).

### Step 2: Create the Base Package

- Go to **Packages** and click **Create Record**.
- Select the Country and State.
- Provide general info (Overview, Highlights list, Inclusions/Exclusions list, SEO title, etc.).
- _Note: This represents the high-level tour topic, but doesn't have a price or duration yet._

### Step 3: Add Package Variants

- Go to **Package Variants** and click **Create Record**.
- Link it to the parent Package you created in Step 2.
- Configure specific options (Nights, Days, Base Price, Stay Type, etc.).
- _Note: Every package needs at least one variant._

### Step 4: Configure Itinerary Days

- Go to **Itinerary Days** and click **Create Record**.
- Select the Package Variant (shows as `[Package Name] - [Variant Label]`).
- Configure Day 1, Day 2, etc., detailing the day title and activities.

### Step 5: Connect Relations (Map & Categories)

- **Link Package to Destinations**: Go to **Package Destinations** and add a record connecting the Package Variant to the Destinations it stops in. Set the `sortOrder` (e.g. `1` for first city, `2` for second city) to render the routing line on the map.
- **Link Package to Categories**: Go to **Package Categories** and associate the Package with theme filters (e.g., _Classic_, _Heritage_, _Adventure_).
- **Link Package to Attractions**: Go to **Package Attractions** and select the attractions featured on this tour variant.

---

## 2. Key Terms & Concepts

### What is a Variant?

A **Package Variant** represents a specific duration and pricing tier for a package. Instead of creating three different packages for the same trip, you create one **Package** (e.g., _"Explore Rajasthan"_) and add multiple **Variants**:

- **3 Nights / 4 Days Classic** (Base price ₹15,000, 3-star stays)
- **5 Nights / 6 Days Deluxe** (Base price ₹25,000, 4-star stays, includes luxury car)

### What is a Category & How to Use It?

**Categories** represent themes or travel styles (e.g., _Classic_, _Heritage_, _Beach_, _Wildlife_, _Pilgrimage_, _Adventure_, _Honeymoon_).

- Go to **Categories** to manage titles and icons.
- Go to **Package Categories** to link a package to a theme. This powers the category sliders and tour filters on the public homepage.

---

## 3. How to Find Latitude and Longitude

Map coordinates are required for Countries, States, Destinations, and Attractions so they show up accurately on the interactive maps.

### Step-by-Step Instructions

1. Open **[Google Maps](https://maps.google.com)** in your web browser.
2. Search for the city, landmark, or attraction.
3. Locate the exact spot on the map and **Right-Click** (or long-press on mobile) on the pin.
4. A context menu will pop up showing the numeric coordinates at the top (e.g., `28.61393, 77.20902`).
5. **Left-Click** on the coordinates inside the menu to copy them directly to your clipboard.
6. Paste the values into the admin form:
   - The first number is the **Latitude** (e.g., `28.61393`).
   - The second number is the **Longitude** (e.g., `77.20902`).

---

## 4. How to Manage Attractions

### Adding an Attraction

1. Go to **Attractions** under _Core Geography_.
2. Click **Create Record**.
3. Fill in:
   - **Name**: (e.g., _Taj Mahal_)
   - **Slug**: (e.g., _taj-mahal_)
   - **Destination**: Select parent destination (e.g., _Agra_)
   - **Image**: Upload a representative picture.
   - **Latitude & Longitude**: (e.g., `27.1751, 78.0421`)
   - **Description**: Add history or sightseeing details.
   - **Sort Order**: Optional number to sequence attractions.

### Linking Attractions to a Package and Destination

- **To a Destination**: This is done automatically when you select the _Destination_ dropdown while creating/editing the Attraction.
- **To a Package**: Go to **Package Attractions** and create a record linking the **Package Variant** to the **Attraction**. This populates the list of sights you visit during that specific tour option.

---

## 5. How to Link Packages to Destinations

To display the route map and list of cities visited on a tour page, you must link the package to its destinations:

1. Go to **Package Destinations** under _Tour Packages_.
2. Click **Create Record**.
3. Choose:
   - **Package Variant**: Select the specific tour variant.
   - **Destination**: Choose the city visited.
   - **Sort Order**: Set `1` for the first city, `2` for the second, and so on. This orders the timeline route.

---

## 6. Itinerary Days Management

The itinerary details the day-by-day activities for a tour variant.

1. Go to **Itinerary Days** and click **Create Record**.
2. **Package Variant**: Choose the variant this day belongs to.
3. **Day Number**: Input the numeric day (e.g., `1`, `2`).
4. **Day Title**: Input a short summary (e.g., _"Arrival & Evening Shikara Ride"_).
5. **Day Activities**: Describe the sightseeing, routes, hotels, or meals included in detail.
6. **Sightseeing Images**: Upload photos highlighting the day's sights.

---

## 7. How Hero Slides & Config Work

The homepage hero banner is managed dynamically:

- **Hero Config (Singleton, ID = 1)**: Go to **Hero Configs** to edit the settings. Set the mode to:
  - `SLIDES` to show the image carousel.
  - `VIDEO` to play a full-screen background video (paste the link in `videoUrl`).
- **Hero Slides**: If mode is `SLIDES`, go to **Hero Slides** to add/remove slides. Configure:
  - **Slide Image**: Upload a high-resolution banner.
  - **Tag**: Small orange badge text (e.g., _Best Seller_).
  - **Title**: Large heading text.
  - **Description**: Subtext description.
  - **Sort Order**: Controls the slide sequence.

---

## 8. How Company Data Works

The **Company Details** record (Singleton, ID = 1) controls branding info across the website.
Instead of raw JSON formatting, the fields are managed using custom visual editors:

- **General Details**: Edit corporate phone numbers, primary email, office address, and WhatsApp contact fields directly.
- **Business Schedule**: A visual checklist where you select open business days and define time windows (e.g., Monday-Friday `09:00` to `20:00`).
- **Holiday Exceptions**: Add calendar dates, notes, and a toggle for "Closed All Day" to handle corporate holidays.
- **Social Media Profiles**: Enter handle links (Facebook, Instagram, LinkedIn, YouTube, WhatsApp, etc.) in dedicated fields.
- **About Us Narrative**: Multi-tab interface to configure:
  - _Header_: Brand badge, main title, introduction text, main image, and company statistics (e.g., _20+ Years Experience_).
  - _Mission & Vision & Strength_: Configure description text, checklist points, and collage accent images for each section.
  - _How We Work_: Heading, description, YouTube video URL, and overlay thumbnail image.
  - _Footer Narrative_: The brief description displayed in the website footer links block.
