import { prisma } from "../src/lib/db/prisma";

async function main() {
  console.log("Resetting and seeding modern blog categories and posts...");

  // 1. Clear old related packages and posts to avoid foreign key violations or stale links
  await prisma.blogPostPackage.deleteMany({});
  await prisma.blogPost.deleteMany({});
  await prisma.blogPostCategory.deleteMany({});

  // 2. Seed Categories
  const categoriesData = [
    { name: "Travel Tips & Planning", slug: "travel-tips-planning", sortOrder: 1 },
    { name: "Honeymoon & Couple Trips", slug: "honeymoon-couple-trips", sortOrder: 2 },
    { name: "Family Travel", slug: "family-travel", sortOrder: 3 },
    { name: "Adventure & Trekking", slug: "adventure-trekking", sortOrder: 4 },
    { name: "Pilgrimage & Spiritual Travel", slug: "pilgrimage-spiritual-travel", sortOrder: 5 },
    { name: "Food & Culture", slug: "food-culture", sortOrder: 6 },
    { name: "Offbeat & Hidden Gems", slug: "offbeat-hidden-gems", sortOrder: 7 },
    { name: "Travel Guides & Itineraries", slug: "travel-guides-itineraries", sortOrder: 8 },
  ];

  const categoriesMap: Record<string, string> = {};

  for (const cat of categoriesData) {
    const record = await prisma.blogPostCategory.create({
      data: { name: cat.name, slug: cat.slug, sortOrder: cat.sortOrder },
    });
    categoriesMap[cat.slug] = record.id;
  }
  console.log(`Seeded ${categoriesData.length} categories.`);

  // 3. Fetch some existing destinations & packages to relate to
  const munnar = await prisma.destination.findFirst({ where: { slug: "munnar" } });
  const leh = await prisma.destination.findFirst({ where: { slug: "leh" } });
  const jaipur = await prisma.destination.findFirst({ where: { slug: "jaipur" } });
  const kashmirDest = await prisma.destination.findFirst({ where: { slug: "srinagar" } });

  const keralaTours = await prisma.package.findFirst({ where: { slug: "kerala-tours" } });
  const rajasthanTours = await prisma.package.findFirst({ where: { slug: "rajasthan-tours" } });
  const varanasiSpiritual = await prisma.package.findFirst({
    where: { slug: "varanasi-spiritual" },
  });
  const kashmirTours = await prisma.package.findFirst({ where: { slug: "kashmir-tours" } });

  const defaultAuthorName = "Mother India Tour Travels";
  const defaultAuthorImage = "https://images.motherindiatourtravels.com/logo.png";

  // 4. Seed Blog Posts (Exactly 1 per category)
  const postsData = [
    {
      slug: "first-time-travel-planning",
      title: "First-Time Travel Planning: 10 Essential Steps for a Smooth Vacation",
      excerpt:
        "Planning your first big vacation can feel overwhelming. This step-by-step guide walks you through choosing destinations, managing budgets, and securing permits seamlessly.",
      coverImage:
        "https://images.unsplash.com/photo-1488646953014-85cb44e25828?auto=format&fit=crop&w=1200&q=80",
      readingTimeMinutes: 5,
      isPublished: true,
      isFeatured: true,
      tags: ["traveltips", "planning", "guide"],
      destinationId: null,
      categoryId: categoriesMap["travel-tips-planning"],
      seoTitle: "Ultimate Guide to First-Time Travel Planning | Travel Tips",
      seoDescription:
        "Step-by-step vacation planning guide covering budget checks, destination selection, and essential documentation checklist.",
      seoKeywords: ["travel planning", "first-time travel", "vacation tips", "trip checklist"],
      images: [
        "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=800&q=80",
      ],
      content: `## Essential Travel Planning

A successful trip begins long before you pack your bags. Proper planning minimizes stress and helps you make the absolute most of your time and resources.

Here is our step-by-step checklist to guide you through the process:

### 1. Set Your Travel Budget
Your budget dictates everything from your lodging categories to your daily meal options.
- **Flight and Transit Costs:** Usually represents the largest single expense.
- **Accommodation Preferences:** Decide between boutique hotels, standard guesthouses, or homestays.
- **Daily Spending Allowances:** Keep a separate emergency fund for unexpected transit changes.

### 2. Choose Your Destination
Pick a destination that aligns with your budget and interests.
- **Adventure Seekers:** Look at regions like Ladakh or Himachal Pradesh.
- **Leisure Travelers:** Consider the serene backwaters of Kerala or the beach getaways of Andaman.

### 3. Verify Permits and Logistics
Some restricted borders and forest reserve parks require special permissions.
- Ensure passport has at least 6 months validity for international packages.
- Apply for inner-line permits early for border areas.`,
      packageId: undefined,
    },
    {
      slug: "romantic-honeymoon-destinations",
      title: "Most Romantic Honeymoon Destinations in India: A Couples Guide",
      excerpt:
        "From the misty valleys of Munnar to the pristine beaches of Andaman, discover the most romantic places in India to begin your journey of togetherness.",
      coverImage:
        "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=1200&q=80",
      readingTimeMinutes: 6,
      isPublished: true,
      isFeatured: true,
      tags: ["honeymoon", "couples", "kerala", "romance"],
      destinationId: munnar?.id || null,
      categoryId: categoriesMap["honeymoon-couple-trips"],
      seoTitle: "Best Honeymoon Places in India | Couple Getaways",
      seoDescription:
        "Detailed guide on the top romantic destinations in India including Munnar, Srinagar, and Havelock Island.",
      seoKeywords: ["honeymoon india", "romantic places", "couples tour", "munnar honeymoon"],
      images: [
        "https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=800&q=80",
      ],
      content: `## Celebrating Love and Togetherness

Your honeymoon should be a relaxing escape filled with beautiful landscapes and private moments. India offers a stunning variety of romantic retreats.

### 1. Munnar: The Green Hills of Kerala
Surrounded by tea plantations and mist-covered valleys, Munnar is a favorite for honeymooners.
- Take a stroll through lush tea estates.
- Book a premium treehouse stay for a unique wilderness experience.

### 2. Srinagar: The Lake City of Kashmir
Experience old-world charm on Lake Pichola-style shikara rides and wooden houseboats.
- Enjoy a private shikara ride on Dal Lake.
- Walk hand-in-hand through the royal Mughal Gardens.

### 3. Havelock Island: The Tropical Paradise
Ideal for couples seeking blue waters and secluded beaches.
- Watch sunsets at Radhanagar Beach.
- Try couples scuba diving in crystal clear waters.`,
      packageId: keralaTours?.id,
    },
    {
      slug: "stress-free-family-travel",
      title: "How to Plan the Perfect Stress-Free Family Holiday in India",
      excerpt:
        "Travelling with kids and elderly parents requires a special balance of comfort and adventure. Here are our top tips for a smooth family trip.",
      coverImage:
        "https://images.unsplash.com/photo-1502086223501-7ea6ecd79368?auto=format&fit=crop&w=1200&q=80",
      readingTimeMinutes: 5,
      isPublished: true,
      isFeatured: false,
      tags: ["familytravel", "vacation", "tripplanning"],
      destinationId: null,
      categoryId: categoriesMap["family-travel"],
      seoTitle: "Family Travel Tips India | Multi-generational Holiday",
      seoDescription:
        "Learn how to plan a comfortable vacation with kids and elderly family members in India.",
      seoKeywords: [
        "family tour tips",
        "kids friendly travel",
        "elderly travel comfort",
        "family package",
      ],
      images: [],
      content: `## The Joy of Family Bonding

Taking a holiday with the entire family creates lasting memories. However, managing different age groups requires thoughtful choices in routes and lodging.

### 1. Focus on Comfort and Pace
Do not overcrowd the itinerary. Allow plenty of downtime for resting.
- Limit travel time between destinations to under 4 hours per day.
- Opt for direct flights or private charter cabs instead of multiple train transfers.

### 2. Choose Family-Friendly Stays
Look for hotels that offer spacious family suites and recreational activities.
- Multi-bedroom villas or interconnected rooms.
- Amenities like play areas for children and elevator access for grandparents.

### 3. Pack Smart and Carry Essentials
Always keep emergency medication and snacks handy.
- Pack a medical kit with prescriptions, rehydration salts, and band-aids.
- Keep healthy snacks ready to avoid mid-transit crankiness.`,
      packageId: undefined,
    },
    {
      slug: "top-trekking-routes",
      title: "Top Trekking Routes in Ladakh and Himachal: Adventure of a Lifetime",
      excerpt:
        "For those seeking the thrill of high passes and dramatic peaks, northern India offers world-class trekking. Discover the best trails for your next adventure.",
      coverImage:
        "https://images.unsplash.com/photo-1524492412937-b280b415be35?auto=format&fit=crop&w=1200&q=80",
      readingTimeMinutes: 7,
      isPublished: true,
      isFeatured: false,
      tags: ["trekking", "adventure", "himalayas", "ladakh"],
      destinationId: leh?.id || null,
      categoryId: categoriesMap["adventure-trekking"],
      seoTitle: "Best Himalayan Treks Ladakh & Himachal | Adventure Tours",
      seoDescription:
        "Complete guide to popular treks in North India including Markha Valley, Hampta Pass, and Beas Kund.",
      seoKeywords: ["himalayan trekking", "markha valley", "hampta pass", "ladakh adventure"],
      images: [
        "https://images.unsplash.com/photo-1506461883276-594a12b11db3?auto=format&fit=crop&w=800&q=80",
      ],
      content: `## The Call of the High Mountains

The Indian Himalayas are home to some of the most dramatic mountain trails in the world. Whether you are a beginner or an experienced mountaineer, there is a trail waiting for you.

### 1. Markha Valley Trek, Ladakh
Walk through cold alpine deserts and cross high mountain passes.
- **Duration:** 6-8 Days
- **Max Altitude:** 5,200 meters (Kongmaru La)
- **Highlight:** Homestays in remote Ladakhi villages.

### 2. Hampta Pass Trek, Himachal Pradesh
A trek of contrast, moving from lush green valleys of Kullu to the stark landscapes of Spiti.
- **Duration:** 5 Days
- **Max Altitude:** 4,270 meters
- **Highlight:** Camping by Chandratal (Moon Lake).

### 3. Essential Adventure Guidelines
- Allow at least 2 full days in Leh for acclimatization before commencing a trek.
- Hire local certified guides and support teams.`,
      packageId: undefined,
    },
    {
      slug: "spiritual-journeys-ganges",
      title: "Spiritual Journeys: Exploring Varanasi, Ayodhya, and Prayagraj",
      excerpt:
        "India's spiritual heartland along the sacred Ganges river offers deep cultural insights. Learn how to plan a meaningful pilgrimage through Varanasi and Ayodhya.",
      coverImage:
        "https://images.unsplash.com/photo-1561361513-2d000a50f0db?auto=format&fit=crop&w=1200&q=80",
      readingTimeMinutes: 6,
      isPublished: true,
      isFeatured: true,
      tags: ["spiritual", "varanasi", "ayodhya", "pilgrimage"],
      destinationId: null,
      categoryId: categoriesMap["pilgrimage-spiritual-travel"],
      seoTitle: "Varanasi Ayodhya Pilgrimage Guide | Spiritual India",
      seoDescription:
        "Step-by-step spiritual guide to the holy cities of Uttar Pradesh: Varanasi Ganga Aarti, Ayodhya Ram Temple, and Prayagraj Sangam.",
      seoKeywords: ["varanasi pilgrimage", "ayodhya tour", "prayagraj sangam", "spiritual india"],
      images: [],
      content: `## Journeying into the Heart of Faith

A spiritual tour along the Ganges offers a profound experience of ancient rituals, temples, and sacred rivers.

### 1. Varanasi: The Eternal City
Varanasi, or Kashi, is one of the oldest continuously inhabited cities in the world.
- Witness the evening Ganga Aarti at Dashashwamedh Ghat.
- Take a sunrise boat ride to observe morning prayers along the ghats.
- Visit the historic Kashi Vishwanath Temple.

### 2. Ayodhya: The Birthplace of Lord Ram
A city steeped in mythology, sitting on the banks of the holy Saryu River.
- Visit the newly constructed grand Ram Mandir.
- Explore Hanumangarhi Temple and Kanak Bhawan.

### 3. Prayagraj: The Holy Confluence
Known for the Triveni Sangam, the confluence of three rivers: Ganges, Yamuna, and the mythical Saraswati.
- Take a boat ride to the Sangam point for a holy bath.
- Visit the Prayagraj Fort built by Akbar.`,
      packageId: varanasiSpiritual?.id,
    },
    {
      slug: "culinary-heritage-rajasthan",
      title: "The Culinary Heritage of Rajasthan: A Food Lover's Journey",
      excerpt:
        "Explore the rich flavors and traditional spices of Rajasthani cuisine, from the iconic Dal Baati Churma to royal delicacies in Jaipur and Udaipur.",
      coverImage:
        "https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=1200&q=80",
      readingTimeMinutes: 5,
      isPublished: true,
      isFeatured: false,
      tags: ["rajasthan", "food", "cuisine", "culture"],
      destinationId: jaipur?.id || null,
      categoryId: categoriesMap["food-culture"],
      seoTitle: "Rajasthani Food & Culture Guide | Foodie Tours",
      seoDescription:
        "Discover the royal cuisine of Rajasthan including Jaipur street food, traditional spices, and sweet dishes.",
      seoKeywords: ["rajasthan food", "dal baati churma", "jaipur cuisine", "indian spices"],
      images: [
        "https://images.unsplash.com/photo-1603262110263-fb0112e7cc33?auto=format&fit=crop&w=800&q=80",
      ],
      content: `## A Royal Feast of Flavors

Rajasthani cuisine has been shaped by the arid climate of the desert and the royal lifestyles of the Rajput rulers. The food is rich, spicy, and full of character.

### 1. The Staple: Dal Baati Churma
No Rajasthani meal is complete without this iconic dish.
- **Baati:** Baked wheat balls, soaked in pure ghee.
- **Dal:** A mix of lentils cooked with authentic spices.
- **Churma:** Crushed wheat sweetened with jaggery or sugar.

### 2. Non-Vegetarian Royal Delicacies
Historically enjoyed by Kings after hunting trips.
- **Laal Maas:** A fiery lamb curry cooked with mathania red chilies.
- **Safed Maas:** A delicate meat dish prepared in a white curd and cashew gravy.

### 3. Desert Sweets
Indulge in sweet delicacies prepared with pure ghee.
- **Ghevar:** A disc-shaped sweet cake popular during festivals.
- **Mawa Kachori:** A crisp pastry shell filled with sweetened milk solids.`,
      packageId: rajasthanTours?.id,
    },
    {
      slug: "offbeat-north-east-gems",
      title: "Offbeat Destinations in North-East India: Explore the Unexplored",
      excerpt:
        "Escape the tourist crowds to discover hidden waterfalls, living root bridges, and pristine valleys in Meghalaya and Sikkim.",
      coverImage:
        "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1200&q=80",
      readingTimeMinutes: 6,
      isPublished: true,
      isFeatured: false,
      tags: ["northeast", "offbeat", "meghalaya", "sikkim"],
      destinationId: null,
      categoryId: categoriesMap["offbeat-hidden-gems"],
      seoTitle: "Offbeat North East India Destinations | Hidden Gems",
      seoDescription:
        "Complete travel guide to unexplored spots in Meghalaya, Sikkim, and Arunachal Pradesh.",
      seoKeywords: [
        "offbeat northeast",
        "living root bridges",
        "hidden waterfalls",
        "sikkim offbeat",
      ],
      images: [],
      content: `## Step into Pristine Nature

North-East India is a sanctuary of dense forests, biological diversity, and unique indigenous tribes.

### 1. Mawlynnong, Meghalaya
Often referred to as the cleanest village in Asia.
- Walk on double-decker living root bridges.
- Climb skywalks for a view across the Bangladesh border plains.

### 2. Ziro Valley, Arunachal Pradesh
A gorgeous pine-clad valley inhabited by the unique Apatani tribe.
- Visit terraced paddy fields.
- Witness the famous Ziro Music Festival during September.

### 3. Ravangla, Sikkim
A tranquil town in South Sikkim known for its panoramic mountain vistas.
- Visit the Tathagata Tsal (Buddha Park) featuring a massive 130-foot statue.
- Soak in local natural hot springs.`,
      packageId: undefined,
    },
    {
      slug: "kashmir-valley-escape-itinerary",
      title: "Kashmir Valley Escape: The Perfect 6-Day Tour Itinerary",
      excerpt:
        "A detailed day-by-day travel guide to exploring Srinagar, Gulmarg, and Pahalgam, including Shikara rides and sightseeing tips.",
      coverImage:
        "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=1200&q=80",
      readingTimeMinutes: 7,
      isPublished: true,
      isFeatured: true,
      tags: ["kashmir", "itinerary", "srinagar", "gulmarg"],
      destinationId: kashmirDest?.id || null,
      categoryId: categoriesMap["travel-guides-itineraries"],
      seoTitle: "Kashmir 6 Days Travel Itinerary | Srinagar Gulmarg Tour",
      seoDescription:
        "Plan the perfect 6-day holiday in Kashmir Valley covering Srinagar houseboat stays, Gulmarg gondola rides, and Pahalgam sightseeing.",
      seoKeywords: [
        "kashmir itinerary",
        "srinagar tour plan",
        "gulmarg gondola",
        "pahalgam valley",
      ],
      images: [
        "https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=800&q=80",
      ],
      content: `## A Journey to Paradise on Earth

This 6-day travel itinerary offers a complete guide to experiencing the beauty of Jammu & Kashmir.

### Day 1: Arrival in Srinagar & Dal Lake Cruise
Welcome to the Summer Capital of Kashmir.
- Arrive at Srinagar airport and check-in to a traditional wooden houseboat on Dal Lake.
- Enjoy a relaxing 2-hour sunset Shikara ride, visiting floating markets and gardens.

### Day 2: Srinagar Mughal Gardens & Old City
Explore the architecture of the Mughal Era.
- Visit Shalimar Bagh and Nishat Bagh built along the shores of Dal Lake.
- Walk through the historical Shankaracharya Temple on the hill top.

### Day 3: Excursion to Gulmarg (Meadow of Flowers)
Gulmarg is famous for its rolling green meadows in summer and ski slopes in winter.
- Experience the Phase 1 & Phase 2 Gondola (cable car) ride up to 13,000 feet.
- Enjoy horse riding in the alpine valleys.

### Day 4: Drive to Pahalgam (Valley of Shepherds)
A scenic 3-hour drive passing through saffron fields and along the Lidder River.
- Visit Betaab Valley, named after the famous Bollywood movie Betaab.
- Explore Aru Valley, a base for many scenic treks.

### Day 5: Pahalgam Sightseeing & Return to Srinagar
Spend a quiet morning in Pahalgam before returning.
- Walk along the banks of Lidder River.
- Return to Srinagar for local souvenir shopping.

### Day 6: Departure from Srinagar
Check out and transfer to Srinagar airport for departure.`,
      packageId: kashmirTours?.id,
    },
  ];

  for (const post of postsData) {
    const { packageId, ...postFields } = post;
    const record = await prisma.blogPost.create({
      data: {
        ...postFields,
        authorName: defaultAuthorName,
        authorImage: defaultAuthorImage,
        publishedAt: new Date(),
      },
    });

    console.log(`Created blog post: ${record.title}`);

    // Relate to package if applicable
    if (packageId) {
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
