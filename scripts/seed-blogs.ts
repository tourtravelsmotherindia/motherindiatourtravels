import { prisma } from "../src/lib/db/prisma";

async function main() {
  console.log("Seeding modern blog categories and posts...");

  // 1. Seed Categories
  const categoriesData = [
    { name: "Newsletter", slug: "newsletter", sortOrder: 1 },
    { name: "Tips", slug: "tips", sortOrder: 2 },
    { name: "Insight", slug: "insight", sortOrder: 3 },
    { name: "Success Stories", slug: "success-stories", sortOrder: 4 },
  ];

  const categoriesMap: Record<string, string> = {};

  for (const cat of categoriesData) {
    const record = await prisma.blogPostCategory.upsert({
      where: { slug: cat.slug },
      update: { name: cat.name, sortOrder: cat.sortOrder },
      create: { name: cat.name, slug: cat.slug, sortOrder: cat.sortOrder },
    });
    categoriesMap[cat.slug] = record.id;
    console.log(`Upserted category: ${record.name} (${record.id})`);
  }

  // 2. Fetch some existing destinations & packages to relate to
  const munnar = await prisma.destination.findFirst({ where: { slug: "munnar" } });
  const leh = await prisma.destination.findFirst({ where: { slug: "leh" } });
  const jaipur = await prisma.destination.findFirst({ where: { slug: "jaipur" } });

  const keralaTours = await prisma.package.findFirst({ where: { slug: "kerala-tours" } });
  const rajasthanTours = await prisma.package.findFirst({ where: { slug: "rajasthan-tours" } });

  // 3. Seed Blog Posts
  const postsData = [
    {
      slug: "kerala-houseboat-guide",
      title: "Kerala Backwaters Houseboat Stay: The Ultimate Guide",
      excerpt:
        "Floating along the palm-fringed canals of Alleppey and Kumarakom in a traditional Kettuvallam is a once-in-a-lifetime experience. Here is everything you need to know.",
      coverImage:
        "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=1200&q=80",
      authorName: "Sneha Iyer",
      authorImage:
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=100&q=80",
      readingTimeMinutes: 6,
      isPublished: true,
      isFeatured: true,
      tags: ["kerala", "houseboat", "backwaters", "travelguide"],
      destinationId: munnar?.id || null,
      categoryId: categoriesMap["tips"],
      seoTitle: "Alleppey Houseboat Booking Guide | Kerala Backwaters",
      seoDescription:
        "Learn how to choose the right houseboat, best routes, seasonal pricing, and essential tips for staying in a Kerala Kettuvallam houseboat.",
      seoKeywords: [
        "kerala houseboat",
        "alleppey houseboats",
        "kerala tourism",
        "kettuvallam stay",
      ],
      images: [
        "https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=800&q=80",
        "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=800&q=80",
      ],
      content: `## The Charm of the Kerala Backwaters

The backwaters of Kerala are a network of brackish lagoons, lakes, canals, and rivers that lie parallel to the Arabian Sea coast. Floating along these calm waters in a traditional **Kettuvallam** (houseboat) is the quintessential Kerala experience, offering a glimpse into rural life, coconut groves, and lush paddy fields.

Historically, these houseboats were used to carry rice and spices. Today, they are designed as floating luxury suites, complete with air-conditioned bedrooms, private bathrooms, and a personal chef who cooks traditional Kerala meals on board.

## How to Choose the Right Houseboat

When planning your stay, you will find options ranging from basic to premium. Here are key factors to consider:

1. **Size and Capacity:** Houseboats range from single-bedroom boats for couples to multi-bedroom boats (up to 10 rooms) for large groups.
2. **Air Conditioning:** Standard houseboats run AC only during the night (9:00 PM to 6:00 AM). If you want full-time AC, ensure you book a **Premium** or **Luxury** category boat.
3. **Route Options:** The most popular route is Alleppey (Alappuzha) round-trip, but Kumarakom round-trip is quieter and ideal for couples.

## Best Time to Visit

The best season to enjoy a houseboat stay is from **October to March** when the weather is pleasant and dry. The monsoon months (June to September) offer lush green surroundings but can disrupt cruise schedules due to heavy rainfall.

## What is Included in Your Stay?

A standard houseboat booking includes:
- A full-day cruise from 12:00 PM to 5:30 PM and next morning 8:00 AM to 9:00 AM.
- Overnight stay on the boat parked by the canal bank.
- All meals: Welcome drink, lunch (including traditional pearl spot fish fry), evening tea with snacks, and dinner.

Book your tour in advance during peak season to secure the best boat handlers.`,
      packageId: keralaTours?.id,
    },
    {
      slug: "rajasthan-journey-guide",
      title: "Unforgettable Rajasthan: A Journey through Jaipur and Udaipur",
      excerpt:
        "Step back in time to explore the grand palaces, majestic forts, and scenic lakes of India's royal state. A complete journey guide through Jaipur and Udaipur.",
      coverImage:
        "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?auto=format&fit=crop&w=1200&q=80",
      authorName: "Rohan Verma",
      authorImage:
        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=100&q=80",
      readingTimeMinutes: 8,
      isPublished: true,
      isFeatured: true,
      tags: ["rajasthan", "jaipur", "udaipur", "heritage", "palaces"],
      destinationId: jaipur?.id || null,
      categoryId: categoriesMap["insight"],
      seoTitle: "Jaipur & Udaipur Tour Guide | Heritage Rajasthan",
      seoDescription:
        "Explore the ultimate itinerary for Rajasthan's two finest cities: the Pink City of Jaipur and the Lake City of Udaipur.",
      seoKeywords: ["rajasthan tours", "jaipur palaces", "udaipur lakes", "royal heritage india"],
      images: [
        "https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=800&q=80",
        "https://images.unsplash.com/photo-1603262110263-fb0112e7cc33?auto=format&fit=crop&w=800&q=80",
      ],
      content: `## The Magic of Royal Rajasthan

Rajasthan is a land where grand history, vibrant culture, and timeless architecture merge. For travelers seeking to experience the heritage of India, the combination of **Jaipur (The Pink City)** and **Udaipur (The City of Lakes)** offers a perfect introduction.

From massive hilltop fortresses to floating white marble palaces, this route showcases the diversity of Rajput architecture and the warmth of Rajasthani hospitality.

## Discovering the Pink City: Jaipur

Jaipur, the capital of Rajasthan, was founded by Maharaja Sawai Jai Singh II. It is famous for its symmetrically planned streets and terracotta-pink buildings.

### Top Places to Visit in Jaipur:
- **Amber Fort:** A majestic fortress located on a hill in Amer. Don't miss the Sheesh Mahal (Mirror Palace) inside.
- **Hawa Mahal:** The iconic Palace of Winds, with its intricate honeycomb facade designed for royal ladies to view street life.
- **City Palace:** A gorgeous blend of Rajasthani and Mughal architecture, still serving as the residence of the royal family.

## The Romance of the Lakes: Udaipur

Often called the 'Venice of the East', Udaipur is built around a series of serene artificial lakes. It is surrounded by the purple ridges of the Aravalli Hills.

### Top Places to Visit in Udaipur:
- **Lake Pichola:** Take a sunset boat ride to view the Jag Mandir Palace and the floating Lake Palace.
- **City Palace Complex:** The largest palace complex in Rajasthan, offering panoramic views of the entire lake and city.
- **Saheliyon-ki-Bari:** A beautiful garden featuring lotus pools, marble pavilions, and cascading fountains.

## Travel Tips for Rajasthan

- **Ideal Duration:** 6 to 8 days is recommended to cover both cities comfortably.
- **Getting Around:** You can hire a private air-conditioned cab for intercity travel (approx. 7 hours drive between Jaipur and Udaipur via Chittorgarh).
- **Local Cuisine:** Try Dal Baati Churma, Gatte ki Sabzi, and Laal Maas.`,
      packageId: rajasthanTours?.id,
    },
    {
      slug: "leh-ladakh-tips",
      title: "Leh Ladakh: Essential Travel Tips for First-Timers",
      excerpt:
        "Planning a road trip to the land of high passes? Here is your go-to guide on acclimatization, inner line permits, and packing list for Ladakh.",
      coverImage:
        "https://images.unsplash.com/photo-1506461883276-594a12b11db3?auto=format&fit=crop&w=1200&q=80",
      authorName: "Aarav Sharma",
      authorImage:
        "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80",
      readingTimeMinutes: 7,
      isPublished: true,
      isFeatured: false,
      tags: ["ladakh", "leh", "adventure", "roadtrip"],
      destinationId: leh?.id || null,
      categoryId: categoriesMap["tips"],
      seoTitle: "Leh Ladakh Travel Guide for First-Timers | Ladakh Tips",
      seoDescription:
        "Everything you need to know before visiting Ladakh: altitude sickness prevention, ILP permit procedures, best routes, and packing essentials.",
      seoKeywords: [
        "ladakh travel tips",
        "leh travel guide",
        "altitude sickness ladakh",
        "inner line permits leh",
      ],
      images: [
        "https://images.unsplash.com/photo-1524492412937-b280b415be35?auto=format&fit=crop&w=800&q=80",
      ],
      content: `## The Mystique of Ladakh

Leh Ladakh is a desert land of stark mountains, cold winds, and turquoise high-altitude lakes. Located at over 11,000 feet above sea level, it is a dream destination for adventure seekers, photographers, and nature lovers.

However, Ladakh's unique terrain and high altitude demand careful planning. Here are essential tips to ensure a safe and memorable journey.

## Acclimatization: The Most Critical Step

Altitude sickness (Acute Mountain Sickness or AMS) is a very real concern in Ladakh.
- **Rule of Thumb:** Rest completely for the first 24 to 36 hours after landing in Leh. Do not plan any sightseeing or travel to higher passes (like Khardung La or Pangong Lake) on day 1.
- **Hydration:** Drink plenty of water, coconut water, or ORS. Avoid alcohol and smoking.
- **Medication:** Consult a doctor before starting a preventive course of Acetazolamide (Diamox).

## Required Permits (Inner Line Permits)

Certain areas in Ladakh (including Pangong Tso, Nubra Valley, Tso Moriri, and Khardung La) lie close to international borders and require an **Inner Line Permit (ILP)**.
- **How to apply:** You can apply online through the official LAHDC portal or ask your travel agent to arrange it in Leh.
- **Documents:** Carry multiple physical photocopies of your government ID card (Aadhaar, Passport, or DL) and the approved permit to submit at military checkpoints.

## Key Packing Essentials

Ladakh's weather is highly unpredictable. It can be hot under direct sunlight and freezing in the shade.
- **Layering:** Pack light woolens, thermals, windcheaters, and a heavy jacket.
- **Sun Protection:** High SPF sunscreen (SPF 50+), UV-protective sunglasses, lip balm, and a sun hat.
- **First Aid:** Carry basic medicines for headache, nausea, cold, motion sickness, and a small oxygen canister if traveling with elderly family members.`,
      packageId: undefined,
    },
  ];

  for (const post of postsData) {
    const { packageId, ...postFields } = post;
    const record = await prisma.blogPost.upsert({
      where: { slug: post.slug },
      update: {
        title: post.title,
        excerpt: post.excerpt,
        content: post.content,
        coverImage: post.coverImage,
        authorName: post.authorName,
        authorImage: post.authorImage,
        readingTimeMinutes: post.readingTimeMinutes,
        isPublished: post.isPublished,
        isFeatured: post.isFeatured,
        tags: post.tags,
        destinationId: post.destinationId,
        categoryId: post.categoryId,
        seoTitle: post.seoTitle,
        seoDescription: post.seoDescription,
        seoKeywords: post.seoKeywords,
        images: post.images,
        publishedAt: new Date(),
      },
      create: {
        ...postFields,
        publishedAt: new Date(),
      },
    });

    console.log(`Upserted blog post: ${record.title}`);

    // Relate to package if applicable
    if (packageId) {
      // Clear old packages first
      await prisma.blogPostPackage.deleteMany({
        where: { blogPostId: record.id },
      });
      // Link
      await prisma.blogPostPackage.create({
        data: {
          blogPostId: record.id,
          packageId: packageId,
        },
      });
      console.log(`Linked post to package: ${packageId}`);
    }
  }

  console.log("\nSeeding complete!");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
