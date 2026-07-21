-- =============================================================
-- Mother India Tour Travels — Complete Seed File
-- Generated: 2026-07-19T13:43:23.573Z
-- =============================================================

-- =============================================================
-- NON-PACKAGE DATA (Company, Hero, FAQ, Testimonials, etc.)
-- Preserved from original seed.sql (git HEAD)
-- =============================================================

-- =============================================================
-- Mother India Tour Travels — Modern Seed Data v2.0
-- Schema: PostgreSQL / Prisma v7 / Supabase
-- =============================================================

-- ─────────────────────────────────────────────
-- COMPANY (singleton id=1)
-- ─────────────────────────────────────────────
INSERT INTO "Company" (
  "id", "name", "tagline", "website", "phones", "email", "address",
  "whatsappNumber", "timezone", "schedule", "exceptions", "socialMedia",
  "certifications", "about", "googleAnalytics", "googleTagManager",
  "latitude", "longitude", "gstin", "messengerNumber", "updatedAt"
) VALUES (
  1,
  'Mother India Tour Travels',
  'Explore India with Trusted Tours',
  'https://www.motherindiatourtravels.com',
  ARRAY['+919810140121', '+919971053881'],
  'tourtravelsmotherindia@gmail.com',
  'B63/B63A, New Jankipuri, Uttam Nagar, New Delhi - 110059',
  '9810140121',
  'Asia/Kolkata',
  '[{"days":["mon","tue","wed","thu","fri"],"hours":[{"open":"09:00","close":"20:00"}]},{"days":["sat","sun"],"hours":[{"open":"09:00","close":"20:00"}]}]'::json,
  '[]'::json,
  '{"facebook":"https://www.facebook.com/driverandcarhire","instagram":"https://www.instagram.com/tour_operator_delhi/","twitter":"https://x.com/TravelsZ","linkedin":"https://www.linkedin.com/in/mother-india-tour-travels-b691b122/","pinterest":"https://in.pinterest.com/Mother_India_Tour_Delhi1/","whatsapp":"https://wa.me/9810140121"}'::json,
  ARRAY['MSME Certified', 'ISO 9001:2015'],
  '{"footer":"Mother India Tour Travels is a trusted tour and travel agency based in Delhi, India. We specialize in customized domestic and international tour packages for individuals, families, and groups. With years of experience, we have served thousands of satisfied customers from around the world.","header":{"badge":"MOTHER INDIA • DISCOVER • EXPLORE • EXPERIENCE","title":"Crafting Unforgettable Journeys Together","description":"At Mother India Tour Travels, we believe in the magic of exploration and the power of personalized travel. With a dedicated team of tourism experts and a deep commitment to excellence, we curate tours that bring your dream vacations to life.","image":"https://motherindiatourtravels.com/assests/about.jpeg","introText":"We have vast experience in the Tour and Travel Industry. With a corporate vision and mission reflected in our goals, we have developed a respected position by delivering customized solutions for the specific travel needs of our clients.","stats":[{"value":"20+","label":"Years Experience"},{"value":"10k+","label":"Happy Travelers"},{"value":"500+","label":"Corporate & School Groups"},{"value":"50+","label":"Indian Destinations"}]},"mission":{"title":"Our Mission","description":"We are committed to establishing a brand quality that is trusted. We provide reliable and quality travel solutions to meet all implied needs of our clients and achieve client satisfaction through highly motivated workforce involvement and a quality management system.","items":["Establishing Brand Quality & Trust","Exceeding Client Expectations at Every Step","Authentic Travel Experiences Across India","Continuous Workforce Growth & Development"],"images":["https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=800&q=80","https://images.unsplash.com/photo-1501555088652-021faa106b9b?auto=format&fit=crop&w=600&q=80"]},"vision":{"title":"Our Vision","description":"We seek a client-oriented organization that demonstrates care, anticipation of client needs, attention to detail, distinctive excellence, and client support with care and clarity.","items":["Anticipating and Exceeding Traveler Needs","Pioneering Sustainable & Green Tourism in India","Empowering Local Communities via Travel","Integrating User-Friendly Booking Technology"],"images":["https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80","https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?auto=format&fit=crop&w=600&q=80"]},"history":{"title":"Our Strength & Team","description":"Supported by a dedicated team of experts including tourism experts, quality controllers, R&D personnel, tour planners, ticketing agents, travel guides, and drivers.","items":["Competitive Prices & No Hidden Charges","Highly Experienced Tour Planners & Guides","Best Transport & Quality Hotel Services","24/7 Ground Coordination & Care"],"images":["https://images.unsplash.com/photo-1605649487212-47bdab064df7?auto=format&fit=crop&w=800&q=80","https://images.unsplash.com/photo-1506461883276-594a12b11db3?auto=format&fit=crop&w=600&q=80"]},"howWeWork":{"title":"How We Do Work","subtitle":"Being a quality-oriented organization, we provide a wide array of high-standard services following the guidelines of the travel industry.","videoImage":"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1200&q=80","videoUrl":"https://www.youtube.com/watch?v=BbrdQLqGUp0"}}'::json,
  'G-9R0JL5K333',
  'GTM-W225BT8G',
  28.61017854877562,
  77.0760841189022,
  '07ADZPL9107F1Z3',
  'https://www.messenger.com/e2ee/t/9661855783930883',
  NOW()
) ON CONFLICT ("id") DO UPDATE SET
  "name" = EXCLUDED."name", "tagline" = EXCLUDED."tagline",
  "website" = EXCLUDED."website", "phones" = EXCLUDED."phones",
  "email" = EXCLUDED."email", "address" = EXCLUDED."address",
  "whatsappNumber" = EXCLUDED."whatsappNumber", "timezone" = EXCLUDED."timezone",
  "schedule" = EXCLUDED."schedule", "exceptions" = EXCLUDED."exceptions",
  "socialMedia" = EXCLUDED."socialMedia", "certifications" = EXCLUDED."certifications",
  "about" = EXCLUDED."about", "googleAnalytics" = EXCLUDED."googleAnalytics",
  "googleTagManager" = EXCLUDED."googleTagManager",
  "latitude" = EXCLUDED."latitude", "longitude" = EXCLUDED."longitude",
  "gstin" = EXCLUDED."gstin", "messengerNumber" = EXCLUDED."messengerNumber",
  "updatedAt" = NOW();

-- ─────────────────────────────────────────────
-- COUNTRIES (All UN member states + key travel countries)
-- ─────────────────────────────────────────────
INSERT INTO "Country" ("id","name","slug","continent","isDomestic","isFeatured","capital","currency","languages","visaRequiredForIndians","visaOnArrival","description","seoTitle","seoDescription","image","latitude","longitude","createdAt","updatedAt") VALUES
-- Asia (featured travel destinations for Indian tourists)
(gen_random_uuid(), 'India', 'india', 'Asia', TRUE, TRUE, 'New Delhi', 'INR', ARRAY['Hindi','English'], FALSE, FALSE, 'India is a land of incredible diversity – ancient temples, Himalayan peaks, tropical beaches, and a 5000-year-old civilization.', 'India Tour Packages | Domestic Holiday Packages | Best India Tours', 'Explore India with Mother India Tour Travels. Best domestic tour packages for Delhi, Agra, Jaipur, Kerala, Kashmir, Goa and more.', 'https://img.freepik.com/free-photo/india-gate-new-delhi-india_1268-17497.jpg', 20.5937, 78.9629, NOW(), NOW()),
(gen_random_uuid(), 'Nepal', 'nepal', 'Asia', FALSE, TRUE, 'Kathmandu', 'NPR', ARRAY['Nepali'], FALSE, FALSE, 'Nepal is the land of Himalayas, home to 8 of the world''s 10 highest mountains including Mount Everest. A paradise for trekkers and spiritual seekers.', 'Nepal Tour Packages | Himalayan Holiday | Kathmandu Pokhara Tours', 'Best Nepal tour packages from India. Explore Kathmandu, Pokhara, Himalayan treks and spiritual sites. Book with Mother India Tour Travels.', '', 28.3949, 84.124, NOW(), NOW()),
(gen_random_uuid(), 'Bhutan', 'bhutan', 'Asia', FALSE, FALSE, 'Thimphu', 'BTN', ARRAY['Dzongkha'], FALSE, FALSE, 'Bhutan, the Land of the Thunder Dragon, is a Himalayan kingdom known for happiness, monasteries, and pristine nature.', 'Bhutan Tour Packages | Land of Thunder Dragon | Himalayan Kingdom', 'Book Bhutan tour packages. Experience dzongs, monasteries and scenic Himalayas with Mother India Tour Travels.', '', 27.5142, 90.4336, NOW(), NOW()),
(gen_random_uuid(), 'Sri Lanka', 'sri-lanka', 'Asia', FALSE, FALSE, 'Sri Jayawardenepura Kotte', 'LKR', ARRAY['Sinhala','Tamil'], FALSE, FALSE, 'Sri Lanka, the Pearl of the Indian Ocean, offers ancient ruins, golden beaches, lush tea hills, and wildlife safaris.', 'Sri Lanka Tour Packages | Ceylon Holiday | Beach & Heritage Tours', 'Best Sri Lanka tour packages from India. Colombo, Kandy, Galle and more. Book with Mother India Tour Travels.', '', 7.8731, 80.7718, NOW(), NOW()),
(gen_random_uuid(), 'Thailand', 'thailand', 'Asia', FALSE, TRUE, 'Bangkok', 'THB', ARRAY['Thai'], TRUE, TRUE, 'Thailand is the Land of Smiles offering golden temples, tropical islands, elephant sanctuaries, and vibrant street food.', 'Thailand Tour Packages from India | Bangkok Pattaya Phuket Tours', 'Best Thailand tour packages from India. Explore Bangkok, Pattaya, Phuket. Affordable international tours by Mother India Tour Travels.', '', 15.87, 100.9925, NOW(), NOW()),
(gen_random_uuid(), 'Malaysia', 'malaysia', 'Asia', FALSE, TRUE, 'Kuala Lumpur', 'MYR', ARRAY['Malay','English'], TRUE, TRUE, 'Malaysia is a multi-cultural gem offering modern cities, pristine rainforests, stunning beaches, and world-class cuisine.', 'Malaysia Tour Packages from India | Kuala Lumpur Genting Tours', 'Best Malaysia tour packages from India. Explore Kuala Lumpur, Petronas Towers, Batu Caves. Book with Mother India Tour Travels.', '', 4.2105, 101.9758, NOW(), NOW()),
(gen_random_uuid(), 'Singapore', 'singapore', 'Asia', FALSE, FALSE, 'Singapore', 'SGD', ARRAY['English','Mandarin','Malay','Tamil'], TRUE, FALSE, 'Singapore is a vibrant city-state known for its futuristic skyline, Gardens by the Bay, universal studios, and incredible street food.', 'Singapore Tour Packages | Best Singapore Holiday Deals', 'Book Singapore tour packages from India. Explore Gardens by the Bay, Sentosa, Universal Studios. Book with Mother India Tour Travels.', '', 1.3521, 103.8198, NOW(), NOW()),
(gen_random_uuid(), 'UAE', 'uae', 'Asia', FALSE, TRUE, 'Abu Dhabi', 'AED', ARRAY['Arabic','English'], TRUE, FALSE, 'UAE is a land of luxury and innovation. From the world''s tallest building to golden deserts, UAE offers a unique blend of tradition and modernity.', 'Dubai UAE Tour Packages from India | Best Dubai Deals', 'Best Dubai UAE tour packages from India. Burj Khalifa, Desert Safari, Palm Jumeirah. Book with Mother India Tour Travels.', '', 24.4667, 54.3667, NOW(), NOW()),
(gen_random_uuid(), 'Maldives', 'maldives', 'Asia', FALSE, FALSE, 'Malé', 'MVR', ARRAY['Dhivehi'], FALSE, TRUE, 'The Maldives is a tropical paradise of pristine white-sand beaches, crystal-clear waters, and world-class overwater bungalows.', 'Maldives Tour Packages | Overwater Bungalow | Honeymoon Deals', 'Best Maldives tour packages from India. Overwater bungalows, beach resorts and diving. Book with Mother India Tour Travels.', '', 3.2028, 73.2207, NOW(), NOW()),
(gen_random_uuid(), 'Vietnam', 'vietnam', 'Asia', FALSE, FALSE, 'Hanoi', 'VND', ARRAY['Vietnamese'], TRUE, FALSE, 'Vietnam is a country of breathtaking natural beauty and cultural richness, from Halong Bay''s limestone karsts to Hoi An''s ancient town.', 'Vietnam Tour Packages | Halong Bay | Best Vietnam Holiday', 'Book Vietnam tour packages from India. Hanoi, Halong Bay, Ho Chi Minh City. Book with Mother India Tour Travels.', '', 14.0583, 108.2772, NOW(), NOW()),
(gen_random_uuid(), 'Indonesia', 'indonesia', 'Asia', FALSE, FALSE, 'Jakarta', 'IDR', ARRAY['Indonesian'], TRUE, TRUE, 'Indonesia, the world''s largest archipelago, is home to Bali''s rice terraces, Komodo dragons, and ancient Hindu temples.', 'Bali Indonesia Tour Packages | Best Bali Holiday Deals', 'Book Bali Indonesia tour packages from India. Explore temples, rice terraces, beaches. Book with Mother India Tour Travels.', '', -0.7893, 113.9213, NOW(), NOW()),
(gen_random_uuid(), 'Japan', 'japan', 'Asia', FALSE, FALSE, 'Tokyo', 'JPY', ARRAY['Japanese'], TRUE, FALSE, 'Japan is a fascinating blend of ancient tradition and cutting-edge modernity — cherry blossoms, samurai culture, bullet trains, and anime.', 'Japan Tour Packages | Tokyo Kyoto | Best Japan Holiday', 'Book Japan tour packages from India. Tokyo, Kyoto, Osaka, Mount Fuji. Book with Mother India Tour Travels.', '', 36.2048, 138.2529, NOW(), NOW()),
(gen_random_uuid(), 'China', 'china', 'Asia', FALSE, FALSE, 'Beijing', 'CNY', ARRAY['Mandarin'], TRUE, FALSE, 'China offers the Great Wall, Forbidden City, Terracotta Warriors, and vibrant modern cities — a civilization spanning 5,000 years.', 'China Tour Packages | Great Wall | Best China Holiday', 'Book China tour packages from India. Beijing, Shanghai, Xi''an Great Wall. Book with Mother India Tour Travels.', '', 35.8617, 104.1954, NOW(), NOW()),
(gen_random_uuid(), 'Cambodia', 'cambodia', 'Asia', FALSE, FALSE, 'Phnom Penh', 'KHR', ARRAY['Khmer'], TRUE, TRUE, 'Cambodia is home to the magnificent Angkor Wat temple complex, one of the greatest architectural achievements in human history.', 'Cambodia Tour Packages | Angkor Wat | Best Cambodia Holiday', 'Book Cambodia tour packages from India. Angkor Wat, Siem Reap, Phnom Penh. Book with Mother India Tour Travels.', '', 12.5657, 104.9910, NOW(), NOW()),
(gen_random_uuid(), 'Philippines', 'philippines', 'Asia', FALSE, FALSE, 'Manila', 'PHP', ARRAY['Filipino','English'], TRUE, FALSE, 'The Philippines is an archipelago of 7,641 islands with stunning beaches, crystal-clear waters, and vibrant local culture.', 'Philippines Tour Packages | Palawan | Best Philippines Holiday', 'Book Philippines tour packages from India. Palawan, Boracay, Cebu. Book with Mother India Tour Travels.', '', 12.8797, 121.7740, NOW(), NOW()),
(gen_random_uuid(), 'South Korea', 'south-korea', 'Asia', FALSE, FALSE, 'Seoul', 'KRW', ARRAY['Korean'], TRUE, FALSE, 'South Korea blends ancient palaces with K-pop culture, futuristic cities, serene Buddhist temples, and delicious cuisine.', 'South Korea Tour Packages | Seoul | Best Korea Holiday', 'Book South Korea tour packages from India. Seoul, Busan, Jeju Island. Book with Mother India Tour Travels.', '', 35.9078, 127.7669, NOW(), NOW()),
(gen_random_uuid(), 'Turkey', 'turkey', 'Asia', FALSE, FALSE, 'Ankara', 'TRY', ARRAY['Turkish'], TRUE, FALSE, 'Turkey bridges Asia and Europe, offering Hagia Sophia, Cappadocia''s fairy chimneys, turquoise coast, and exquisite cuisine.', 'Turkey Tour Packages | Istanbul Cappadocia | Best Turkey Holiday', 'Book Turkey tour packages from India. Istanbul, Cappadocia, Pamukkale. Book with Mother India Tour Travels.', '', 38.9637, 35.2433, NOW(), NOW()),
(gen_random_uuid(), 'Jordan', 'jordan', 'Asia', FALSE, FALSE, 'Amman', 'JOD', ARRAY['Arabic'], TRUE, FALSE, 'Jordan is home to Petra, the rose-red city carved from rock, Wadi Rum desert, and the Dead Sea — the lowest point on Earth.', 'Jordan Tour Packages | Petra Wadi Rum | Best Jordan Holiday', 'Book Jordan tour packages from India. Petra, Dead Sea, Wadi Rum. Book with Mother India Tour Travels.', '', 30.5852, 36.2384, NOW(), NOW()),
(gen_random_uuid(), 'Oman', 'oman', 'Asia', FALSE, FALSE, 'Muscat', 'OMR', ARRAY['Arabic'], TRUE, FALSE, 'Oman is an Arabian gem with ancient forts, dramatic fjords, pristine deserts, and warm hospitality far from mass tourism.', 'Oman Tour Packages | Muscat Salalah | Best Oman Holiday', 'Book Oman tour packages from India. Muscat, Nizwa, Salalah. Book with Mother India Tour Travels.', '', 21.4735, 55.9754, NOW(), NOW()),
-- Europe
(gen_random_uuid(), 'France', 'france', 'Europe', FALSE, FALSE, 'Paris', 'EUR', ARRAY['French'], TRUE, FALSE, 'France is the world''s most visited country, renowned for the Eiffel Tower, the Louvre, French Riviera, and world-class cuisine.', 'France Tour Packages | Paris | Best France Holiday', 'Book France tour packages from India. Paris, Nice, Bordeaux. Book with Mother India Tour Travels.', '', 46.2276, 2.2137, NOW(), NOW()),
(gen_random_uuid(), 'Italy', 'italy', 'Europe', FALSE, FALSE, 'Rome', 'EUR', ARRAY['Italian'], TRUE, FALSE, 'Italy is a land of art, history, and gastronomy — from the Colosseum and Vatican to Venice''s canals and Tuscan vineyards.', 'Italy Tour Packages | Rome Venice | Best Italy Holiday', 'Book Italy tour packages from India. Rome, Venice, Florence, Amalfi Coast. Book with Mother India Tour Travels.', '', 41.8719, 12.5674, NOW(), NOW()),
(gen_random_uuid(), 'Switzerland', 'switzerland', 'Europe', FALSE, FALSE, 'Bern', 'CHF', ARRAY['German','French','Italian'], TRUE, FALSE, 'Switzerland is famous for its Alps, pristine lakes, luxury watches, chocolate, and charming medieval towns.', 'Switzerland Tour Packages | Alps | Best Switzerland Holiday', 'Book Switzerland tour packages from India. Zurich, Interlaken, Jungfrau, Geneva. Book with Mother India Tour Travels.', '', 46.8182, 8.2275, NOW(), NOW()),
(gen_random_uuid(), 'Greece', 'greece', 'Europe', FALSE, FALSE, 'Athens', 'EUR', ARRAY['Greek'], TRUE, FALSE, 'Greece is the cradle of Western civilization, offering the Acropolis, Santorini''s blue-domed churches, and Mediterranean beaches.', 'Greece Tour Packages | Santorini Athens | Best Greece Holiday', 'Book Greece tour packages from India. Athens, Santorini, Mykonos, Crete. Book with Mother India Tour Travels.', '', 39.0742, 21.8243, NOW(), NOW()),
(gen_random_uuid(), 'Spain', 'spain', 'Europe', FALSE, FALSE, 'Madrid', 'EUR', ARRAY['Spanish'], TRUE, FALSE, 'Spain is a passionate destination of flamenco, bullfighting, Sagrada Familia, and beautiful beaches along the Mediterranean.', 'Spain Tour Packages | Barcelona Madrid | Best Spain Holiday', 'Book Spain tour packages from India. Barcelona, Madrid, Seville, Costa del Sol. Book with Mother India Tour Travels.', '', 40.4637, -3.7492, NOW(), NOW()),
(gen_random_uuid(), 'United Kingdom', 'united-kingdom', 'Europe', FALSE, FALSE, 'London', 'GBP', ARRAY['English'], TRUE, FALSE, 'The United Kingdom is a treasure trove of history — from Buckingham Palace and the Tower of London to the Scottish Highlands and Welsh castles.', 'UK Tour Packages | London Scotland | Best UK Holiday', 'Book UK tour packages from India. London, Edinburgh, Oxford, Lake District. Book with Mother India Tour Travels.', '', 55.3781, -3.4360, NOW(), NOW()),
(gen_random_uuid(), 'Germany', 'germany', 'Europe', FALSE, FALSE, 'Berlin', 'EUR', ARRAY['German'], TRUE, FALSE, 'Germany is a land of fairy-tale castles, Bavarian beer gardens, the Berlin Wall, and world-class engineering and culture.', 'Germany Tour Packages | Berlin Munich | Best Germany Holiday', 'Book Germany tour packages from India. Berlin, Munich, Cologne, Romantic Road. Book with Mother India Tour Travels.', '', 51.1657, 10.4515, NOW(), NOW()),
(gen_random_uuid(), 'Portugal', 'portugal', 'Europe', FALSE, FALSE, 'Lisbon', 'EUR', ARRAY['Portuguese'], TRUE, FALSE, 'Portugal is Europe''s westernmost country, known for its Age of Exploration legacy, Fado music, stunning coastline, and pastéis de nata.', 'Portugal Tour Packages | Lisbon Porto | Best Portugal Holiday', 'Book Portugal tour packages from India. Lisbon, Porto, Algarve, Sintra. Book with Mother India Tour Travels.', '', 39.3999, -8.2245, NOW(), NOW()),
(gen_random_uuid(), 'Austria', 'austria', 'Europe', FALSE, FALSE, 'Vienna', 'EUR', ARRAY['German'], TRUE, FALSE, 'Austria is a land of imperial palaces, Mozart, the Vienna Philharmonic, Alpine skiing, and the Sound of Music scenery.', 'Austria Tour Packages | Vienna Salzburg | Best Austria Holiday', 'Book Austria tour packages from India. Vienna, Salzburg, Innsbruck, Hallstatt. Book with Mother India Tour Travels.', '', 47.5162, 14.5501, NOW(), NOW()),
(gen_random_uuid(), 'Netherlands', 'netherlands', 'Europe', FALSE, FALSE, 'Amsterdam', 'EUR', ARRAY['Dutch'], TRUE, FALSE, 'The Netherlands is famous for its tulip fields, windmills, canal-lined cities, and world-class art museums like the Rijksmuseum.', 'Netherlands Tour Packages | Amsterdam | Best Netherlands Holiday', 'Book Netherlands tour packages from India. Amsterdam, Keukenhof, Hague. Book with Mother India Tour Travels.', '', 52.1326, 5.2913, NOW(), NOW()),
(gen_random_uuid(), 'Norway', 'norway', 'Europe', FALSE, FALSE, 'Oslo', 'NOK', ARRAY['Norwegian'], TRUE, FALSE, 'Norway is a land of dramatic fjords, Northern Lights, Viking heritage, and unspoiled Arctic wilderness.', 'Norway Tour Packages | Fjords Northern Lights | Best Norway Holiday', 'Book Norway tour packages from India. Oslo, Bergen, Flam, Lofoten Islands. Book with Mother India Tour Travels.', '', 60.4720, 8.4689, NOW(), NOW()),
(gen_random_uuid(), 'Sweden', 'sweden', 'Europe', FALSE, FALSE, 'Stockholm', 'SEK', ARRAY['Swedish'], TRUE, FALSE, 'Sweden is known for ABBA, IKEA, the Nobel Prize, midnight sun, and stunning archipelagos of more than 220,000 islands.', 'Sweden Tour Packages | Stockholm | Best Sweden Holiday', 'Book Sweden tour packages from India. Stockholm, Gothenburg, Lapland. Book with Mother India Tour Travels.', '', 60.1282, 18.6435, NOW(), NOW()),
(gen_random_uuid(), 'Czech Republic', 'czech-republic', 'Europe', FALSE, FALSE, 'Prague', 'CZK', ARRAY['Czech'], TRUE, FALSE, 'Czech Republic is home to the magical city of Prague, medieval castles, Buddhist shrines, and world-famous Pilsner beer.', 'Czech Republic Tour Packages | Prague | Best Czech Holiday', 'Book Czech Republic tour packages from India. Prague, Cesky Krumlov, Brno. Book with Mother India Tour Travels.', '', 49.8175, 15.4730, NOW(), NOW()),
-- Americas
(gen_random_uuid(), 'USA', 'usa', 'North America', FALSE, FALSE, 'Washington D.C.', 'USD', ARRAY['English'], TRUE, FALSE, 'The United States of America offers New York''s skyline, the Grand Canyon, Hollywood, national parks, and world-class entertainment.', 'USA Tour Packages | New York Las Vegas | Best USA Holiday', 'Book USA tour packages from India. New York, Las Vegas, Los Angeles, Orlando. Book with Mother India Tour Travels.', '', 37.0902, -95.7129, NOW(), NOW()),
(gen_random_uuid(), 'Canada', 'canada', 'North America', FALSE, FALSE, 'Ottawa', 'CAD', ARRAY['English','French'], TRUE, FALSE, 'Canada is a vast land of Niagara Falls, Rocky Mountain national parks, multicultural cities, and the spectacular Northern Lights.', 'Canada Tour Packages | Toronto Vancouver | Best Canada Holiday', 'Book Canada tour packages from India. Toronto, Vancouver, Niagara Falls, Banff. Book with Mother India Tour Travels.', '', 56.1304, -106.3468, NOW(), NOW()),
(gen_random_uuid(), 'Brazil', 'brazil', 'South America', FALSE, FALSE, 'Brasília', 'BRL', ARRAY['Portuguese'], TRUE, FALSE, 'Brazil is home to the Amazon rainforest, the carnival of Rio de Janeiro, Iguazu Falls, and stunning beaches.', 'Brazil Tour Packages | Rio de Janeiro | Best Brazil Holiday', 'Book Brazil tour packages from India. Rio de Janeiro, Amazon, Iguazu Falls. Book with Mother India Tour Travels.', '', -14.2350, -51.9253, NOW(), NOW()),
(gen_random_uuid(), 'Peru', 'peru', 'South America', FALSE, FALSE, 'Lima', 'PEN', ARRAY['Spanish'], TRUE, FALSE, 'Peru is home to Machu Picchu, the Nazca Lines, the Amazon Basin, and the ancient Inca civilization.', 'Peru Tour Packages | Machu Picchu | Best Peru Holiday', 'Book Peru tour packages from India. Machu Picchu, Lima, Cusco. Book with Mother India Tour Travels.', '', -9.1900, -75.0152, NOW(), NOW()),
-- Africa
(gen_random_uuid(), 'Egypt', 'egypt', 'Africa', FALSE, FALSE, 'Cairo', 'EGP', ARRAY['Arabic'], TRUE, FALSE, 'Egypt is the land of the Pharaohs — home to the Great Pyramids of Giza, Sphinx, Nile cruises, and Luxor''s Valley of the Kings.', 'Egypt Tour Packages | Pyramids Nile Cruise | Best Egypt Holiday', 'Book Egypt tour packages from India. Cairo Pyramids, Nile Cruise, Luxor, Alexandria. Book with Mother India Tour Travels.', '', 26.0975, 30.0444, NOW(), NOW()),
(gen_random_uuid(), 'Kenya', 'kenya', 'Africa', FALSE, FALSE, 'Nairobi', 'KES', ARRAY['Swahili','English'], TRUE, FALSE, 'Kenya is the ultimate safari destination — Maasai Mara, Amboseli with Kilimanjaro views, and pristine Indian Ocean beaches.', 'Kenya Tour Packages | Maasai Mara Safari | Best Kenya Holiday', 'Book Kenya tour packages from India. Maasai Mara, Nairobi, Amboseli. Book with Mother India Tour Travels.', '', -0.0236, 37.9062, NOW(), NOW()),
(gen_random_uuid(), 'Tanzania', 'tanzania', 'Africa', FALSE, FALSE, 'Dodoma', 'TZS', ARRAY['Swahili','English'], TRUE, FALSE, 'Tanzania is home to Serengeti''s Great Migration, Mount Kilimanjaro, Zanzibar''s beaches, and Ngorongoro Crater.', 'Tanzania Tour Packages | Serengeti Zanzibar | Best Tanzania Holiday', 'Book Tanzania tour packages from India. Serengeti, Kilimanjaro, Zanzibar. Book with Mother India Tour Travels.', '', -6.3690, 34.8888, NOW(), NOW()),
(gen_random_uuid(), 'South Africa', 'south-africa', 'Africa', FALSE, FALSE, 'Pretoria', 'ZAR', ARRAY['Zulu','Xhosa','Afrikaans','English'], TRUE, FALSE, 'South Africa offers Cape Town''s Table Mountain, Kruger Park safaris, the Garden Route, and world-class wine farms.', 'South Africa Tour Packages | Cape Town Safari | Best SA Holiday', 'Book South Africa tour packages from India. Cape Town, Kruger, Garden Route. Book with Mother India Tour Travels.', '', -30.5595, 22.9375, NOW(), NOW()),
(gen_random_uuid(), 'Morocco', 'morocco', 'Africa', FALSE, FALSE, 'Rabat', 'MAD', ARRAY['Arabic','Berber'], TRUE, FALSE, 'Morocco is a North African kingdom of ancient medinas, Sahara Desert dunes, imperial cities, and vibrant souks.', 'Morocco Tour Packages | Marrakech Sahara | Best Morocco Holiday', 'Book Morocco tour packages from India. Marrakech, Fez, Sahara Desert, Casablanca. Book with Mother India Tour Travels.', '', 31.7917, -7.0926, NOW(), NOW()),
-- Oceania
(gen_random_uuid(), 'Australia', 'australia', 'Oceania', FALSE, FALSE, 'Canberra', 'AUD', ARRAY['English'], TRUE, FALSE, 'Australia is a vast continent with the Great Barrier Reef, Uluru, Sydney Opera House, and unique wildlife found nowhere else on Earth.', 'Australia Tour Packages | Sydney Melbourne | Best Australia Holiday', 'Book Australia tour packages from India. Sydney, Melbourne, Gold Coast, Great Barrier Reef. Book with Mother India Tour Travels.', '', -25.2744, 133.7751, NOW(), NOW()),
(gen_random_uuid(), 'New Zealand', 'new-zealand', 'Oceania', FALSE, FALSE, 'Wellington', 'NZD', ARRAY['English','Maori'], TRUE, FALSE, 'New Zealand, the home of Middle Earth, is a land of dramatic mountains, pristine fjords, geothermal wonders, and Maori culture.', 'New Zealand Tour Packages | Auckland Queenstown | Best NZ Holiday', 'Book New Zealand tour packages from India. Auckland, Queenstown, Fiordland. Book with Mother India Tour Travels.', '', -40.9006, 174.8860, NOW(), NOW())
ON CONFLICT ("slug") DO UPDATE SET
  "name" = EXCLUDED."name", "continent" = EXCLUDED."continent",
  "isDomestic" = EXCLUDED."isDomestic", "isFeatured" = EXCLUDED."isFeatured",
  "capital" = EXCLUDED."capital", "currency" = EXCLUDED."currency",
  "languages" = EXCLUDED."languages", "visaRequiredForIndians" = EXCLUDED."visaRequiredForIndians",
  "visaOnArrival" = EXCLUDED."visaOnArrival", "description" = EXCLUDED."description",
  "seoTitle" = EXCLUDED."seoTitle", "seoDescription" = EXCLUDED."seoDescription",
  "image" = EXCLUDED."image", "latitude" = EXCLUDED."latitude", "longitude" = EXCLUDED."longitude",
  "updatedAt" = NOW();

-- ─────────────────────────────────────────────
-- INDIA STATES (All 28 States + 8 UTs)
-- ─────────────────────────────────────────────
DO $$
DECLARE
  india_id TEXT;
BEGIN
  SELECT "id" INTO india_id FROM "Country" WHERE "slug" = 'india';

  INSERT INTO "State" ("id","name","slug","countryId","capital","isFeatured","description","image","latitude","longitude") VALUES
  -- Featured (popular for tourism)
  (gen_random_uuid(), 'Delhi', 'delhi', india_id, 'New Delhi', TRUE, 'Delhi, India''s capital territory, is a megacity where ancient monuments, Mughal grandeur, and colonial heritage meet modern urban life.', '', 28.7041, 77.1025),
  (gen_random_uuid(), 'Uttar Pradesh', 'uttar-pradesh', india_id, 'Lucknow', TRUE, 'Uttar Pradesh is India''s most populous state, home to the Taj Mahal, Varanasi ghats, and the spiritual circuit of Ayodhya and Mathura.', '', 26.8467, 80.9462),
  (gen_random_uuid(), 'Rajasthan', 'rajasthan', india_id, 'Jaipur', TRUE, 'Rajasthan, the Land of Kings, dazzles with majestic forts, vibrant desert culture, camel safaris in the Thar Desert, and ornate palaces.', '', 27.0238, 74.2179),
  (gen_random_uuid(), 'Himachal Pradesh', 'himachal-pradesh', india_id, 'Shimla', TRUE, 'Himachal Pradesh is a Himalayan state of apple orchards, scenic hill stations, ancient temples, and adventure sports.', '', 31.1048, 77.1734),
  (gen_random_uuid(), 'Uttarakhand', 'uttarakhand', india_id, 'Dehradun', TRUE, 'Uttarakhand, the Land of the Gods, is home to the Char Dham pilgrimage, Jim Corbett National Park, and the yoga capital Rishikesh.', '', 30.0668, 79.0193),
  (gen_random_uuid(), 'Jammu and Kashmir', 'jammu-kashmir', india_id, 'Srinagar', TRUE, 'Jammu & Kashmir, the Paradise on Earth, enchants with the shimmering Dal Lake, Gulmarg snow slopes, and Pahalgam meadows.', '', 33.7782, 76.5762),
  (gen_random_uuid(), 'Kerala', 'kerala', india_id, 'Thiruvananthapuram', TRUE, 'Kerala, God''s Own Country, is a lush paradise of backwater houseboats, Ayurveda resorts, spice plantations, and pristine beaches.', '', 10.8505, 76.2711),
  (gen_random_uuid(), 'Goa', 'goa', india_id, 'Panaji', TRUE, 'Goa, India''s smallest state, is famous for its palm-fringed beaches, Portuguese heritage, vibrant nightlife, and seafood cuisine.', '', 15.2993, 74.1240),
  (gen_random_uuid(), 'West Bengal', 'west-bengal', india_id, 'Kolkata', TRUE, 'West Bengal is the cultural heartland of India — home to Darjeeling tea gardens, Sundarbans mangroves, and the city of Kolkata.', '', 22.9868, 87.8550),
  (gen_random_uuid(), 'Sikkim', 'sikkim', india_id, 'Gangtok', FALSE, 'Sikkim is a tiny Himalayan state of monasteries, rhododendron forests, and stunning views of Kangchenjunga, the world''s third-highest peak.', '', 27.5330, 88.5122),
  (gen_random_uuid(), 'Andaman and Nicobar Islands', 'andaman-nicobar', india_id, 'Port Blair', FALSE, 'The Andaman and Nicobar Islands are an archipelago of 572 islands with emerald waters, pristine coral reefs, and untouched rainforests.', '', 11.7401, 92.6586),
  (gen_random_uuid(), 'Madhya Pradesh', 'madhya-pradesh', india_id, 'Bhopal', FALSE, 'Madhya Pradesh, the Heart of India, is known for Khajuraho temples, Bandhavgarh tigers, Orchha palaces, and ancient rock art at Bhimbetka.', '', 22.9734, 78.6569),
  (gen_random_uuid(), 'Tamil Nadu', 'tamil-nadu', india_id, 'Chennai', FALSE, 'Tamil Nadu is the cradle of Dravidian civilization — land of grand Chola temples, Nilgiri hills, Ooty, and the ancient city of Madurai.', '', 11.1271, 78.6569),
  (gen_random_uuid(), 'Karnataka', 'karnataka', india_id, 'Bengaluru', FALSE, 'Karnataka combines Silicon Valley modernity with ancient Hampi ruins, misty Coorg hills, and the royal city of Mysuru.', '', 15.3173, 75.7139),
  -- All remaining states and UTs
  (gen_random_uuid(), 'Maharashtra', 'maharashtra', india_id, 'Mumbai', FALSE, 'Maharashtra is home to Mumbai — the city of dreams — along with the ancient Ajanta and Ellora caves and hill stations of Lonavala.', '', 19.7515, 75.7139),
  (gen_random_uuid(), 'Gujarat', 'gujarat', india_id, 'Gandhinagar', FALSE, 'Gujarat is a state of vibrant festivals, Rann of Kutch salt desert, Gir Forest lions, and the heritage of Mahatma Gandhi''s birthplace.', '', 22.2587, 71.1924),
  (gen_random_uuid(), 'Bihar', 'bihar', india_id, 'Patna', FALSE, 'Bihar is the land of Buddha — Bodh Gaya, Nalanda, and Rajgir carry the legacy of Buddhism and ancient Magadha Empire.', '', 25.0961, 85.3131),
  (gen_random_uuid(), 'Jharkhand', 'jharkhand', india_id, 'Ranchi', FALSE, 'Jharkhand, carved from Bihar in 2000, is rich in tribal heritage, mineral resources, and scenic waterfalls and forests.', '', 23.6102, 85.2799),
  (gen_random_uuid(), 'Odisha', 'odisha', india_id, 'Bhubaneswar', FALSE, 'Odisha is known for the Konark Sun Temple, Jagannath Temple Puri, and the pristine beaches and tribes of its interior.', '', 20.9517, 85.0985),
  (gen_random_uuid(), 'Chhattisgarh', 'chhattisgarh', india_id, 'Raipur', FALSE, 'Chhattisgarh is India''s rice bowl, rich in tribal culture, ancient temples, and dense forests with stunning waterfalls.', '', 21.2787, 81.8661),
  (gen_random_uuid(), 'Assam', 'assam', india_id, 'Dispur', FALSE, 'Assam is a land of wild one-horned rhinoceroses in Kaziranga, Brahmaputra river cruises, and the world''s largest river island Majuli.', '', 26.2006, 92.9376),
  (gen_random_uuid(), 'Meghalaya', 'meghalaya', india_id, 'Shillong', FALSE, 'Meghalaya, the Abode of Clouds, is home to the wettest place on Earth, living root bridges, and stunning waterfalls.', '', 25.4670, 91.3662),
  (gen_random_uuid(), 'Manipur', 'manipur', india_id, 'Imphal', FALSE, 'Manipur is a land of classical Manipuri dance, the floating Loktak Lake, and gateway to Southeast Asia.', '', 24.6637, 93.9063),
  (gen_random_uuid(), 'Nagaland', 'nagaland', india_id, 'Kohima', FALSE, 'Nagaland is home to the vibrant Hornbill Festival, diverse Naga tribes, and pristine hills bordering Myanmar.', '', 26.1584, 94.5624),
  (gen_random_uuid(), 'Mizoram', 'mizoram', india_id, 'Aizawl', FALSE, 'Mizoram is a land of rolling blue hills, bamboo forests, and a highly literate Mizo community known for its music and arts.', '', 23.1645, 92.9376),
  (gen_random_uuid(), 'Tripura', 'tripura', india_id, 'Agartala', FALSE, 'Tripura is a small northeastern state with ancient temples, tribal culture, and scenic landscapes bordering Bangladesh.', '', 23.9408, 91.9882),
  (gen_random_uuid(), 'Arunachal Pradesh', 'arunachal-pradesh', india_id, 'Itanagar', FALSE, 'Arunachal Pradesh, the Land of the Rising Sun, is India''s easternmost state of pristine valleys, Buddhist monasteries, and diverse tribes.', '', 28.2180, 94.7278),
  (gen_random_uuid(), 'Telangana', 'telangana', india_id, 'Hyderabad', FALSE, 'Telangana, formed in 2014, is home to the historic city of Hyderabad, Golconda Fort, and the famous Charminar.', '', 18.1124, 79.0193),
  (gen_random_uuid(), 'Andhra Pradesh', 'andhra-pradesh', india_id, 'Amaravati', FALSE, 'Andhra Pradesh is known for its spicy cuisine, ancient Buddhist sites at Amaravati, Tirupati temple, and Visakhapatnam beaches.', '', 15.9129, 79.7400),
  (gen_random_uuid(), 'Punjab', 'punjab', india_id, 'Amritsar', FALSE, 'Punjab, the Land of Five Rivers, is home to the Golden Temple in Amritsar — the holiest shrine in Sikhism — and vibrant Punjabi culture.', '', 31.1471, 75.3412),
  (gen_random_uuid(), 'Haryana', 'haryana', india_id, 'Chandigarh', FALSE, 'Haryana surrounds Delhi and is known for Kurukshetra (Mahabharata battleground), Sultanpur Bird Sanctuary, and vibrant folk culture.', '', 29.0588, 76.0856),
  -- Union Territories
  (gen_random_uuid(), 'Chandigarh', 'chandigarh-ut', india_id, 'Chandigarh', FALSE, 'Chandigarh is India''s most planned city, designed by Le Corbusier, serving as capital of both Punjab and Haryana.', '', 30.7333, 76.7794),
  (gen_random_uuid(), 'Puducherry', 'puducherry', india_id, 'Puducherry', FALSE, 'Puducherry (Pondicherry) is a former French colony with colonial-era buildings, ashrams, and pristine beaches on the Coromandel Coast.', '', 11.9416, 79.8083),
  (gen_random_uuid(), 'Dadra and Nagar Haveli', 'dadra-nagar-haveli', india_id, 'Silvassa', FALSE, 'Dadra and Nagar Haveli is a small UT with lush forests, tribal culture, and scenic dam lakes near Mumbai and Surat.', '', 20.1809, 73.0169),
  (gen_random_uuid(), 'Daman and Diu', 'daman-diu', india_id, 'Daman', FALSE, 'Daman and Diu is a coastal UT with Portuguese architecture, pristine beaches, and seafood on the Gujarat and Maharashtra coasts.', '', 20.3974, 72.8328),
  (gen_random_uuid(), 'Lakshadweep', 'lakshadweep', india_id, 'Kavaratti', FALSE, 'Lakshadweep is India''s smallest UT — 36 coral islands in the Arabian Sea with crystal-clear lagoons and pristine coral reefs.', '', 10.5667, 72.6417),
  (gen_random_uuid(), 'Ladakh', 'ladakh', india_id, 'Leh', FALSE, 'Ladakh is India''s highest union territory, home to ancient Buddhist monasteries, the Pangong Tso lake, and the world''s highest motorable roads.', '', 34.2996, 78.2932)
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "capital" = EXCLUDED."capital",
    "isFeatured" = EXCLUDED."isFeatured", "description" = EXCLUDED."description",
    "latitude" = EXCLUDED."latitude", "longitude" = EXCLUDED."longitude";
END $$;

-- ─────────────────────────────────────────────
-- DESTINATIONS (with proper coordinates)
-- ─────────────────────────────────────────────
DO $$
DECLARE
  india_id TEXT; nepal_id TEXT; thailand_id TEXT; malaysia_id TEXT; uae_id TEXT;
  delhi_state TEXT; up_state TEXT; raj_state TEXT; hp_state TEXT; uk_state TEXT;
  jk_state TEXT; wb_state TEXT; sikkim_state TEXT; kerala_state TEXT; goa_state TEXT;
  mp_state TEXT; tn_state TEXT; kar_state TEXT; ladakh_state TEXT; andaman_state TEXT;
BEGIN
  SELECT "id" INTO india_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO nepal_id FROM "Country" WHERE "slug" = 'nepal';
  SELECT "id" INTO thailand_id FROM "Country" WHERE "slug" = 'thailand';
  SELECT "id" INTO malaysia_id FROM "Country" WHERE "slug" = 'malaysia';
  SELECT "id" INTO uae_id FROM "Country" WHERE "slug" = 'uae';
  SELECT "id" INTO delhi_state FROM "State" WHERE "slug" = 'delhi';
  SELECT "id" INTO up_state FROM "State" WHERE "slug" = 'uttar-pradesh';
  SELECT "id" INTO raj_state FROM "State" WHERE "slug" = 'rajasthan';
  SELECT "id" INTO hp_state FROM "State" WHERE "slug" = 'himachal-pradesh';
  SELECT "id" INTO uk_state FROM "State" WHERE "slug" = 'uttarakhand';
  SELECT "id" INTO jk_state FROM "State" WHERE "slug" = 'jammu-kashmir';
  SELECT "id" INTO wb_state FROM "State" WHERE "slug" = 'west-bengal';
  SELECT "id" INTO sikkim_state FROM "State" WHERE "slug" = 'sikkim';
  SELECT "id" INTO kerala_state FROM "State" WHERE "slug" = 'kerala';
  SELECT "id" INTO goa_state FROM "State" WHERE "slug" = 'goa';
  SELECT "id" INTO mp_state FROM "State" WHERE "slug" = 'madhya-pradesh';
  SELECT "id" INTO tn_state FROM "State" WHERE "slug" = 'tamil-nadu';
  SELECT "id" INTO kar_state FROM "State" WHERE "slug" = 'karnataka';
  SELECT "id" INTO ladakh_state FROM "State" WHERE "slug" = 'ladakh';
  SELECT "id" INTO andaman_state FROM "State" WHERE "slug" = 'andaman-nicobar';

  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
  -- Delhi
  (gen_random_uuid(), 'Delhi', 'delhi', delhi_state, india_id, 'CITY', TRUE, 'Delhi, India''s capital, is a city where ancient history meets modern life. Home to iconic landmarks like the Red Fort, Qutub Minar, and India Gate.', 'October to March', 'Extreme continental – hot summers, cold winters', 28.6139, 77.2090, 'https://img.freepik.com/free-photo/india-gate-new-delhi-india_1268-17497.jpg', 'Delhi Tour Packages | Best Deals on Delhi Holiday Packages', 'Explore Delhi with Mother India Tour Travels. Best Delhi tour packages, sightseeing, heritage walks and more. Book now!', NOW(), NOW()),
  -- Uttar Pradesh
  (gen_random_uuid(), 'Agra', 'agra', up_state, india_id, 'HERITAGE', TRUE, 'Agra is home to the magnificent Taj Mahal, one of the Seven Wonders of the World. The city also houses the Agra Fort and Fatehpur Sikri.', 'October to March', 'Semi-arid – hot summers, mild winters', 27.1767, 78.0081, 'https://img.freepik.com/free-photo/majestic-mausoleum-ancient-god-spiritual-journey-generated-by-ai_188544-11114.jpg', 'Agra Tour Packages | Taj Mahal Tour | Best Agra Holiday Deals', 'Visit Agra and the iconic Taj Mahal with Mother India Tour Travels. Best Agra tour packages from Delhi. Book now!', NOW(), NOW()),
  (gen_random_uuid(), 'Varanasi', 'varanasi', up_state, india_id, 'PILGRIMAGE', TRUE, 'Varanasi, one of the world''s oldest cities, is India''s spiritual capital. The ghats along the Ganges, evening Ganga Aarti, and ancient temples make it unforgettable.', 'October to March', 'Humid subtropical', 25.3176, 82.9739, 'https://images.pexels.com/photos/17869844/pexels-photo-17869844.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Varanasi Tour Packages | Spiritual City of India | Ganga Aarti', 'Visit Varanasi, the spiritual heart of India. Witness Ganga Aarti, ancient ghats and temples. Book with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Mathura', 'mathura', up_state, india_id, 'PILGRIMAGE', FALSE, 'Mathura is the birthplace of Lord Krishna, a sacred city on the banks of the Yamuna river with over 1,000 temples.', 'October to March', 'Semi-arid', 27.4924, 77.6737, 'https://images.pexels.com/photos/37503640/pexels-photo-37503640.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Mathura Tour Packages | Krishna Birthplace | Pilgrimage Tour', 'Visit Mathura, birthplace of Lord Krishna. Best Mathura tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Ayodhya', 'ayodhya', up_state, india_id, 'PILGRIMAGE', FALSE, 'Ayodhya, birthplace of Lord Ram, is one of the seven sacred cities in Hinduism and home to the newly constructed Ram Mandir.', 'October to March', 'Humid subtropical', 26.7957, 82.1997, 'https://images.pexels.com/photos/36478003/pexels-photo-36478003.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Ayodhya Tour Packages | Ram Mandir | Pilgrimage Tour', 'Visit Ayodhya and Ram Mandir. Best Ayodhya pilgrimage tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Prayagraj', 'prayagraj', up_state, india_id, 'PILGRIMAGE', FALSE, 'Prayagraj (Allahabad) is the confluence of Ganga, Yamuna, and Saraswati rivers — a sacred site and venue of the Kumbh Mela.', 'October to March', 'Humid subtropical', 25.4358, 81.8463, 'https://images.pexels.com/photos/30218191/pexels-photo-30218191.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Prayagraj Tour Packages | Sangam | Kumbh Mela | Pilgrimage', 'Visit Prayagraj Sangam. Best Prayagraj tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Khajuraho', 'khajuraho', mp_state, india_id, 'HERITAGE', FALSE, 'Khajuraho is world-famous for its group of stunning medieval Hindu and Jain temples adorned with erotic sculptures.', 'October to March', 'Tropical', 24.8318, 79.9199, 'https://images.pexels.com/photos/13102404/pexels-photo-13102404.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Khajuraho Tour Packages | Temple Heritage | UNESCO World Heritage', 'Visit Khajuraho temples. Best Khajuraho tour packages by Mother India Tour Travels.', NOW(), NOW()),
  -- Rajasthan
  (gen_random_uuid(), 'Jaipur', 'jaipur', raj_state, india_id, 'HERITAGE', TRUE, 'Jaipur, the Pink City, is the capital of Rajasthan. Known for its stunning palaces, forts, and vibrant bazaars — a treasure trove of Rajput heritage.', 'October to March', 'Semi-arid – very hot summers, mild winters', 26.9124, 75.7873, 'https://img.freepik.com/free-photo/hawa-mahal-palace-jaipur-india_53876-31311.jpg', 'Jaipur Tour Packages | Pink City Holiday Deals | Rajasthan', 'Explore Jaipur, the Pink City of India. Best Jaipur tour packages including Amber Fort, Hawa Mahal and more. Book with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Pushkar', 'pushkar', raj_state, india_id, 'PILGRIMAGE', FALSE, 'Pushkar is a sacred Hindu pilgrimage town beside a holy lake, famous for the annual Camel Fair — one of the world''s largest livestock fairs.', 'October to March', 'Semi-arid', 26.4897, 74.5554, 'https://images.pexels.com/photos/12581420/pexels-photo-12581420.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Pushkar Tour Packages | Camel Fair | Rajasthan Pilgrimage', 'Visit Pushkar, the holy lake town. Best Pushkar tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Ranthambore', 'ranthambore', raj_state, india_id, 'WILDLIFE', FALSE, 'Ranthambore National Park is India''s most famous tiger reserve, where you can spot Bengal tigers in the ruins of a medieval fort.', 'October to June', 'Semi-arid', 25.9931, 76.5026, 'https://images.pexels.com/photos/31393397/pexels-photo-31393397.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Ranthambore Tour Packages | Tiger Safari | Wildlife Tour', 'Book Ranthambore tiger safari tour packages. Best wildlife holidays by Mother India Tour Travels.', NOW(), NOW()),
  -- Himachal Pradesh
  (gen_random_uuid(), 'Shimla', 'shimla', hp_state, india_id, 'HILL_STATION', TRUE, 'Shimla, the former summer capital of British India, is a charming hill station known for its colonial architecture, apple orchards, and scenic Himalayan views.', 'March to June, September to November', 'Highland – cool summers, snowy winters', 31.1048, 77.1734, 'https://images.pexels.com/photos/19213818/pexels-photo-19213818.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Shimla Tour Packages | Himachal Pradesh Holiday | Best Deals', 'Book Shimla tour packages. Explore Mall Road, colonial architecture and scenic Himalayas. Shimla holiday packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Manali', 'manali', hp_state, india_id, 'ADVENTURE', TRUE, 'Manali is a high-altitude Himalayan resort town known for skiing, trekking, adventure sports, and breathtaking views of snow-capped mountains.', 'October to June (snow), July to September (trekking)', 'Alpine – cold winters with heavy snowfall', 32.2396, 77.1887, 'https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Manali Tour Packages | Himachal Pradesh | Snow Adventure', 'Book Manali tour packages for adventure, snow and scenic beauty. Best Manali holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Uttarakhand
  (gen_random_uuid(), 'Rishikesh', 'rishikesh', uk_state, india_id, 'ADVENTURE', TRUE, 'Rishikesh, the Yoga Capital of the World, sits at the Himalayan foothills. Famous for ashrams, river rafting, bungee jumping, and the iconic Laxman Jhula.', 'September to November, February to May', 'Humid subtropical', 30.0869, 78.2676, 'https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Rishikesh Tour Packages | Yoga Capital | River Rafting', 'Book Rishikesh tour packages. Yoga, meditation, river rafting and more. Best Rishikesh holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Haridwar', 'haridwar', uk_state, india_id, 'PILGRIMAGE', FALSE, 'Haridwar is one of the seven holiest places in Hinduism. The evening Ganga Aarti at Har Ki Pauri ghat is a spectacular spiritual experience.', 'October to March', 'Humid subtropical', 29.9457, 78.1642, 'https://images.pexels.com/photos/32111239/pexels-photo-32111239.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Haridwar Tour Packages | Ganga Aarti | Spiritual Travel India', 'Visit Haridwar with Mother India Tour Travels. Experience the sacred Ganga Aarti. Best Haridwar tour packages.', NOW(), NOW()),
  (gen_random_uuid(), 'Mussoorie', 'mussoorie', uk_state, india_id, 'HILL_STATION', FALSE, 'Mussoorie, the Queen of Hills, is a charming hill station with colonial-era hotels, Kempty Falls, and panoramic Himalayan views.', 'March to June, September to November', 'Highland', 30.4598, 78.0772, 'https://images.pexels.com/photos/2070307/pexels-photo-2070307.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Mussoorie Tour Packages | Queen of Hills | Hill Station Holiday', 'Book Mussoorie tour packages. Explore colonial charm and Himalayan views. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Jim Corbett', 'jim-corbett', uk_state, india_id, 'WILDLIFE', FALSE, 'Jim Corbett National Park is India''s oldest national park, home to Bengal tigers, elephants, and over 600 species of birds.', 'November to June', 'Subtropical', 29.5300, 78.7747, 'https://images.pexels.com/photos/29666818/pexels-photo-29666818.png?auto=compress&cs=tinysrgb&h=650&w=940', 'Jim Corbett Tour Packages | Tiger Safari | Wildlife Holiday', 'Book Jim Corbett National Park safari packages. Tiger safari and wildlife tours by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Nainital', 'nainital', uk_state, india_id, 'HILL_STATION', FALSE, 'Nainital is a charming lake district hill station with the serene Naini Lake, surrounded by forested mountains and a colonial-era town.', 'March to June, September to November', 'Highland', 29.3801, 79.4582, 'https://images.pexels.com/photos/34792746/pexels-photo-34792746.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Nainital Tour Packages | Lake District | Hill Station Holiday', 'Book Nainital tour packages. Naini Lake, boating and scenic Himalayas. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Jammu & Kashmir / Ladakh
  (gen_random_uuid(), 'Srinagar', 'srinagar', jk_state, india_id, 'CITY', TRUE, 'Srinagar, the summer capital of Jammu & Kashmir, is famous for its Dal Lake houseboats, Mughal Gardens, and stunning surrounding peaks.', 'April to October', 'Highland continental', 34.0837, 74.7973, 'https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Srinagar Tour Packages | Kashmir Tour | Dal Lake Houseboat', 'Book Srinagar Kashmir tour packages. Experience Dal Lake houseboats, Mughal Gardens and snow peaks. Best Kashmir tours by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Gulmarg', 'gulmarg', jk_state, india_id, 'ADVENTURE', FALSE, 'Gulmarg, the Meadow of Flowers, is Asia''s highest and largest ski resort, offering world-class skiing, a gondola, and breathtaking views.', 'December to March (skiing), April to June (spring)', 'Alpine', 34.0500, 74.3800, 'https://images.pexels.com/photos/15344121/pexels-photo-15344121.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Gulmarg Tour Packages | Ski Resort | Kashmir Snow Adventure', 'Book Gulmarg ski resort packages. Asia''s highest ski resort and gondola ride. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Pahalgam', 'pahalgam', jk_state, india_id, 'ADVENTURE', FALSE, 'Pahalgam, the Valley of Shepherds, is a scenic town on the Lidder River — base camp for Amarnath Yatra and stunning Himalayan treks.', 'May to October', 'Highland', 34.0167, 75.3167, 'https://images.pexels.com/photos/36627785/pexels-photo-36627785.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Pahalgam Tour Packages | Kashmir Valley | Amarnath Yatra', 'Book Pahalgam Kashmir tour packages. Beautiful valleys, trekking and Amarnath Yatra. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Leh', 'leh', ladakh_state, india_id, 'ADVENTURE', FALSE, 'Leh, the capital of Ladakh, is a high-altitude desert town of ancient monasteries, stunning mountain landscapes, and the famed Khardung La pass.', 'May to September', 'Cold desert', 34.1526, 77.5771, 'https://images.pexels.com/photos/2324780/pexels-photo-2324780.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Leh Ladakh Tour Packages | High Altitude Adventure | Best Deals', 'Book Leh Ladakh tour packages. Pangong Lake, Nubra Valley, monasteries. Best Ladakh adventure tours by Mother India Tour Travels.', NOW(), NOW()),
  -- West Bengal / Sikkim
  (gen_random_uuid(), 'Darjeeling', 'darjeeling', wb_state, india_id, 'HILL_STATION', TRUE, 'Darjeeling, the Queen of Hills, offers spectacular views of Kangchenjunga, world-famous tea gardens, and the charming Darjeeling Himalayan Railway toy train.', 'March to May, September to November', 'Highland – cool and foggy', 27.0410, 88.2627, 'https://images.pexels.com/photos/103875/pexels-photo-103875.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Darjeeling Tour Packages | Tea Garden Holiday | Hill Station', 'Explore Darjeeling''s tea gardens, toy train and Himalayan views. Best Darjeeling tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Gangtok', 'gangtok', sikkim_state, india_id, 'CITY', FALSE, 'Gangtok, the capital of Sikkim, offers beautiful mountain scenery, Buddhist monasteries, and cable car rides with views of Kangchenjunga.', 'March to May, October to December', 'Subtropical highland', 27.3314, 88.6138, 'https://images.pexels.com/photos/14916663/pexels-photo-14916663.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Gangtok Tour Packages | Sikkim Holiday | Monastery Tours', 'Book Gangtok Sikkim tour packages. Explore monasteries, mountain views and Nathu La Pass. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Pelling', 'pelling', sikkim_state, india_id, 'HILL_STATION', FALSE, 'Pelling is a small hill town in West Sikkim offering magnificent close-up views of Kangchenjunga and ancient Pemayangtse Monastery.', 'March to May, September to December', 'Highland', 27.2885, 88.2433, 'https://images.pexels.com/photos/30733687/pexels-photo-30733687.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Pelling Tour Packages | Sikkim | Kangchenjunga Views', 'Book Pelling Sikkim tour packages. Stunning mountain views and monasteries. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Kerala
  (gen_random_uuid(), 'Cochin', 'cochin', kerala_state, india_id, 'CITY', FALSE, 'Cochin (Kochi) is Kerala''s largest city and a major port, known for its colonial heritage, Chinese fishing nets, and vibrant cultural scene.', 'October to March', 'Tropical monsoon', 9.9312, 76.2673, 'https://images.pexels.com/photos/27833051/pexels-photo-27833051.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Cochin Tour Packages | Kochi Kerala | Heritage City Tours', 'Explore Cochin with its colonial heritage and backwaters. Best Cochin tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Munnar', 'munnar', kerala_state, india_id, 'HILL_STATION', TRUE, 'Munnar is a hill station in Kerala known for its vast tea plantations, misty mountains, and lush green scenery.', 'September to March', 'Subtropical highland – cool and misty', 10.0889, 77.0597, 'https://images.pexels.com/photos/3848200/pexels-photo-3848200.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Munnar Tour Packages | Kerala Tea Garden | Hill Station', 'Book Munnar tour packages. Explore tea gardens, national parks and scenic hills. Best Munnar holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Alleppey', 'alleppey', kerala_state, india_id, 'BEACH', TRUE, 'Alleppey (Alappuzha), the Venice of the East, is famous for its tranquil backwaters, houseboat cruises, and beautiful beaches.', 'November to February', 'Tropical monsoon', 9.4981, 76.3388, 'https://images.pexels.com/photos/28890056/pexels-photo-28890056.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Alleppey Tour Packages | Kerala Backwaters | Houseboat Cruise', 'Experience Kerala''s backwaters and houseboat cruises in Alleppey. Best Alleppey tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Thekkady', 'thekkady', kerala_state, india_id, 'WILDLIFE', FALSE, 'Thekkady is home to Periyar National Park, one of India''s richest wildlife sanctuaries where you can spot elephants on boat safaris.', 'October to March', 'Tropical monsoon', 9.6031, 77.1740, 'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Thekkady Tour Packages | Periyar National Park | Wildlife Tour', 'Book Thekkady tour packages. Periyar boat safari, elephants and spice plantations. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Goa
  (gen_random_uuid(), 'Goa', 'goa', goa_state, india_id, 'BEACH', TRUE, 'Goa, India''s smallest state, is famous for its stunning beaches, Portuguese heritage, vibrant nightlife, and seafood cuisine.', 'November to March', 'Tropical monsoon', 15.2993, 74.1240, 'https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Goa Tour Packages | Beach Holiday | Best Goa Deals', 'Book Goa tour packages. Enjoy beaches, nightlife and Portuguese heritage. Best Goa holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Andaman
  (gen_random_uuid(), 'Port Blair', 'port-blair', andaman_state, india_id, 'ISLAND', FALSE, 'Port Blair, the capital of the Andaman Islands, is the gateway to this pristine archipelago with its colonial history and crystal-clear waters.', 'November to April', 'Tropical', 11.6234, 92.7265, 'https://images.pexels.com/photos/362690/pexels-photo-362690.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Port Blair Tour Packages | Andaman Islands | Best Deals', 'Book Port Blair Andaman tour packages. Cellular Jail, Ross Island, water sports. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Havelock Island', 'havelock-island', andaman_state, india_id, 'ISLAND', FALSE, 'Havelock Island (Swaraj Dweep) is home to the famous Radhanagar Beach, ranked among Asia''s most beautiful beaches.', 'November to April', 'Tropical', 12.0000, 92.9700, 'https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Havelock Island Tour | Radhanagar Beach | Andaman Holiday', 'Book Havelock Island Andaman tour packages. Radhanagar Beach, snorkeling, diving. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Nepal
  (gen_random_uuid(), 'Kathmandu', 'kathmandu', NULL, nepal_id, 'CITY', TRUE, 'Kathmandu, Nepal''s capital, is a city of temples, festivals, and mountain adventure. The Pashupatinath Temple and Boudhanath Stupa are world-famous.', 'September to November, March to May', 'Subtropical highland', 27.7172, 85.3240, 'https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Nepal Tour Packages | Kathmandu | Himalayan Holiday', 'Book Nepal tour packages to Kathmandu, Pokhara and more. Himalayan adventures and spiritual journeys. Book with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Pokhara', 'pokhara', NULL, nepal_id, 'CITY', FALSE, 'Pokhara is Nepal''s adventure capital, a lakeside city with views of the Annapurna range, perfect for trekking, paragliding, and kayaking.', 'September to November, March to May', 'Subtropical', 28.2096, 83.9856, 'https://images.pexels.com/photos/1588134/pexels-photo-1588134.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Pokhara Tour Packages | Nepal Adventure | Annapurna Trekking', 'Book Pokhara Nepal tour packages. Phewa Lake, paragliding, Annapurna trekking. Best Nepal deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Chitwan', 'chitwan', NULL, nepal_id, 'WILDLIFE', FALSE, 'Chitwan National Park is a UNESCO World Heritage Site, home to one-horned rhinoceroses, Bengal tigers, and gharial crocodiles.', 'October to June', 'Subtropical', 27.5291, 84.4284, 'https://images.pexels.com/photos/35489578/pexels-photo-35489578.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Chitwan Tour Packages | Nepal Safari | Rhinoceros Safari', 'Book Chitwan National Park safari packages. One-horned rhino and tiger safari. Best Nepal wildlife tours by Mother India Tour Travels.', NOW(), NOW()),
  -- Thailand
  (gen_random_uuid(), 'Bangkok', 'bangkok', NULL, thailand_id, 'CITY', TRUE, 'Bangkok, Thailand''s capital, is a city of contrasts with ancient temples, modern malls, vibrant street food, and electrifying nightlife.', 'November to April', 'Tropical savanna', 13.7563, 100.5018, 'https://images.pexels.com/photos/30540817/pexels-photo-30540817.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Thailand Tour Packages | Bangkok Pattaya | Best Thailand Deals', 'Book Thailand tour packages. Explore Bangkok, Pattaya and Phuket. Best Thailand holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Pattaya', 'pattaya', NULL, thailand_id, 'BEACH', FALSE, 'Pattaya is a beachside resort city known for its beaches, water sports, theme parks, and vibrant nightlife scene.', 'November to April', 'Tropical savanna', 12.9236, 100.8831, 'https://images.pexels.com/photos/30882228/pexels-photo-30882228.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Pattaya Tour Packages | Beach Resort | Thailand Holiday', 'Book Pattaya Thailand tour packages. Beaches, water sports, Coral Island. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Phuket', 'phuket', NULL, thailand_id, 'BEACH', FALSE, 'Phuket is Thailand''s largest island, famed for its stunning beaches, clear waters, vibrant nightlife at Patong, and island-hopping excursions.', 'November to April', 'Tropical monsoon', 7.8804, 98.3922, 'https://images.pexels.com/photos/4100105/pexels-photo-4100105.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Phuket Tour Packages | Thailand Beach | Best Phuket Deals', 'Book Phuket Thailand tour packages. Patong Beach, island hopping, diving. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Malaysia
  (gen_random_uuid(), 'Kuala Lumpur', 'kuala-lumpur', NULL, malaysia_id, 'CITY', TRUE, 'Kuala Lumpur is Malaysia''s vibrant capital featuring the iconic Petronas Twin Towers, rich multicultural food scene, and Batu Caves.', 'May to July, December to January', 'Tropical rainforest', 3.1390, 101.6869, 'https://images.pexels.com/photos/5396569/pexels-photo-5396569.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Malaysia Tour Packages | Kuala Lumpur | Best Malaysia Deals', 'Book Malaysia tour packages. Visit Petronas Towers, Batu Caves and more. Best Malaysia holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Genting Highlands', 'genting-highlands', NULL, malaysia_id, 'ADVENTURE', FALSE, 'Genting Highlands is a cool highland resort city 50km from KL, home to Resorts World Genting, theme parks, and Malaysia''s only casino.', 'Year round (best Mar-Oct)', 'Highland – cool and misty', 3.4239, 101.7944, 'https://images.pexels.com/photos/26108669/pexels-photo-26108669.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Genting Highlands Tour | Malaysia | Theme Park Holiday', 'Book Genting Highlands Malaysia packages. Resorts World, theme parks, cool weather. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- UAE
  (gen_random_uuid(), 'Dubai', 'dubai', NULL, uae_id, 'CITY', TRUE, 'Dubai, a jewel in the desert, is a city of superlatives – the world''s tallest building, largest mall, and most luxurious hotels.', 'November to March', 'Hot desert', 25.2048, 55.2708, 'https://images.pexels.com/photos/19612315/pexels-photo-19612315.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 'Dubai Tour Packages | UAE Holiday | Best Dubai Deals', 'Book Dubai tour packages. Visit Burj Khalifa, Desert Safari and more. Best Dubai holiday deals by Mother India Tour Travels.', NOW(), NOW())
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "type" = EXCLUDED."type",
    "isFeatured" = EXCLUDED."isFeatured", "description" = EXCLUDED."description",
    "bestTimeToVisit" = EXCLUDED."bestTimeToVisit", "climate" = EXCLUDED."climate",
    "latitude" = EXCLUDED."latitude", "longitude" = EXCLUDED."longitude",
    "image" = EXCLUDED."image", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "updatedAt" = NOW();
END $$;

-- ─────────────────────────────────────────────
-- ATTRACTIONS (replaces JSON topAttractions)
-- With proper coordinates for the map
-- ─────────────────────────────────────────────
DO $$
DECLARE
  delhi_id TEXT; agra_id TEXT; jaipur_id TEXT; varanasi_id TEXT;
  srinagar_id TEXT; manali_id TEXT; rishikesh_id TEXT; munnar_id TEXT;
  alleppey_id TEXT; darjeeling_id TEXT; kathmandu_id TEXT; dubai_id TEXT;
  gulmarg_id TEXT; pahalgam_id TEXT; leh_id TEXT; shimla_id TEXT;
  goa_id TEXT; gangtok_id TEXT;
BEGIN
  SELECT "id" INTO delhi_id FROM "Destination" WHERE "slug" = 'delhi';
  SELECT "id" INTO agra_id FROM "Destination" WHERE "slug" = 'agra';
  SELECT "id" INTO jaipur_id FROM "Destination" WHERE "slug" = 'jaipur';
  SELECT "id" INTO varanasi_id FROM "Destination" WHERE "slug" = 'varanasi';
  SELECT "id" INTO srinagar_id FROM "Destination" WHERE "slug" = 'srinagar';
  SELECT "id" INTO manali_id FROM "Destination" WHERE "slug" = 'manali';
  SELECT "id" INTO rishikesh_id FROM "Destination" WHERE "slug" = 'rishikesh';
  SELECT "id" INTO munnar_id FROM "Destination" WHERE "slug" = 'munnar';
  SELECT "id" INTO alleppey_id FROM "Destination" WHERE "slug" = 'alleppey';
  SELECT "id" INTO darjeeling_id FROM "Destination" WHERE "slug" = 'darjeeling';
  SELECT "id" INTO kathmandu_id FROM "Destination" WHERE "slug" = 'kathmandu';
  SELECT "id" INTO dubai_id FROM "Destination" WHERE "slug" = 'dubai';
  SELECT "id" INTO gulmarg_id FROM "Destination" WHERE "slug" = 'gulmarg';
  SELECT "id" INTO pahalgam_id FROM "Destination" WHERE "slug" = 'pahalgam';
  SELECT "id" INTO leh_id FROM "Destination" WHERE "slug" = 'leh';
  SELECT "id" INTO shimla_id FROM "Destination" WHERE "slug" = 'shimla';
  SELECT "id" INTO goa_id FROM "Destination" WHERE "slug" = 'goa';
  SELECT "id" INTO gangtok_id FROM "Destination" WHERE "slug" = 'gangtok';

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","latitude","longitude","sortOrder") VALUES
  -- Delhi
  (gen_random_uuid(), 'Red Fort', 'red-fort', delhi_id, 'The iconic Mughal-era fort that served as the main residence of the Mughal emperors for nearly 200 years.', 28.6562, 77.2410, 1),
  (gen_random_uuid(), 'Qutub Minar', 'qutub-minar', delhi_id, 'A UNESCO World Heritage Site — the world''s tallest brick minaret, standing 72.5 metres high, built in 1193.', 28.5245, 77.1855, 2),
  (gen_random_uuid(), 'India Gate', 'india-gate', delhi_id, 'A war memorial dedicated to Indian soldiers, set along the ceremonial axis of New Delhi — one of the most iconic monuments in India.', 28.6129, 77.2295, 3),
  (gen_random_uuid(), 'Humayun''s Tomb', 'humayuns-tomb', delhi_id, 'A stunning 16th-century Mughal garden tomb and UNESCO World Heritage Site, the inspiration for the Taj Mahal.', 28.5933, 77.2507, 4),
  (gen_random_uuid(), 'Lotus Temple', 'lotus-temple', delhi_id, 'A stunning Bahá''í House of Worship shaped like a lotus flower, welcoming people of all faiths for prayer and meditation.', 28.5535, 77.2588, 5),
  (gen_random_uuid(), 'Jama Masjid', 'jama-masjid-delhi', delhi_id, 'India''s largest mosque, built by Mughal emperor Shah Jahan, can accommodate 25,000 worshippers in its courtyard.', 28.6507, 77.2334, 6),
  -- Agra
  (gen_random_uuid(), 'Taj Mahal', 'taj-mahal', agra_id, 'One of the Seven Wonders of the World — a white marble mausoleum built by Emperor Shah Jahan as a monument to love, completed in 1653.', 27.1751, 78.0421, 1),
  (gen_random_uuid(), 'Agra Fort', 'agra-fort', agra_id, 'A UNESCO World Heritage Site — a massive red sandstone fort that served as the main residence of the Mughal emperors until 1638.', 27.1800, 78.0218, 2),
  (gen_random_uuid(), 'Fatehpur Sikri', 'fatehpur-sikri', agra_id, 'A UNESCO World Heritage Site — a ghost city built by Emperor Akbar that was abandoned after just 14 years due to water shortage.', 27.0945, 77.6679, 3),
  (gen_random_uuid(), 'Mehtab Bagh', 'mehtab-bagh', agra_id, 'A charbagh complex opposite the Taj Mahal offering the most stunning sunset view of the monument reflected in the Yamuna river.', 27.1840, 78.0458, 4),
  -- Jaipur
  (gen_random_uuid(), 'Amber Fort', 'amber-fort', jaipur_id, 'A magnificent hilltop fortress palace 11km from Jaipur, renowned for its artistic style blending Hindu and Mughal architecture.', 26.9855, 75.8513, 1),
  (gen_random_uuid(), 'Hawa Mahal', 'hawa-mahal', jaipur_id, 'The Palace of Winds — a 5-storey red and pink sandstone palace with 953 small windows (jharokhas), an iconic symbol of Jaipur.', 26.9239, 75.8267, 2),
  (gen_random_uuid(), 'City Palace', 'city-palace-jaipur', jaipur_id, 'The royal residence of the Jaipur Maharajas, now partly a museum showcasing Rajput and Mughal architecture and royal artifacts.', 26.9258, 75.8237, 3),
  (gen_random_uuid(), 'Jantar Mantar', 'jantar-mantar-jaipur', jaipur_id, 'A UNESCO World Heritage Site — the world''s largest stone sundial complex, built in 1734 for astronomical observations.', 26.9246, 75.8242, 4),
  (gen_random_uuid(), 'Nahargarh Fort', 'nahargarh-fort', jaipur_id, 'A hillside fort offering panoramic views of Jaipur city, built as a retreat for Maharaja Jai Singh II in 1734.', 26.9406, 75.8153, 5),
  -- Varanasi
  (gen_random_uuid(), 'Dashashwamedh Ghat', 'dashashwamedh-ghat', varanasi_id, 'Varanasi''s most sacred and spectacular ghat, site of the daily Ganga Aarti ceremony — a mesmerizing fire ritual performed every evening.', 25.3067, 83.0107, 1),
  (gen_random_uuid(), 'Kashi Vishwanath Temple', 'kashi-vishwanath', varanasi_id, 'One of the most famous Hindu temples dedicated to Lord Shiva, considered the holiest of all shiva temples — the Jyotirlinga.', 25.3109, 83.0105, 2),
  (gen_random_uuid(), 'Sarnath', 'sarnath', varanasi_id, 'The site where Buddha gave his first sermon after attaining enlightenment — a major Buddhist pilgrimage site with ruins, museum, and Dhamek Stupa.', 25.3787, 83.0236, 3),
  (gen_random_uuid(), 'Manikarnika Ghat', 'manikarnika-ghat', varanasi_id, 'Hinduism''s most sacred cremation ghat, burning 24 hours a day for centuries — a profound and moving experience of life and death.', 25.3092, 83.0124, 4),
  -- Srinagar
  (gen_random_uuid(), 'Dal Lake', 'dal-lake', srinagar_id, 'The iconic jewel of Kashmir — a 18km² lake famous for its ornate houseboats (shikaras), Mughal Gardens, and floating vegetable markets.', 34.0958, 74.8722, 1),
  (gen_random_uuid(), 'Nishat Bagh', 'nishat-bagh', srinagar_id, 'The Garden of Joy — a spectacular Mughal garden on the eastern shore of Dal Lake with twelve terraces representing the twelve zodiac signs.', 34.1045, 74.8822, 2),
  (gen_random_uuid(), 'Shalimar Bagh', 'shalimar-bagh', srinagar_id, 'Built by Emperor Jahangir for his wife Nur Jahan — the largest Mughal garden in Kashmir, meaning "Abode of Love".', 34.1118, 74.8939, 3),
  (gen_random_uuid(), 'Hazratbal Shrine', 'hazratbal-shrine', srinagar_id, 'A revered Muslim shrine on the western shore of Dal Lake, housing a hair of the Prophet Muhammad — a significant pilgrimage site.', 34.1242, 74.8334, 4),
  -- Gulmarg
  (gen_random_uuid(), 'Gulmarg Gondola', 'gulmarg-gondola', gulmarg_id, 'Asia''s highest and one of the world''s longest cable car rides — ascending to 3,980m with spectacular panoramic views of the Himalayas.', 34.0452, 74.3823, 1),
  (gen_random_uuid(), 'Khilanmarg', 'khilanmarg', gulmarg_id, 'A scenic meadow accessible from Gulmarg, offering stunning views of Nanga Parbat and surrounding peaks, popular for skiing and trekking.', 34.0562, 74.3784, 2),
  -- Manali
  (gen_random_uuid(), 'Solang Valley', 'solang-valley', manali_id, 'An adventure hub 14km from Manali, famous for skiing, zorbing, paragliding, and cable car rides against a backdrop of snow-capped peaks.', 32.3294, 77.1520, 1),
  (gen_random_uuid(), 'Rohtang Pass', 'rohtang-pass', manali_id, 'A high mountain pass at 3,978m connecting Manali to the Spiti and Lahaul valleys — spectacular views and snow even in summer.', 32.3745, 77.2482, 2),
  (gen_random_uuid(), 'Hadimba Devi Temple', 'hadimba-temple', manali_id, 'A unique 16th-century wooden pagoda-style temple built into a cedar forest, dedicated to Hadimba Devi — serene and architecturally stunning.', 32.2415, 77.1746, 3),
  -- Shimla
  (gen_random_uuid(), 'Mall Road', 'mall-road-shimla', shimla_id, 'The heart of Shimla — a colonial-era pedestrian promenade lined with Victorian buildings, shops, restaurants, and mountain views.', 31.1048, 77.1734, 1),
  (gen_random_uuid(), 'Christ Church', 'christ-church-shimla', shimla_id, 'The second oldest church in North India, built in 1857, a neo-Gothic masterpiece dominating the Shimla ridge skyline.', 31.1076, 77.1729, 2),
  (gen_random_uuid(), 'Kufri', 'kufri', shimla_id, 'A small hill station 20km from Shimla, famous for skiing and great Himalayan views — the highest motorable point near Shimla.', 31.0988, 77.2679, 3),
  -- Rishikesh
  (gen_random_uuid(), 'Laxman Jhula', 'laxman-jhula', rishikesh_id, 'A famous iron suspension bridge across the Ganges, said to be where Laxman crossed the river — offering beautiful river and mountain views.', 30.1216, 78.3220, 1),
  (gen_random_uuid(), 'Ram Jhula', 'ram-jhula', rishikesh_id, 'A slightly larger suspension bridge near Rishikesh, with excellent views of the Ganges and surrounding ashrams.', 30.1089, 78.3148, 2),
  (gen_random_uuid(), 'Triveni Ghat', 'triveni-ghat', rishikesh_id, 'The most sacred ghat in Rishikesh where three sacred rivers meet — site of a beautiful evening Ganga Aarti ceremony.', 30.0887, 78.2986, 3),
  -- Munnar
  (gen_random_uuid(), 'Tea Gardens', 'munnar-tea-gardens', munnar_id, 'Vast rolling hills covered in manicured tea bushes — Munnar''s iconic landscape of luxury green tea estates stretching to the horizon.', 10.0889, 77.0597, 1),
  (gen_random_uuid(), 'Eravikulam National Park', 'eravikulam-np', munnar_id, 'Home to the endangered Nilgiri Tahr mountain goat, and famous for the rare Neelakurinji flower that blooms once every 12 years.', 10.1670, 77.0638, 2),
  (gen_random_uuid(), 'Mattupetty Dam', 'mattupetty-dam', munnar_id, 'A scenic reservoir 13km from Munnar, surrounded by lush hills and perfect for boating — with a nearby Indo-Swiss dairy farm.', 10.1175, 77.1164, 3),
  -- Alleppey
  (gen_random_uuid(), 'Vembanad Lake', 'vembanad-lake', alleppey_id, 'Kerala''s largest lake and India''s longest lake — the backdrop for the famous Snake Boat Races and houseboat cruises of Alleppey.', 9.5794, 76.3851, 1),
  (gen_random_uuid(), 'Alappuzha Beach', 'alappuzha-beach', alleppey_id, 'A beautiful, long beach with an old lighthouse and a pier stretching 137m into the sea — perfect for sunset walks.', 9.4880, 76.3257, 2),
  (gen_random_uuid(), 'Kumarakom Bird Sanctuary', 'kumarakom-bird-sanctuary', alleppey_id, 'A beautiful mangrove forest bird sanctuary on the banks of Vembanad Lake, home to migratory birds, waterfowl, and various species.', 9.6167, 76.4167, 3),
  -- Darjeeling
  (gen_random_uuid(), 'Tiger Hill', 'tiger-hill', darjeeling_id, 'At 2,590m, this is the highest peak near Darjeeling, offering stunning sunrise views of Kangchenjunga and, on clear days, Mount Everest.', 26.9849, 88.2987, 1),
  (gen_random_uuid(), 'Batasia Loop', 'batasia-loop', darjeeling_id, 'A famous spiral railway loop where the Darjeeling Himalayan toy train performs a 360-degree loop with panoramic mountain views.', 27.0231, 88.2673, 2),
  (gen_random_uuid(), 'Darjeeling Tea Gardens', 'darjeeling-tea-gardens', darjeeling_id, 'The world-famous Happy Valley Tea Estate and other gardens producing the renowned Darjeeling first-flush and second-flush teas.', 27.0424, 88.2625, 3),
  -- Gangtok
  (gen_random_uuid(), 'MG Marg', 'mg-marg', gangtok_id, 'Gangtok''s vibrant pedestrian main street lined with shops, restaurants, and flower beds — the social heart of the city.', 27.3314, 88.6138, 1),
  (gen_random_uuid(), 'Tsomgo Lake', 'tsomgo-lake', gangtok_id, 'A glacial lake at 3,753m altitude, 40km from Gangtok — sacred to the local people and surrounded by alpine flora and fauna.', 27.3750, 88.7614, 2),
  (gen_random_uuid(), 'Rumtek Monastery', 'rumtek-monastery', gangtok_id, 'One of the largest and most important monasteries in Sikkim, home to a significant collection of Tibetan Buddhist relics.', 27.3014, 88.5847, 3),
  -- Goa
  (gen_random_uuid(), 'Baga Beach', 'baga-beach', goa_id, 'Goa''s most popular beach — known for its vibrant beach shacks, water sports, nightclubs, and buzzing Saturday Night Market.', 15.5525, 73.7516, 1),
  (gen_random_uuid(), 'Basilica of Bom Jesus', 'basilica-bom-jesus', goa_id, 'A UNESCO World Heritage Site — one of the best examples of baroque architecture in India, housing the remains of St. Francis Xavier.', 15.5009, 73.9115, 2),
  (gen_random_uuid(), 'Fort Aguada', 'fort-aguada', goa_id, 'A well-preserved 17th-century Portuguese fort at the confluence of the Mandovi River and the Arabian Sea, offering panoramic coastal views.', 15.4941, 73.7729, 3),
  (gen_random_uuid(), 'Dudhsagar Falls', 'dudhsagar-falls', goa_id, 'One of India''s tallest waterfalls (310m) — located in Bhagwan Mahavir Wildlife Sanctuary, accessible by jeep safaris through the forest.', 15.3148, 74.3141, 4),
  -- Kathmandu
  (gen_random_uuid(), 'Pashupatinath Temple', 'pashupatinath', kathmandu_id, 'UNESCO World Heritage Site — one of the most sacred Hindu temples in the world, dedicated to Lord Shiva, on the banks of the Bagmati River.', 27.7105, 85.3485, 1),
  (gen_random_uuid(), 'Boudhanath Stupa', 'boudhanath', kathmandu_id, 'One of the largest spherical stupas in the world and the most important Buddhist pilgrimage site in Nepal — UNESCO World Heritage Site.', 27.7215, 85.3620, 2),
  (gen_random_uuid(), 'Swayambhunath', 'swayambhunath', kathmandu_id, 'The Monkey Temple — an ancient religious complex atop a hill with panoramic views of Kathmandu Valley and iconic Buddha eyes.', 27.7149, 85.2903, 3),
  (gen_random_uuid(), 'Kathmandu Durbar Square', 'kathmandu-durbar-square', kathmandu_id, 'UNESCO World Heritage Site — a collection of palaces, courtyards, and temples that demonstrate Nepal''s extraordinary Newari architecture.', 27.7045, 85.3075, 4),
  -- Leh
  (gen_random_uuid(), 'Pangong Tso Lake', 'pangong-tso', leh_id, 'A stunning high-altitude brackish lake (4,350m) stretching from India to China, famous for its changing blue hues and 3 Idiots fame.', 33.7599, 78.6580, 1),
  (gen_random_uuid(), 'Khardung La Pass', 'khardung-la', leh_id, 'One of the world''s highest motorable passes at 5,359m, connecting Leh to the Nubra Valley — a must-do Ladakh experience.', 34.2788, 77.6023, 2),
  (gen_random_uuid(), 'Nubra Valley', 'nubra-valley', leh_id, 'A high-altitude cold desert valley north of Leh, famous for double-humped Bactrian camels, sand dunes, and monasteries.', 34.6600, 77.5500, 3),
  (gen_random_uuid(), 'Hemis Monastery', 'hemis-monastery', leh_id, 'The largest and wealthiest monastery in Ladakh, home to a 12m golden Padmasambhava statue and famous Hemis Festival.', 33.9087, 77.6965, 4),
  -- Dubai
  (gen_random_uuid(), 'Burj Khalifa', 'burj-khalifa', dubai_id, 'The world''s tallest building at 828m — offering breathtaking views from the 124th and 148th floor observation decks.', 25.1972, 55.2744, 1),
  (gen_random_uuid(), 'Dubai Mall', 'dubai-mall', dubai_id, 'The world''s largest shopping mall by total area, with over 1,200 shops, the Dubai Aquarium, ice rink, and the iconic Dubai Fountain.', 25.1976, 55.2796, 2),
  (gen_random_uuid(), 'Palm Jumeirah', 'palm-jumeirah', dubai_id, 'The world''s largest man-made island shaped like a palm tree — home to luxury resorts, Atlantis Hotel, and the Palm Monorail.', 25.1124, 55.1390, 3),
  (gen_random_uuid(), 'Desert Safari Dubai', 'desert-safari-dubai', dubai_id, 'A quintessential Dubai experience: dune bashing in 4WDs, camel riding, sandboarding, and a traditional Bedouin camp dinner.', 24.8564, 55.5697, 4)
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "description" = EXCLUDED."description",
    "latitude" = EXCLUDED."latitude", "longitude" = EXCLUDED."longitude",
    "sortOrder" = EXCLUDED."sortOrder";
END $$;

-- ─────────────────────────────────────────────
-- CATEGORIES
-- ─────────────────────────────────────────────
INSERT INTO "Category" ("id","name","slug","description","icon","sortOrder","seoTitle","seoDescription") VALUES
(gen_random_uuid(), 'Domestic Tour Packages', 'domestic-tour-packages', 'Explore the incredible diversity of India with our domestic tour packages. From the snow-capped Himalayas to tropical backwaters, we have it all.', '🇮🇳', 1, 'Domestic Tour Packages India | Best India Holiday Packages', 'Book the best domestic tour packages in India. Explore Delhi, Agra, Jaipur, Kerala, Kashmir, Goa & more with Mother India Tour Travels.'),
(gen_random_uuid(), 'International Tour Packages', 'international-tour-packages', 'Discover beautiful destinations around the world with our international tour packages. Nepal, Thailand, Malaysia, Dubai & more.', '🌍', 2, 'International Tour Packages | Best Overseas Holiday Deals', 'Best international tour packages from India. Travel to Nepal, Thailand, Malaysia, Dubai with Mother India Tour Travels.'),
(gen_random_uuid(), 'North India Tour Packages', 'north-india-tour-packages', 'Explore the rich heritage, culture, and landscapes of North India including Delhi, Agra, Jaipur, Kashmir, Himachal Pradesh and Uttarakhand.', '🏯', 3, 'North India Tour Packages | Delhi Agra Jaipur Kashmir Packages', 'Best North India tour packages covering Delhi, Agra, Jaipur, Kashmir, Shimla, Manali. Book with Mother India Tour Travels.'),
(gen_random_uuid(), 'South India Tour Packages', 'south-india-tour-packages', 'Experience the lush greenery, temples, backwaters, and beaches of South India including Kerala, Tamil Nadu, Karnataka, and Goa.', '🌴', 4, 'South India Tour Packages | Kerala Goa Tamil Nadu Tours', 'Affordable South India tour packages. Explore Kerala backwaters, Tamil Nadu temples, Goa beaches. Book with Mother India Tour Travels.'),
(gen_random_uuid(), 'Honeymoon Tour Packages', 'honeymoon-tour-packages', 'Celebrate your love with our specially curated honeymoon packages to the most romantic destinations in India and abroad.', '💕', 5, 'Honeymoon Tour Packages | Romantic Holiday Packages India', 'Romantic honeymoon tour packages to Kashmir, Kerala, Goa, Shimla, Andaman. Book your dream honeymoon with Mother India Tour Travels.'),
(gen_random_uuid(), 'Family Tour Packages', 'family-tour-packages', 'Create unforgettable memories with your family. Our family tour packages are designed for all age groups with comfortable travel and great accommodations.', '👨‍👩‍👧‍👦', 6, 'Family Tour Packages | Best Family Holiday Packages India', 'Best family tour packages in India. Fun-filled holidays for all ages. Book your family vacation with Mother India Tour Travels.'),
(gen_random_uuid(), 'Spiritual Tour Packages', 'spiritual-tour-packages', 'Embark on a journey of faith and spirituality. Visit the most sacred temples, ghats, and pilgrimage sites across India and Nepal.', '🕉️', 7, 'Spiritual Tour Packages | Pilgrimage Tours India', 'Best spiritual tour packages to Varanasi, Rishikesh, Haridwar, Ayodhya, Mathura, Vrindavan and Nepal. Book with Mother India Tour Travels.'),
(gen_random_uuid(), 'Wildlife Tour Packages', 'wildlife-tour-packages', 'Explore India''s incredible wildlife and national parks. Spot tigers, leopards, elephants, and exotic birds in their natural habitat.', '🐯', 8, 'Wildlife Tour Packages | Tiger Safari India', 'Book wildlife safari tour packages to Ranthambore, Corbett, Bandhavgarh. Tiger safari tours with Mother India Tour Travels.'),
(gen_random_uuid(), 'Rajasthan Tour Packages', 'rajasthan-tour-packages', 'Discover the land of kings with our Rajasthan tour packages. Explore majestic forts, palaces, deserts and the vibrant culture of Rajasthan.', '🏜️', 9, 'Rajasthan Tour Packages | Jaipur Jodhpur Jaisalmer Udaipur Tours', 'Best Rajasthan tour packages covering Jaipur, Jodhpur, Jaisalmer, Udaipur, Pushkar. Book with Mother India Tour Travels.'),
(gen_random_uuid(), 'Adventure Tour Packages', 'adventure-tour-packages', 'For the thrill-seekers — trekking in Himalayas, white-water rafting, paragliding, ski adventures, and jeep safaris across India.', '🧗', 10, 'Adventure Tour Packages | Trekking Rafting Skiing India', 'Best adventure tour packages in India. Himalayan trekking, river rafting, skiing. Book with Mother India Tour Travels.'),
(gen_random_uuid(), 'Beach Tour Packages', 'beach-tour-packages', 'Relax and rejuvenate on India''s beautiful beaches — Goa, Kerala, Andaman, and international beach destinations.', '🏖️', 11, 'Beach Tour Packages | Goa Kerala Andaman | Best Beach Holiday', 'Book beach holiday packages. Goa, Kerala, Andaman, Maldives, Thailand beaches. Best deals by Mother India Tour Travels.'),
(gen_random_uuid(), 'Hill Station Tour Packages', 'hill-station-tour-packages', 'Escape to the cool hills — Shimla, Manali, Mussoorie, Darjeeling, Ooty, and Munnar for a refreshing mountain holiday.', '🏔️', 12, 'Hill Station Tour Packages | Shimla Manali Darjeeling | Best Deals', 'Best hill station tour packages in India. Shimla, Manali, Darjeeling, Ooty, Munnar. Book with Mother India Tour Travels.')
ON CONFLICT ("slug") DO UPDATE SET
  "name" = EXCLUDED."name", "description" = EXCLUDED."description",
  "icon" = EXCLUDED."icon", "sortOrder" = EXCLUDED."sortOrder",
  "seoTitle" = EXCLUDED."seoTitle", "seoDescription" = EXCLUDED."seoDescription";

-- ─────────────────────────────────────────────
-- HERO CONFIG (singleton)
-- ─────────────────────────────────────────────
INSERT INTO "HeroConfig" ("id","mode","videoUrl","updatedAt") VALUES
(1, 'SLIDES', '', NOW())
ON CONFLICT ("id") DO UPDATE SET "mode" = EXCLUDED."mode", "updatedAt" = NOW();

INSERT INTO "HeroSlide" ("id","heroConfigId","image","tag","title","description","sortOrder") VALUES
(gen_random_uuid(), 1, 'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=1920&q=80', 'Taj Mahal, Agra', 'Discover the Wonder of the World', 'Experience the timeless beauty of the Taj Mahal and the rich Mughal heritage of Agra.', 1),
(gen_random_uuid(), 1, 'https://images.unsplash.com/photo-1585136917119-2b25c1f6e0d3?auto=format&fit=crop&w=1920&q=80', 'Dal Lake, Kashmir', 'Paradise on Earth', 'Float through the shimmering Dal Lake on a shikara and experience the magic of Kashmir.', 2),
(gen_random_uuid(), 1, 'https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=1920&q=80', 'Kerala Backwaters', 'God''s Own Country Awaits', 'Glide through the serene backwaters of Kerala on a traditional houseboat surrounded by luxury greenery.', 3),
(gen_random_uuid(), 1, 'https://images.unsplash.com/photo-1587135941948-670b381f08ce?auto=format&fit=crop&w=1920&q=80', 'Jaipur, Rajasthan', 'The Land of Kings', 'Explore majestic forts, vibrant bazaars, and the royal splendor of Rajasthan''s Pink City.', 4)
ON CONFLICT DO NOTHING;

-- ─────────────────────────────────────────────
-- SITE SECTIONS (CMS text for page sections)
-- ─────────────────────────────────────────────
INSERT INTO "SiteSection" ("id","key","tagline","subtitle","image","metaJson") VALUES
(gen_random_uuid(), 'faq', 'All You Should Know Before Embarking on Your Journey', 'We''ve got answers to the most common travel questions from our customers.', 'https://motherindiatourtravels.com/images/trip_ladakh.png', NULL),
(gen_random_uuid(), 'gallery', 'Our Travel Gallery', 'Catch a glimpse of the mesmerizing landscapes, historical monuments, and soulful cultures captured during our curated trips.', NULL, NULL),
(gen_random_uuid(), 'why-choose-us', 'Why Choose Us', 'Two decades of trust, expertise, and unforgettable journeys across India and the world.', NULL, NULL),
(gen_random_uuid(), 'testimonials', 'What Our Travelers Say', 'Thousands of happy travelers have explored India with us. Here''s what they say about their experience.', NULL, NULL),
(gen_random_uuid(), 'destinations', 'Explore Destinations', 'From the snow-capped Himalayas to tropical beaches, discover India''s incredible diversity with our handpicked destinations.', NULL, NULL),
(gen_random_uuid(), 'regions', 'Destination By Region', 'Explore adventures across every corner of the incredible Indian subcontinent', NULL, '[{"id": 1, "name": "North India", "image": "https://images.unsplash.com/photo-1589308078059-be1415eab4c3?auto=format&fit=crop&w=800&q=80", "badges": ["All Adventures", "Deals"], "states": ["delhi", "uttar pradesh", "himachal pradesh", "uttarakhand", "jammu & kashmir", "jammu and kashmir", "ladakh", "punjab", "haryana"]}, {"id": 2, "name": "South India", "image": "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80", "badges": ["Nature", "Wellness"], "states": ["kerala", "karnataka", "tamil nadu", "andhra pradesh", "telangana"]}, {"id": 3, "name": "West India", "image": "https://images.unsplash.com/photo-1605649487212-47bdab064df7?auto=format&fit=crop&w=800&q=80", "badges": ["Beaches", "Heritage"], "states": ["goa", "rajasthan", "gujarat", "maharashtra"]}, {"id": 4, "name": "East India", "image": "https://images.unsplash.com/photo-1555899434-94d1368aa7af?auto=format&fit=crop&w=800&q=80", "badges": ["Hills", "Tea Gardens"], "states": ["west bengal", "odisha", "bihar", "jharkhand"]}, {"id": 5, "name": "Central India", "image": "https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=800&q=80", "badges": ["Culture", "History"], "states": ["madhya pradesh", "chhattisgarh"]}, {"id": 6, "name": "Northeast India", "image": "https://images.unsplash.com/photo-1528127269322-539801943592?auto=format&fit=crop&w=800&q=80", "badges": ["Monasteries", "Scenic"], "states": ["sikkim", "meghalaya", "assam", "arunachal pradesh", "nagaland", "manipur", "mizoram", "tripura"]}]'::jsonb)
ON CONFLICT ("key") DO UPDATE SET
  "tagline" = EXCLUDED."tagline",
  "subtitle" = EXCLUDED."subtitle",
  "image" = EXCLUDED."image",
  "metaJson" = EXCLUDED."metaJson";

-- ─────────────────────────────────────────────
-- GALLERY IMAGES
-- ─────────────────────────────────────────────
DO $$
DECLARE
  agra_id TEXT; kerala_id TEXT; ladakh_id TEXT; raj_id TEXT; varanasi_id TEXT; jaipur_id TEXT;
BEGIN
  SELECT "id" INTO agra_id FROM "Destination" WHERE "slug" = 'agra';
  SELECT "id" INTO kerala_id FROM "Destination" WHERE "slug" = 'alleppey';
  SELECT "id" INTO ladakh_id FROM "Destination" WHERE "slug" = 'leh';
  SELECT "id" INTO raj_id FROM "Destination" WHERE "slug" = 'jaipur';
  SELECT "id" INTO varanasi_id FROM "Destination" WHERE "slug" = 'varanasi';
  SELECT "id" INTO jaipur_id FROM "Destination" WHERE "slug" = 'jaipur';

  DELETE FROM "GalleryImage";
  INSERT INTO "GalleryImage" ("id","title","location","image","altText","sortOrder","destinationId") VALUES
  (gen_random_uuid(), 'Agra (Taj Mahal)', 'Uttar Pradesh', 'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=800&q=80', 'Taj Mahal at sunrise, Agra', 1, agra_id),
  (gen_random_uuid(), 'Houseboat Cruise', 'Alleppey, Kerala', 'https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80', 'Traditional houseboat on Kerala backwaters', 2, kerala_id),
  (gen_random_uuid(), 'Pangong Lake', 'Leh Ladakh', 'https://images.unsplash.com/photo-1596176530529-78163a4f7af2?auto=format&fit=crop&w=800&q=80', 'Pangong Tso lake with blue waters', 3, ladakh_id),
  (gen_random_uuid(), 'Thar Desert Safari', 'Jaisalmer, Rajasthan', 'https://images.unsplash.com/photo-1542856391-010fb87dcfed?auto=format&fit=crop&w=800&q=80', 'Camel safari in the Thar Desert', 4, NULL),
  (gen_random_uuid(), 'Ganges Aarti', 'Varanasi, Uttar Pradesh', 'https://images.unsplash.com/photo-1561361058-c24cecae35ca?auto=format&fit=crop&w=800&q=80', 'Evening Ganga Aarti ceremony on the ghats', 5, varanasi_id),
  (gen_random_uuid(), 'Hawa Mahal', 'Jaipur, Rajasthan', 'https://images.unsplash.com/photo-1603262110263-fb0112e7cc33?auto=format&fit=crop&w=800&q=80', 'Hawa Mahal Palace of Winds facade', 6, jaipur_id)
  ON CONFLICT DO NOTHING;
END $$;

-- ─────────────────────────────────────────────
-- FAQ
-- ─────────────────────────────────────────────
DELETE FROM "FAQ";
INSERT INTO "FAQ" ("id","question","answer","sortOrder","isFeatured") VALUES
(gen_random_uuid(), 'What is included in your tour packages?', 'Our packages typically include comfortable accommodation, dedicated AC transportation with a professional driver, custom sightseeing as per the itinerary, and 24/7 trip support. Meals, flight tickets, and guide service can be added based on your specific requirements. Please check your package details for exact inclusions.', 1, TRUE),
(gen_random_uuid(), 'Can I customize a tour package?', 'Absolutely! All our tour packages are fully customizable. You can request changes to hotels, include additional sightseeing spots, adjust the number of days, or create a completely personalized itinerary. Contact us on WhatsApp or via our forms to design your custom plan.', 2, TRUE),
(gen_random_uuid(), 'How do I book a tour package?', 'You can book by filling out the inquiry forms on package pages, calling us at +91 9810140121, or messaging us on WhatsApp. Our travel coordinators will check hotel availability, share a detailed proposal, and collect an advance payment to confirm your booking.', 3, TRUE),
(gen_random_uuid(), 'What is your cancellation policy?', 'Our cancellation policy strictly follows the individual policy of the respective hotel or service provider. Some hotels are refundable while others are non-refundable. For transport and general package components, standard timelines apply (e.g. 100% cancellation charges within 15 days of travel). Please refer to our Cancellation Policy page for complete details.', 4, TRUE),
(gen_random_uuid(), 'Do you provide visa assistance for international tours?', 'Yes, we provide complete visa guidance and documentation support for all international tour packages. Please note that visa fees and embassy approval are subject to their respective government policies and are outside our direct control.', 5, TRUE),
(gen_random_uuid(), 'What payment methods do you accept?', 'We accept secure bank transfers (NEFT/RTGS/IMPS), UPI payments (GPay, PhonePe, Paytm), cash, and cheques. A booking deposit (typically 25-30%) is required upfront to secure hotel rooms and transportation bookings.', 6, TRUE),
(gen_random_uuid(), 'Are your tours suitable for senior citizens?', 'Yes! We customize itineraries specifically for senior citizens, selecting properties with lift access or ground floor rooms, comfortable AC cars, and slow-paced sightseeing. Please let us know of any health/mobility requirements when booking.', 7, FALSE),
(gen_random_uuid(), 'Do you offer group discounts?', 'Yes, we offer special discounted rates for groups of 10 or more people. We also organize tailored trips for corporate events, family get-togethers, educational institutions, and pilgrimage tours.', 8, FALSE),
(gen_random_uuid(), 'In case of a legal dispute, which court holds jurisdiction?', 'All bookings, transactions, and disputes between the traveler and Mother India Tour Travels are subject exclusively to the court jurisdictions of New Delhi, India, as detailed in our Terms of Service.', 9, FALSE),
(gen_random_uuid(), 'How are my travel photos or videos used by your agency?', 'Any travel media you share in our trip support groups or via email may be shared on our official social media channels to engage our audience. If you prefer to keep your media private, email us at tourtravelsmotherindia@gmail.com and we will ensure it is not uploaded.', 10, FALSE),
(gen_random_uuid(), 'What third-party services on your website collect data or set cookies?', 'We integrate MapTiler for rendering interactive maps, Google Translate for multi-language translations, and Google Analytics to analyze website traffic. These external utilities may set cookies or collect basic data (such as IP addresses). Refer to our Cookie Policy for details.', 11, FALSE),
(gen_random_uuid(), 'How can I request access or deletion of my personal data?', 'You have full rights to request access, correction, or removal of your personal information from our databases. Simply send an email to tourtravelsmotherindia@gmail.com, and we will process your request in compliance with active bookings and legal requirements.', 12, FALSE),
(gen_random_uuid(), 'Are flight tickets booked through you refundable upon cancellation?', 'Airfare cancellations are governed solely by the respective airline''s fare rules and cancellation policies. On-trip changes or promotional flight bookings are generally non-refundable. Please refer to our Cancellation Policy page for details.', 13, FALSE),
(gen_random_uuid(), 'Who bears the cost of medical emergencies or stay-backs during a tour?', 'Travelers are responsible for maintaining their health. Any emergency medical care, evacuations, or unexpected hotel stay-backs must be borne solely by the traveler. We strongly advise purchasing travel insurance to cover these risks.', 14, FALSE)
ON CONFLICT DO NOTHING;

-- ─────────────────────────────────────────────
-- TESTIMONIALS
-- ─────────────────────────────────────────────
DELETE FROM "Testimonial";
INSERT INTO "Testimonial" ("id","reviewer","review","rating","packageName","source","isApproved","isFeatured","createdAt") VALUES
(gen_random_uuid(), 'Rajesh Sharma', 'Had an absolutely wonderful experience with Mother India Tour Travels! Our Golden Triangle tour was perfectly organized. The hotel choices were excellent, the driver was courteous, and the guide was very knowledgeable. Will definitely book again!', 5, 'Golden Triangle Tour', 'Google', TRUE, TRUE, NOW()),
(gen_random_uuid(), 'Priya Mehta', 'Our Kashmir honeymoon was a dream come true thanks to this team. The houseboat on Dal Lake, the shikara rides, Gulmarg snow — everything was perfectly arranged. The team was available 24/7 for any need. Highly recommend!', 5, 'Kashmir Honeymoon Package', 'Google', TRUE, TRUE, NOW()),
(gen_random_uuid(), 'Suresh & Family', 'Booked a 7-day Kerala backwaters tour for our family of 6. The houseboat was spacious and clean, the food was delicious, and the Munnar tea gardens were magical. Mother India Tour Travels took care of everything seamlessly!', 5, 'Kerala Family Tour', 'TripAdvisor', TRUE, TRUE, NOW()),
(gen_random_uuid(), 'Anita Kapoor', 'The Char Dham Yatra package was meticulously planned. Comfortable hotels at each dhama, smooth transportation even on mountain roads, and a very caring team. This was a once-in-a-lifetime spiritual journey. Thank you!', 5, 'Char Dham Yatra Package', 'Google', TRUE, FALSE, NOW()),
(gen_random_uuid(), 'Vikram Singh', 'Excellent Dubai tour! All transfers, Burj Khalifa, desert safari, dhow cruise — everything was on time and perfectly organized. Great value for money. Our family of 4 had a fantastic vacation!', 5, 'Dubai Family Package', 'Google', TRUE, TRUE, NOW()),
(gen_random_uuid(), 'Meena Agarwal', 'We were a group of 15 senior citizens for the Varanasi-Prayagraj pilgrimage. The team arranged everything keeping our age and comfort in mind — from wheelchair assistance to dietary needs. Truly a blessed journey. 5 stars!', 5, 'Varanasi Prayagraj Spiritual Tour', 'Google', TRUE, FALSE, NOW())
ON CONFLICT DO NOTHING;

-- ─────────────────────────────────────────────

-- =============================================================
-- RELATIONAL PACKAGES, VARIANTS, & ITINERARIES
-- Generated by scripts/step4_assemble_seed.js
-- =============================================================

-- =============================================================
-- PACKAGE DATA — Auto-generated by scripts/step4_assemble_seed.js
-- Generated: 2026-07-19T13:43:23.562Z
-- Packages: 20 | Variants: 112
-- =============================================================

-- ─── COUNTRIES ──────────────────────────────────────────────
DO $$
BEGIN
  INSERT INTO "Country" ("id","name","slug","continent","isDomestic","isFeatured","capital","currency","languages","visaRequiredForIndians","visaOnArrival","description","seoTitle","seoDescription","image","latitude","longitude","createdAt","updatedAt")
  VALUES
    (gen_random_uuid(), 'India', 'india', 'Asia', TRUE, FALSE, 'New Delhi', 'INR', ARRAY['Hindi', 'English'], FALSE, FALSE, 'India offers diverse travel experiences across Asia.', '', '', '', 20.5937, 78.9629, NOW(), NOW()),
    (gen_random_uuid(), 'Nepal', 'nepal', 'Asia', FALSE, FALSE, 'Kathmandu', 'NPR', ARRAY['Nepali'], FALSE, TRUE, 'Nepal offers diverse travel experiences across Asia.', '', '', '', 28.3949, 84.124, NOW(), NOW()),
    (gen_random_uuid(), 'United Arab Emirates', 'uae', 'Asia', FALSE, FALSE, 'Abu Dhabi', 'AED', ARRAY['Arabic', 'English'], TRUE, FALSE, 'United Arab Emirates offers diverse travel experiences across Asia.', '', '', '', 23.4241, 53.8478, NOW(), NOW()),
    (gen_random_uuid(), 'Malaysia', 'malaysia', 'Asia', FALSE, FALSE, 'Kuala Lumpur', 'MYR', ARRAY['Malay', 'English'], FALSE, TRUE, 'Malaysia offers diverse travel experiences across Asia.', '', '', '', 4.2105, 101.9758, NOW(), NOW()),
    (gen_random_uuid(), 'Thailand', 'thailand', 'Asia', FALSE, FALSE, 'Bangkok', 'THB', ARRAY['Thai', 'English'], TRUE, TRUE, 'Thailand offers diverse travel experiences across Asia.', '', '', '', 15.87, 100.9925, NOW(), NOW()),
    (gen_random_uuid(), 'Bhutan', 'bhutan', 'Asia', FALSE, FALSE, 'Thimphu', 'BTN', ARRAY['Dzongkha'], FALSE, FALSE, 'Bhutan offers diverse travel experiences across Asia.', '', '', '', 27.5142, 90.4336, NOW(), NOW())
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "isDomestic" = EXCLUDED."isDomestic",
    "capital" = EXCLUDED."capital", "currency" = EXCLUDED."currency",
    "latitude" = EXCLUDED."latitude", "longitude" = EXCLUDED."longitude";
END $$;

-- ─── STATES ─────────────────────────────────────────────────
DO $$
DECLARE india_id TEXT; nepal_id TEXT; uae_id TEXT; malaysia_id TEXT; thailand_id TEXT; bhutan_id TEXT;
BEGIN
  SELECT "id" INTO india_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO nepal_id FROM "Country" WHERE "slug" = 'nepal';
  SELECT "id" INTO uae_id FROM "Country" WHERE "slug" = 'uae';
  SELECT "id" INTO malaysia_id FROM "Country" WHERE "slug" = 'malaysia';
  SELECT "id" INTO thailand_id FROM "Country" WHERE "slug" = 'thailand';
  SELECT "id" INTO bhutan_id FROM "Country" WHERE "slug" = 'bhutan';

  INSERT INTO "State" ("id","name","slug","countryId","capital","isFeatured","description","image","latitude","longitude")
  VALUES
    (gen_random_uuid(), 'Delhi', 'delhi', india_id, 'New Delhi', FALSE, 'Delhi is a state/territory with rich cultural heritage and natural beauty.', '', 28.6139, 77.209),
    (gen_random_uuid(), 'Uttar Pradesh', 'uttar-pradesh', india_id, 'Lucknow', FALSE, 'Uttar Pradesh is a state/territory with rich cultural heritage and natural beauty.', '', 26.8467, 80.9462),
    (gen_random_uuid(), 'Rajasthan', 'rajasthan', india_id, 'Jaipur', FALSE, 'Rajasthan is a state/territory with rich cultural heritage and natural beauty.', '', 27.0238, 74.2179),
    (gen_random_uuid(), 'Himachal Pradesh', 'himachal-pradesh', india_id, 'Shimla', FALSE, 'Himachal Pradesh is a state/territory with rich cultural heritage and natural beauty.', '', 31.1048, 77.1734),
    (gen_random_uuid(), 'Uttarakhand', 'uttarakhand', india_id, 'Dehradun', FALSE, 'Uttarakhand is a state/territory with rich cultural heritage and natural beauty.', '', 30.0668, 79.0193),
    (gen_random_uuid(), 'Jammu & Kashmir', 'jammu-kashmir', india_id, 'Srinagar', FALSE, 'Jammu & Kashmir is a state/territory with rich cultural heritage and natural beauty.', '', 33.7782, 76.5762),
    (gen_random_uuid(), 'West Bengal', 'west-bengal', india_id, 'Kolkata', FALSE, 'West Bengal is a state/territory with rich cultural heritage and natural beauty.', '', 22.9868, 87.855),
    (gen_random_uuid(), 'Sikkim', 'sikkim', india_id, 'Gangtok', FALSE, 'Sikkim is a state/territory with rich cultural heritage and natural beauty.', '', 27.533, 88.5122),
    (gen_random_uuid(), 'Kerala', 'kerala', india_id, 'Thiruvananthapuram', FALSE, 'Kerala is a state/territory with rich cultural heritage and natural beauty.', '', 10.8505, 76.2711),
    (gen_random_uuid(), 'Goa', 'goa', india_id, 'Panaji', FALSE, 'Goa is a state/territory with rich cultural heritage and natural beauty.', '', 15.2993, 74.124),
    (gen_random_uuid(), 'Madhya Pradesh', 'madhya-pradesh', india_id, 'Bhopal', FALSE, 'Madhya Pradesh is a state/territory with rich cultural heritage and natural beauty.', '', 22.9734, 78.6569),
    (gen_random_uuid(), 'Tamil Nadu', 'tamil-nadu', india_id, 'Chennai', FALSE, 'Tamil Nadu is a state/territory with rich cultural heritage and natural beauty.', '', 11.1271, 78.6569),
    (gen_random_uuid(), 'Karnataka', 'karnataka', india_id, 'Bengaluru', FALSE, 'Karnataka is a state/territory with rich cultural heritage and natural beauty.', '', 15.3173, 75.7139),
    (gen_random_uuid(), 'Andaman & Nicobar Islands', 'andaman-nicobar', india_id, 'Port Blair', FALSE, 'Andaman & Nicobar Islands is a state/territory with rich cultural heritage and natural beauty.', '', 11.7401, 92.6586),
    (gen_random_uuid(), 'Punjab', 'punjab', india_id, 'Chandigarh', FALSE, 'Punjab is a state/territory with rich cultural heritage and natural beauty.', '', 31.1471, 75.3412)
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "capital" = EXCLUDED."capital",
    "latitude" = EXCLUDED."latitude", "longitude" = EXCLUDED."longitude";
END $$;

-- ─── DESTINATIONS ───────────────────────────────────────────
DO $$
DECLARE
  india_id TEXT;
  nepal_id TEXT;
  uae_id TEXT;
  malaysia_id TEXT;
  thailand_id TEXT;
  bhutan_id TEXT;
  delhi_state TEXT;
  uttar_pradesh_state TEXT;
  rajasthan_state TEXT;
  himachal_pradesh_state TEXT;
  uttarakhand_state TEXT;
  jammu_kashmir_state TEXT;
  west_bengal_state TEXT;
  sikkim_state TEXT;
  kerala_state TEXT;
  goa_state TEXT;
  madhya_pradesh_state TEXT;
  tamil_nadu_state TEXT;
  karnataka_state TEXT;
  andaman_nicobar_state TEXT;
  punjab_state TEXT;
BEGIN
  SELECT "id" INTO india_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO nepal_id FROM "Country" WHERE "slug" = 'nepal';
  SELECT "id" INTO uae_id FROM "Country" WHERE "slug" = 'uae';
  SELECT "id" INTO malaysia_id FROM "Country" WHERE "slug" = 'malaysia';
  SELECT "id" INTO thailand_id FROM "Country" WHERE "slug" = 'thailand';
  SELECT "id" INTO bhutan_id FROM "Country" WHERE "slug" = 'bhutan';
  SELECT "id" INTO delhi_state FROM "State" WHERE "slug" = 'delhi';
  SELECT "id" INTO uttar_pradesh_state FROM "State" WHERE "slug" = 'uttar-pradesh';
  SELECT "id" INTO rajasthan_state FROM "State" WHERE "slug" = 'rajasthan';
  SELECT "id" INTO himachal_pradesh_state FROM "State" WHERE "slug" = 'himachal-pradesh';
  SELECT "id" INTO uttarakhand_state FROM "State" WHERE "slug" = 'uttarakhand';
  SELECT "id" INTO jammu_kashmir_state FROM "State" WHERE "slug" = 'jammu-kashmir';
  SELECT "id" INTO west_bengal_state FROM "State" WHERE "slug" = 'west-bengal';
  SELECT "id" INTO sikkim_state FROM "State" WHERE "slug" = 'sikkim';
  SELECT "id" INTO kerala_state FROM "State" WHERE "slug" = 'kerala';
  SELECT "id" INTO goa_state FROM "State" WHERE "slug" = 'goa';
  SELECT "id" INTO madhya_pradesh_state FROM "State" WHERE "slug" = 'madhya-pradesh';
  SELECT "id" INTO tamil_nadu_state FROM "State" WHERE "slug" = 'tamil-nadu';
  SELECT "id" INTO karnataka_state FROM "State" WHERE "slug" = 'karnataka';
  SELECT "id" INTO andaman_nicobar_state FROM "State" WHERE "slug" = 'andaman-nicobar';
  SELECT "id" INTO punjab_state FROM "State" WHERE "slug" = 'punjab';

  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt")
  VALUES
    (gen_random_uuid(), 'Delhi', 'delhi', delhi_state, india_id, 'CITY', TRUE, 'Delhi is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Semi-arid, hot summers, cool winters', 28.6139, 77.209, '', 'Delhi Tour Packages | Mother India Tour Travels', 'Explore Delhi with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Agra', 'agra', uttar_pradesh_state, india_id, 'HERITAGE', TRUE, 'Agra is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Semi-arid, hot summers, mild winters', 27.1767, 78.0081, '', 'Agra Tour Packages | Mother India Tour Travels', 'Explore Agra with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Jaipur', 'jaipur', rajasthan_state, india_id, 'CITY', TRUE, 'Jaipur is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Semi-arid, hot summers, mild winters', 26.9124, 75.7873, '', 'Jaipur Tour Packages | Mother India Tour Travels', 'Explore Jaipur with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Varanasi', 'varanasi', uttar_pradesh_state, india_id, 'PILGRIMAGE', TRUE, 'Varanasi is a premier travel destination known for its unique cultural and natural heritage.', 'November to February', 'Humid subtropical, hot summers', 25.3176, 82.9739, '', 'Varanasi Tour Packages | Mother India Tour Travels', 'Explore Varanasi with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Mathura', 'mathura', uttar_pradesh_state, india_id, 'PILGRIMAGE', FALSE, 'Mathura is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Semi-arid', 27.4924, 77.6737, '', 'Mathura Tour Packages | Mother India Tour Travels', 'Explore Mathura with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Khajuraho', 'khajuraho', madhya_pradesh_state, india_id, 'HERITAGE', FALSE, 'Khajuraho is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Tropical, hot summers, cool winters', 24.8318, 79.9199, '', 'Khajuraho Tour Packages | Mother India Tour Travels', 'Explore Khajuraho with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Ranthambore', 'ranthambore', rajasthan_state, india_id, 'WILDLIFE', FALSE, 'Ranthambore is a premier travel destination known for its unique cultural and natural heritage.', 'October to June', 'Dry, warm', 26.0173, 76.5026, '', 'Ranthambore Tour Packages | Mother India Tour Travels', 'Explore Ranthambore with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Pushkar', 'pushkar', rajasthan_state, india_id, 'PILGRIMAGE', FALSE, 'Pushkar is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Desert, hot and dry', 26.4899, 74.5513, '', 'Pushkar Tour Packages | Mother India Tour Travels', 'Explore Pushkar with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Udaipur', 'udaipur', rajasthan_state, india_id, 'CITY', TRUE, 'Udaipur is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Semi-arid, moderate', 24.5854, 73.7125, '', 'Udaipur Tour Packages | Mother India Tour Travels', 'Explore Udaipur with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Jodhpur', 'jodhpur', rajasthan_state, india_id, 'CITY', FALSE, 'Jodhpur is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Desert, hot and dry', 26.2389, 73.0243, '', 'Jodhpur Tour Packages | Mother India Tour Travels', 'Explore Jodhpur with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Jaisalmer', 'jaisalmer', rajasthan_state, india_id, 'HERITAGE', FALSE, 'Jaisalmer is a premier travel destination known for its unique cultural and natural heritage.', 'October to February', 'Desert, extreme temperatures', 26.9157, 70.9083, '', 'Jaisalmer Tour Packages | Mother India Tour Travels', 'Explore Jaisalmer with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Bikaner', 'bikaner', rajasthan_state, india_id, 'CITY', FALSE, 'Bikaner is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Desert', 28.0229, 73.3119, '', 'Bikaner Tour Packages | Mother India Tour Travels', 'Explore Bikaner with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Haridwar', 'haridwar', uttarakhand_state, india_id, 'PILGRIMAGE', FALSE, 'Haridwar is a premier travel destination known for its unique cultural and natural heritage.', 'February to May, September to November', 'Subtropical highland', 29.9457, 78.1642, '', 'Haridwar Tour Packages | Mother India Tour Travels', 'Explore Haridwar with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Rishikesh', 'rishikesh', uttarakhand_state, india_id, 'ADVENTURE', FALSE, 'Rishikesh is a premier travel destination known for its unique cultural and natural heritage.', 'February to May, September to November', 'Subtropical highland', 30.0869, 78.2676, '', 'Rishikesh Tour Packages | Mother India Tour Travels', 'Explore Rishikesh with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Nainital', 'nainital', uttarakhand_state, india_id, 'HILL_STATION', FALSE, 'Nainital is a premier travel destination known for its unique cultural and natural heritage.', 'March to June, September to November', 'Humid temperate', 29.3919, 79.4542, '', 'Nainital Tour Packages | Mother India Tour Travels', 'Explore Nainital with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Mussoorie', 'mussoorie', uttarakhand_state, india_id, 'HILL_STATION', FALSE, 'Mussoorie is a premier travel destination known for its unique cultural and natural heritage.', 'March to June', 'Humid temperate', 30.4598, 78.0664, '', 'Mussoorie Tour Packages | Mother India Tour Travels', 'Explore Mussoorie with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Jim Corbett', 'jim-corbett', uttarakhand_state, india_id, 'WILDLIFE', FALSE, 'Jim Corbett is a premier travel destination known for its unique cultural and natural heritage.', 'November to June', 'Tropical, warm', 29.53, 78.7747, '', 'Jim Corbett Tour Packages | Mother India Tour Travels', 'Explore Jim Corbett with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Shimla', 'shimla', himachal_pradesh_state, india_id, 'HILL_STATION', TRUE, 'Shimla is a premier travel destination known for its unique cultural and natural heritage.', 'March to June, September to December', 'Humid subtropical highland', 31.1048, 77.1734, '', 'Shimla Tour Packages | Mother India Tour Travels', 'Explore Shimla with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Manali', 'manali', himachal_pradesh_state, india_id, 'HILL_STATION', TRUE, 'Manali is a premier travel destination known for its unique cultural and natural heritage.', 'October to June', 'Alpine, cold', 32.2396, 77.1887, '', 'Manali Tour Packages | Mother India Tour Travels', 'Explore Manali with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Dharamshala', 'dharamshala', himachal_pradesh_state, india_id, 'HILL_STATION', FALSE, 'Dharamshala is a premier travel destination known for its unique cultural and natural heritage.', 'March to June, September to November', 'Subtropical highland', 32.219, 76.3234, '', 'Dharamshala Tour Packages | Mother India Tour Travels', 'Explore Dharamshala with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Amritsar', 'amritsar', punjab_state, india_id, 'PILGRIMAGE', FALSE, 'Amritsar is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Semi-arid', 31.634, 74.8723, '', 'Amritsar Tour Packages | Mother India Tour Travels', 'Explore Amritsar with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Srinagar', 'srinagar', jammu_kashmir_state, india_id, 'CITY', TRUE, 'Srinagar is a premier travel destination known for its unique cultural and natural heritage.', 'April to October', 'Humid continental, cold winters', 34.0837, 74.7973, '', 'Srinagar Tour Packages | Mother India Tour Travels', 'Explore Srinagar with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Gulmarg', 'gulmarg', jammu_kashmir_state, india_id, 'ADVENTURE', FALSE, 'Gulmarg is a premier travel destination known for its unique cultural and natural heritage.', 'December to March (skiing), April to June (summer)', 'Alpine, heavy snowfall', 34.0484, 74.3805, '', 'Gulmarg Tour Packages | Mother India Tour Travels', 'Explore Gulmarg with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Pahalgam', 'pahalgam', jammu_kashmir_state, india_id, 'HILL_STATION', FALSE, 'Pahalgam is a premier travel destination known for its unique cultural and natural heritage.', 'May to September', 'Alpine, pleasant summers', 34.0161, 75.315, '', 'Pahalgam Tour Packages | Mother India Tour Travels', 'Explore Pahalgam with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Vaishno Devi', 'vaishno-devi', jammu_kashmir_state, india_id, 'PILGRIMAGE', FALSE, 'Vaishno Devi is a premier travel destination known for its unique cultural and natural heritage.', 'Year-round', 'Temperate', 32.9868, 74.9529, '', 'Vaishno Devi Tour Packages | Mother India Tour Travels', 'Explore Vaishno Devi with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Ayodhya', 'ayodhya', uttar_pradesh_state, india_id, 'PILGRIMAGE', FALSE, 'Ayodhya is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Humid subtropical', 26.7922, 82.1998, '', 'Ayodhya Tour Packages | Mother India Tour Travels', 'Explore Ayodhya with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Prayagraj', 'prayagraj', uttar_pradesh_state, india_id, 'PILGRIMAGE', FALSE, 'Prayagraj is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Humid subtropical', 25.4358, 81.8463, '', 'Prayagraj Tour Packages | Mother India Tour Travels', 'Explore Prayagraj with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Goa', 'goa', goa_state, india_id, 'BEACH', TRUE, 'Goa is a premier travel destination known for its unique cultural and natural heritage.', 'November to March', 'Tropical, hot and humid, distinct monsoon', 15.2993, 74.124, '', 'Goa Tour Packages | Mother India Tour Travels', 'Explore Goa with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Kochi (Cochin)', 'kochi', kerala_state, india_id, 'CITY', FALSE, 'Kochi (Cochin) is a premier travel destination known for its unique cultural and natural heritage.', 'September to March', 'Tropical monsoon, warm and humid', 9.9312, 76.2673, '', 'Kochi (Cochin) Tour Packages | Mother India Tour Travels', 'Explore Kochi (Cochin) with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Munnar', 'munnar', kerala_state, india_id, 'HILL_STATION', FALSE, 'Munnar is a premier travel destination known for its unique cultural and natural heritage.', 'September to May', 'Cool and misty, moderate temperatures', 10.0889, 77.0595, '', 'Munnar Tour Packages | Mother India Tour Travels', 'Explore Munnar with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Thekkady', 'thekkady', kerala_state, india_id, 'WILDLIFE', FALSE, 'Thekkady is a premier travel destination known for its unique cultural and natural heritage.', 'September to April', 'Tropical, warm', 9.5927, 77.1636, '', 'Thekkady Tour Packages | Mother India Tour Travels', 'Explore Thekkady with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Alleppey (Alappuzha)', 'alleppey', kerala_state, india_id, 'BEACH', FALSE, 'Alleppey (Alappuzha) is a premier travel destination known for its unique cultural and natural heritage.', 'November to February', 'Tropical, hot and humid', 9.4981, 76.3388, '', 'Alleppey (Alappuzha) Tour Packages | Mother India Tour Tr...', 'Explore Alleppey (Alappuzha) with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Kovalam', 'kovalam', kerala_state, india_id, 'BEACH', FALSE, 'Kovalam is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Tropical, warm', 8.3988, 76.9782, '', 'Kovalam Tour Packages | Mother India Tour Travels', 'Explore Kovalam with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Port Blair', 'port-blair', andaman_nicobar_state, india_id, 'CITY', FALSE, 'Port Blair is a premier travel destination known for its unique cultural and natural heritage.', 'November to March', 'Tropical, warm and humid', 11.6234, 92.7265, '', 'Port Blair Tour Packages | Mother India Tour Travels', 'Explore Port Blair with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Havelock Island', 'havelock-island', andaman_nicobar_state, india_id, 'ISLAND', FALSE, 'Havelock Island is a premier travel destination known for its unique cultural and natural heritage.', 'November to April', 'Tropical, warm', 11.9717, 93.0012, '', 'Havelock Island Tour Packages | Mother India Tour Travels', 'Explore Havelock Island with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Neil Island', 'neil-island', andaman_nicobar_state, india_id, 'ISLAND', FALSE, 'Neil Island is a premier travel destination known for its unique cultural and natural heritage.', 'November to April', 'Tropical, warm', 11.8282, 92.7292, '', 'Neil Island Tour Packages | Mother India Tour Travels', 'Explore Neil Island with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Gangtok', 'gangtok', sikkim_state, india_id, 'CITY', FALSE, 'Gangtok is a premier travel destination known for its unique cultural and natural heritage.', 'March to June, September to November', 'Subtropical highland, cool', 27.3389, 88.6065, '', 'Gangtok Tour Packages | Mother India Tour Travels', 'Explore Gangtok with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Darjeeling', 'darjeeling', west_bengal_state, india_id, 'HILL_STATION', FALSE, 'Darjeeling is a premier travel destination known for its unique cultural and natural heritage.', 'March to May, September to November', 'Subtropical highland, cool', 27.036, 88.2627, '', 'Darjeeling Tour Packages | Mother India Tour Travels', 'Explore Darjeeling with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Pelling', 'pelling', sikkim_state, india_id, 'HILL_STATION', FALSE, 'Pelling is a premier travel destination known for its unique cultural and natural heritage.', 'March to May, September to November', 'Temperate, cool', 27.2959, 88.118, '', 'Pelling Tour Packages | Mother India Tour Travels', 'Explore Pelling with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Ooty (Udhagamandalam)', 'ooty', tamil_nadu_state, india_id, 'HILL_STATION', FALSE, 'Ooty (Udhagamandalam) is a premier travel destination known for its unique cultural and natural heritage.', 'April to June, September to November', 'Temperate highland, cool', 11.4102, 76.695, '', 'Ooty (Udhagamandalam) Tour Packages | Mother India Tour T...', 'Explore Ooty (Udhagamandalam) with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Mysore', 'mysore', karnataka_state, india_id, 'CITY', FALSE, 'Mysore is a premier travel destination known for its unique cultural and natural heritage.', 'October to February', 'Tropical savanna, warm', 12.2958, 76.6394, '', 'Mysore Tour Packages | Mother India Tour Travels', 'Explore Mysore with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Kodaikanal', 'kodaikanal', tamil_nadu_state, india_id, 'HILL_STATION', FALSE, 'Kodaikanal is a premier travel destination known for its unique cultural and natural heritage.', 'April to June', 'Subtropical highland, cool', 10.2381, 77.4892, '', 'Kodaikanal Tour Packages | Mother India Tour Travels', 'Explore Kodaikanal with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Coorg (Kodagu)', 'coorg', karnataka_state, india_id, 'HILL_STATION', FALSE, 'Coorg (Kodagu) is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Tropical highland, pleasant', 12.3375, 75.8069, '', 'Coorg (Kodagu) Tour Packages | Mother India Tour Travels', 'Explore Coorg (Kodagu) with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Mandawa', 'mandawa', rajasthan_state, india_id, 'HERITAGE', FALSE, 'Mandawa is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Desert, hot and dry', 28.0568, 75.1481, '', 'Mandawa Tour Packages | Mother India Tour Travels', 'Explore Mandawa with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Kathmandu', 'kathmandu', NULL, nepal_id, 'CITY', TRUE, 'Kathmandu is a premier travel destination known for its unique cultural and natural heritage.', 'September to November, March to May', 'Subtropical highland, mild', 27.7172, 85.324, '', 'Kathmandu Tour Packages | Mother India Tour Travels', 'Explore Kathmandu with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Pokhara', 'pokhara', NULL, nepal_id, 'CITY', FALSE, 'Pokhara is a premier travel destination known for its unique cultural and natural heritage.', 'September to November, March to May', 'Subtropical, mild', 28.2096, 83.9856, '', 'Pokhara Tour Packages | Mother India Tour Travels', 'Explore Pokhara with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Lumbini', 'lumbini', NULL, nepal_id, 'PILGRIMAGE', FALSE, 'Lumbini is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Tropical, warm', 27.4833, 83.2764, '', 'Lumbini Tour Packages | Mother India Tour Travels', 'Explore Lumbini with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Nagarkot', 'nagarkot', NULL, nepal_id, 'HILL_STATION', FALSE, 'Nagarkot is a premier travel destination known for its unique cultural and natural heritage.', 'October to March', 'Temperate, cool, Himalayan views', 27.7197, 85.5194, '', 'Nagarkot Tour Packages | Mother India Tour Travels', 'Explore Nagarkot with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Dubai', 'dubai', NULL, uae_id, 'CITY', TRUE, 'Dubai is a premier travel destination known for its unique cultural and natural heritage.', 'November to March', 'Desert, extreme heat in summer', 25.2048, 55.2708, '', 'Dubai Tour Packages | Mother India Tour Travels', 'Explore Dubai with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Abu Dhabi', 'abu-dhabi', NULL, uae_id, 'CITY', FALSE, 'Abu Dhabi is a premier travel destination known for its unique cultural and natural heritage.', 'November to March', 'Desert, hot and dry', 24.4539, 54.3773, '', 'Abu Dhabi Tour Packages | Mother India Tour Travels', 'Explore Abu Dhabi with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Kuala Lumpur', 'kuala-lumpur', NULL, malaysia_id, 'CITY', TRUE, 'Kuala Lumpur is a premier travel destination known for its unique cultural and natural heritage.', 'May to July, December to February', 'Tropical rainforest, hot and humid', 3.139, 101.6869, '', 'Kuala Lumpur Tour Packages | Mother India Tour Travels', 'Explore Kuala Lumpur with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Penang', 'penang', NULL, malaysia_id, 'CITY', FALSE, 'Penang is a premier travel destination known for its unique cultural and natural heritage.', 'November to March', 'Tropical, warm and humid', 5.4141, 100.3288, '', 'Penang Tour Packages | Mother India Tour Travels', 'Explore Penang with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Langkawi', 'langkawi', NULL, malaysia_id, 'ISLAND', FALSE, 'Langkawi is a premier travel destination known for its unique cultural and natural heritage.', 'November to April', 'Tropical, warm and humid', 6.35, 99.8, '', 'Langkawi Tour Packages | Mother India Tour Travels', 'Explore Langkawi with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Bangkok', 'bangkok', NULL, thailand_id, 'CITY', TRUE, 'Bangkok is a premier travel destination known for its unique cultural and natural heritage.', 'November to February', 'Tropical savanna, hot and humid', 13.7563, 100.5018, '', 'Bangkok Tour Packages | Mother India Tour Travels', 'Explore Bangkok with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Pattaya', 'pattaya', NULL, thailand_id, 'BEACH', FALSE, 'Pattaya is a premier travel destination known for its unique cultural and natural heritage.', 'November to February', 'Tropical, warm and humid', 12.9236, 100.8825, '', 'Pattaya Tour Packages | Mother India Tour Travels', 'Explore Pattaya with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Phuket', 'phuket', NULL, thailand_id, 'ISLAND', FALSE, 'Phuket is a premier travel destination known for its unique cultural and natural heritage.', 'November to February', 'Tropical, warm and humid', 7.8804, 98.3923, '', 'Phuket Tour Packages | Mother India Tour Travels', 'Explore Phuket with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Chiang Mai', 'chiang-mai', NULL, thailand_id, 'CITY', FALSE, 'Chiang Mai is a premier travel destination known for its unique cultural and natural heritage.', 'November to February', 'Tropical, warm, cooler in winter', 18.7883, 98.9853, '', 'Chiang Mai Tour Packages | Mother India Tour Travels', 'Explore Chiang Mai with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Paro', 'paro', NULL, bhutan_id, 'CITY', FALSE, 'Paro is a premier travel destination known for its unique cultural and natural heritage.', 'March to May, September to November', 'Humid subtropical, cool', 27.4287, 89.4164, '', 'Paro Tour Packages | Mother India Tour Travels', 'Explore Paro with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Thimphu', 'thimphu', NULL, bhutan_id, 'CITY', FALSE, 'Thimphu is a premier travel destination known for its unique cultural and natural heritage.', 'March to May, September to November', 'Humid subtropical, cool', 27.4661, 89.6419, '', 'Thimphu Tour Packages | Mother India Tour Travels', 'Explore Thimphu with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Punakha', 'punakha', NULL, bhutan_id, 'CITY', FALSE, 'Punakha is a premier travel destination known for its unique cultural and natural heritage.', 'March to May, September to November', 'Warm subtropical, pleasant', 27.5921, 89.8678, '', 'Punakha Tour Packages | Mother India Tour Travels', 'Explore Punakha with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Phobjikha Valley', 'phobjikha-valley', NULL, bhutan_id, 'REGION', FALSE, 'Phobjikha Valley is a premier travel destination known for its unique cultural and natural heritage.', 'October to March (cranes)', 'Alpine, cool', 27.4598, 90.1762, '', 'Phobjikha Valley Tour Packages | Mother India Tour Travels', 'Explore Phobjikha Valley with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW()),
    (gen_random_uuid(), 'Phuentsholing', 'phuentsholing', NULL, bhutan_id, 'CITY', FALSE, 'Phuentsholing is a premier travel destination known for its unique cultural and natural heritage.', 'March to June, September to November', 'Subtropical, warm', 26.8616, 89.3832, '', 'Phuentsholing Tour Packages | Mother India Tour Travels', 'Explore Phuentsholing with Mother India Tour Travels. Best packages, sightseeing, and travel deals. Book now!', NOW(), NOW())
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "isFeatured" = EXCLUDED."isFeatured",
    "bestTimeToVisit" = EXCLUDED."bestTimeToVisit", "climate" = EXCLUDED."climate",
    "latitude" = EXCLUDED."latitude", "longitude" = EXCLUDED."longitude";
END $$;

-- ─── ATTRACTIONS ────────────────────────────────────────────
DO $$
BEGIN
  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Red Fort', 'red-fort', d."id", 'Red Fort is one of the top attractions at Delhi.', '', 28.6562, 77.241, 1
  FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Qutub Minar', 'qutub-minar', d."id", 'Qutub Minar is one of the top attractions at Delhi.', '', 28.5244, 77.1855, 2
  FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'India Gate', 'india-gate', d."id", 'India Gate is one of the top attractions at Delhi.', '', 28.6129, 77.2295, 3
  FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Humayun''s Tomb', 'humayuns-tomb', d."id", 'Humayun''s Tomb is one of the top attractions at Delhi.', '', 28.5933, 77.2507, 4
  FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Lotus Temple', 'lotus-temple', d."id", 'Lotus Temple is one of the top attractions at Delhi.', '', 28.5535, 77.2588, 5
  FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Taj Mahal', 'taj-mahal', d."id", 'Taj Mahal is one of the top attractions at Agra.', '', 27.1751, 78.0421, 1
  FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Agra Fort', 'agra-fort', d."id", 'Agra Fort is one of the top attractions at Agra.', '', 27.1795, 78.0211, 2
  FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Fatehpur Sikri', 'fatehpur-sikri', d."id", 'Fatehpur Sikri is one of the top attractions at Agra.', '', 27.0945, 77.6667, 3
  FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Amber Fort', 'amber-fort', d."id", 'Amber Fort is one of the top attractions at Jaipur.', '', 26.9855, 75.8513, 1
  FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Hawa Mahal', 'hawa-mahal', d."id", 'Hawa Mahal is one of the top attractions at Jaipur.', '', 26.9239, 75.8267, 2
  FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'City Palace', 'city-palace-jaipur', d."id", 'City Palace is one of the top attractions at Jaipur.', '', 26.9258, 75.8237, 3
  FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Kashi Vishwanath Temple', 'kashi-vishwanath', d."id", 'Kashi Vishwanath Temple is one of the top attractions at Varanasi.', '', 25.3109, 83.0107, 1
  FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Dasaswamedh Ghat', 'dasaswamedh-ghat', d."id", 'Dasaswamedh Ghat is one of the top attractions at Varanasi.', '', 25.3076, 83.0113, 2
  FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Sarnath', 'sarnath', d."id", 'Sarnath is one of the top attractions at Varanasi.', '', 25.3714, 83.0228, 3
  FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Dal Lake', 'dal-lake', d."id", 'Dal Lake is one of the top attractions at Srinagar.', '', 34.106, 74.8419, 1
  FROM "Destination" d WHERE d."slug" = 'srinagar'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Mughal Gardens (Shalimar Bagh)', 'mughal-gardens', d."id", 'Mughal Gardens (Shalimar Bagh) is one of the top attractions at Srinagar.', '', 34.1148, 74.8627, 2
  FROM "Destination" d WHERE d."slug" = 'srinagar'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Shankaracharya Temple', 'shankaracharya-temple', d."id", 'Shankaracharya Temple is one of the top attractions at Srinagar.', '', 34.0838, 74.8361, 3
  FROM "Destination" d WHERE d."slug" = 'srinagar'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Mall Road', 'mall-road-shimla', d."id", 'Mall Road is one of the top attractions at Shimla.', '', 31.1048, 77.1734, 1
  FROM "Destination" d WHERE d."slug" = 'shimla'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Jakhu Temple', 'jakhu-temple', d."id", 'Jakhu Temple is one of the top attractions at Shimla.', '', 31.1073, 77.1894, 2
  FROM "Destination" d WHERE d."slug" = 'shimla'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Rohtang Pass', 'rohtang-pass', d."id", 'Rohtang Pass is one of the top attractions at Manali.', '', 32.3714, 77.2498, 1
  FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Solang Valley', 'solang-valley', d."id", 'Solang Valley is one of the top attractions at Manali.', '', 32.3201, 77.1584, 2
  FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Hadimba Temple', 'hadimba-temple', d."id", 'Hadimba Temple is one of the top attractions at Manali.', '', 32.2378, 77.1803, 3
  FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Khajuraho Temples', 'khajuraho-temples', d."id", 'Khajuraho Temples is one of the top attractions at Khajuraho.', '', 24.8318, 79.9199, 1
  FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Baga Beach', 'baga-beach', d."id", 'Baga Beach is one of the top attractions at Goa.', '', 15.5527, 73.7521, 1
  FROM "Destination" d WHERE d."slug" = 'goa'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Calangute Beach', 'calangute-beach', d."id", 'Calangute Beach is one of the top attractions at Goa.', '', 15.544, 73.7518, 2
  FROM "Destination" d WHERE d."slug" = 'goa'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Basilica of Bom Jesus', 'basilica-bom-jesus', d."id", 'Basilica of Bom Jesus is one of the top attractions at Goa.', '', 15.5009, 73.9117, 3
  FROM "Destination" d WHERE d."slug" = 'goa'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Fort Aguada', 'fort-aguada', d."id", 'Fort Aguada is one of the top attractions at Goa.', '', 15.4946, 73.7733, 4
  FROM "Destination" d WHERE d."slug" = 'goa'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Periyar Tiger Reserve', 'periyar-tiger-reserve', d."id", 'Periyar Tiger Reserve is one of the top attractions at Thekkady.', '', 9.5927, 77.1636, 1
  FROM "Destination" d WHERE d."slug" = 'thekkady'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Alleppey Backwaters', 'alleppey-backwaters', d."id", 'Alleppey Backwaters is one of the top attractions at Alleppey (Alappuzha).', '', 9.4981, 76.3388, 1
  FROM "Destination" d WHERE d."slug" = 'alleppey'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Tea Gardens', 'tea-gardens-munnar', d."id", 'Tea Gardens is one of the top attractions at Munnar.', '', 10.0889, 77.0595, 1
  FROM "Destination" d WHERE d."slug" = 'munnar'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Radhanagar Beach', 'radhanagar-beach', d."id", 'Radhanagar Beach is one of the top attractions at Havelock Island.', '', 11.9717, 93.0012, 1
  FROM "Destination" d WHERE d."slug" = 'havelock-island'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Cellular Jail', 'cellular-jail', d."id", 'Cellular Jail is one of the top attractions at Port Blair.', '', 11.6693, 92.7538, 1
  FROM "Destination" d WHERE d."slug" = 'port-blair'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Ross Island', 'ross-island', d."id", 'Ross Island is one of the top attractions at Port Blair.', '', 11.6734, 92.7759, 2
  FROM "Destination" d WHERE d."slug" = 'port-blair'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Pashupatinath Temple', 'pashupatinath', d."id", 'Pashupatinath Temple is one of the top attractions at Kathmandu.', '', 27.7105, 85.3487, 1
  FROM "Destination" d WHERE d."slug" = 'kathmandu'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Swayambhunath (Monkey Temple)', 'swayambhunath', d."id", 'Swayambhunath (Monkey Temple) is one of the top attractions at Kathmandu.', '', 27.7149, 85.29, 2
  FROM "Destination" d WHERE d."slug" = 'kathmandu'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Boudhanath Stupa', 'boudhanath', d."id", 'Boudhanath Stupa is one of the top attractions at Kathmandu.', '', 27.7215, 85.362, 3
  FROM "Destination" d WHERE d."slug" = 'kathmandu'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Phewa Lake', 'phewa-lake', d."id", 'Phewa Lake is one of the top attractions at Pokhara.', '', 28.2096, 83.9856, 1
  FROM "Destination" d WHERE d."slug" = 'pokhara'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Burj Khalifa', 'burj-khalifa', d."id", 'Burj Khalifa is one of the top attractions at Dubai.', '', 25.1972, 55.2744, 1
  FROM "Destination" d WHERE d."slug" = 'dubai'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Dubai Mall', 'dubai-mall', d."id", 'Dubai Mall is one of the top attractions at Dubai.', '', 25.1985, 55.2796, 2
  FROM "Destination" d WHERE d."slug" = 'dubai'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Palm Jumeirah', 'palm-jumeirah', d."id", 'Palm Jumeirah is one of the top attractions at Dubai.', '', 25.1124, 55.139, 3
  FROM "Destination" d WHERE d."slug" = 'dubai'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Desert Safari', 'desert-safari-dubai', d."id", 'Desert Safari is one of the top attractions at Dubai.', '', 24.8929, 55.4005, 4
  FROM "Destination" d WHERE d."slug" = 'dubai'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Petronas Twin Towers', 'petronas-towers', d."id", 'Petronas Twin Towers is one of the top attractions at Kuala Lumpur.', '', 3.1579, 101.7116, 1
  FROM "Destination" d WHERE d."slug" = 'kuala-lumpur'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Batu Caves', 'batu-caves', d."id", 'Batu Caves is one of the top attractions at Kuala Lumpur.', '', 3.2379, 101.684, 2
  FROM "Destination" d WHERE d."slug" = 'kuala-lumpur'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Grand Palace', 'grand-palace-bangkok', d."id", 'Grand Palace is one of the top attractions at Bangkok.', '', 13.75, 100.4913, 1
  FROM "Destination" d WHERE d."slug" = 'bangkok'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Wat Pho', 'wat-pho', d."id", 'Wat Pho is one of the top attractions at Bangkok.', '', 13.7465, 100.4927, 2
  FROM "Destination" d WHERE d."slug" = 'bangkok'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Patong Beach', 'patong-beach', d."id", 'Patong Beach is one of the top attractions at Phuket.', '', 7.8997, 98.2954, 1
  FROM "Destination" d WHERE d."slug" = 'phuket'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Tiger''s Nest (Taktsang Monastery)', 'tigers-nest', d."id", 'Tiger''s Nest (Taktsang Monastery) is one of the top attractions at Paro.', '', 27.4712, 89.3631, 1
  FROM "Destination" d WHERE d."slug" = 'paro'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Paro Dzong', 'paro-dzong', d."id", 'Paro Dzong is one of the top attractions at Paro.', '', 27.4287, 89.4164, 2
  FROM "Destination" d WHERE d."slug" = 'paro'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Buddha Dordenma', 'buddha-dordenma', d."id", 'Buddha Dordenma is one of the top attractions at Thimphu.', '', 27.4293, 89.6427, 1
  FROM "Destination" d WHERE d."slug" = 'thimphu'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Punakha Dzong', 'punakha-dzong', d."id", 'Punakha Dzong is one of the top attractions at Punakha.', '', 27.5921, 89.8678, 1
  FROM "Destination" d WHERE d."slug" = 'punakha'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Rumtek Monastery', 'rumtek-monastery', d."id", 'Rumtek Monastery is one of the top attractions at Gangtok.', '', 27.2773, 88.5748, 1
  FROM "Destination" d WHERE d."slug" = 'gangtok'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Nathu La Pass', 'nathu-la-pass', d."id", 'Nathu La Pass is one of the top attractions at Gangtok.', '', 27.387, 88.8302, 2
  FROM "Destination" d WHERE d."slug" = 'gangtok'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Darjeeling Himalayan Railway', 'darjeeling-toy-train', d."id", 'Darjeeling Himalayan Railway is one of the top attractions at Darjeeling.', '', 27.036, 88.2627, 1
  FROM "Destination" d WHERE d."slug" = 'darjeeling'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Tiger Hill', 'tiger-hill', d."id", 'Tiger Hill is one of the top attractions at Darjeeling.', '', 27.0019, 88.2531, 2
  FROM "Destination" d WHERE d."slug" = 'darjeeling'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Ooty Lake', 'ooty-lake', d."id", 'Ooty Lake is one of the top attractions at Ooty (Udhagamandalam).', '', 11.4102, 76.695, 1
  FROM "Destination" d WHERE d."slug" = 'ooty'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Mysore Palace', 'mysore-palace', d."id", 'Mysore Palace is one of the top attractions at Mysore.', '', 12.3052, 76.6552, 1
  FROM "Destination" d WHERE d."slug" = 'mysore'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","image","latitude","longitude","sortOrder")
  SELECT gen_random_uuid(), 'Golden Temple', 'golden-temple', d."id", 'Golden Temple is one of the top attractions at Amritsar.', '', 31.62, 74.8765, 1
  FROM "Destination" d WHERE d."slug" = 'amritsar'
  ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "sortOrder" = EXCLUDED."sortOrder";

END $$;

-- ─── CATEGORIES ─────────────────────────────────────────────
INSERT INTO "Category" ("id","name","slug","description","icon","sortOrder","seoTitle","seoDescription") VALUES
  (gen_random_uuid(), 'Heritage Tours', 'heritage-tours', 'Explore ancient monuments, forts, palaces and UNESCO World Heritage sites across India and beyond.', '🏛️', 1, 'Heritage Tours | Mother India Tour Travels', 'Book heritage tours with Mother India Tour Travels. Best deals on curated India tour packages.'),
  (gen_random_uuid(), 'Beach Holidays', 'beach-holidays', 'Sun, sand and sea — relax on pristine beaches from Goa to Andaman to Kerala.', '🏖️', 2, 'Beach Holidays | Mother India Tour Travels', 'Book beach holidays with Mother India Tour Travels. Best deals on curated India tour packages.'),
  (gen_random_uuid(), 'Adventure Tours', 'adventure-tours', 'Trek mountain passes, raft wild rivers and explore the Himalayas on adrenaline-fuelled tours.', '⛰️', 3, 'Adventure Tours | Mother India Tour Travels', 'Book adventure tours with Mother India Tour Travels. Best deals on curated India tour packages.'),
  (gen_random_uuid(), 'Pilgrimage Tours', 'pilgrimage-tours', 'Sacred journeys to Varanasi, Ayodhya, Vaishno Devi, Haridwar and Nepal''s spiritual sites.', '🕌', 4, 'Pilgrimage Tours | Mother India Tour Travels', 'Book pilgrimage tours with Mother India Tour Travels. Best deals on curated India tour packages.'),
  (gen_random_uuid(), 'International Tours', 'international-tours', 'Premium international packages to Dubai, Thailand, Malaysia, Nepal, and Bhutan.', '✈️', 5, 'International Tours | Mother India Tour Travels', 'Book international tours with Mother India Tour Travels. Best deals on curated India tour packages.'),
  (gen_random_uuid(), 'Hill Station Tours', 'hill-station-tours', 'Escape to the cool mountain air of Shimla, Manali, Darjeeling, Ooty and more.', '🏔️', 6, 'Hill Station Tours | Mother India Tour Travels', 'Book hill station tours with Mother India Tour Travels. Best deals on curated India tour packages.'),
  (gen_random_uuid(), 'Wildlife Tours', 'wildlife-tours', 'Spot tigers at Ranthambore, elephants at Corbett, and exotic birds across India''s national parks.', '🐯', 7, 'Wildlife Tours | Mother India Tour Travels', 'Book wildlife tours with Mother India Tour Travels. Best deals on curated India tour packages.'),
  (gen_random_uuid(), 'Golden Triangle', 'golden-triangle', 'India''s most iconic circuit: Delhi, Agra and Jaipur — covering the best of Indian heritage.', '🔺', 8, 'Golden Triangle | Mother India Tour Travels', 'Book golden triangle with Mother India Tour Travels. Best deals on curated India tour packages.')
ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name", "description" = EXCLUDED."description";

-- ─── PACKAGES ───────────────────────────────────────────────
DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
  var_id_5 TEXT;
  var_id_6 TEXT;
  var_id_7 TEXT;
  var_id_8 TEXT;
  var_id_9 TEXT;
  var_id_10 TEXT;
  var_id_11 TEXT;
  var_id_12 TEXT;
  var_id_13 TEXT;
  var_id_14 TEXT;
  var_id_15 TEXT;
  var_id_16 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'delhi';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'delhi-agra-jaipur', 'Delhi Agra Jaipur Tour Packages',
    'The classic Golden Triangle of Delhi, Agra, and Jaipur is India’s most iconic heritage circuit, weaving together Mughal grandeur, Rajput valour, and colonial elegance. From the majestic Taj Mahal at dawn to the vibrant bazaars of Jaipur’s Pink City, this journey offers a breathtaking tapestry of architectural marvels and living culture. Mother India Tour Travels curates seamless itineraries with expert storytellers, ensuring you uncover hidden gems like Delhi’s stepwells and Agra’s marble inlay workshops. Whether you have a day or three weeks, our flexible packages let you experience North India’s soul at your own pace.',
    ARRAY['Witness the Taj Mahal at sunrise from the Diwan-i-Khas garden', 'Explore the magnificent Amber Fort by jeep and its Sheesh Mahal (Mirror Palace)', 'Discover the intricate jali work at Delhi’s Humayun’s Tomb, a UNESCO World Heritage Site', 'Stroll through Jaipur’s Hawa Mahal and City Palace, home to the royal family', 'Shop for handcrafted marble inlay souvenirs in Agra’s Kachhpura district'],
    ARRAY['Accommodation in heritage hotels (e.g., Alsisar Haveli, Jaipur) or modern 5-star options', 'Private air-conditioned vehicle with English-speaking driver for all transfers and sightseeing', 'Expert licensed tour guide at each city (Delhi, Agra, Jaipur)', 'Entrance fees to all monuments including Taj Mahal (₹1,300), Amber Fort (₹500), Qutub Minar (₹600)', 'Daily buffet breakfast at hotel (local specialties like parathas, lassi, chai)', 'One traditional Rajasthani dinner with folk dance performance in Jaipur', 'All taxes, tolls, parking, and driver allowances'],
    ARRAY['International or domestic airfare (not included unless specified)', 'Personal expenses such as tips, laundry, phone calls, or souvenirs', 'Camera fees at monuments (₹25-100 per device)', 'Travel insurance (recommended: cover medical and baggage)', 'Meals not mentioned in the itinerary (lunch and dinner on free days)'],
    ARRAY['Taj Mahal is closed every Friday; plan accordingly.', 'Modest dress is recommended for temples and mosques; remove shoes before entering.', 'Peak season (Oct-Mar) requires booking 3-4 months in advance for best options.'],
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Heritage', 20, 12, 'Premium Hotels',
    'Discover the Golden Triangle: 17 heritage tours from ₹4,999', TRUE, TRUE, TRUE,
    ARRAY['golden-triangle', 'heritage', 'taj-mahal', 'rajasthan', 'north-india'], country_id, state_id,
    'Delhi Agra Jaipur Tour Packages | Golden Triangle 2025', 'Explore India''s Golden Triangle: Delhi, Agra & Jaipur. 17 heritage tour options from 1D to 21D. Book with Mother India Tour Travels for curated experiences.', ARRAY['golden triangle tour', 'delhi agra jaipur packages', 'heritage tours india', 'taj mahal tours', 'rajasthan tour packages', 'north india travel', 'luxury india tours', 'mother india tour travels'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'heritage-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'golden-triangle'
  ON CONFLICT DO NOTHING;

  -- Variant: 0n-1d-same-day
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '0n-1d-same-day', 'Same Day Agra Tour from Delhi',
    0, 1, 'Same Day Tour',
    0, TRUE,
    'https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34201914/pexels-photo-34201914.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Delhi to Agra: Sunrise Taj Mahal & Mughal Fort', 'Your journey begins early in the morning as your private AC vehicle picks you up from your Delhi hotel. You drive approximately 240 km to Agra, arriving just in time to witness the Taj Mahal glowing in the soft morning light. After exploring the marble masterpiece, you proceed to the imposing Agra Fort, a UNESCO World Heritage site showcasing Mughal military architecture. Enjoy a delicious lunch at a local restaurant before heading back to Delhi. The comfortable return drive ensures you arrive by evening, with drop-off at your preferred location.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 1n-2d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '1n-2d', 'Delhi Agra Delhi Tour Package for 02 Days',
    1, 2, '1 Nights / 2 Days',
    1, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Delhi to Agra: Express Drive & Mughal Monuments', 'Your tour begins with a pick-up from your preferred location in Delhi – airport, hotel, or railway station – and a comfortable 3-4 hour drive to Agra via the Yamuna Expressway. Upon arrival, meet your expert guide for a guided tour of the iconic Taj Mahal, a UNESCO World Heritage site and one of the Seven Wonders of the World. Marvel at its pristine white marble and intricate inlay work as the afternoon light casts a warm glow. Next, visit the imposing Agra Fort, a red sandstone fortress that served as the seat of the Mughal Empire, offering stunning views of the Taj from its balconies. After a full day of exploration, check into your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Agra to Delhi: Modern Landmarks & Departure', 'After a leisurely breakfast at the hotel, check out and begin your drive back to Delhi. Upon arrival, embark on a guided city tour starting with the Lotus Temple, a stunning lotus-shaped Baháʼí House of Worship known for its serene ambiance and architectural beauty. Continue to the Qutub Minar, a towering minaret from the 12th century and another UNESCO site, surrounded by ancient ruins. Drive past the majestic India Gate, a war memorial arch, and view the Rashtrapati Bhavan (Presidential House) with its grand dome and manicured gardens. The tour concludes with a drop-off at your desired location in Delhi – airport, hotel, or railway station – leaving you with sweet memories of your two-day heritage journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d', 'Delhi Agra Delhi Tour Package for 03 Days',
    2, 3, '2 Nights / 3 Days',
    2, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Delhi to Agra: Express Drive & Hotel Check-in', 'Upon arrival at Delhi airport or railway station, your personal representative from Mother India Tour Travels greets you and assists with your transfer. You then embark on a scenic drive to Agra, a journey of approximately 3.5 hours along the Yamuna Expressway. On reaching Agra, check into your hotel and relax after the drive. The evening is free to explore the local markets or simply unwind. Overnight stay at the hotel in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Agra: Sunrise Taj Mahal & Agra Fort', 'After breakfast, you set out for a guided tour of Agra’s crown jewels. First, witness the breathtaking Taj Mahal at sunrise, a UNESCO World Heritage Site and one of the Seven Wonders of the World, built by Emperor Shah Jahan in memory of his wife Mumtaz Mahal. Next, visit the formidable Agra Fort, another UNESCO site, where you can explore the Diwan-i-Am, Khas Mahal, and the beautifulMusamman Burj. After lunch, begin your drive back to Delhi, arriving in the evening. Check into your Delhi hotel and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Delhi: Mughal & Colonial Heritage Sightseeing', 'After breakfast, enjoy a comprehensive guided tour of Delhi’s historic landmarks. Start with Jama Masjid, India''s largest mosque, then pass by the Red Fort, a symbol of Mughal power. Continue to India Gate, the war memorial, and drive past the President''s House (Rashtrapati Bhavan). Visit Humayun''s Tomb, a stunning precursor to the Taj Mahal, and end at Qutub Minar, the tallest brick minaret in the world. After the tour, you are transferred to Delhi airport or railway station for your departure.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d-mathura
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d-mathura', 'Delhi-Agra-Mathura-Tour-Package-for-03 Days',
    2, 3, '2 Nights / 3 Days',
    3, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Delhi to Agra via Mathura: Spiritual Temples of Vrindavan', 'Upon arrival at Delhi airport or railway station, your representative greets and assists you before driving to Agra (approx. 3-4 hours). En route, stop at Mathura to visit the Krishna Janmabhoomi Temple, the revered birthplace of Lord Krishna. Continue to Vrindavan to explore the stunning Prem Mandir and the spiritually uplifting ISKCON Temple, both adorned with intricate carvings and vibrant frescoes. After this spiritual immersion, arrive in Agra and check into the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Agra: Sunrise Taj Mahal & Agra Fort, Return to Delhi', 'After an early breakfast, embark on a guided tour to the magnificent Taj Mahal, best seen at dawn when the white marble glows with changing hues. Marvel at its symmetrical gardens and intricate inlay work. Next, visit the imposing Agra Fort, a UNESCO World Heritage site that once housed Mughal emperors and offers panoramic views of the Taj. Later, drive back to Delhi (approx. 3-4 hours) and check into your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Delhi: Mughal & Colonial Heritage Sightseeing', 'After breakfast, enjoy a guided tour of Delhi’s most iconic landmarks. Begin at the grand Jama Masjid, India’s largest mosque, then drive past the Red Fort with its imposing red sandstone walls. Visit India Gate, the war memorial arch, and the President’s House (Rashtrapati Bhavan) with its lush Mughal Gardens. Continue to the serene Humayun’s Tomb, a precursor to the Taj, and end at the soaring Qutub Minar. After the tour, you are transferred to Delhi airport or railway station for departure.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 3 FROM "Destination" d WHERE d."slug" = 'mathura'
  ON CONFLICT DO NOTHING;

  -- Variant: 3n-4d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '3n-4d', 'Delhi Agra Jaipur Tour package for 04 Days',
    3, 4, '3 Nights / 4 Days',
    4, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Delhi: Imperial Landmarks & Drive to Agra', 'Upon arrival at Delhi airport or railway station, you are met by our representative and begin with a guided tour of Delhi''s iconic landmarks. You visit the Qutub Minar, a UNESCO World Heritage Site, followed by the Lotus Temple, known for its flower-like architecture. Drive past India Gate, the war memorial, before proceeding to Agra by surface. The drive takes approximately 3-4 hours covering 250 km. Upon arrival in Agra, check into your hotel and relax. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Agra: Sunrise at Taj Mahal & Journey to Jaipur', 'Early morning, you enjoy a guided tour of the Taj Mahal at sunrise, witnessing its ethereal beauty. After breakfast, check out from the hotel and drive to Jaipur, en route stopping at Fatehpur Sikri, the abandoned Mughal capital. You explore its well-preserved palaces and courtyards. Continue your journey with a lunch break on the way. Arrive in Jaipur in the evening and check into your hotel. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Jaipur: Royal Forts & Palaces Exploration', 'After breakfast, you embark on a guided tour of Jaipur''s heritage. Visit the magnificent Amber Fort, perched on a hill, and enjoy its intricate architecture. Drive past the Water Palace (Jal Mahal), then proceed to the Hawa Mahal (Palace of Winds). Explore the City Palace complex and the Jantar Mantar astronomical observatory. You also witness traditional block printing and Rajasthani handicrafts that have been practiced for centuries. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Jaipur to Delhi: Departure with Memories', 'After breakfast, you depart from Jaipur and drive back to Delhi (approx. 280 km, 5-6 hours). You are dropped at the airport or railway station with sweet memories of your tour. The tour concludes here.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d', 'Delhi Agra Jaipur Tour package for 05 Days',
    4, 5, '4 Nights / 5 Days',
    5, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_5;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_5;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 1, 'Delhi: Mughal Heritage & Imperial Landmarks', 'Upon arrival at Delhi Airport, our representative greets you and transfers you to your hotel. After freshening up, embark on a guided tour of Delhi''s iconic landmarks. Visit the towering Qutub Minar, a UNESCO World Heritage Site, and the serene Lotus Temple, known for its flower-like shape. Drive past India Gate and the President''s House, then explore the magnificent Humayun''s Tomb, a precursor to the Taj Mahal. Return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 2, 'Delhi to Agra: Express Drive & Taj Mahal at Sunset', 'After breakfast, drive to Agra (approx. 3–4 hours). Check into your hotel and enjoy some refreshments. Then set out for a guided visit to the breathtaking Taj Mahal, a marble mausoleum built by Emperor Shah Jahan. Continue to the imposing Agra Fort, where you can admire the stunning views of the Taj from its balconies. Overnight stay at the hotel in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 3, 'Agra to Jaipur: Fatehpur Sikri & Rural En Route', 'After breakfast, journey to Jaipur (approx. 6 hours). En route, stop at the abandoned Mughal city of Fatehpur Sikri, a UNESCO World Heritage Site, and explore its palaces and courtyards. Enjoy lunch on the way (direct payment). Arrive in Jaipur and check into your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 4, 'Jaipur: Amber Fort & Royal Heritage Walk', 'After breakfast, head for a guided tour of the ancient capital of Amber. Visit the majestic Amber Fort, a hilltop fortress with palatial halls and mirrorwork. Drive past the Water Palace (Jal Mahal) and stop at the iconic Hawa Mahal (Palace of Winds). Explore the City Palace complex and the astronomical Jantar Mantar observatory. Later, witness centuries-old traditions at a block printing and Rajasthani handicraft workshop. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 5, 'Jaipur to Delhi: Departure with Memories', 'After breakfast, drive back to Delhi (approx. 5–6 hours). Our driver drops you at Delhi Airport or Railway Station with sweet memories of your Golden Triangle tour. Tour concludes.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d', 'Delhi Agra Jaipur Golden Triangle Tour for 06 Days package',
    5, 6, '5 Nights / 6 Days',
    6, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_6;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_6;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_6, 1, 'Delhi: Arrival & Hotel Check-in', 'Upon arrival at Delhi Airport, our company representative greets you and assists with your transfer to the hotel. After check-in, you have the rest of the day at leisure to relax or explore the nearby area. Overnight stay at the hotel in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_6, 2, 'Delhi: Mughal Heritage & Modern Landmarks Sightseeing', 'After breakfast, you embark on a guided tour of Delhi''s iconic landmarks. Visit the majestic Jama Masjid, one of India''s largest mosques, and the historic Red Fort, a UNESCO World Heritage site. Drive past India Gate, the President''s House, and Parliament House, then explore Qutub Minar, the Lotus Temple, and Humayun’s Tomb. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_6, 3, 'Delhi to Agra: Scenic Drive and Agra Arrival', 'Following breakfast, you depart for Agra, a 250-kilometer drive taking approximately 3–4 hours. Upon arrival, check into your hotel and enjoy the afternoon at leisure. Overnight stay at the hotel in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_6, 4, 'Agra: Sunrise Taj Mahal & Journey to Jaipur via Fatehpur Sikri', 'Early morning, you visit the Taj Mahal at sunrise, witnessing its breathtaking beauty as the sun''s rays illuminate the marble. Return to the hotel for breakfast, then explore the imposing Agra Fort, another UNESCO site. Afterwards, drive to Jaipur, stopping en route to explore Fatehpur Sikri, the abandoned Mughal capital. Overnight stay at the hotel in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_6, 5, 'Jaipur: Royal Forts, Palaces & Craft Traditions', 'After breakfast, you set out for a guided tour of Jaipur''s highlights. Visit the magnificent Amber Fort, with its grand courtyards and mirror work, then see the Water Palace from a distance. Explore the iconic Hawa Mahal (Palace of Winds), the City Palace complex, and the astronomical observatory Jantar Mantar. The tour also includes a visit to a block printing workshop and Rajasthani handicraft center. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_6, 6, 'Jaipur to Delhi: Return Journey with Memories', 'After breakfast, you drive back to Delhi, covering 280 kilometers in about 5–6 hours. Upon arrival, you are dropped off at the Airport or Railway station with sweet memories of your Golden Triangle tour. The tour concludes here.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_6, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_6, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_6, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-udaipur
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-udaipur', 'Delhi Agra Jaipur Udaipur Tour package for 06 Days',
    5, 6, '5 Nights / 6 Days',
    7, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_7;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_7;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 1, 'Delhi: Mughal & Colonial Heritage Tour', 'Upon arrival at Delhi airport, our representative assists you and begins a guided tour of the capital. Visit the towering Qutub Minar, the lotus-shaped Baháʼí House of Worship, the grand India Gate, the imposing President''s House, and the exquisite Humayun''s Tomb, a UNESCO World Heritage site. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 2, 'Delhi to Agra: Taj Mahal & Agra Fort', 'After breakfast, drive to Agra (approx. 3-4 hours). Check in at the hotel and refresh before a guided tour of the iconic Taj Mahal, a marble mausoleum of eternal love, and the massive Agra Fort, a UNESCO World Heritage site. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 3, 'Agra to Jaipur: Fatehpur Sikri Stopover', 'After breakfast, drive to Jaipur (approx. 6 hours). En route, stop at Fatehpur Sikri, the abandoned Mughal capital with its stunning Buland Darwaza and Jama Masjid. Enjoy lunch on the way. Arrive in Jaipur and check into the hotel. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 4, 'Jaipur: Pink City Royal Splendors', 'After breakfast, a guided tour of Jaipur begins with a visit to the ancient capital of Amber, exploring the majestic Amber Fort. Continue to see the Water Palace (Jal Mahal), the iconic Hawa Mahal (Palace of Winds), the City Palace, and the astronomical Jantar Mantar observatory. Witness centuries-old Rajasthani handicrafts. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 5, 'Jaipur to Udaipur: Chittorgarh Fort Visit', 'After breakfast, drive to Udaipur (approx. 6-7 hours). En route, visit the magnificent Chittorgarh Fort, a UNESCO World Heritage site and symbol of Rajput valor. Arrive in Udaipur and check in at the hotel. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 6, 'Udaipur: Lakes & Palaces Tour & Departure', 'After breakfast, a guided tour of Udaipur visits the intricately carved Jagdish Temple, the majestic City Palace overlooking Lake Pichola, and the serene Princess Garden. After the tour, you are dropped at Udaipur airport or railway station for your onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 3 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-khajuraho
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-khajuraho', 'Delhi-Agra-Jaipur-Khajuraho-Tour-package-for-06-Days',
    5, 6, '5 Nights / 6 Days',
    8, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_8;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_8;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 1, 'Delhi: Arrival & Transfer to Hotel', 'Upon arrival at Delhi Airport, our company representative assists you and transfers you to the hotel. After checking in, the rest of the day is at leisure. You may choose to explore nearby markets or simply relax after your journey. Overnight stay at the hotel in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 2, 'Delhi to Agra: Taj Mahal & Mughal Heritage', 'After breakfast, you drive to Agra, covering 230 kms in about 3-4 hours. Upon arrival, embark on a guided tour to visit the iconic Taj Mahal, a breathtaking marble mausoleum and a UNESCO World Heritage Site. Later, you may also visit the Agra Fort. Overnight stay at the hotel in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 3, 'Agra to Jaipur: Fatehpur Sikri & Pink City', 'After breakfast, you drive to Jaipur, 260 kms away, taking approximately 6 hours. En route, you stop at Fatehpur Sikri, the abandoned Mughal capital featuring stunning red sandstone architecture. Continue to Jaipur, check into your hotel, and spend the evening at leisure. Overnight stay at the hotel in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 4, 'Jaipur: Amber Fort & City Palace Exploration', 'After breakfast, you proceed for a guided tour of Amber, the ancient capital. Visit the magnificent Amber Fort, a hilltop fortress with intricate art and sweeping views. Then explore the Pink City of Jaipur, visiting the Water Palace, Hawa Mahal (Palace of Winds), and a Rajasthani handicraft emporium. Overnight stay at the hotel in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 5, 'Jaipur to Pushkar: Spiritual & Cultural Immersion', 'After breakfast, you drive to Pushkar, 150 kms away, taking about 3 hours. Upon arrival, check into your hotel and freshen up. Then visit the revered Brahma Temple, one of the few temples dedicated to Lord Brahma, and the sacred Pushkar Lake. Enjoy a city walking tour through the vibrant streets and ghats. Overnight stay at the hotel in Pushkar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 6, 'Pushkar to Delhi: Return with Delhi Sightseeing & Departure', 'After breakfast, you drive back to Delhi, 415 kms away (7-8 hours drive). Upon arrival, enjoy a guided tour of Delhi''s landmarks: Red Fort, Jama Masjid, India Gate, Lotus Temple, and Qutub Minar. After the tour, you are dropped off at the airport or railway station with sweet memories. Tour concludes.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 3 FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-rishikesh
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-rishikesh', 'Delhi Haridwar Rishikesh Agra Tour package for 06 Days',
    5, 6, '5 Nights / 6 Days',
    9, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_9;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_9;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_9, 1, 'Delhi: Arrival & Welcome at the Capital', 'Upon arrival at Delhi Airport, our representative welcomes you and assists with the transfer to your hotel. After check-in, the evening is free to relax or explore nearby markets. Overnight stay at the hotel in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_9, 2, 'Delhi to Haridwar: Journey to the Holy Ganges', 'After breakfast, drive 260 km to Haridwar (5-6 hours). Check into your hotel and freshen up. In the evening, head to Har Ki Pauri to witness the spectacular Ganga Aarti, a mesmerizing ritual of fire, water, and chanting. Overnight stay in Haridwar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_9, 3, 'Haridwar to Rishikesh: Ashrams, Bridges & Ghats', 'After breakfast, drive 20 km to Rishikesh. Visit Lakshman Jhula and Ram Jhula, the iconic suspension bridges over the Ganges, and explore Triveni Ghat. Later, return to Haridwar for a walking tour around Har Ki Pauri. Overnight stay in Haridwar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_9, 4, 'Haridwar to Agra: En Route to the Taj', 'After breakfast, depart for Agra, a 260 km drive (7-8 hours). Check into your hotel upon arrival. The evening is free to explore the local markets or relax. Overnight stay in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_9, 5, 'Agra: Sunrise Taj Mahal & Agra Fort', 'After breakfast, enjoy a guided tour of the magnificent Taj Mahal, a UNESCO World Heritage Site, followed by a visit to the imposing Agra Fort. After sightseeing, drive 250 km back to Delhi (3-4 hours). Check into your hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_9, 6, 'Delhi Sightseeing & Departure', 'After breakfast, proceed for a Delhi city tour covering the Red Fort (Lal Qila), India Gate, the President''s House (Rashtrapati Bhavan), Lotus Temple, and Qutub Minar. Later, you are transferred to Delhi Airport or railway station for your onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_9, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_9, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_9, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_9, d."id", 3 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_9, d."id", 4 FROM "Destination" d WHERE d."slug" = 'rishikesh'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d-ranthambore
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d-ranthambore', 'Ranthambore Tour with Delhi Agra Jaipur for 07 Days',
    6, 7, '6 Nights / 7 Days',
    10, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_10;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_10;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_10, 1, 'Delhi: Arrival & Imperial Sightseeing', 'Upon arrival at Delhi Airport, our representative greets and assists you. Begin your tour with a visit to the iconic Qutub Minar, a UNESCO World Heritage site. Continue to the Lotus Temple, renowned for its flower-like architecture, and drive past India Gate and the President''s House. Immerse yourself in the capital''s blend of ancient and colonial heritage. Overnight stay at your hotel in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_10, 2, 'Delhi to Agra: Express Drive & Evening Leisure', 'After breakfast, depart for Agra (approx. 230 km / 3 hours). Upon arrival, check into your hotel and enjoy the afternoon at leisure. You may opt to visit the Taj Mahal at sunset (own cost) or simply unwind. Overnight stay at your hotel in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_10, 3, 'Agra: Taj Mahal, Agra Fort & Marble Crafts', 'After breakfast, embark on a guided tour of the legendary Taj Mahal, a monument of eternal love. Next, explore the imposing Agra Fort, a UNESCO site filled with palaces and mosques. Visit a famous marble handicraft factory to witness intricate inlay work. Overnight stay at your hotel in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_10, 4, 'Agra to Ranthambore: Fatehpur Sikri En Route', 'After breakfast, drive to Ranthambore (approx. 280 km / 7 hours). En route, stop at Fatehpur Sikri, the abandoned Mughal capital with stunning architecture including Buland Darwaza and Panch Mahal. Continue to Ranthambore and check into your hotel. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_10, 5, 'Ranthambore: Jungle Safari & Drive to Jaipur', 'Early morning, embark on a thrilling jungle safari in Ranthambore National Park (own cost) to spot tigers, leopards, and diverse wildlife. After breakfast, drive to Jaipur (approx. 200 km / 4 hours). Upon arrival, check into your hotel. Overnight stay at the hotel in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_10, 6, 'Jaipur: Amber Fort, Hawa Mahal & City Palace', 'After breakfast, enjoy a guided tour of the magnificent Amber Fort, set atop a hill. See the Water Palace (Jal Mahal) from a distance, and visit the iconic Hawa Mahal (Palace of Winds). Explore the City Palace and Jantar Mantar astronomical observatory. End with a visit to a Rajasthani handicraft emporium. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_10, 7, 'Jaipur to Delhi: Departure Transfer', 'After breakfast, drive back to Delhi (approx. 260 km / 6 hours). You will be dropped at the airport or railway station for your onward journey. Tour concludes with fond memories.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_10, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_10, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_10, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_10, d."id", 3 FROM "Destination" d WHERE d."slug" = 'ranthambore'
  ON CONFLICT DO NOTHING;

  -- Variant: 0n-1d-manali-agra
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '0n-1d-manali-agra', 'Delhi Shimla Manali Agra Tour package for 08 Days',
    0, 1, 'Same Day Tour',
    11, FALSE,
    'https://images.pexels.com/photos/35616883/pexels-photo-35616883.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_11;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_11;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_11, 1, 'Delhi to Shimla: Scenic Drive & Colonial Charm', 'Depart early from Delhi for a scenic drive to Shimla, covering 360 kilometers in about 7–8 hours. Upon arrival, check into your hotel and spend the evening exploring the Mall and The Ridge, where Victorian architecture like the Gaiety Theater and Christ Church stand as reminders of the British Raj. Overnight in Shimla.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_11, 2, 'Shimla: Kufri Excursion & Mall Road Stroll', 'After breakfast, head to Kufri at 2,500 meters for panoramic views and adventure activities like skiing or tobogganing. Hike or pony ride up to Mashu Peak for stunning scenery. Post-lunch, return to Shimla Mall Road to explore the iconic Scandal Point, Town Hall, and Jakhoo Temple, with time for shopping. Overnight in Shimla.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_11, 3, 'Shimla to Manali: Journey Through Kullu Valley', 'After breakfast, drive 272 kilometers to Manali, passing the Beas-Sutlej Link Project and Pandoh Dam. En route, halt in Kullu Valley, where you can enjoy a boat ride on the Beas River. Arrive in Manali and check into your hotel. Overnight in Manali.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_11, 4, 'Manali: Solang Valley Adventure', 'After breakfast, proceed to Solang Valley, a hub for adventure sports like paragliding, zorbing, and skiing (subject to snow conditions). Spend the day amidst the snow-capped peaks and lush meadows. Return to Manali for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_11, 5, 'Manali: Temples, Monasteries & Local Sights', 'After breakfast, explore Manali’s cultural side: visit the ancient Hadimba Temple set in a cedar forest, the natural hot springs at Vashishtha Kund, a Tibetan Monastery with its prayer flags, and the bustling Mall Road. Stroll through Van Vihar forest for a peaceful end. Overnight in Manali.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_11, 6, 'Manali to Delhi: Long Drive to Capital', 'After an early breakfast, start the 550-kilometer drive back to Delhi, lasting 12–13 hours. Reach Delhi by evening and check into your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_11, 7, 'Delhi to Agra: Taj Mahal & Agra Fort', 'After breakfast, drive 250 kilometers to Agra. On arrival, enjoy a guided tour of the iconic Taj Mahal, a UNESCO World Heritage Site, followed by the imposing Agra Fort. Explore the majestic marble and red sandstone architecture. Overnight in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_11, 8, 'Agra to Delhi: Monumental Highlights & Departure', 'After breakfast, drive back to Delhi for a guided tour of the city’s landmarks: India Gate, President’s House, Lotus Temple, and Qutub Minar. After sightseeing, transfer to the airport or railway station with sweet memories.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_11, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_11, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_11, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_11, d."id", 3 FROM "Destination" d WHERE d."slug" = 'shimla'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_11, d."id", 4 FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT DO NOTHING;

  -- Variant: 7n-8d-khajuraho-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '7n-8d-khajuraho-varanasi', 'Delhi Agra Jaipur Khajuraho Varanasi Tour package for 08 Days',
    7, 8, '7 Nights / 8 Days',
    12, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_12;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_12;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_12, 1, 'Delhi: Arrival and Mughal Heritage Tour', 'Upon arrival at Delhi Airport, our representative assists with your transfer. After freshening up, embark on a guided tour of Delhi’s Mughal and colonial landmarks. Visit the towering Qutub Minar, a UNESCO World Heritage site, and the serene Lotus Temple, known for its lotus-shaped architecture. Drive past the India Gate, a war memorial, and the President’s House (Rashtrapati Bhavan), the official residence of the President of India. Overnight stay at your hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_12, 2, 'Delhi to Jaipur: Journey into the Pink City', 'After breakfast, drive approximately 260 km (6 hours) to Jaipur, the Pink City. The scenic route passes through rural Rajasthan. Upon arrival, check in to your hotel and relax. The rest of the day is at leisure, allowing you to explore the local markets or enjoy traditional Rajasthani cuisine. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_12, 3, 'Jaipur: Amber Fort and City Palace Exploration', 'After breakfast, head to the ancient capital of Amber. Visit the magnificent Amber Fort, a hilltop fortress with palaces and mirror halls. En route, catch views of the Water Palace (Jal Mahal) from the roadside. In the city, admire the Hawa Mahal (Palace of Winds), then explore the City Palace and the Jantar Mantar observatory with its giant astronomical instruments. End the day shopping for Rajasthani handicrafts. Overnight at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_12, 4, 'Jaipur to Agra: Sunset at the Taj Mahal', 'After breakfast, drive approximately 260 km (6 hours) to Agra. Check into your hotel and refresh. Later, visit the iconic Taj Mahal, a UNESCO World Heritage site and one of the Seven Wonders of the World. Witness the marble mausoleum bathed in the golden light of sunset. Return to the hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_12, 5, 'Agra to Khajuraho: En-Route Orchha Temples', 'After breakfast, set off on a scenic drive of about 400 km (6-7 hours) to Khajuraho. En route, stop at Orchha, a historic town on the Betwa River. Explore the Orchha Fort complex, including the Raja Mahal and the Chaturbhuj Temple, known for their Bundela architecture. Continue to Khajuraho and check into your hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_12, 6, 'Khajuraho: Western and Jain Temple Circuit', 'After breakfast, proceed to visit the famous Western Group of Temples, a UNESCO World Heritage site renowned for their intricate erotic sculptures and stunning architecture. Then explore the Jain temples, including the Parsvanath Temple, known for its fine carvings. Spend the afternoon at leisure or visit the local handicraft markets. Overnight at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_12, 7, 'Khajuraho to Varanasi: Spiritual Journey to the Ganges', 'After breakfast, drive approximately 390 km (7-8 hours) to Varanasi, one of the world’s oldest living cities and the spiritual capital of India. Check into your hotel and rest. In the evening, you may optionally witness the Ganga Aarti ceremony at Dashashwamedh Ghat, a mesmerizing ritual of fire and devotion. Overnight at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_12, 8, 'Varanasi: Sunrise Boat Ride on the Ganges', 'Early morning, proceed for a boat ride on the holy river Ganges. Drift past the famous bathing ghats (steps leading to the river), such as Manikarnika Ghat and Dasashwamedh Ghat, where pilgrims perform rituals and cremations. The sunrise over the river creates an unforgettable spiritual ambiance. After the ride, return to the hotel for breakfast before checking out for your onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_12, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_12, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_12, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_12, d."id", 3 FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_12, d."id", 4 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  -- Variant: 8n-9d-khajuraho-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '8n-9d-khajuraho-varanasi', 'Delhi Agra Jaipur Khajuraho Varanasi Tour package for 09 Days',
    8, 9, '8 Nights / 9 Days',
    13, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_13;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_13;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_13, 1, 'Delhi: Arrival & Welcome Transfer', 'Upon arrival at Delhi Airport, you are warmly greeted by our representative who assists with your transfer to the hotel. The rest of the day is at leisure to relax or explore nearby areas. Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_13, 2, 'Delhi: Mughal & Modern Landmarks Tour', 'After breakfast, embark on a guided tour of Delhi''s iconic landmarks. Visit the majestic Red Fort and Jama Masjid in Old Delhi, then drive past India Gate and the President''s House (Rashtrapati Bhavan). Explore the towering Qutub Minar and the unique Lotus Temple. Overnight in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_13, 3, 'Delhi to Jaipur: Scenic Drive to the Pink City', 'After breakfast, depart for Jaipur, the Pink City, by road (approximately 6 hours). Upon arrival, check in to the hotel and relax. The evening is free to explore local markets or enjoy traditional Rajasthani cuisine. Overnight in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_13, 4, 'Jaipur: Royal Forts & Traditional Crafts', 'Today after breakfast, visit the ancient capital of Amber and explore the magnificent Amber Fort, riding up on a jeep or elephant. En route, see the Jal Mahal (Water Palace). Continue to Hawa Mahal, the City Palace, and the astronomical observatory Jantar Mantar. Also witness traditional block printing and Rajasthani handicrafts. Overnight in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_13, 5, 'Jaipur to Agra: Evening at the Taj Mahal', 'After breakfast, drive to Agra (approx 6 hours). Check in and freshen up. Later, enjoy a guided tour of the breathtaking Taj Mahal at sunset, a UNESCO World Heritage Site and one of the Seven Wonders of the World. Overnight in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_13, 6, 'Agra to Khajuraho: En Route Orchha Temples', 'After breakfast, drive to Khajuraho with a stop at Orchha, a historic town known for its stunning temples and palaces. Visit the Orchha Fort complex and the Chaturbhuj Temple. Continue to Khajuraho and check in to the hotel. Overnight in Khajuraho.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_13, 7, 'Khajuraho: Exquisite Temple Architecture', 'After breakfast, explore the famous Khajuraho temples, known for their intricate erotic sculptures. Visit the Western Group of Temples, including the Kandariya Mahadev Temple, and the Jain temples. The craftsmanship and artistry are unparalleled. Overnight in Khajuraho.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_13, 8, 'Khajuraho to Varanasi: Journey to the Holy City', 'After breakfast, proceed to Varanasi either by road (approx 8 hours) or by flight from Khajuraho airport (optional). Upon arrival, check in to the hotel. The evening is free to explore the ghats or relax. Overnight in Varanasi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_13, 9, 'Varanasi: Sunrise Boat Ride on the Ganges', 'Early morning, experience a serene boat ride on the holy River Ganges, witnessing the famous bathing ghats and the morning rituals. The spiritual atmosphere is unforgettable. After the ride, return to the hotel for breakfast. Later, transfer to the airport or railway station for your onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_13, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_13, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_13, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_13, d."id", 3 FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_13, d."id", 4 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  -- Variant: 9n-10d-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '9n-10d-varanasi', 'Delhi Agra Jaipur Tour with Varanasi 10 Days',
    9, 10, '9 Nights / 10 Days',
    14, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_14;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_14;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_14, 1, 'Delhi: Arrival & Welcome', 'Upon arrival at Delhi Airport, our company representative greets you and assists with your transfer to the hotel. You check in and spend the rest of the day at leisure, settling into the vibrant capital. An overnight stay at the hotel provides a comfortable start to your journey.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_14, 2, 'Delhi: Mughal Heritage & Old Delhi Sightseeing', 'After breakfast, a guided tour takes you through Delhi''s historic core. You visit the magnificent Jama Masjid, the sprawling Red Fort, and the imposing India Gate. The tour includes views of the President House and Parliament, followed by the ancient Qutub Minar, the serene Lotus Temple, and the elegant Humayun''s Tomb. An overnight stay at the hotel concludes the day.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_14, 3, 'Delhi to Jaipur: Express Drive via Rajasthan Highway', 'After breakfast, you depart for Jaipur, driving approximately 260 kilometers over 6 hours. You enjoy lunch en route and arrive in the Pink City by evening. After checking into the hotel, you have the evening free to explore or relax. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_14, 4, 'Jaipur: Amber Fort & Royal City Palaces', 'Today after breakfast, a guided tour covers Jaipur''s highlights. You visit the majestic Amber Fort, the scenic Water Palace, the iconic Hawa Mahal (Palace of Winds), the sprawling City Palace, and the astronomical Jantar Mantar observatory. You also explore Rajasthani handicraft workshops. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_14, 5, 'Jaipur to Agra: Taj Mahal Evening Visit', 'After breakfast, you drive to Agra, covering approximately 260 kilometers in 6 hours. Upon arrival, a guided tour takes you to the breathtaking Taj Mahal, where you witness its ethereal beauty. You then check into the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_14, 6, 'Agra to Khajuraho: En-Route Orchha Exploration', 'After breakfast, you drive to Khajuraho, a journey of about 400 kilometers and 9 hours. En route, you stop to explore the historic town of Orchha, with its beautiful palaces and temples. You continue to Khajuraho and check into the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_14, 7, 'Khajuraho: Western Temples & Jain Shrines', 'After breakfast, you visit the famous Western Temples of Khajuraho, renowned for their intricate erotic carvings and stunning architecture. You also explore the Jain Temples and take a leisurely walk through the city centre. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_14, 8, 'Khajuraho to Varanasi: Sacred City Drive', 'After breakfast, you drive to Varanasi, approximately 400 kilometers in 9-10 hours. The journey takes you through the heart of Uttar Pradesh. Upon arrival, you check into the hotel and have the evening at leisure. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_14, 9, 'Varanasi: Ganges Boat Ride & Sarnath Excursion', 'Early morning, you enjoy a boat ride on the holy river Ganges, witnessing the famous bathing ghats and the vibrant morning rituals. After breakfast, you visit the sacred Vishwanath Temple, Sankat Mochan Temple, BHEU, and the important Buddhist site of Sarnath. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_14, 10, 'Varanasi: Departure Transfer', 'After breakfast, you are transferred to Varanasi Airport or Railway Station for your onward journey. Your memorable tour concludes as you depart with rich cultural experiences.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_14, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_14, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_14, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_14, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  -- Variant: 11n-12d-khajuraho-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '11n-12d-khajuraho-varanasi', 'Delhi Jaipur Agra Khajuraho Varanasi Tour For 12 Days',
    11, 12, '11 Nights / 12 Days',
    15, FALSE,
    'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29018572/pexels-photo-29018572.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32261869/pexels-photo-32261869.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_15;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_15;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 1, 'Delhi: Arrival and Hotel Check-in', 'Upon arrival at Delhi Airport, your representative greets you and escorts you to your pre-booked hotel. After check-in, you have the evening at leisure to relax or explore the nearby area. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 2, 'Delhi: Mughal Heritage & Imperial Landmarks', 'After breakfast, you embark on a guided tour of Delhi''s iconic landmarks. Visit the majestic Jama Masjid and the historic Red Fort in Old Delhi. Continue to India Gate, President House, and Parliament House. Later, explore the towering Qutub Minar and the elegant Humayun''s Tomb. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 3, 'Delhi to Jaipur: Scenic Drive to the Pink City', 'After breakfast, you drive to Jaipur, the Pink City, covering approximately 260 kilometers in 6 hours. Enjoy lunch at a roadside restaurant en route. Upon arrival, check into your hotel and spend the evening at leisure. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 4, 'Jaipur: Royal Forts, Palaces & Traditional Crafts', 'After breakfast, you proceed for a full-day guided tour of Jaipur. Visit the magnificent Amber Fort, then see the Jal Mahal (Water Palace) from outside. Explore the iconic Hawa Mahal, City Palace, and the astronomical Jantar Mantar. Later, witness traditional block printing and stone cutting crafts that have been practiced for centuries. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 5, 'Jaipur to Agra: En Route Fatehpur Sikri Exploration', 'After breakfast, you drive to Agra, stopping en route at the UNESCO-listed Fatehpur Sikri. Explore the ghost city''s beautiful palaces and courtyards. Continue your journey to Agra, check into your hotel, and relax. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 6, 'Agra: Taj Mahal at Dawn & Agra Fort', 'Early morning, you visit the breathtaking Taj Mahal at sunrise. After breakfast, explore the imposing Agra Fort. Later, visit a workshop to see the fine marble inlay work that Agra is famous for. Return to the hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 7, 'Agra to Khajuraho: Journey through Bundelkhand', 'After breakfast, you drive to Khajuraho, a journey of about 400 kilometers taking 8 hours. Enjoy the rural landscapes of Bundelkhand along the way. Check into your hotel upon arrival and spend the evening at leisure. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 8, 'Khajuraho: Exquisite Temple Architecture', 'After breakfast, you explore the famous Western Group of Temples, known for their intricate erotic sculptures. Continue to the Jain Temples within the complex. Take a leisurely walk through the city center, soaking in the local atmosphere. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 9, 'Khajuraho to Varanasi: Drive to the Spiritual Capital', 'After breakfast, you drive to Varanasi, the spiritual heart of India, covering 400 kilometers in approximately 9 hours. Upon arrival, check into your hotel and relax. In the evening, you may take a stroll along the ghats. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 10, 'Varanasi: Ganga Aarti & Ancient Temples', 'Early morning, you enjoy a boat ride on the holy Ganges River, witnessing the bustling bathing ghats. After breakfast, visit the Kashi Vishwanath Temple, Sankat Mochan Temple, and Banaras Hindu University. Later, drive to Sarnath, where Buddha gave his first sermon. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 11, 'Varanasi to Delhi: Return Journey & Leisure', 'After breakfast, you are transferred to Varanasi Airport or Railway Station for your flight or train to Delhi. Upon arrival in Delhi, our representative escorts you to your hotel. The rest of the day is at leisure. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_15, 12, 'Departure from Delhi: End of Tour', 'After breakfast, you are transferred to Delhi Airport or Railway Station for your onward journey. Your memorable 12-day tour concludes with fond memories of India''s rich heritage.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_15, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_15, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_15, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_15, d."id", 3 FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_15, d."id", 4 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  -- Variant: 20n-21d-khajuraho-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '20n-21d-khajuraho-varanasi', 'Rajasthan Tour with Delhi Agra Khajuraho Varanasi Tour 20 Nights 21 Days',
    20, 21, '20 Nights / 21 Days',
    16, FALSE,
    'https://images.pexels.com/photos/34201914/pexels-photo-34201914.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_16;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_16;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 1, 'Delhi: Arrival and Leisure', 'Upon arrival at Delhi Airport, a company representative greets and assists you, then transfers you to the hotel. The rest of the day is at leisure to relax or explore nearby areas. Welcome drink awaits at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 2, 'Delhi: Mughal Heritage & Old Delhi Sightseeing', 'After breakfast, embark on a guided tour covering Jama Masjid, Red Fort, President''s House, Parliament House, Qutub Minar, Lotus Temple, and Humayun''s Tomb. The evening is free for personal exploration or optional visits.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 3, 'Delhi to Mandawa: Painted Havelis of Shekhawati', 'Drive 260 km to Mandawa (approx. 6 hours). After check-in, enjoy a guided walking tour through the old town, visiting elaborately painted havelis. Rest of the day at leisure to soak in the frescoed heritage.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 4, 'Mandawa to Bikaner: Junagarh Fort & Karni Mata Temple', 'Drive to Bikaner (200 km, 4 hours). Visit Junagarh Fort, a formidable sandstone fortress. Later, proceed to Deshnok Temple, the famous rat temple. Evening free.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 5, 'Bikaner to Jaisalmer: The Golden City', 'Drive to Jaisalmer (340 km, 6 hours). The day is at leisure to explore the golden sandstone city on your own. Overnight at hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 6, 'Jaisalmer: Fort, Havelis & Desert Camp at Khuri', 'After breakfast, check out and visit Jaisalmer Fort and Patwon Ki Haveli. After lunch, drive to Khuri/Sam sand dunes. Enjoy a camel ride at sunset, followed by Rajasthani folk dance and dinner at the desert camp.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 7, 'Khuri to Jodhpur: Mehrangarh Fort & Jaswant Thada', 'Drive to Jodhpur (270 km, 6 hours). Visit the imposing Mehrangarh Fort and the marble cenotaph Jaswant Thada. Evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 8, 'Jodhpur to Ranakpur: Jain Temple Marvel', 'Drive to Ranakpur (200 km, 3 hours). Visit the exquisite Ranakpur Jain Temple, renowned for its intricate marble carvings. Rest of the day free.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 9, 'Ranakpur to Udaipur: The City of Lakes', 'Drive to Udaipur (100 km, 3 hours). Day at leisure to explore the romantic lakes and palaces on your own. Overnight at hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 10, 'Udaipur: City Palace, Jagdish Temple & Boat Ride', 'After breakfast, visit Jagdish Temple, City Palace, and Sahelion Ki Bari (Princess Garden). Enjoy a boat ride on Lake Pichola. Evening free.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 11, 'Udaipur to Pushkar: Holy City & Brahma Temple', 'Drive to Pushkar (280 km, 6 hours). Explore the sacred Pushkar Lake and Brahma Temple. Evening at leisure to witness aarti at the ghats.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 12, 'Pushkar to Jaipur: Camel Fair Ground & Brahma Temple', 'Visit Brahma Temple and the camel fair ground. Then proceed to Jaipur (150 km, 3 hours). Rest of the day free.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 13, 'Jaipur: Amber Fort, Hawa Mahal & City Palace', 'After breakfast, guided tour of Amber Fort, Hawa Mahal, City Palace, and Jantar Mantar. Also visit block printing and stone cutting workshops. Evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 14, 'Jaipur to Agra via Fatehpur Sikri: Mughal Marvels', 'Drive to Agra (260 km, 6 hours) en route visiting Fatehpur Sikri, the abandoned Mughal city. Arrive in Agra and check into hotel. Evening free.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 15, 'Agra: Taj Mahal, Agra Fort & Marble Inlay Craft', 'Guided tour of Taj Mahal and Agra Fort. Visit a workshop to see fine marble inlay work. Evening free.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 16, 'Agra to Orchha: Bundela Fort & Cenotaphs', 'Drive to Orchha (260 km, 6 hours). Visit Orchha Fort complex and enjoy a walking tour. Overnight at hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 17, 'Orchha to Khajuraho: Western & Jain Temples', 'Drive to Khajuraho (180 km, 4 hours). After check-in, visit the Western Group of Temples and Jain Temples, famed for erotic sculptures. Evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 18, 'Khajuraho to Varanasi: Sacred Ganges', 'Drive to Varanasi (400 km, 9 hours). Check into hotel. Rest of the day at leisure to explore the ghats on your own.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 19, 'Varanasi: Ganges Boat Ride, Temples & Sarnath', 'Early morning boat ride on the Ganges to see bathing ghats. After breakfast, visit Kashi Vishwanath Temple, Sankat Mochan Temple, BHU, and Sarnath. Evening free.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 20, 'Varanasi to Delhi: Return Transfer', 'After breakfast, transfer to Varanasi Airport/Railway station for flight/train to Delhi. Upon arrival, transfer to hotel. Rest of day at leisure for onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_16, 21, 'Delhi: Departure with Sweet Memories', 'After breakfast, transfer to Delhi Airport/Railway station for departure. Tour ends with sweet memories of an incredible journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_16, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_16, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_16, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_16, d."id", 3 FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_16, d."id", 4 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
  var_id_5 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'himachal-pradesh';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'shimla-manali-himachal', 'Shimla Manali Himachal Pradesh Tour',
    'Escape to the timeless Himalayan grandeur of Shimla and Manali, where pine-clad slopes and snow-dusted peaks cradle charming colonial architecture and vibrant local culture. This adventure tour category invites you to trek through lush apple orchards in Manali, stroll along Mall Road in Shimla, and witness the sunrise over the Dhauladhar range. Our expertly crafted itineraries blend adrenaline-pumping activities like river rafting in the Beas and paragliding in Solang Valley with serene visits to ancient temples and monasteries. With Mother India Tour Travels, you get India-honed expertise, handpicked accommodations, and seamless transfers that let you focus on creating mountain memories.',
    ARRAY['Walk the historic Mall Road and Ridge in Shimla, with panoramic views of the surrounding Himalayas.', 'Explore the ancient Hadimba Devi Temple in Manali, surrounded by cedar forests.', 'Drive the thrilling Atal Tunnel to Sissu and witness the Lahaul Valley''s stark beauty.', 'Paraglide over Solang Valley or white-water raft in the Beas River (seasonal).', 'Visit the serene Tibetan Monastery in Manali and witness Buddhist prayer ceremonies.'],
    ARRAY['Accommodation in handpicked hotels/resorts (3-star and above) for all nights as per itinerary.', 'Daily breakfast and dinner at the hotel (or as specified).', 'Private air-conditioned vehicle for all transfers and sightseeing (as per itinerary).', 'Experienced English-speaking local guide for city tours and excursions.', 'All toll taxes, parking fees, driver allowances, and interstate taxes.', '24/7 emergency assistance from our India-based travel experts.', 'Complimentary welcome kit with water bottle, map, and travel tips.'],
    ARRAY['Airfare or train fare to/from the starting point (usually Chandigarh or Delhi).', 'Entrance fees to monuments, temples, and adventure activity charges (unless specified).', 'Personal expenses such as laundry, telephone calls, tips, and beverages.', 'Travel insurance (recommended to buy separately).', 'Any services not explicitly mentioned in inclusions.'],
    ARRAY['Mountain roads can be windy; guests prone to motion sickness should carry medication.', 'Snow activities (skiing, snowmobiling) depend on season and weather; confirm availability while booking.', 'Altitude may affect some travelers; allow time to acclimatize, especially in Manali (2,050 m).'],
    'https://images.pexels.com/photos/6496159/pexels-photo-6496159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/968625/pexels-photo-968625.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/28680808/pexels-photo-28680808.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5110976/pexels-photo-5110976.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Adventure', 20, 12, 'Premium Hotels',
    'Shimla Manali: Adventure awaits in the Himalayas.', TRUE, FALSE, TRUE,
    ARRAY['himachal', 'mountains', 'hill-stations', 'snow', 'adventure'], country_id, state_id,
    'Shimla Manali Tour Packages 2025 | Book from ₹5,999', 'Explore Shimla & Manali adventure tours: 1D to 9D packages. Trek, paraglide, raft in the Himalayas. Book now with Mother India Tour Travels!', ARRAY['Shimla Manali tour packages', 'Himachal Pradesh adventure tours', 'Shimla Manali itinerary', 'hill station packages India', 'Manali paragliding tours', 'Shimla Mall Road', 'snow holiday packages', 'Mother India Tour Travels Shimla Manali'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'hill-station-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'adventure-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d', 'Shimla Manali Tour Package for 05 Days',
    4, 5, '4 Nights / 5 Days',
    0, TRUE,
    'https://images.pexels.com/photos/6496159/pexels-photo-6496159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/968625/pexels-photo-968625.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/28680808/pexels-photo-28680808.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5110976/pexels-photo-5110976.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Delhi to Shimla: Scenic Drive & Arrival', 'Upon arrival at Delhi airport or railway station, our representative assists you and transfers you to Shimla. The 350 km drive takes approximately 7-8 hours through winding hill roads. Check into your hotel and relax. Evening free to stroll the Mall Road. Overnight stay in Shimla.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Shimla: Kufri Adventure & Local Sightseeing', 'After breakfast, drive to Kufri, renowned for its adventure activities like skiing and tobogganing. Kufri boasts the oldest skiing slopes in Himachal Pradesh. You can hike or ride a pony up to Mashu Peak for panoramic views. Return to Shimla for local sightseeing including the Viceregal Lodge and Christ Church. Overnight in Shimla.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Shimla to Manali: Kullu Valley & River Rafting', 'After breakfast, depart for Manali, a 240 km drive that takes about 8 hours. En route, enjoy the scenic Kullu Valley and stop for river rafting on the Beas River. Arrive in Manali by evening and check into your hotel. Overnight in Manali.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Manali: Solang Valley & Temples', 'After breakfast, proceed to Solang Valley for adventure activities like paragliding and zorbing. Visit the ancient Hadimba Temple surrounded by cedar forests, the hot springs at Vashisht Temple, and the Tibetan Monastery. Stroll down Mall Road and Van Vihar. Overnight in Manali.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 5, 'Manali to Delhi: Departure', 'After breakfast, drive to Chandigarh or Delhi (550 km, 12-13 hours) for your onward journey. Our representative drops you at the airport or railway station. Tour concludes with cherished memories of Himachal.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'shimla'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d', 'Shimla Kullu Manali Tour Package 06 Days',
    5, 6, '5 Nights / 6 Days',
    1, FALSE,
    'https://images.pexels.com/photos/6496159/pexels-photo-6496159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/968625/pexels-photo-968625.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/28680808/pexels-photo-28680808.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5110976/pexels-photo-5110976.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Arrival in Shimla: Scenic Drive through the Hills', 'Upon arrival at Delhi or Chandigarh airport/railway station, our representative assists you and you proceed to Shimla. The journey from Chandigarh covers about 120 km in 4 hours, winding through picturesque hills and valleys. On reaching Shimla, you check into your hotel and relax. The evening is free to explore the Mall Road or simply enjoy the cool mountain air.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Shimla: Half-Day Excursion to Kufri & Adventure Activities', 'After breakfast, you proceed for a half-day excursion to Kufri, situated at an altitude of 2500 meters. Kufri is renowned for its skiing slopes and adventure activities like tobogganing. You can hike or take a pony ride up to Mashu Peak (own cost) for panoramic views of the Himalayas. The rest of the day is free to explore Shimla at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Shimla to Manali: Scenic Transfer via Kullu Valley', 'After breakfast, you depart for Manali, covering 240 km in about 8 hours. The drive takes you past the Beas-Sutlej Link Project and Pandoh Dam. You halt en route at Kullu Valley, where you can enjoy a boat ride on the Beas River (own cost). The scenic beauty of the valley, with its apple orchards and river views, makes this journey memorable. Upon arrival in Manali, you check into your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Manali: Full-Day Adventure at Solang Valley', 'After breakfast, you enjoy a full-day excursion to Solang Valley, known for its rolling meadows and adventure activities. You can try paragliding, zorbing, or skiing (own cost) amidst stunning snow-capped peaks. The valley offers a perfect blend of thrill and natural beauty. You return to your hotel in Manali for dinner and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Manali: Local Sightseeing – Temples, Monastery & Mall Road', 'After breakfast, you proceed for local sightseeing in Manali. You visit Vashishtha Kund, a hot spring temple, and the ancient Hadimba Temple surrounded by cedar forests. Continue to Van Vihar, a scenic park, and the Tibetan Monastery to witness Buddhist art. Finally, you stroll along the vibrant Mall Road, lined with shops and cafes. Overnight at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 6, 'Departure: Transfer to Delhi/Chandigarh', 'After breakfast, you checkout from the hotel and drive to Chandigarh (270 km, 6-7 hours) or Delhi (550 km, 12-13 hours) for your onward journey. You are dropped at the airport or railway station as per your schedule. The tour concludes with fond memories of the Himalayas.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'shimla'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d', 'Shimla Manali Chandigarh Tour Packages 07 Days',
    6, 7, '6 Nights / 7 Days',
    2, FALSE,
    'https://images.pexels.com/photos/6496159/pexels-photo-6496159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/968625/pexels-photo-968625.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/28680808/pexels-photo-28680808.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5110976/pexels-photo-5110976.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Delhi/Chandigarh to Shimla: Scenic Drive & Arrival', 'Upon arrival at Delhi or Chandigarh airport or railway station, our representative warmly greets you and assists with your transfer to Shimla. The journey from Delhi covers 350 km (approx. 8 hours), while from Chandigarh it is 120 km (approx. 4 hours), winding through the Shivalik hills with panoramic views. On reaching Shimla, you check into your hotel and enjoy the evening at leisure, perhaps strolling along the famous Mall Road. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Shimla: Kufri Excursion & Adventure Activities', 'After breakfast, set out for a half-day excursion to Kufri, situated at an altitude of 2500 meters. Kufri is renowned for its adventure activities like skiing and tobogganing, and it boasts the oldest skiing slopes in Himachal Pradesh. You may also hike or take a pony up to Mashu Peak (own cost) for breathtaking views of the surrounding Himalayas. Return to Shimla in the afternoon and spend the rest of the day exploring the local markets or relaxing at the hotel. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Shimla to Manali: Journey via Kullu Valley', 'After breakfast, depart for Manali, a drive of 240 km (approx. 8 hours). En route, you pass the Beas-Sutlej Link Project and the impressive Pandoh Dam. A halt at the scenic Kullu Valley offers an opportunity for a boat ride (direct) on the Beas River, surrounded by apple orchards and pine forests. Continue the journey to Manali, checking into your hotel by evening. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Manali: Full-Day Solang Valley Adventure', 'After breakfast, enjoy a full-day excursion to Solang Valley, famous for its rolling meadows, ski slopes, and thrilling paragliding activities (own cost). You can also try zorbing, ATV rides, or simply soak in the alpine beauty. The valley offers stunning views of the surrounding snow-capped peaks. Return to Manali in the evening for an overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Manali: Local Sightseeing & Cultural Landmarks', 'After breakfast, proceed for local sightseeing of Manali. Visit the ancient Hadimba Temple, dedicated to the demon goddess Hidimba, set amidst a cedar forest. Next, bathe in the hot sulphur springs at Vashishtha Kund, then explore the Van Vihar nature park and the Tibetan Monastery, which houses a giant Buddha statue. End your day with a leisurely walk on Mall Road, lined with shops and cafes. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Manali to Chandigarh: En Route Pinjore Garden', 'After breakfast, depart for Chandigarh, a drive of 270 km (approx. 7-8 hours). En route, visit the historic Pinjore Garden, a Mughal-style terraced garden with fountains and pavilions. Arrive in Chandigarh and check into your hotel for an overnight stay. The evening is free to explore the city''s planned layout or enjoy local cuisine.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 7, 'Chandigarh to Delhi: Garden City Sightseeing & Departure', 'After breakfast, visit the famous Rose Garden and the unique Rock Garden in Chandigarh, a sculpture garden created from industrial and home waste. Later, proceed to Delhi (250 km, approx. 5-6 hours) for your drop at the airport or railway station. Your memorable Himalayan adventure concludes here.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'shimla'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT DO NOTHING;

  -- Variant: 8n-9d-amritsar
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '8n-9d-amritsar', 'Exotic Himachal Tour Package with Amritsar for 09 Days',
    8, 9, '8 Nights / 9 Days',
    3, FALSE,
    'https://images.pexels.com/photos/6496159/pexels-photo-6496159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/968625/pexels-photo-968625.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/28680808/pexels-photo-28680808.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5110976/pexels-photo-5110976.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Delhi/Chandigarh to Shimla: Scenic Drive & Colonial Charms', 'Guests are greeted upon arrival at Delhi or Chandigarh airport/railway station and driven to Shimla. The journey reveals the shifting landscapes of the Shivalik Hills. Shimla, the former summer capital of British India, enchants with its Victorian architecture along the Mall Road and The Ridge. After checking in, the evening is free to stroll through the pine-fringed paths. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Kufri: Alpine Adventure & Panoramic Views', 'After breakfast, guests set off for a half-day excursion to Kufri, perched at 2,500 meters. This hill station offers panoramic views of the Himalayas and is a hub for adventure activities like skiing and tobogganing in winter. An optional pony ride or hike to Mashu Peak is available at own cost. The crisp mountain air and lush landscapes make for a refreshing morning. Return to Shimla for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Shimla to Manali: Valleys, Dams & River Rafting', 'After breakfast, the journey continues to Manali, winding through the scenic Beas River Valley. En route, guests pass the Beas-Sutlej Link Project and Pandoh Dam. A stop at Kullu Valley offers opportunities for white-water rafting (optional, at own cost). Lunch is enjoyed at a local roadside eatery. The drive is dotted with apple orchards and pine forests. Arrive in Manali by evening and check into the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Manali: Temples, Valleys & Mall Road', 'Following breakfast, guests explore Manali’s highlights. Hadimba Temple, a pagoda-shaped shrine dedicated to the demoness Hidimba, sits amidst a cedar forest. The Vashisht Temple offers hot sulphur springs for a relaxing dip. In Solang Valley, adventure options include paragliding and zorbing. A leisurely walk along Mall Road leads to local handicraft shops and cafes. An optional excursion to Atal Tunnel, Sissu, and Rohtang Pass is available at extra cost. Overnight in Manali.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Manali to Dharamshala: Temples & Tea Gardens', 'After breakfast, guests drive to Dharamshala, the seat of the Dalai Lama. En route, a stop at Baijnath Temple reveals a 13th-century Shiva temple with intricate stone carvings. Continuing, Palampur’s lush tea gardens offer a chance to see tea plucking and taste fresh brews. The drive winds through the Kangra Valley. Upon arrival in Dharamshala, check into the hotel and relax. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Dharamshala to Dalhousie: Tibetan Monasteries & Scenic Drive', 'After breakfast, guests explore Dharamshala’s landmarks before departing for Dalhousie. In McLeod Ganj, they visit the residence of His Holiness the Dalai Lama and the Tsuglagkhang Temple. St. John’s Church in the Wilderness, built in 1853, offers a peaceful retreat. The war memorial honors brave soldiers, while Bhagsunath Temple and Dal Lake provide serenity. Norbulingka and Gyuto Rameda Tantric Monastery showcase Tibetan culture. The drive to Dalhousie is scenic. Arrive and check into the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 7, 'Dalhousie: Colonial Charms & Khajjiar Excursion', 'Dalhousie, named after the 19th-century British Governor-General, is nestled amidst deodar, pine, and oak forests. The morning begins with local sightseeing: Panjipula, a popular picnic spot, and Subhash Baoli, a serene spring. In the afternoon, guests drive to Khajjiar, 24 km away, known as the ''Mini Switzerland of India'' for its lush meadows and dense deodar groves. The journey itself is a visual treat. Return to Dalhousie for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 8, 'Amritsar: Golden Temple & Wagah Border Ceremony', 'After breakfast, guests drive to Amritsar, the spiritual heart of Sikhism. Upon arrival, they visit the golden splendor of the Golden Temple (Harmandir Sahib), where the holy sarovar and gold-plated dome inspire devotion. In the evening, they head to the Wagha Border to witness the high-energy Beating Retreat ceremony between Indian and Pakistani soldiers. The pageantry and patriotic fervor are unforgettable. Return to the hotel in Amritsar for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 9, 'Amritsar to Delhi/Chandigarh: Journey Home', 'After a final breakfast, guests check out and begin their journey back to Delhi or Chandigarh. The long drive offers a chance to reflect on the diverse experiences of the tour. Depending on preference, drop-off is at the airport or railway station for onward travel. The tour concludes with lasting memories of the Himalayas, colonial towns, and spiritual Amritsar.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'shimla'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'amritsar'
  ON CONFLICT DO NOTHING;

  -- Variant: 0n-1d-amritsar
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '0n-1d-amritsar', 'Grand Himachal Tour Package with Amritsar for 10 Days.',
    0, 1, 'Same Day Tour',
    4, FALSE,
    'https://images.pexels.com/photos/19213818/pexels-photo-19213818.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/30729231/pexels-photo-30729231.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32862097/pexels-photo-32862097.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31216870/pexels-photo-31216870.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31216843/pexels-photo-31216843.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Delhi/Chandigarh to Shimla: Scenic Drive & Victorian Charm', 'Upon arrival at Delhi or Chandigarh airport/railway station, you are driven to Shimla, a journey of 350 km from Delhi (7-8 hours) or 120 km from Chandigarh (4 hours). Shimla is renowned for its Victorian architecture, especially along the Mall and The Ridge. After checking into the hotel, spend the evening exploring the bustling Mall Road and enjoy the cool mountain air. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Shimla: Kufri Excursion & Adventure Activities', 'After breakfast, proceed for a half-day excursion to Kufri (2500 meters), a popular hill station known for adventure activities like skiing and tobogganing. You can also hike or take a pony ride to Mashu Peak (at own cost). The panoramic views of the Himalayan ranges are breathtaking. Return to Shimla in the afternoon for leisure time. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Shimla to Manali: Drive via Kullu Valley & River Rafting', 'After breakfast, depart for Manali (240 km, 7-8 hours). En route, witness the Beas-Sutlej Link Project and Pandoh Dam. Stop in Kullu Valley for optional river rafting (at own cost). Have lunch along the way. Continue the scenic drive through lush valleys and pine forests. Arrive in Manali by evening and check into the hotel. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Manali: Local Sightseeing & Solang Valley', 'After breakfast, visit Manali''s famous landmarks including Hadimba Temple, a unique pagoda-shaped shrine, and Vashisht Temple with its hot springs. Then head to Solang Valley for adventure activities like skiing and paragliding (at own cost). Later, stroll along Mall Road for shopping and local cuisine. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Manali: Day Trip to Solang Valley for Adventure', 'After breakfast, proceed for a full-day trip to Solang Valley, known for its pristine snow and adventure sports. Enjoy activities such as zorbing, skiing, and snowmobiling (at own cost). The valley offers stunning views of the surrounding peaks. Return to Manali in the evening for dinner. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Manali to Dharamshala: Temples & Tea Gardens', 'After breakfast, drive to Dharamshala (225 km, 7 hours). En route, visit the ancient Baijnath Shiva Temple and the lush Palampur Tea Gardens. Upon arrival in Dharamshala, check into the hotel and explore the local market. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 7, 'Dharamshala to Dalhousie: Spiritual Sites & Scenic Drive', 'After breakfast, visit the residence of His Holiness the Dalai Lama and Tsugalkhang Temple at Mcleodganj, St. John’s Church in the Wilderness (built in 1853), War Memorial, Bhagsunath Temple, and Dal Lake. Also see Norbulingka and Gyuto Rameda Tantric Monastery. Then drive to Dalhousie (125 km, 4 hours). Check into the hotel and enjoy the evening at leisure. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 8, 'Dalhousie: Local Sightseeing & Khajjiar Excursion', 'After breakfast, explore Dalhousie’s colonial charm with visits to Panjipula and Subhash Baoli. Then drive to Khajjiar (24 km), known as ''Mini Switzerland'', surrounded by thick deodar forests. Enjoy the breathtaking drive and meadow views. Return to Dalhousie for overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 9, 'Dalhousie to Amritsar: Golden Temple & Wagah Border', 'After breakfast, drive to Amritsar (200 km, 5-6 hours). Upon arrival, visit the serene Golden Temple, the holiest Sikh shrine. In the evening, witness the Beating Retreat Ceremony at the Wagah Border, a stirring display of patriotism. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 10, 'Amritsar to Delhi/Chandigarh: Departure', 'After breakfast, drive to Delhi (550 km, 10 hours) or Chandigarh (250 km, 5-6 hours) for your onward journey. You are dropped at the airport or railway station. Tour concludes with cherished memories of the Himalayas and Amritsar''s spiritual grandeur.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'shimla'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'amritsar'
  ON CONFLICT DO NOTHING;

  -- Variant: 0n-1d-volvo
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '0n-1d-volvo', 'Volvo Tour Packages Delhi Manali Delhi',
    0, 1, 'Same Day Tour',
    5, FALSE,
    'https://images.pexels.com/photos/5238340/pexels-photo-5238340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/30729231/pexels-photo-30729231.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32862097/pexels-photo-32862097.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31216870/pexels-photo-31216870.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19213818/pexels-photo-19213818.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_5;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_5;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 1, 'Delhi to Manali: Overnight Volvo Journey', 'Board an AC Volvo bus from Delhi in the evening, commencing an overnight journey through the scenic hills towards Manali. The ride offers comfortable reclining seats and a glimpse of the changing landscape as you traverse the winding mountain roads. Expect a smooth transit with a scheduled dinner break en route. Arrive in Manali by early morning, refreshed and ready to explore.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 2, 'Manali: Local Temple Tour and Monastery Visit', 'Upon arrival at Manali bus stand, transfer to your hotel for a brief rest and refreshments. Later, embark on a half-day city tour covering the ancient Hadimba Temple, dedicated to the wife of Bhima from the Mahabharata. Continue to Manu Temple, believed to be the birthplace of the lawgiver Manu, and Vashisht Temple with its natural hot springs. End the day at the Tibetan Monastery, where you can witness Buddhist art and prayer flags. Return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 3, 'Solang Valley: Adventure and Scenic Excursion', 'After breakfast, drive to Solang Valley, a paradise for adventure enthusiasts set amidst rolling meadows and snow-capped peaks. Spend the full day indulging in activities like skiing, paragliding, and zorbing (own cost). Enjoy the breathtaking views of the valley and the distant Rohtang Pass. Optional add-ons include a visit to Atal Tunnel, Sissu, or Rohtang Pass (extra charges apply). Return to your hotel in the evening for dinner and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 4, 'Kullu and Manikaran: Hot Springs and Handicrafts', 'After an early breakfast, set out for a full-day excursion to Manikaran, famous for its hot water springs and the revered Gurudwara. Along the way, visit Kullu and Shamshi, known for the Kullu shawl industry, where you can shop for traditional handicrafts. Enjoy a boat ride on the Beas River (own cost) amidst the picturesque valley. Return to Manali for an overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 5, 'Manali to Delhi: Return by Volvo Bus', 'Check out from your hotel after breakfast and spend some leisure time in Manali before boarding the AC Volvo bus in the evening. The overnight journey takes you back to Delhi, with a restful ride through the mountains and plains. Arrive in Delhi the next morning, concluding the tour with lasting memories of Himachal''s beauty.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 0 FROM "Destination" d WHERE d."slug" = 'shimla'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 1 FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
  var_id_5 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'rajasthan';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'rajasthan-tours', 'Rajasthan Tour Packages',
    'Rajasthan, the Land of Kings, offers a breathtaking tapestry of majestic forts, opulent palaces, and vibrant bazaars that whisper tales of valor and romance. From the pink-hued streets of Jaipur to the blue alleys of Jodhpur, each city unveils a unique chapter of royal heritage. Our expertly curated tours take you beyond the guidebooks, with exclusive access to hidden courtyards of Mehrangarh Fort and sundowner camel rides on Sam Sand Dunes. With Mother India Tour Travels, you experience Rajasthan through the eyes of a connoisseur, blending luxury with authentic cultural encounters.',
    ARRAY['Guided tour of Amber Fort with optional sound and light show in Jaipur', 'Sunset view of Mehrangarh Fort from the Jaswant Thada cenotaphs in Jodhpur', 'Overnight stay at a heritage desert camp near Jaisalmer with folk music under the stars', 'Private boat ride on Lake Pichola with views of the Lake Palace in Udaipur', 'Visit to the opulent City Palace in Udaipur, including the Crystal Gallery'],
    ARRAY['Accommodation in 4-star heritage hotels and palace properties on twin-sharing basis', 'Daily breakfast and dinner at the hotel or at select heritage restaurants', 'Private air-conditioned vehicle with English-speaking chauffeur throughout the tour', 'Services of a dedicated English-speaking tour guide at all major monuments', 'All monument entry fees including Amber Fort, Mehrangarh Fort, Jaisalmer Fort, and City Palace', 'Traditional welcome with tilak and garland at Jaipur arrival', 'One complimentary camel ride and desert safari at Jaisalmer sand dunes'],
    ARRAY['International or domestic airfare and airport taxes', 'Lunch and beverages (except those specified in inclusions)', 'Personal expenses such as laundry, phone calls, and tips', 'Any activities not mentioned in the itinerary, like hot air balloon rides or jeep safaris', 'Travel insurance and visa fees'],
    ARRAY['Best time to visit is October to March; desert nights can be cool, so pack layers.', 'Moderate walking required at forts and palaces; comfortable footwear recommended.', 'ID proof is mandatory for monument entries and hotel check-ins.'],
    'https://images.pexels.com/photos/18881277/pexels-photo-18881277.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/31339268/pexels-photo-31339268.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36545457/pexels-photo-36545457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37350608/pexels-photo-37350608.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33797768/pexels-photo-33797768.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Heritage', 20, 12, 'Premium Hotels',
    'Explore majestic forts, royal palaces & golden deserts on curated heritage tours.', TRUE, TRUE, TRUE,
    ARRAY['rajasthan', 'forts', 'palaces', 'desert', 'heritage'], country_id, state_id,
    'Rajasthan Tour Packages 2025 | Book from ₹35,999', 'Explore Rajasthan''s majestic forts, palaces, and desert with our heritage tours. Jaipur, Jodhpur, Jaisalmer, Udaipur. 10D–15D options. Book now at Mother Ind...', ARRAY['Rajasthan tour packages', 'Rajasthan heritage tours', 'Jaipur Jodhpur Jaisalmer Udaipur package', 'Rajasthan tour from Delhi', 'best Rajasthan tour operator', 'Rajasthan travel itinerary', 'forts and palaces tour India', 'desert safari Rajasthan package'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'heritage-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 9n-10d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '9n-10d', 'Rajasthan Tour Packages for 10 Days',
    9, 10, '9 Nights / 10 Days',
    0, TRUE,
    'https://images.pexels.com/photos/18881277/pexels-photo-18881277.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/31339268/pexels-photo-31339268.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36545457/pexels-photo-36545457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37350608/pexels-photo-37350608.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33797768/pexels-photo-33797768.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Delhi: Arrival and Welcome', 'Upon arrival at Delhi Airport, our company representative warmly welcomes and assists you with luggage transfer. You are then driven to your pre-booked hotel for check-in. Spend the rest of the day at leisure, relaxing after your flight or exploring the nearby markets. Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Delhi: Mughal Heritage and Imperial Landmarks', 'After breakfast, set out for a full-day guided tour of Delhi''s iconic sights. Visit the massive Jama Masjid, the imposing Red Fort, the majestic India Gate, and the stately President''s House (Rashtrapati Bhavan). Continue to the serene Humayun''s Tomb, the lotus-shaped Baha''i Lotus Temple, and the soaring Qutub Minar complex. Return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Delhi to Agra: Taj Mahal and Agra Fort', 'After an early breakfast, drive 240 kilometers (3 hours) to Agra upon arrival. First, visit the legendary Taj Mahal, a marble mausoleum glowing in the afternoon light. Next, explore the red sandstone Agra Fort, a UNESCO World Heritage site housing palaces and mosques. Overnight stay at an Agra hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Agra to Ranthambore: Fatehpur Sikri and Wildlife', 'Following breakfast, drive 305 kilometers (6-7 hours) to Ranthambore. En route, stop at Fatehpur Sikri, the deserted Mughal city with its Buland Darwaza and Panch Mahal. Continue to Ranthambore, check into your hotel, and unwind. Overnight stay in Ranthambore.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 5, 'Ranthambore to Udaipur: Chittorgarh Fort', 'Today after breakfast, drive 405 kilometers (7-8 hours) to Udaipur. Along the way, visit the magnificent Chittorgarh Fort, a sprawling hilltop fortress that tells tales of Rajput bravery. Arrive in Udaipur by evening, check into your hotel, and enjoy a relaxing night.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 6, 'Udaipur: Temples, Palaces, and Lake Pichola', 'After breakfast, explore Udaipur''s crown jewels. Begin at the intricately carved Jagdish Temple, then tour the grand City Palace overlooking Lake Pichola. Visit the charming Saheliyo ki Baari (Princess Garden) and enjoy an optional boat ride on Lake Pichola (at own cost). Overnight stay in Udaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 7, 'Udaipur to Jodhpur: Meherangarh Fort and Jaswant Thada', 'Today after breakfast, drive 260 kilometers (5-6 hours) to Jodhpur. Upon arrival, visit the imposing Meherangarh Fort, towering over the blue city. Explore its ornate palaces and museums, then proceed to Jaswant Thada, a beautiful marble cenotaph. Overnight stay in Jodhpur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 8, 'Jodhpur to Jaipur: Pushkar Pilgrimage', 'After breakfast, drive 350 kilometers (6-7 hours) to Jaipur. En route, stop at the holy town of Pushkar, home to the sacred Brahma Temple and a serene lake. Enjoy lunch here before continuing to Jaipur. Check into your hotel and spend the evening at leisure. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 9, 'Jaipur: Amber Fort, Hawa Mahal, and Royal Heritage', 'After breakfast, embark on a guided tour of Jaipur''s highlights. Visit the magnificent Amber Fort, perched on a hill; the Water Palace (Jal Mahal); the iconic Hawa Mahal (Palace of Winds); the City Palace complex; and the astronomical Jantar Mantar observatory. Also explore local block printing and Rajasthani handicrafts. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 10, 'Jaipur to Delhi: Departure with Memories', 'After breakfast, drive 260 kilometers (5-6 hours) back to Delhi. You are then transferred to Delhi Airport or railway station for your onward journey, carrying sweet memories of your royal Rajasthan and North India tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'jodhpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaisalmer'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 3 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 10n-11d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '10n-11d', 'Rajasthan Tour Packages for 11 Days Tour',
    10, 11, '10 Nights / 11 Days',
    1, FALSE,
    'https://images.pexels.com/photos/18881277/pexels-photo-18881277.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/31339268/pexels-photo-31339268.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36545457/pexels-photo-36545457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37350608/pexels-photo-37350608.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33797768/pexels-photo-33797768.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Delhi: Mughal Heritage & Colonial Landmarks', 'Upon arrival at Delhi airport, our representative assists you and transfers you to the hotel. After refreshments, embark on a guided tour visiting the magnificent Red Fort, the bustling Jama Masjid, the iconic India Gate, and the soaring Qutub Minar. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Delhi to Agra: Express Drive & Sunset Taj Mahal', 'After breakfast, proceed to Agra (230 km, 3-4 hrs). Upon arrival, enjoy a guided tour of the breathtaking Taj Mahal, the majestic Agra Fort, and marvel at the intricate marble handicrafts. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Agra to Jaipur: En Route Fatehpur Sikri', 'After breakfast, drive to Jaipur (260 km, 6 hrs), stopping en route to explore the deserted Mughal city of Fatehpur Sikri with its stunning Buland Darwaza and Jama Masjid. Continue to Jaipur for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Jaipur: The Pink City’s Forts & Palaces', 'After breakfast, enjoy a guided tour visiting the majestic Amber Fort, the serene Water Palace, the iconic Hawa Mahal (Palace of Winds), the grand City Palace, and the astronomical Jantar Mantar. Also explore famous Rajasthani handicrafts. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Jaipur to Udaipur: Via Chittorgarh Fort', 'After breakfast, drive to Udaipur (400 km, 7-8 hrs). En route, visit the imposing Chittorgarh Fort, a UNESCO World Heritage site symbolizing Rajput valor. Continue to Udaipur for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 6, 'Udaipur: City of Lakes & Palace Splendor', 'After breakfast, a guided tour takes you to the opulent City Palace, the intricately carved Jagdish Temple, the beautiful Sahelion-ki-Bari (Princess Garden), and enjoy a boat ride on the serene Lake Pichola. Overnight stay at hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 7, 'Udaipur to Jodhpur: Ranakpur Jain Temple', 'After breakfast, proceed to Jodhpur (250 km, 6-7 hrs). En route, visit the stunning Ranakpur Jain Temple, renowned for its exquisite marble architecture. Continue to Jodhpur for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 8, 'Jodhpur to Jaisalmer: Fort & Desert Drive', 'After breakfast, check out and visit the imposing Jodhpur Fort (Mehrangarh) and the elegant Jaswant Thada. Then drive to Jaisalmer (285 km, 5-6 hrs). Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 9, 'Jaisalmer: Golden Fort, Havelis & Desert Camp', 'After breakfast, explore the magnificent Jaisalmer Fort, the intricate Jain Temples, and the ornate Patwon-ki-Haveli. After lunch, proceed to a desert resort for a thrilling camel ride and traditional Rajasthani folk dance performance. Overnight at desert resort.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 10, 'Jaisalmer to Bikaner: Junagarh Fort', 'After breakfast, check out and proceed to Bikaner (325 km, 6-7 hrs). Upon arrival, visit the impressive Junagarh Fort. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 11, 'Bikaner to Delhi: En Route Painted Havelis & Departure', 'After breakfast, check out and drive to Delhi (440 km, 8-9 hrs). En route, visit the old painted havelis in Mandawa or similar villages. You will be dropped at Delhi airport or railway station with sweet memories.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'jodhpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaisalmer'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 3 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 9n-10d-khajuraho-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '9n-10d-khajuraho-varanasi', 'Rajasthan Tour with Khajuraho & Varanasi for 10 Days',
    9, 10, '9 Nights / 10 Days',
    2, FALSE,
    'https://images.pexels.com/photos/18881277/pexels-photo-18881277.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/31339268/pexels-photo-31339268.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36545457/pexels-photo-36545457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37350608/pexels-photo-37350608.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33797768/pexels-photo-33797768.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Delhi: Mughal Heritage & Modern Landmarks', 'Upon arrival at Delhi Airport, our company representative assists you and transfers you to the hotel. After refreshments, proceed for a guided tour visiting the Red Fort, a UNESCO World Heritage site and symbol of Mughal power. Explore Jama Masjid, India''s largest mosque, and drive past India Gate, the President''s House, and the lotus-shaped Baháʼí House of Worship (Lotus Temple). Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Delhi to Jaipur: Journey to the Pink City', 'After breakfast, depart for Jaipur, the Pink City famed for its royal palaces and vibrant bazaars. The drive of about 260 km takes approximately 6 hours. Upon arrival, check into the hotel and enjoy the rest of the day at leisure. You can explore the local markets or simply relax in the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Jaipur: Amber Fort & City Palace Exploration', 'After breakfast, a guided tour takes you to the magnificent Amber Fort, perched on a hilltop, where you can either climb or enjoy an elephant ride. Visit the serene Jal Mahal (Water Palace) floating in Man Sagar Lake, then the iconic Hawa Mahal (Palace of Winds) with its honeycomb façade. Continue to the City Palace complex and Jantar Mantar, an astronomical observatory. The rest of the day is at leisure for shopping or rest.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Jaipur to Agra via Fatehpur Sikri', 'After breakfast, drive towards Agra, stopping en route at Fatehpur Sikri, the abandoned Mughal capital and UNESCO World Heritage site. Explore its well-preserved palaces, courtyards, and the Buland Darwaza. Continue to Agra, check into the hotel, and enjoy the evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Agra: Taj Mahal & Agra Fort at Dawn', 'Early morning guided tour to the Taj Mahal, a breathtaking marble mausoleum and one of the Seven Wonders of the World, best seen at sunrise. Afterwards, return to the hotel for breakfast. Later, explore the massive Agra Fort, another UNESCO site filled with palaces and mosques. The rest of the day is free for personal exploration or optional visits to local crafts and marble inlay workshops.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Agra to Khajuraho via Orchha: Temple Town Detour', 'After breakfast, depart for Khajuraho, a journey of about 410 km (6-7 hours). En route, stop at Orchha, a historic town known for its stunning temples and cenotaphs. Visit the Chaturbhuj Temple and the Jahangir Mahal. Continue to Khajuraho, check into the hotel, and enjoy the evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 7, 'Khajuraho: Western & Jain Temples Tour', 'After breakfast, proceed for sightseeing of the Khajuraho temples, famous for their intricate erotic sculptures and architectural brilliance. Explore the Western group of temples, including the Kandariya Mahadev Temple, and the Jain temples within the same complex. The rest of the day is at leisure to explore the local village or relax.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 8, 'Khajuraho to Varanasi: Sacred City Bound', 'After breakfast, drive to Varanasi, the spiritual capital of India, covering about 400 km (8-9 hours). Upon arrival, check into the hotel. The evening is free for a leisurely walk along the ghats or to witness the Ganga Aarti at Dashashwamedh Ghat (optional). Overnight in Varanasi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 9, 'Varanasi: Ganges Boat Ride & Temple Circuit', 'Wake up early for a memorable boat ride on the holy River Ganges to see the bathing ghats and the Manikarnika cremation site, followed by a return to the hotel for breakfast. After breakfast, a guided tour covers the Kashi Vishwanath Temple (one of the twelve Jyotirlingas), Bharat Mata Temple, and a visit to Sarnath, where Buddha gave his first sermon. The rest of the day is at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 10, 'Varanasi: Departure from the Holy City', 'After breakfast at the hotel, you are transferred to Varanasi Airport or Railway Station to board your flight or train for your onward journey. End of tour services.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'jodhpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaisalmer'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 3 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 4 FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 5 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  -- Variant: 11n-12d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '11n-12d', 'Rajasthan Tour Packages for 12 Days',
    11, 12, '11 Nights / 12 Days',
    3, FALSE,
    'https://images.pexels.com/photos/18881277/pexels-photo-18881277.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/31339268/pexels-photo-31339268.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36545457/pexels-photo-36545457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37350608/pexels-photo-37350608.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33797768/pexels-photo-33797768.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Delhi: Arrival and Welcome', 'Upon arrival at Delhi Airport, our company representative assists you and transfers you to the hotel. The rest of the day is at leisure to relax or explore the surroundings. Overnight stay at the hotel in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Delhi: Mughal Heritage & Old Delhi Sightseeing', 'After breakfast, you embark on a guided tour of Delhi. Visit the grand Jama Masjid, the largest mosque in India, and the majestic Red Fort, a UNESCO World Heritage site. Drive past India Gate and the President''s House, then explore the stunning Humayun''s Tomb, Lotus Temple, and the towering Qutub Minar. Overnight at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Delhi to Agra: Express Drive & Sunset Taj Mahal', 'After breakfast, drive to Agra (approx. 3 hours). Upon arrival, visit the iconic Taj Mahal, a masterpiece of Mughal architecture and one of the Seven Wonders of the World. Also explore the imposing Agra Fort, another UNESCO site. Overnight stay at the hotel in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Agra to Jaipur: En Route Fatehpur Sikri', 'After breakfast, proceed to Jaipur (approx. 6 hours). En route, stop at Fatehpur Sikri, the abandoned Mughal city, and explore its stunning red sandstone monuments including the Buland Darwaza. Continue to Jaipur and check into your hotel. Overnight in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Jaipur: Amber Fort, City Palace & Handicrafts', 'After breakfast, enjoy a guided tour of Jaipur. Visit the Amber Fort, an ancient capital with magnificent palaces, and the Water Palace. See the iconic Hawa Mahal (Palace of Winds), the City Palace, and the Jantar Mantar observatory. Also witness traditional block printing and Rajasthani handicrafts. Overnight in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Jaipur to Udaipur: Chittorgarh Fort Stopover', 'After breakfast, drive to Udaipur (approx. 6-7 hours). On the way, visit the formidable Chittorgarh Fort, a symbol of Rajput valor and a UNESCO World Heritage site. Arrive in Udaipur and check into your hotel. Overnight in Udaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 7, 'Udaipur: City Palace, Temple & Lake Pichola', 'After breakfast, visit the Jagdish Temple, a beautiful Hindu temple, and the magnificent City Palace overlooking Lake Pichola. Explore Saheliyon-ki-Bari (the Princess Garden). Enjoy a boat ride on Lake Pichola (own cost) for stunning views of the lake palaces. Overnight in Udaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 8, 'Udaipur to Jodhpur: Ranakpur Jain Temple', 'After breakfast, drive to Jodhpur (approx. 5-6 hours). En route, visit the famous Ranakpur Jain Temple, renowned for its intricate marble carvings and 1,444 pillars. Continue to Jodhpur and check into your hotel. Overnight in Jodhpur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 9, 'Jodhpur to Jaisalmer: Forts & Blue City', 'After breakfast, explore Jodhpur''s magnificent Mehrangarh Fort, one of India''s largest forts, and the serene Jaswant Thada cenotaph. Then proceed to Jaisalmer (approx. 5-6 hours). Arrive and check into your hotel. Overnight in Jaisalmer.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 10, 'Jaisalmer: Golden Fort, Havelis & Desert Safari', 'After breakfast, check out from the hotel and visit the golden Jaisalmer Fort, a living fort with bustling lanes. Explore the intricate Jain Temples within the fort and the ornate Patwon-ki-Haveli. After lunch, head to a desert resort at the sand dunes, where you enjoy a camel ride and traditional Rajasthani folk dance performance. Overnight at the desert resort.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 11, 'Jaisalmer to Bikaner: Junagarh Fort', 'After breakfast, drive to Bikaner (approx. 5-6 hours). Visit the impressive Bikaner Fort, also known as Junagarh Fort, a splendid sandstone structure. Check into your hotel and relax. Overnight in Bikaner.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 12, 'Bikaner to Delhi: Journey Ends', 'After breakfast, drive back to Delhi (approx. 8-9 hours). Upon arrival, you are transferred to the airport or railway station for your onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'jodhpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaisalmer'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 3 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 13n-14d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '13n-14d', 'Rajasthan Tour Packages for 14 Days',
    13, 14, '13 Nights / 14 Days',
    4, FALSE,
    'https://images.pexels.com/photos/18881277/pexels-photo-18881277.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/31339268/pexels-photo-31339268.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36545457/pexels-photo-36545457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37350608/pexels-photo-37350608.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33797768/pexels-photo-33797768.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Delhi: Arrival and Welcome', 'Upon arrival at Indira Gandhi International Airport, our company representative greets you and assists with your transfer to the hotel. After checking in, the rest of the day is at your leisure to relax or explore the local area. Overnight stay at the hotel in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Delhi: Mughal Heritage & Old Delhi Sightseeing', 'After breakfast, we embark on a full-day tour of Delhi''s iconic landmarks. We visit the majestic Jama Masjid, India''s largest mosque, and the historic Red Fort. Drive past India Gate and the President''s House, then explore the Humayun''s Tomb, Lotus Temple, and the Qutub Minar complex. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Delhi to Agra: Express Drive & Taj Mahal Visit', 'After breakfast, we drive approximately 240 kilometers to Agra, the city of the Taj Mahal. Upon arrival, we visit the magnificent Taj Mahal, a UNESCO World Heritage site and one of the Seven Wonders of the World. Later, we explore the imposing Agra Fort, another UNESCO site. Overnight stay at the hotel in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Agra to Jaipur: En Route Fatehpur Sikri', 'Today after breakfast, we drive to Jaipur, the Pink City. En route, we stop at Fatehpur Sikri, the abandoned Mughal capital, and explore its stunning architecture including the Buland Darwaza and Panch Mahal. Continue to Jaipur and check into the hotel. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Jaipur: Amber Fort & Pink City Heritage', 'After breakfast, we begin our guided tour of Jaipur. First, we visit the magnificent Amber Fort, an ancient capital perched on a hill. Then we see the Water Palace (Jal Mahal) from a distance, followed by the iconic Hawa Mahal (Palace of Winds). Later, we explore the City Palace and the Jantar Mantar observatory. The tour includes a visit to a local workshop showcasing block printing and Rajasthani handicrafts. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Jaipur to Pushkar: Spiritual Retreat by the Lake', 'After breakfast, we drive to Pushkar, a sacred town known for its holy lake. Upon arrival, check in to the hotel and after refreshments, we visit the Brahma Temple, one of the few temples dedicated to Lord Brahma in the world. We then walk to Pushkar Lake and witness the evening aarti (prayer ceremony) at sunset. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 7, 'Pushkar to Udaipur: Chittorgarh Fort En Route', 'After breakfast, we drive towards Udaipur, the City of Lakes. En route, we stop at Chittorgarh Fort, a UNESCO World Heritage site and the largest fort in India. Explore its palaces, towers, and temples that narrate tales of Rajput valor. Continue to Udaipur, check into the hotel, and relax. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 8, 'Udaipur: City Palace, Lake Pichola & Gardens', 'After breakfast, we explore Udaipur''s highlights. We visit the Jagdish Temple, a large Hindu temple, and then the grand City Palace overlooking Lake Pichola. We also see Saheliyon-ki-Bari (the princess garden) with its fountains and kiosks. Later, enjoy an optional boat ride on Lake Pichola (at own cost). Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 9, 'Udaipur to Jodhpur: Ranakpur Jain Temple Detour', 'After breakfast, we drive to Jodhpur. En route, we visit the Ranakpur Jain Temple, an exquisite marble temple dedicated to Tirthankara Adinath. The intricate carvings and 1,444 pillars are a marvel of architecture. Continue to Jodhpur, check into the hotel, and relax. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 10, 'Jodhpur to Jaisalmer: Mehrangarh Fort & Jaswant Thada', 'After breakfast, we visit the formidable Mehrangarh Fort, one of India''s largest forts, and the beautiful Jaswant Thada cenotaph. After the tour, we drive to Jaisalmer, the Golden City. Upon arrival, check into the hotel and spend the evening at leisure. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 11, 'Jaisalmer: Fort, Havelis & Desert Safari', 'After breakfast, we explore Jaisalmer Fort, a living fort with palaces and temples. Inside, we visit the Jain Temples with intricate carvings. Then we see Patwon-ki-Haveli, a cluster of five havelis with stunning architecture. After lunch, we proceed to a desert resort for a camel ride and traditional Rajasthani folk dance performance under the stars. Overnight stay at the desert resort.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 12, 'Jaisalmer to Bikaner: Junagarh Fort Exploration', 'After breakfast, we drive to Bikaner, known for its desert fortresses. Upon arrival, we visit the Junagarh Fort (also called Bikaner Fort), a well-preserved fort with palaces and museums. Check into the hotel and relax. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 13, 'Bikaner to Mandawa: Painted Havelis Walk', 'After breakfast, we drive to Mandawa, the open-air art gallery of Shekhawati. Check into the hotel and then explore the town''s painted havelis with intricate frescoes. We take a walking tour through the lanes to admire these historic mansions. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 14, 'Mandawa to Delhi: Departure Transfer', 'After breakfast, we drive back to Delhi, approximately 250 kilometers. Upon arrival, we transfer you to the airport or railway station for your onward journey. The tour concludes with fond memories of Rajasthan''s rich heritage.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'jodhpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaisalmer'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 3 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 14n-15d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '14n-15d', 'Rajasthan Tour Packages for 15 Days',
    14, 15, '14 Nights / 15 Days',
    5, FALSE,
    'https://images.pexels.com/photos/18881277/pexels-photo-18881277.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/31339268/pexels-photo-31339268.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36545457/pexels-photo-36545457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37350608/pexels-photo-37350608.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33797768/pexels-photo-33797768.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_5;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_5;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 1, 'Delhi: Mughal Heritage & Old Delhi Sightseeing', 'Upon arrival at Delhi Airport, our representative escorts you to your hotel. After breakfast, embark on a guided tour of Old Delhi, visiting the majestic Red Fort and the grand Jama Masjid. Continue to New Delhi to see India Gate, the President''s House, and the Lotus Temple. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 2, 'Delhi to Agra: Express Drive & Sunset Taj Mahal', 'After breakfast, drive to Agra (230 km, 3 hours). Check into the hotel and refresh before visiting the iconic Taj Mahal and the formidable Agra Fort. Explore the intricate marble work and Mughal architecture. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 3, 'Agra: Taj Mahal Revisited & Marble Craftsmanship', 'After breakfast, revisit the Taj Mahal for a more intimate experience at dawn. Then visit a famous marble factory and handicraft emporium to witness skilled artisans creating inlay work. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 4, 'Agra to Jaipur: Fatehpur Sikri En Route', 'After breakfast, drive to Jaipur (260 km, 6 hours) with a stop at Fatehpur Sikri, the abandoned Mughal city. Explore its stunning palaces and courtyards. Continue to Jaipur and check into the hotel. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 5, 'Jaipur: Amber Fort & Pink City Splendors', 'After breakfast, visit the magnificent Amber Fort, perched on a hill. Then see the Water Palace, the iconic Hawa Mahal (Palace of Winds), and the City Palace. Explore the Jantar Mantar observatory and then browse famous Rajasthani handicrafts. Overnight at hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 6, 'Jaipur to Pushkar: Sacred Lake & Brahma Temple', 'After breakfast, drive to Pushkar (150 km, 3 hours). Check into the hotel and then visit the Brahma Temple, one of the few dedicated to Lord Brahma. Stroll around Pushkar Lake and the fairground. Enjoy a walking tour of the holy town. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 7, 'Pushkar to Udaipur: Chittorgarh Fort En Route', 'After breakfast, drive to Udaipur (250 km, 6 hours). En route, visit the imposing Chittorgarh Fort, a UNESCO World Heritage site. Continue to Udaipur and check into the hotel. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 8, 'Udaipur: City Palace & Lake Pichola Boat Ride', 'After breakfast, explore the grand City Palace overlooking Lake Pichola, visit the Jagdish Temple, and stroll through Sahelion ki Bari (Princess Garden). Enjoy a scenic boat ride on Lake Pichola, taking in the lake palaces. Overnight at hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 9, 'Udaipur to Jodhpur: Ranakpur Jain Temple Stop', 'After breakfast, drive to Jodhpur (250 km, 7 hours) with a stop at Ranakpur to visit the exquisite Jain Temple, renowned for its intricate marble carvings. Continue to Jodhpur and check into the hotel. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 10, 'Jodhpur: Mehrangarh Fort & Blue City Walk', 'After breakfast, visit the massive Mehrangarh Fort, then the Jaswant Thada memorial. Explore the old city on a walking tour through the blue-painted streets of Jodhpur. Overnight at hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 11, 'Jodhpur to Jaisalmer: Journey to the Golden City', 'After breakfast, check out and drive to Jaisalmer (285 km, 6 hours), known as the Golden City. Check into the hotel and relax. Evening at leisure. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 12, 'Jaisalmer: Sand Dunes, Fort & Desert Night', 'After breakfast, visit Jaisalmer Fort, Jain Temples within the fort, and Patwon-ki-Haveli. After lunch, head to the sand dunes at a desert resort. Enjoy a camel ride and traditional Rajasthani folk dance performance. Stay overnight at the desert resort.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 13, 'Jaisalmer to Bikaner: Junagarh Fort & Rat Temple', 'After breakfast, drive to Bikaner (325 km, 6 hours). Visit the imposing Junagarh Fort, then check into the hotel. Later, visit the famous Deshnok Temple, also known as the Rat Temple. Overnight at hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 14, 'Bikaner to Mandawa: Painted Havelis of Shekhawati', 'After breakfast, drive to Mandawa (200 km, 3 hours). En route, explore old painted havelis. Check into the hotel and in the evening, take a walking tour through the village to admire frescoed mansions. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 15, 'Mandawa to Delhi: Departure with Sweet Memories', 'After breakfast, drive to Delhi (280 km, 6-7 hours). En route, visit more old painted havelis. You will be dropped at Delhi airport or railway station with sweet memories of your Rajasthan journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 0 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 1 FROM "Destination" d WHERE d."slug" = 'jodhpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaisalmer'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 3 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'delhi';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'delhi-rajasthan-varanasi', 'Delhi Rajasthan Taj Mahal with Varanasi',
    'From the bustling streets of Old Delhi to the serene ghats of Varanasi, this tour weaves together India''s most iconic heritage sites. Witness the timeless beauty of the Taj Mahal at sunrise, explore the Amber Fort in Jaipur, and experience the spiritual Ganga Aarti in Varanasi. Our package offers a perfect blend of royal Rajasthan and sacred Varanasi, with comfortable heritage accommodations and expert guides. Choose from 10, 14, or 21-day itineraries for a truly immersive cultural journey.',
    ARRAY['Witness the Taj Mahal at sunrise from Mehtab Bagh, a UNESCO World Heritage Site.', 'Explore the Amber Fort in Jaipur on a jeep safari and admire its intricate mirror work.', 'Take a private boat ride on the Ganges in Varanasi and attend the evening Ganga Aarti ceremony.', 'Stroll through the chaotic yet charming Chandni Chowk market in Delhi on a rickshaw ride.', 'Visit the City Palace and Hawa Mahal in Jaipur, icons of Rajput architecture.'],
    ARRAY['Accommodation in 4-star or heritage hotels with breakfast.', 'Private air-conditioned vehicle for all transfers and sightseeing.', 'English-speaking local guides at each destination.', 'Entrance fees to monuments as per itinerary.', 'Boat ride on the Ganges in Varanasi.', 'All applicable taxes and service charges.', '24/7 customer support during the tour.'],
    ARRAY['International or domestic flights.', 'Visa fees and travel insurance.', 'Meals not mentioned in the itinerary.', 'Personal expenses like laundry, phone calls, and tips.', 'Camera fees at monuments (if any).'],
    ARRAY['Varanasi is a holy city; please dress modestly and respect local customs at the ghats.', 'Early morning starts are recommended for the Taj Mahal and Ganges boat ride to avoid crowds and heat.', 'Summer temperatures can be high; carry sunscreen, water, and a hat.'],
    'https://images.pexels.com/photos/14867272/pexels-photo-14867272.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/31553142/pexels-photo-31553142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/14374972/pexels-photo-14374972.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34770347/pexels-photo-34770347.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33658452/pexels-photo-33658452.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Heritage', 20, 12, 'Premium Hotels',
    'Explore India''s heritage from Delhi to Varanasi on a grand tour.', FALSE, FALSE, TRUE,
    ARRAY['grand-tour', 'heritage', 'culture', 'rajasthan', 'varanasi'], country_id, state_id,
    'Delhi Rajasthan Taj Mahal Varanasi Tour 2025 | Book Now', 'Explore Delhi, Jaipur, Agra & Varanasi with heritage tours. Options from 10 to 21 days. Book your grand North India tour with Mother India Tour Travels.', ARRAY['Delhi Rajasthan tour', 'Taj Mahal tour', 'Varanasi tour', 'Heritage tour India', 'Rajasthan tour package', 'Grand tour India', 'North India tour', 'Mother India Tour Travels'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'heritage-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'pilgrimage-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 20n-21d-khajuraho-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '20n-21d-khajuraho-varanasi', 'Rajasthan Tour with Agra & Khajuraho Varanasi Ex. Delhi For 21 Days',
    20, 21, '20 Nights / 21 Days',
    0, TRUE,
    'https://images.pexels.com/photos/14867272/pexels-photo-14867272.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/31553142/pexels-photo-31553142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/14374972/pexels-photo-14374972.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34770347/pexels-photo-34770347.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33658452/pexels-photo-33658452.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Delhi Arrival: Welcome to the Capital', 'Upon arrival at Delhi airport, our company representative warmly welcomes you and assists with your transfer to the hotel. The rest of the day is at leisure to rest or explore nearby areas, allowing you to acclimatize to the vibrant energy of India''s capital.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Delhi: Mughal Heritage & Modern Landmarks', 'After breakfast, embark on a guided tour of Delhi’s iconic landmarks. Visit the grand Jama Masjid, the historic Red Fort, and drive past the President''s House and Parliament. Later, explore the towering Qutub Minar, the serene Lotus Temple, and the magnificent Humayun''s Tomb. The evening is free for personal exploration or sampling local cuisine.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Delhi to Mandawa: Discovering Shekhawati''s Painted Havelis', 'Drive to Mandawa, the heart of the Shekhawati region known for its ornate havelis. Check into the hotel. In the evening, enjoy a guided walking tour through the old town, admiring frescoed mansions like the Goenka and Jhunjhunuwala Havelis. The rest of the evening is at leisure to soak in the rustic charm.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Mandawa to Bikaner: Forts & Rat Temple', 'After breakfast, drive to Bikaner and visit the imposing Junagarh Fort, a marvel of Rajput architecture. After check-in, proceed to the unique Deshnok Temple (Karni Mata Temple), famously home to thousands of sacred rats. The remainder of the day is free for relaxation or exploring local bazaars.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 5, 'Bikaner to Jaisalmer: Journey into the Golden City', 'Today, travel to Jaisalmer, the golden city of Rajasthan. The drive takes you through the Thar Desert landscape. Upon arrival, check into the hotel and spend the rest of the day at leisure, perhaps exploring the local markets for handicrafts and textiles.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 6, 'Jaisalmer: Golden Fort & Desert Safari', 'After breakfast, check out from the hotel and visit the magnificent Jaisalmer Fort, a living fort with bustling streets. Continue to Patwon ki Haveli, a cluster of five intricately carved havelis. After lunch, proceed to the Sam Sand Dunes for a camel ride and sunset experience. Enjoy Rajasthani folk dance and dinner at a desert camp. Overnight at the camp.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 7, 'Jaisalmer to Jodhpur: Blue City & Majestic Fort', 'Drive to Jodhpur, the Blue City. Upon arrival, visit the imposing Mehrangarh Fort, perched on a hill, and the elegant Jaswant Thada cenotaph. The rest of the day is at leisure to explore the blue lanes of Jodhpur and sample local sweets.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 8, 'Jodhpur to Ranakpur: Exquisite Jain Temple & Udaipur Transfer', 'After breakfast, drive to Ranakpur to visit the stunning Ranakpur Jain Temple, renowned for its 1,444 intricately carved marble pillars. After lunch, continue your journey to Udaipur, arriving by evening. The rest of the day is at leisure to soak in the city''s romantic ambiance.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 9, 'Ranakpur to Udaipur: Arrival in the City of Lakes', 'After breakfast, drive to Udaipur, the romantic city of lakes. Upon arrival, check into the hotel and enjoy the rest of the day at leisure. You might choose to walk along the banks of Lake Pichola or explore the local bazaars.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 10, 'Udaipur: Lakes, Palaces & Temple Splendors', 'After breakfast, explore Udaipur''s highlights with a guided tour. Visit the intricately carved Jagdish Temple, the grand City Palace overlooking Lake Pichola, and the charming Sahelion ki Badi (princess garden). Enjoy a relaxing boat ride on Lake Pichola, offering stunning views of the city and the Lake Palace. The evening is free for independent exploration.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 11, 'Udaipur to Pushkar: Journey to the Holy City', 'Today, drive to Pushkar, a sacred Hindu town. The scenic drive takes about six hours. Upon arrival, check into the hotel. The rest of the day is at leisure to walk around the holy lake and ghats, absorbing the spiritual atmosphere.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 12, 'Pushkar: Brahma Temple & Transfer to Jaipur', 'After breakfast, visit the unique Brahma Temple, one of the few dedicated to Lord Brahma. If the Pushkar Camel Fair season aligns, explore the camel fair grounds. Later, drive to Jaipur, the Pink City. Check into the hotel and enjoy the evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 13, 'Jaipur: Pink City''s Majestic Forts & Palaces', 'After breakfast, embark on a guided tour of Jaipur. Visit the magnificent Amber Fort, with its fusion of Rajput and Mughal architecture. See the iconic Hawa Mahal (Palace of Winds), the City Palace, and the Jantar Mantar astronomical observatory. Also witness traditional block printing and gemstone cutting workshops that have thrived for centuries. The evening is free for shopping or relaxation.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 14, 'Jaipur to Agra: Fatehpur Sikri & Mughal Splendors', 'Drive from Jaipur to Agra, en route visiting the abandoned Mughal city of Fatehpur Sikri. Explore its well-preserved palaces, courtyards, and the Buland Darwaza. Continue to Agra and check into the hotel. The rest of the evening is at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 15, 'Agra: Taj Mahal & Agra Fort – Mughal Masterpieces', 'A guided tour today begins with the breathtaking Taj Mahal at sunrise, a UNESCO World Heritage site and monument of love. Later, visit the imposing Agra Fort, also a UNESCO site, with its stunning palaces and halls. Witness the exquisite marble inlay work that has been practiced locally for centuries. The remainder of the day is free for leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 16, 'Agra to Orchha: Bundela Dynasty''s Forgotten Capital', 'After breakfast, drive to Orchha, a historic town on the Betwa River. Visit the Orchha Fort complex, including the Jehangir Mahal and the Ram Raja Temple. Enjoy a guided walking tour through the old city, admiring the well-preserved cenotaphs and palaces. Overnight in Orchha.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 17, 'Orchha to Khajuraho: Journey to the Temples of Love', 'Drive to Khajuraho, famous for its medieval temples with erotic sculptures. The short drive takes about four hours. Upon arrival, check into the hotel and spend the rest of the day at leisure, perhaps exploring the local village or beginning your temple exploration independently.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 18, 'Khajuraho: Intricate Temple Architecture & Sculptures', 'After breakfast, explore the world-renowned Khajuraho temples. Visit the Western Group of Temples, including the Kandariya Mahadev and Lakshmana temples, known for their exquisite erotic carvings and architectural brilliance. Also, visit the Jain temples to see beautiful Jain iconography. The rest of the afternoon is free for further exploration or relaxation.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 19, 'Khajuraho to Varanasi: Road to the Spiritual Capital', 'Today, undertake a long drive to Varanasi, one of the world''s oldest living cities. The journey takes about nine hours. Upon arrival, check into the hotel. The evening is at leisure to rest or take a preliminary stroll near the Ganges.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 20, 'Varanasi: Ganga Aarti & Buddhist Pilgrimage', 'Experience the spiritual essence of Varanasi with an early morning boat ride on the Ganges, witnessing the famous bathing ghats and morning rituals. After breakfast, visit the sacred Kashi Vishwanath Temple, the popular Sankat Mochan Temple, and the renowned Banaras Hindu University (BHU). Later, proceed to Sarnath, where Lord Buddha gave his first sermon. The evening is free for exploring the ghats and markets.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 21, 'Varanasi Departure: Farewell to India', 'After breakfast, you will be transferred to Varanasi airport or railway station for your onward journey, marking the end of this grand tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 4 FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT DO NOTHING;

  -- Variant: 10n-11d-khajuraho-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '10n-11d-khajuraho-varanasi', 'Delhi Jaipur Agra Khajuraho Varanasi Tour For 10Night/11Days',
    10, 11, '10 Nights / 11 Days',
    1, FALSE,
    'https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34201914/pexels-photo-34201914.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Delhi: Arrival and Transfer to Hotel', 'Upon arrival at Delhi Airport, our company representative assists you and transfers you to the hotel. After check-in, you have the evening to relax or explore nearby local markets. Enjoy an overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Delhi: Mughal Heritage & Old Delhi Sightseeing', 'After breakfast, embark on a guided tour of Delhi. Visit the grand Jama Masjid, the Red Fort, India Gate, President''s House, and Parliament House. Continue to Qutub Minar, the Lotus Temple, and Humayun’s Tomb. Return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Delhi to Jaipur: Scenic Drive to the Pink City', 'After breakfast, drive from Delhi to Jaipur (260 km, approx. 6 hours). Enjoy lunch en route. Upon arrival, check into your hotel and relax. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Jaipur: Amber Fort & City Palace Exploration', 'After breakfast, visit the magnificent Amber Fort with its elephant rides, the Water Palace (Jal Mahal), the Hawa Mahal (Palace of Winds), and the City Palace complex. Explore Jantar Mantar, the ancient observatory, and see traditional block printing and stone cutting workshops. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Jaipur to Agra via Fatehpur Sikri', 'Today after breakfast, drive from Jaipur to Agra (260 km, approx. 6 hours). En route, visit the abandoned Mughal city of Fatehpur Sikri, including the Buland Darwaza and Jama Masjid. Continue to Agra and check into the hotel. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 6, 'Agra: Taj Mahal at Sunrise & Agra Fort', 'Early morning, visit the Taj Mahal at sunrise – a breathtaking experience. After breakfast, explore the imposing Agra Fort, a UNESCO World Heritage site. Visit a local workshop to see fine marble inlay work, a craft still practiced today. Overnight stay in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 7, 'Agra to Khajuraho: Long Drive Through Bundelkhand', 'After breakfast, drive from Agra to Khajuraho (400 km, approx. 8 hours). The route passes through rural Bundelkhand. Check into your hotel upon arrival. Evening at leisure. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 8, 'Khajuraho: Western & Jain Temples Exploration', 'After breakfast, visit the famous Western Group of Temples, known for their intricate erotic sculptures. Also, explore the Jain Temples with their delicate carvings. Enjoy a walk through the city centre. Overnight stay in Khajuraho.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 9, 'Khajuraho to Varanasi: Journey to the Spiritual Capital', 'Today after breakfast, drive from Khajuraho to Varanasi (400 km, approx. 9 hours). Upon arrival, check into your hotel. Evening free to explore the ghats or rest. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 10, 'Varanasi: Ganga Aarti Boat Ride & Sarnath', 'Early morning, enjoy a boat ride on the holy Ganges to witness the bathing ghats and sunrise. After breakfast, visit the Kashi Vishwanath Temple, Sankat Mochan Temple, BHU, and Sarnath, where Buddha gave his first sermon. Overnight stay in Varanasi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 11, 'Varanasi: Departure Transfer to Airport/Railway Station', 'After breakfast, you will be transferred to Varanasi Airport or Railway Station for your onward journey. Tour ends with beautiful memories.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 4 FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT DO NOTHING;

  -- Variant: 9n-10d-khajuraho-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '9n-10d-khajuraho-varanasi', 'Golden Triangle Tour with Khajuraho Varanasi 10 Days',
    9, 10, '9 Nights / 10 Days',
    2, FALSE,
    'https://images.pexels.com/photos/14867272/pexels-photo-14867272.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/31553142/pexels-photo-31553142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/14374972/pexels-photo-14374972.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34770347/pexels-photo-34770347.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33658452/pexels-photo-33658452.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Delhi: Arrival and Welcome', 'Upon arrival at Delhi Airport, a company representative assists you with baggage and transfers you to your hotel. The rest of the day is at leisure to recover from your journey. Check into your hotel and enjoy the evening exploring nearby markets or simply relaxing. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Delhi: Mughal Monuments and Landmarks Tour', 'After breakfast, embark on a guided tour of Delhi''s iconic landmarks. Visit the majestic Red Fort and Jama Masjid, India''s largest mosque. Drive past the India Gate, President House, and Parliament. Then explore the soaring Qutub Minar, the serene Lotus Temple, and the elegant Humayun''s Tomb. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Delhi to Jaipur: Drive through Rajasthan', 'After breakfast, check out and drive to Jaipur, approximately 260 kilometers via the expressway. The journey offers glimpses of rural Rajasthan. Enjoy lunch en route at a recommended restaurant. Arrive in Jaipur by evening and check into your hotel. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Jaipur: Amber Fort and Pink City Exploration', 'After breakfast, visit the magnificent Amber Fort, where you can opt for an elephant ride to the entrance. See the Water Palace (Jal Mahal) from the roadside, then explore the Hawa Mahal (Palace of Winds). Continue to the City Palace and Jantar Mantar observatory. End the day at a local block printing and stone cutting factory showcasing centuries-old crafts. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Jaipur to Agra via Fatehpur Sikri: Mughal Marvels', 'After breakfast, drive to Agra, stopping en route at the abandoned Mughal city of Fatehpur Sikri. Explore its stunning red sandstone courtyards, palaces, and the Buland Darwaza. Continue to Agra, arriving by evening. Check into your hotel and relax. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Agra: Taj Mahal at Sunrise and Journey to Khajuraho via Orchha', 'Early morning, take a guided tour of the Taj Mahal at sunrise for breathtaking views. Return to the hotel for breakfast. Later, visit a local marble inlay workshop to see artisans continuing the Taj''s intricate craft. Then drive to Khajuraho (approx. 400 km), stopping at the historic town of Orchha to see its beautiful cenotaphs and palaces. Arrive in Khajuraho and check into your hotel. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 7, 'Khajuraho: Erotic Temples and Chandela Art', 'After breakfast, explore the famous Western group of temples, UNESCO-listed for their intricate erotic sculptures. Visit the Jain temples and take a leisurely walk through the city center, absorbing the spiritual and artistic atmosphere. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 8, 'Khajuraho to Varanasi: Journey to the Holy City', 'After breakfast, drive to Varanasi (approx. 400 km). The journey takes you through the heart of Uttar Pradesh. Arrive in the holy city by evening and check into your hotel. The evening is free to explore the ghats or rest. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 9, 'Varanasi: Ganges Boat Ride and Sacred Sites', 'Before dawn, take a boat ride on the holy river Ganges to witness the famous bathing ghats and the morning aarti. After breakfast, visit the Kashi Vishwanath Temple, Sankat Mochan Temple, and BHU campus. Proceed to Sarnath, where Buddha gave his first sermon. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 10, 'Varanasi: Departure', 'After breakfast, you are transferred to Varanasi Airport or Railway Station for your onward journey. Your enriching 10-day tour concludes with memories of India''s heritage and spirituality.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 4 FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'jammu-kashmir';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'kashmir-tours', 'Kashmir Tour Packages',
    'Kashmir, often called ''Paradise on Earth,'' offers a breathtaking blend of snow-capped peaks, lush valleys, and pristine lakes. This adventure package takes you beyond the usual tourist trail, with opportunities for trekking in Pahalgam, skiing in Gulmarg, and a shikara ride on Dal Lake. Experience the thrill of the Gulmarg Gondola, one of the highest cable cars in the world. Mother India Tour Travels ensures seamless logistics, expert local guides, and handpicked accommodations including a stay on a traditional houseboat.',
    ARRAY['Shikara ride on Dal Lake at sunset, passing Mughal gardens and floating markets', 'Gondola ride in Gulmarg to Apharwat Peak (13,780 ft) for panoramic Himalayan views', 'Trek through Betaab Valley and Aru Valley in Pahalgam, surrounded by pine forests and glacial streams', 'Visit the 400-year-old Shankaracharya Temple atop a hill for a 360° view of Srinagar', 'Overnight stay on a deluxe houseboat on Nigeen Lake, complete with walnut wood carvings and Kashmiri cuisine'],
    ARRAY['Standard hotel/houseboat accommodation with breakfast and dinner', 'All transfers and sightseeing by private air-conditioned vehicle', 'English-speaking local guide for all excursions', 'Shikara ride on Dal Lake (up to 1 hour)', 'Gulmarg Gondola ticket (Stage 1 or Stage 2 as per itinerary)', 'Pony ride in Pahalgam to Baisaran Meadow', 'All applicable taxes and service charges'],
    ARRAY['Airfare or train fare to and from Srinagar', 'Lunch (unless specified) and personal expenses', 'Camera fees at monuments and parks', 'Gratuities and tips for guides and drivers', 'Travel insurance and medical expenses'],
    ARRAY['Domestic flights to Srinagar are available from Delhi, Mumbai, and Jammu; the airport is secure and well-connected.', 'Best time for adventure activities is April to October for trekking, December to March for skiing.', 'Please carry valid photo ID for all hotel and houseboat check-ins; permits may be required for certain trekking routes.'],
    'https://images.pexels.com/photos/5776631/pexels-photo-5776631.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11866095/pexels-photo-11866095.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/25786565/pexels-photo-25786565.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/6730641/pexels-photo-6730641.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Adventure', 20, 12, 'Premium Hotels',
    'Adventure in Kashmir: ski, trek, and sail on Dal Lake.', TRUE, TRUE, TRUE,
    ARRAY['kashmir', 'houseboat', 'mountains', 'valleys', 'paradise'], country_id, state_id,
    'Kashmir Adventure Packages 2025 | Starting ₹12,999', 'Discover Kashmir with adventure tours: skiing in Gulmarg, trekking in Pahalgam, shikara rides on Dal Lake. 3-7 day packages with houseboat stays. Book now!', ARRAY['Kashmir tour packages', 'Kashmir adventure tours', 'Gulmarg skiing package', 'Pahalgam trekking tours', 'houseboat stay Srinagar', 'Dal Lake shikara', 'Kashmir travel 2025', 'Mother India Tour Travels'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'hill-station-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'adventure-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d-vaishno-devi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d-vaishno-devi', '02 Nights/03 Days Mata Vaishno Devi Yatra',
    2, 3, '2 Nights / 3 Days',
    0, TRUE,
    'https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/12750077/pexels-photo-12750077.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29264394/pexels-photo-29264394.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11522584/pexels-photo-11522584.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/7743323/pexels-photo-7743323.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Jammu to Katra: Arrival and Sacred Drive', 'Your pilgrimage begins with a warm welcome at Jammu Railway Station or Airport by our representative. We then drive the scenic 50 kilometers to Katra, the base camp for the Vaishno Devi yatra, taking approximately 2 hours. Upon arrival in Katra, check into your hotel and unwind. The evening is at leisure before enjoying a delicious dinner and an overnight stay, preparing for the trek ahead.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Katra: Trek to Mata Vaishno Devi Shrine', 'After an early breakfast, start your 15-kilometer trek or choose a horse ride to the holy cave of Mata Vaishno Devi. The path winds through picturesque hills, with stops at Adhkuwari and other landmarks. Upon reaching the sanctum sanctorum at 5,200 feet, you experience the divine darshan of the three pindies representing the goddess. After offering prayers, descend back to Katra, where dinner and overnight stay at the hotel await.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Katra to Jammu: Departure with Blessings', 'Enjoy a final breakfast at the hotel in Katra before checking out. We then drive back to Jammu Railway Station or Airport (50 km, 2 hours) for your onward journey. The tour concludes with sweet memories and the blessings of Mata Vaishno Devi, leaving you spiritually rejuvenated.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'srinagar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'gulmarg'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'pahalgam'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 3 FROM "Destination" d WHERE d."slug" = 'vaishno-devi'
  ON CONFLICT DO NOTHING;

  -- Variant: 3n-4d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '3n-4d', '03 Nights/04 Days - Srinagar - Pahalgam - Gulmarg',
    3, 4, '3 Nights / 4 Days',
    1, FALSE,
    'https://images.pexels.com/photos/12750077/pexels-photo-12750077.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29264394/pexels-photo-29264394.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11522584/pexels-photo-11522584.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/7743323/pexels-photo-7743323.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Srinagar: Mughal Gardens & Lake City Exploration', 'Your journey begins upon arrival at Srinagar Airport. You are welcomed and transferred to your hotel. Later, you proceed for a city tour visiting the ancient Shankaracharya Temple perched atop the highest hill, offering panoramic views of Dal Lake. Next, you explore the magnificent Mughal Gardens — Chashmashahi, Nishat Bagh, and Shalimar Bagh — each a terraced paradise with cascading fountains. You also visit the revered Hazratbal Dargah on the shores of Dal Lake. Overnight stay at your hotel in Srinagar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Srinagar to Pahalgam: Valley of Shepherds & Scenic Excursion', 'After breakfast, you drive to Pahalgam, the ''Valley of Shepherds'', located 96 km from Srinagar. En route, you stop at the saffron fields of Pampore, the 1100-year-old Awantipura ruins dedicated to Lord Vishnu, and the sacred Mattan Temple. Upon arrival in Pahalgam, you have the option to enjoy a pony ride through pine forests and visit the lush meadows of Baisaran, known as Mini-Switzerland. You can also explore picturesque spots like Aru, Betaab Valley, and Chandanwari at your own cost. In the evening, you return to Srinagar for dinner and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Srinagar to Gulmarg: Meadow of Flowers & Gondola Ride', 'After breakfast, you check out from the hotel and drive to Gulmarg, the ''Meadow of Flowers'', situated at 2,440 meters above sea level. This hill station boasts the world''s highest golf course and is famous for winter sports. Upon arrival, you visit the Jai Jai Shiv Shankar Temple and then have the opportunity to experience the thrilling Gondola ride (cable car) from Gulmarg to Kongdori and further to Apharwat Peak, at your own cost. In the evening, you return to Srinagar for dinner and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Srinagar: Departure with Fond Memories', 'After a final breakfast in Srinagar, you are transferred to Srinagar Airport for your departure, carrying with you the serene beauty of Kashmir''s valleys, gardens, and snow-capped peaks. Your tour concludes with cherished memories of the Himalayan paradise.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'srinagar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'gulmarg'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'pahalgam'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d', '04 Night/05 Days Paradise Kashmir Tour',
    4, 5, '4 Nights / 5 Days',
    2, FALSE,
    'https://images.pexels.com/photos/29264394/pexels-photo-29264394.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12750077/pexels-photo-12750077.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11522584/pexels-photo-11522584.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/7743323/pexels-photo-7743323.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Srinagar: Lake City & Mughal Gardens Exploration', 'Arrive at Srinagar Airport and transfer to your hotel. Begin your Kashmir journey with a city tour visiting the Shankaracharya Temple atop a hill, offering panoramic views of the valley. Explore the magnificent Mughal Gardens: Chashmashahi, Nishat Bagh, and Shalimar Bagh, laid out by Emperor Jahangir. Also pay a visit to the Hazratbal Dargah on the shores of Dal Lake. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Srinagar to Sonamarg: Meadow of Gold Excursion', 'Drive to Sonamarg, the ''Meadow of Gold,'' situated at 2,743 meters above sea level. The journey takes you through scenic landscapes along the Sindh River, popular for trout fishing. Upon arrival, opt for a pony ride (at your own cost) to the Thajiwas Glacier for snow fun and ice activities. Return to Srinagar in the evening for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Srinagar to Pahalgam: Valley of Shepherds & Pine Forests', 'After breakfast, drive 96 km to Pahalgam, the ''Valley of Shepherds,'' passing through saffron fields in Pampore and the ancient Awantipura Ruins—a 1,100-year-old Vishnu temple. En route, stop at Mattan Temple. Upon arrival in Pahalgam, enjoy the Lidder River. You can hire a local car (own cost) to visit Aru, Betaab Valley, and Chandanwari, or go for pony rides to Baisaran and Snow Valley. Return to Srinagar for the night.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Srinagar to Gulmarg: Meadows of Flowers & Gondola Ride', 'Drive to Gulmarg, the ''Meadow of Flowers,'' at 2,440 meters. Visit the Jai Jai Shiv Shankar Temple and enjoy a Gondola ride (cable car, own cost) from Gulmarg to Kongdori and Affarwat, offering stunning views of the Himalayas. Gulmarg also boasts the world''s highest golf course and is famous for winter sports. Return to Srinagar for dinner and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Departure from Srinagar with Sweet Memories', 'After breakfast, transfer to Srinagar Airport for your flight home, carrying beautiful memories of Kashmir''s lush gardens, snow-capped peaks, and warm hospitality.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'srinagar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'gulmarg'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'pahalgam'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d', '05 Nights/06 Days Sweet Kashmir Tour',
    5, 6, '5 Nights / 6 Days',
    3, FALSE,
    'https://images.pexels.com/photos/11522584/pexels-photo-11522584.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12750077/pexels-photo-12750077.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29264394/pexels-photo-29264394.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/7743323/pexels-photo-7743323.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Srinagar: Arrival & Mughal Gardens Tour', 'Upon arrival at Srinagar Airport, you are transferred to your hotel. Begin your Kashmir exploration with a city tour visiting the Shankaracharya Temple, perched on a hilltop offering panoramic views of the Dal Lake. Proceed to the Mughal gardens: Chashme Shahi, Nishat Bagh, and Shalimar Bagh, each a masterpiece of terraced lawns, cascading fountains, and vibrant flowerbeds. Also visit the Hazratbal Dargah, the only domed mosque in Srinagar, situated on the banks of Dal Lake. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Srinagar: Day Excursion to Sonmarg', 'After breakfast, drive to Sonmarg, the ''Meadow of Gold'', located 84 km from Srinagar at an altitude of 2667 meters. Surrounded by snow-capped peaks, alpine flowers, and the gushing Sindh River, Sonmarg is a paradise for trekkers. Spend the full day exploring on your own: visit the Thajiwas Glacier via a pony ride or trek, or head to Zero Point/Zojila Pass (at own cost). Sonmarg also serves as the gateway to Leh, with many famous treks starting here. Return to Srinagar for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Srinagar to Gulmarg: The Meadow of Flowers', 'Early morning drive to Gulmarg, the ''Meadow of Flowers'', passing willow trees, fast-flowing streams, and lush green meadows. At an altitude of 2730 meters, Gulmarg offers stunning views of towering snow-capped peaks and dense forests of conifers, fir, and pine. Take a leisurely stroll through the flower-laden meadow or enjoy pony rides (at own cost). In winter, Gulmarg is famous for skiing; in summer, it''s a haven for golf and nature walks. Return to Srinagar for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Gulmarg to Pahalgam: Via Awantipura Ruins', 'Check out from the hotel and drive to Pahalgam, the ''Valley of Shepherds'', situated at the confluence of streams from Lidder River and Sheshnag Lake. En route, stop at Awantipura to see the 1100-year-old ruins of a temple dedicated to Lord Vishnu, built by King Awantivarman. Upon arrival in Pahalgam, enjoy the serene beauty, or take a short walk to Baisaran, a small village 2 km away set in pine and fir forests offering lovely views. Overnight stay at a hotel in Pahalgam.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Pahalgam to Srinagar: Relaxation & Shikara Ride', 'After breakfast, enjoy free time to absorb Pahalgam''s beauty. Stroll along the Lidder River surrounded by snow-capped mountains, or visit attractions like Aru Valley, Chandanwari, or Betaab Valley (at own cost). In the afternoon, check out and drive back to Srinagar. Check into your hotel or houseboat. Later, enjoy a shikara ride on Dal Lake (at own cost), gliding past floating gardens and colorful houseboats. Overnight stay in Srinagar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Srinagar: Departure with Happy Memories', 'After breakfast, you are transferred to Srinagar Airport for your onward flight, carrying with you the memories of Kashmir''s breathtaking landscapes, warm hospitality, and cultural richness. This marks the end of your Sweet Kashmir Tour. (Honeymoon tours available on demand).', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'srinagar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'gulmarg'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'pahalgam'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d', '06 Nights/07 Days Charming Kashmir Tour',
    6, 7, '6 Nights / 7 Days',
    4, FALSE,
    'https://images.pexels.com/photos/7743323/pexels-photo-7743323.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12750077/pexels-photo-12750077.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29264394/pexels-photo-29264394.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11522584/pexels-photo-11522584.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Srinagar: Arrival & Mughal Garden Tour', 'Upon arrival at Srinagar Airport, transfer to a traditional houseboat on Dal Lake. After settling in, embark on a sightseeing tour of Srinagar''s Mughal gardens: Cheshma Shahi (Royal Spring), Shalimar Bagh (Garden of Love), and Nishat Bagh (Garden of Pleasure). On the return, visit a local handicraft emporium showcasing hand-knotted silk carpets, pashmina shawls, and intricate jewelry. Overnight stay on the houseboat.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Srinagar to Gulmarg: Meadow of Flowers', 'After breakfast, drive 52 km to Gulmarg, the Meadow of Flowers, perched at 2,730 meters. Spend the day at leisure exploring lush green meadows against a backdrop of snow-capped peaks. Options include a pony ride or the famous Gulmarg Gondola ride (own cost) to Khilanmarg for panoramic views. Overnight at the hotel in Gulmarg.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Gulmarg to Pahalgam: Valley of Shepherds', 'Morning drive 154 km to Pahalgam, the Valley of Shepherds. En route, stop at the Saffron fields of Pampore and the 8th-century Avantipur Temple ruins. Upon arrival, check into the hotel. The rest of the day is free to explore the countryside, take leisurely walks through pine forests along the Lidder River, or simply relax. Overnight in Pahalgam.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Pahalgam: Aru Valley & Chandanwari Excursion', 'After breakfast, proceed by car (own cost) to Aru Valley, 11 km upstream the Lidder River, a starting point for treks to Kolahoi Glacier. Continue to the undulating meadow of Baisaran, surrounded by dense pine forests, and visit Hajan and Betaab Valley en route to Chandanwari. Return to Pahalgam for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Pahalgam to Srinagar: Tulip Festival & Mughal Gardens', 'Drive back to Srinagar and visit the Indira Gandhi Memorial Tulip Garden in the Zabarwan range, hosting Asia''s largest tulip show (seasonal, April). After enjoying the vibrant blooms, check into a houseboat. Later, visit Mughal gardens including Chashma Shahi, Nishat Bagh, and Shalimar Bagh. Overnight on the houseboat.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Srinagar to Sonamarg: Thajiwas Glacier Excursion', 'After breakfast, drive 96 km to Sonamarg, the Meadow of Gold. The surrounding mountains feature several glaciers, notably the Thajiwas Glacier, a 3-km walk or pony ride from the road. Spend time amid lush meadows and ice fields. Return to Srinagar for overnight stay at a hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 7, 'Srinagar Departure', 'After breakfast, transfer to Srinagar Airport for your flight onward. The tour concludes with sweet memories of Kashmir''s breathtaking landscapes and warm hospitality.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'srinagar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'gulmarg'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'pahalgam'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'uae';
  state_id := NULL;

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'dubai-tours', 'Dubai Tour Packages',
    'Dubai, a city of superlatives, dazzles with its futuristic skyline, golden deserts, and Arabian hospitality. From the towering Burj Khalifa to the man-made Palm Jumeirah, every corner offers a blend of luxury and tradition. Explore Abu Dhabi''s majestic Sheikh Zayed Grand Mosque and thrilling Ferrari World. With Mother India Tour Travels, enjoy meticulously crafted itineraries, Indian comforts, and seamless travel experiences across the UAE.',
    ARRAY['Ascend the 148th-floor observation deck of Burj Khalifa, the world''s tallest building, for panoramic city views.', 'Catch the spectacular Dubai Fountain show at the base of Burj Khalifa, choreographed to music and lights.', 'Thrill to a desert safari with dune bashing, camel rides, and a BBQ dinner under the stars.', 'Visit the opulent Sheikh Zayed Grand Mosque in Abu Dhabi, a masterpiece of Islamic architecture with marble and gold details.', 'Stroll through the Dubai Mall, the world''s largest shopping and entertainment destination, featuring an indoor aquarium and ice rink.'],
    ARRAY['Return economy airfare from major Indian cities to Dubai', '4-star or 5-star hotel accommodation with breakfast', 'Private air-conditioned transfers and sightseeing as per itinerary', 'Half-day Dubai city tour covering Burj Khalifa, Dubai Mall, and Palm Jumeirah', 'Desert safari with dune bashing, camel ride, and dinner', 'Full-day Abu Dhabi tour with Sheikh Zayed Grand Mosque and Ferrari World (optional)', 'All applicable taxes and service charges'],
    ARRAY['UAE visa fees (approx. ₹3,000 per person)', 'Personal expenses such as laundry, telephone calls, and beverages', 'Optional tours not mentioned in the itinerary', 'Travel insurance (recommended at ₹500 per person)', 'Tips and gratuities for guides and drivers'],
    ARRAY['Valid passport with at least 6 months validity required for UAE visa.', 'Summer months (May-September) are extremely hot; plan indoor activities accordingly.', 'Dress modestly when visiting mosques and religious sites; cover shoulders and knees.'],
    'https://images.pexels.com/photos/31566720/pexels-photo-31566720.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/19664340/pexels-photo-19664340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29470840/pexels-photo-29470840.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/18341554/pexels-photo-18341554.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/1381722/pexels-photo-1381722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Classic', 20, 12, 'Premium Hotels',
    'Experience Dubai''s luxury and adventure with our curated packages.', TRUE, FALSE, FALSE,
    ARRAY['dubai', 'uae', 'luxury', 'burj-khalifa', 'desert-safari'], country_id, state_id,
    'Dubai Tour Packages 2025 | Book from ₹29,999', 'Explore Dubai & Abu Dhabi with our classic tour packages. Burj Khalifa, desert safari, luxury stays. Book your Dubai holiday from ₹29,999.', ARRAY['Dubai tour packages', 'Dubai holiday packages', 'Abu Dhabi tour', 'Burj Khalifa tickets', 'desert safari Dubai', 'luxury Dubai packages', 'UAE tour from India', 'Mother India Travel'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'international-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d', 'Essential Dubai Experience - 3 Days',
    2, 3, '2 Nights / 3 Days',
    0, TRUE,
    'https://images.pexels.com/photos/31566720/pexels-photo-31566720.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/19664340/pexels-photo-19664340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29470840/pexels-photo-29470840.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/18341554/pexels-photo-18341554.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/1381722/pexels-photo-1381722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Dubai: Arrival & Modern Marvels', 'Upon arrival at Dubai International Airport, you are met by our representative and transferred to your hotel. After a brief refresh, embark on a city tour starting with the iconic Burj Khalifa – ascend to the 124th-floor observation deck for panoramic views of the cityscape and the Arabian Gulf. Next, visit the Dubai Mall, one of the world''s largest shopping and entertainment destinations, home to the Dubai Aquarium and Underwater Zoo. In the evening, witness the spectacular Dubai Fountain show set against the backdrop of the Burj Khalifa. Return to the hotel for an overnight stay in Dubai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Dubai to Abu Dhabi: Cultural Crossroads', 'After breakfast, check out from your Dubai hotel and drive to Abu Dhabi, approximately 1.5 hours. Your first stop is the magnificent Sheikh Zayed Grand Mosque, a masterpiece of Islamic architecture with its white marble domes, intricate floral designs, and the world''s largest hand-knotted carpet. Continue to the Louvre Abu Dhabi, a stunning museum that showcases art and artifacts from around the world under a striking dome of interwoven metal stars. Enjoy a leisurely afternoon at the Abu Dhabi Corniche, a pristine waterfront promenade with beaches and lush parks. Later, check into your hotel in Abu Dhabi for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Abu Dhabi: Yas Island Adventure & Departure', 'After breakfast, check out from your hotel and head to Yas Island, Abu Dhabi’s premier entertainment hub. Choose between Ferrari World Abu Dhabi, home to the world''s fastest roller coaster Formula Rossa, or Warner Bros. World Abu Dhabi, an indoor theme park with immersive rides and attractions featuring iconic characters. Spend the morning enjoying adrenaline-pumping rides and family-friendly fun. After a final lunch (own arrangement), you are transferred to Abu Dhabi International Airport for your departure flight, concluding your Essential Dubai Experience.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'dubai'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'abu-dhabi'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d-abu-dhabi-classic
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d-abu-dhabi-classic', 'Classic Dubai & Abu Dhabi - 5 Days',
    4, 5, '4 Nights / 5 Days',
    1, FALSE,
    'https://images.pexels.com/photos/31566720/pexels-photo-31566720.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/19664340/pexels-photo-19664340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29470840/pexels-photo-29470840.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/18341554/pexels-photo-18341554.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/1381722/pexels-photo-1381722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Dubai: Arrival & Dhow Cruise at Dubai Creek', 'Upon arrival at Dubai International Airport, you are transferred to your hotel. In the evening, embark on a traditional dhow cruise along Dubai Creek, passing by illuminated landmarks like the Deira Gold Souk and Al Fahidi Historical Neighbourhood. Enjoy a buffet dinner with live entertainment, offering a magical introduction to the city''s blend of old and new.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Dubai: Modern Marvels & Iconic Landmarks', 'After breakfast, explore the city''s modern side with visits to the Burj Khalifa (At the Top observation deck on the 124th floor), Dubai Mall, and the dazzling Dubai Fountain. Then, drive through the Palm Jumeirah to see the Atlantis Hotel and stop at the Jumeirah Beach for photos of the iconic Burj Al Arab sail-shaped hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Dubai: Desert Adventure & Bedouin Camp Dinner', 'Spend the morning at leisure or explore optional attractions like the Dubai Aquarium. In the afternoon, embark on a thrilling desert safari with dune bashing in a 4x4 vehicle, followed by camel riding and sandboarding. The evening concludes with a barbecue dinner under the stars at a Bedouin-style camp, featuring henna painting, shisha, and traditional performances.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Abu Dhabi: Cultural Gems & Architectural Wonders', 'After breakfast, drive to Abu Dhabi (approx. 1.5 hours). Visit the magnificent Sheikh Zayed Grand Mosque, one of the world''s largest mosques, with its white marble domes and intricate floral designs. Then, explore the Louvre Abu Dhabi, a stunning museum of art and civilization under a futuristic dome. Overnight in Abu Dhabi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Abu Dhabi: Farewell to UAE & Departure', 'Enjoy a leisurely morning with an option to visit Ferrari World Abu Dhabi (with its record-breaking Formula Rossa roller coaster) or Yas Marina Circuit. Alternatively, explore the Corniche or the Heritage Village. Later, you are transferred to Abu Dhabi International Airport for your flight back home, carrying unforgettable memories of the UAE''s blend of tradition and futuristic vision.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'dubai'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'abu-dhabi'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d-luxury
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d-luxury', 'Luxury Dubai Experience - 5 Days',
    4, 5, '4 Nights / 5 Days',
    2, FALSE,
    'https://images.pexels.com/photos/31566720/pexels-photo-31566720.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/19664340/pexels-photo-19664340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29470840/pexels-photo-29470840.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/18341554/pexels-photo-18341554.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/1381722/pexels-photo-1381722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Dubai: Arrival & Dhow Cruise on Dubai Creek', 'Upon arrival at Dubai International Airport, you are met by our representative and transferred to your 5-star hotel. The evening unfolds with a private dhow cruise along historic Dubai Creek, where you enjoy a gourmet dinner while gliding past illuminated souks and traditional abra boats. The gentle breeze and city lights set the tone for a luxurious stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Dubai: Iconic Landmarks & Modern Marvels', 'After breakfast, embark on a guided city tour covering Dubai''s iconic landmarks. Ascend to the 124th floor of Burj Khalifa for panoramic views, then explore the Dubai Mall and its massive aquarium. Photo stops include the sail-shaped Burj Al Arab and the Palm Jumeirah, with a visit to Atlantis, The Palm. The afternoon is free for leisure or shopping at the Dubai Marina Mall.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Dubai: Desert Safari & Luxury Camp Dinner', 'The day begins with a relaxing morning at the hotel or optional spa. In the afternoon, a 4x4 vehicle takes you on a thrilling desert safari across the Lahbab Desert dunes. You enjoy camel riding, sandboarding, and a sunset photo session. The evening features a gourmet BBQ dinner at a luxury desert camp, complete with traditional Tanoura dance and henna painting.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Dubai to Abu Dhabi: Grand Mosque & Royal Palaces', 'After breakfast, drive 90 minutes to Abu Dhabi. Visit the magnificent Sheikh Zayed Grand Mosque, with its white marble domes and world''s largest hand-knotted carpet. Continue to Qasr Al Watan, the Presidential Palace, and later stop for photos at the Emirates Palace Hotel. The evening is free to explore Yas Island''s attractions or relax at your 5-star hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Abu Dhabi: Ferrari World & Airport Departure', 'Your final day offers a choice: thrill-seekers head to Ferrari World Abu Dhabi for Formula Rossa, the world''s fastest roller coaster, while culture lovers visit the Louvre Abu Dhabi. After lunch, transfer to Abu Dhabi International Airport for your departure flight, with a stop at the Heritage Village if time permits.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'dubai'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'abu-dhabi'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d-uae
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d-uae', 'Complete UAE Experience - 7 Days',
    6, 7, '6 Nights / 7 Days',
    3, FALSE,
    'https://images.pexels.com/photos/31566720/pexels-photo-31566720.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/19664340/pexels-photo-19664340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29470840/pexels-photo-29470840.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/18341554/pexels-photo-18341554.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/1381722/pexels-photo-1381722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Dubai: Arrival & Marina Welcome', 'Upon arrival at Dubai International Airport, you are greeted by our representative and transferred to your hotel. Spend the afternoon at leisure exploring the Dubai Marina, strolling along the JBR Walk, or relaxing on the beach. In the evening, enjoy a welcome dinner at a waterfront restaurant overlooking the glittering skyline.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Dubai: Iconic Landmarks & Downtown', 'Begin the day with a visit to the world''s tallest building, the Burj Khalifa, and ascend to the 124th-floor observation deck for panoramic views. Explore the Dubai Mall, home to the Dubai Aquarium and Underwater Zoo. In the evening, witness the spectacular Dubai Fountain show set to music. Optional dinner at a restaurant in the mall.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Dubai: Desert Safari & Arabian Night', 'Embark on a thrilling desert safari in the Lahbab Desert. Enjoy dune bashing in a 4x4, sandboarding, and a camel ride. As the sun sets, visit a Bedouin-style camp for henna painting, shisha, and a sumptuous barbecue dinner under the stars with traditional dance performances.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Dubai: Old Dubai & Souk Experience', 'Explore the historic side of Dubai by taking an abra (traditional boat) across Dubai Creek. Wander through the Gold Souk and Spice Souk, where you can haggle for gold, spices, and textiles. Visit the Al Fahidi Historical District and the Dubai Museum housed in Al Fahidi Fort. In the afternoon, leisure time at your hotel or for shopping.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Dubai to Abu Dhabi: Grand Mosque & Corniche', 'Check out of your Dubai hotel and drive to Abu Dhabi. First, visit the magnificent Sheikh Zayed Grand Mosque, one of the world''s largest mosques, with its white marble domes and intricate carvings. Continue to the Corniche for a scenic waterfront walk. Check into your Abu Dhabi hotel. Evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Abu Dhabi: Ferrari World & Louvre Museum', 'Spend the morning at Ferrari World Abu Dhabi on Yas Island, home to the world''s fastest roller coaster, Formula Rossa. Optionally, visit Yas Waterworld or Warner Bros. World. In the afternoon, explore the Louvre Abu Dhabi, a stunning museum with art from around the world under a futuristic dome. Return to hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 7, 'Abu Dhabi: Departure', 'After breakfast, enjoy some last-minute shopping at the Yas Mall or relax. Transfer to Abu Dhabi International Airport for your departure flight, carrying memories of a complete UAE experience.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'dubai'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'abu-dhabi'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-family
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-family', 'Dubai Family Adventure - 6 Days',
    5, 6, '5 Nights / 6 Days',
    4, FALSE,
    'https://images.pexels.com/photos/31566720/pexels-photo-31566720.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/19664340/pexels-photo-19664340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29470840/pexels-photo-29470840.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/18341554/pexels-photo-18341554.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/1381722/pexels-photo-1381722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Dubai: Arrival & Welcome to the City of Gold', 'Upon arrival at Dubai International Airport, you are met by our representative and transferred to your hotel. The afternoon is free to relax or explore the nearby Dubai Marina Walk. In the evening, embark on a traditional dhow cruise along Dubai Creek, enjoying a sumptuous dinner under the stars with views of the illuminated skyline. Overnight in Dubai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Dubai: Iconic Landmarks & Modern Wonders', 'After breakfast, visit the towering Burj Khalifa for a breathtaking view from the 124th-floor observation deck. Next, explore the Dubai Mall, home to the Dubai Aquarium & Underwater Zoo. After lunch, head to the historic Al Fahidi Fort (Dubai Museum) and take an abra ride across Dubai Creek to the Gold and Spice Souks. Evening at leisure. Overnight in Dubai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Dubai: Desert Safari & Arabian Adventures', 'Start your day with a visit to the Palm Jumeirah for a photo stop at the Atlantis Hotel. Then, enjoy waterpark fun at Aquaventure or Wild Wadi (own expense). In the afternoon, depart for a desert safari: enjoy dune bashing, camel riding, sandboarding, and a BBQ dinner under the stars with traditional Tanoura dance. Overnight in Dubai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Dubai to Abu Dhabi: Grand Mosque & Cultural Gems', 'After breakfast, check out and drive to Abu Dhabi (approx 1.5 hours). On arrival, visit the magnificent Sheikh Zayed Grand Mosque, one of the world’s largest mosques, with its white marble and intricate floral designs. Continue to the Heritage Village to glimpse traditional Bedouin life. After lunch, explore the Qasr Al Hosn fort. Check in to hotel and enjoy evening at leisure. Overnight in Abu Dhabi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Abu Dhabi: Thrills at Ferrari World & Yas Island', 'After breakfast, head to Ferrari World Abu Dhabi on Yas Island, home to the world’s fastest roller coaster, Formula Rossa. Enjoy rides and attractions suitable for all ages. Alternatively, visit the nearby Yas Waterworld or Warner Bros. World (optional). In the evening, stroll along the Corniche or visit the Observation Deck at 300. Overnight in Abu Dhabi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Abu Dhabi: Farewell & Departure', 'After a leisurely breakfast, check out from the hotel. Depending on your flight schedule, you may have time to visit the Marina Mall or take a last walk on the Corniche. You are then transferred to Abu Dhabi International Airport for your departure flight, concluding your family adventure with Mother India Tour Travels.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'dubai'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'abu-dhabi'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'kerala';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'kerala-tours', 'Kerala Tour Packages',
    'Kerala, God''s Own Country, is a tropical paradise where emerald backwaters meet serene beaches and misty tea plantations. From the vibrant streets of Cochin to the rolling hills of Munnar, the spice-scented forests of Thekkady, and the iconic houseboat cruises in Alleppey, every corner offers a unique blend of nature and culture. This package category invites you to unwind on sun-kissed shores, glide through tranquil lagoons, and savor authentic Ayurvedic therapies. With Mother India Tour Travels, you get carefully curated itineraries, handpicked accommodations, and local experts who bring Kerala''s magic to life.',
    ARRAY['Explore the historic Fort Cochin with its Chinese fishing nets and Dutch-colonial architecture.', 'Walk through the lush tea gardens of Munnar and visit the Tea Museum.', 'Enjoy a bamboo rafting or spice plantation tour in Thekkady.', 'Overnight stay on a traditional houseboat cruising the Alleppey backwaters.', 'Relax on the golden sands of Marari or Kovalam beaches.'],
    ARRAY['Accommodation in 3-star to 5-star hotels and resorts as per itinerary.', 'Daily breakfast and select meals (lunch/dinner) as mentioned.', 'Private air-conditioned vehicle for all transfers and sightseeing.', 'English-speaking local guide for major sightseeing days.', 'Houseboat cruise with onboard meals and tea/coffee.', 'All tolls, parking, driver allowances, and fuel charges.', 'GST and all applicable taxes.'],
    ARRAY['Airfare or train fare to/from Kerala.', 'Entry fees to monuments, parks, and activities not explicitly mentioned.', 'Personal expenses such as laundry, tips, phone calls, etc.', 'Camera fees at monuments and wildlife sanctuaries.', 'Any services not mentioned in inclusions or additional sightseeing.'],
    ARRAY['Houseboat check-in is typically at 12:00 PM and check-out at 9:00 AM the next day.', 'Best time to visit is October to March for pleasant weather.', 'Carry light cotton clothes and a jacket for hill stations; sunscreen and mosquito repellent are recommended.'],
    'https://images.pexels.com/photos/34588372/pexels-photo-34588372.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32518360/pexels-photo-32518360.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12950219/pexels-photo-12950219.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36998153/pexels-photo-36998153.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Beach', 20, 12, 'Premium Hotels',
    'Discover Kerala''s backwaters, tea gardens & pristine beaches.', TRUE, TRUE, TRUE,
    ARRAY['kerala', 'backwaters', 'houseboat', 'tea-gardens', 'beaches'], country_id, state_id,
    'Kerala Tour Packages 2025 | Starting ₹12,999', 'Explore Kerala backwaters, tea gardens & beaches. 3D to 7D packages with houseboat, Munnar, Thekkady, Alleppey. Book now!', ARRAY['Kerala tour packages', 'Kerala backwaters', 'houseboat Kerala', 'Munnar tea gardens', 'Alleppey beaches', 'Thekkady wildlife', 'Cochin sightseeing', 'Kerala holiday packages'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'beach-holidays'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d', '02 Nights/03 Days - Cochin - Munnar - Cochin',
    2, 3, '2 Nights / 3 Days',
    0, TRUE,
    'https://images.pexels.com/photos/17141643/pexels-photo-17141643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/17441031/pexels-photo-17441031.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/15308719/pexels-photo-15308719.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5959722/pexels-photo-5959722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Cochin to Munnar: Waterfalls, Tea Gardens & Wildlife', 'Upon arrival at Cochin airport or railway station, you drive 130 km to Munnar, a scenic 5-hour journey through winding roads. En route, you stop at Valparai and Cheeyappara Waterfalls, surrounded by lush tea plantations. After checking in at your hotel, you visit Rajamala (Eravikulam National Park), home to the endangered Nilgiri Tahr, South India''s mountain goat. You also explore the Tea Museum, the only one of its kind, nestled amid sprawling tea gardens.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Munnar: Scenic Dams, Viewpoints & Gardens', 'After breakfast, you set out for a full day of sightseeing around Munnar. You visit Mattupetty Dam, where you can enjoy boating against a backdrop of rolling hills, followed by the famous Echo Point, where sounds echo across the valley. You also explore Kundala Dam, Pothamedu View Point offering panoramic vistas, and Blossom Park with its vibrant floral displays. The evening is free for shopping at local markets or relaxing at your hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Munnar to Cochin: Departure Drive', 'After a leisurely breakfast at your hotel, you check out and begin the 130 km drive back to Cochin. The 5-hour journey retraces the lush landscapes of tea estates and waterfalls. You are dropped at Cochin airport or railway station, concluding your tour with memories of Munnar''s verdant hills.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kochi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'munnar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'thekkady'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 3 FROM "Destination" d WHERE d."slug" = 'alleppey'
  ON CONFLICT DO NOTHING;

  -- Variant: 3n-4d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '3n-4d', '03 Nights/04 Days - Munnar - Alleppey',
    3, 4, '3 Nights / 4 Days',
    1, FALSE,
    'https://images.pexels.com/photos/17441031/pexels-photo-17441031.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/17141643/pexels-photo-17141643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/15308719/pexels-photo-15308719.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5959722/pexels-photo-5959722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Cochin to Munnar: Tea Country & Waterfall En Route', 'Upon arrival at Cochin Airport or railway station, you are greeted and driven to Munnar (130 km, approx. 5 hours). The scenic route passes through Valparai and the Cheeyappara Waterfalls, where you stop for photos amidst lush tea plantations. Arriving in Munnar by afternoon, check into your hotel. Later, visit Rajamala (Eravikulam National Park), home to the endangered Nilgiri Tahr, and explore the Tea Museum surrounded by rolling tea gardens. Overnight stay in Munnar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Munnar: Lakes, Dams & Panoramic Viewpoints', 'After breakfast, proceed for a full day of sightseeing in Munnar. Visit Mattupetty Dam and enjoy the serene reservoir, then head to Echo Point for its natural echo phenomenon. Continue to Kundala Dam, Pothamedu View Point offering panoramic valley views, and Blossom Park with its manicured gardens. Spend the evening shopping for spices and tea at local markets. Return to the hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Munnar to Alleppey: Overnight Houseboat Cruise', 'Check out from the hotel after breakfast and drive to Alleppey (65 km, approx. 2 hours). Around noon, board your private deluxe houseboat and begin cruising the famous Kerala backwaters. As you glide past paddy fields, coconut groves, and village settlements, enjoy freshly prepared Kerala meals onboard. The houseboat features fully furnished bedrooms and a kitchen. Drift along the tranquil canals, witness local life, and anchor for the night. All meals (breakfast, lunch, dinner) are included.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Alleppey to Cochin: Departure with Coastal Stops', 'After a leisurely breakfast on the houseboat, disembark and drive to Cochin (65 km, approx. 2 hours). If time permits, visit Lulu Mall for shopping or take a short walk along Cochin Beach. You are then transferred to the airport or railway station for your onward journey, marking the end of this memorable Kerala tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kochi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'munnar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'thekkady'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 3 FROM "Destination" d WHERE d."slug" = 'alleppey'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d', '04 Nights/05 Days - Cochin - Munnar - Thekkady - Alleppey',
    4, 5, '4 Nights / 5 Days',
    2, FALSE,
    'https://images.pexels.com/photos/15308719/pexels-photo-15308719.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/17141643/pexels-photo-17141643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/17441031/pexels-photo-17441031.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5959722/pexels-photo-5959722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Cochin to Munnar: Tea Country Drive', 'Upon arrival at Cochin, drive 140 km to Munnar, India’s highest tea estate. En route, admire scenic waterfalls, rolling hills, and low-flying clouds. Check into your hotel and relax in the crisp mountain air. Overnight stay at Munnar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Munnar: Scenic Hill Station Sights', 'After breakfast, explore Munnar’s highlights including Mattupetty Dam, Echo Point, Kundala Dam, Pothamedu View Point, and Blossom Park. Enjoy shopping for local spices and tea. Return to hotel for overnight stay in Munnar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Munnar to Thekkady: Periyar Wildlife Safari', 'Drive 140 km to Thekkady, home to Periyar Wildlife Sanctuary. Check in to your hotel. In the afternoon, take a boat ride (tickets purchased directly at counter, subject to availability) on Periyar Lake to spot elephants and exotic birds. Overnight at Thekkady.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Thekkady to Alleppey: Backwater Houseboat Cruise', 'After breakfast, drive to Alleppey and board an AC deluxe houseboat. Cruise through serene backwater villages, witnessing daily life of Keralites. Enjoy all meals on board. Overnight stay on the houseboat.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Alleppey to Cochin: Departure with Memories', 'After breakfast, drive 90 km to Cochin for your drop at the airport or railway station. Carry sweet memories of Kerala’s enchanting landscapes and hospitality.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kochi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'munnar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'thekkady'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 3 FROM "Destination" d WHERE d."slug" = 'alleppey'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d', '05 Nights/06 Days - Cochin - Munnar - Thekkady - Alleppey',
    5, 6, '5 Nights / 6 Days',
    3, FALSE,
    'https://images.pexels.com/photos/5959722/pexels-photo-5959722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/17141643/pexels-photo-17141643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/17441031/pexels-photo-17441031.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/15308719/pexels-photo-15308719.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Cochin to Munnar: Scenic Drive & Hill Station Arrival', 'Morning arrival at Cochin, followed by a scenic drive to Munnar (approx. 130 km, 5 hours). En route, we stop at Valparai, Cheeyappara waterfalls, and vast tea plantations, offering stunning photo opportunities. After checking into the hotel, we head to Rajamala (Eravikulam National Park) to spot the endangered Nilgiri Tahr in its natural habitat. We also visit the Tea Museum, which showcases the history of tea cultivation amidst lush tea gardens. Evening is free to explore the local market.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Munnar: Full Day Sightseeing of Hill Station Gems', 'After breakfast, we embark on a full day of sightseeing in Munnar. Highlights include Mattupetty Dam, Echo Point, Kundala Dam, Pothamedu View Point, and Blossom Park, each offering unique landscapes and vistas. We also have time for shopping at local spice and tea shops. Overnight stay at the hotel in Munnar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Munnar to Thekkady: Wildlife Sanctuary & Periyar Lake Cruise', 'After breakfast, we check out and drive to Thekkady (approx. 100 km, 3 hours), home to the famous Periyar Wildlife Sanctuary. Upon arrival, we check into the hotel and later enjoy a relaxing boat cruise on Periyar Lake, where we can spot elephants, deer, and a variety of birds along the shoreline. The cruise offers a unique perspective of the sanctuary''s biodiversity. Overnight at Thekkady.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Thekkady: Jeep Safari & Wildlife Exploration', 'After breakfast, we head out for an exciting jeep safari inside the Periyar Tiger Reserve. This guided tour takes us deep into the forest, increasing our chances of spotting wild elephants, bison, sambar deer, and if lucky, the elusive tiger. The safari also covers scenic viewpoints within the reserve. The rest of the day is at leisure to explore the surrounding spice plantations or relax at the hotel. Overnight at Thekkady.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Thekkady to Alleppey: Overnight Houseboat Cruise in Backwaters', 'After breakfast, we check out and drive to Alleppey (approx. 160 km, 4 hours) to board our deluxe houseboat. Around noon, we begin our cruise through the tranquil backwaters, passing by lush paddy fields, coconut groves, and traditional Kerala villages. The houseboat is fully furnished with comfortable bedrooms, a living area, and a kitchen. All meals (breakfast, lunch, and dinner) are prepared onboard, offering a taste of authentic Keralan cuisine. We spend the night anchored in a serene spot, surrounded by nature.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Alleppey to Cochin: Departure with Local Sightseeing', 'After breakfast on the houseboat, we disembark and transfer to Cochin. Depending on flight timing, we enjoy a short sightseeing tour of Cochin, visiting the popular Lulu Mall and the historic Cochin Beach. Later, we are dropped off at the airport or railway station for our onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kochi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'munnar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'thekkady'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 3 FROM "Destination" d WHERE d."slug" = 'alleppey'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d', '06 Nights 07 Days Kerala Lovers Tour Packages',
    6, 7, '6 Nights / 7 Days',
    4, FALSE,
    'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/17141643/pexels-photo-17141643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/17441031/pexels-photo-17441031.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/15308719/pexels-photo-15308719.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5959722/pexels-photo-5959722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Cochin to Munnar: Tea Country & Waterfalls', 'Upon arrival at Cochin, we drive to Munnar (about 5 hours), ascending to 1800 meters above sea level. En route, we visit the scenic Valparai region, Cheeyappara Waterfalls, and vast tea plantations. After checking into the hotel, we explore Rajamala (Eravikulam National Park), home to the endangered Nilgiri Tahr, and visit the Tea Museum surrounded by lush gardens.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Munnar: Scenic Valleys & Dam Sightseeing', 'After breakfast, we set out for a full day of sightseeing in Munnar. Highlights include Mattupetty Dam, Echo Point, Kundala Dam, Pothamedu View Point, and the picturesque Blossom Park. Enjoy shopping for local spices and tea, then return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Munnar to Thekkady: Periyar Wildlife Cruise', 'After breakfast, we check out and drive to Thekkady (about 3 hours), home to the famed Periyar Wildlife Sanctuary. On arrival, we check into the hotel and later embark on a game viewing cruise on Periyar Lake, offering glimpses of elephants, deer, and birds. Overnight stay at Thekkady.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Thekkady: Jeep Safari & Wildlife Exploration', 'The day begins with breakfast, followed by an exciting Jeep safari into the Periyar Tiger Reserve. We explore deeper jungle trails, spotting a variety of wildlife including bison, langurs, and if lucky, the elusive tiger. Afternoon is free for optional spice plantation visits before returning to the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Thekkady to Kovalam: Beach Resort Arrival', 'After breakfast, we drive to Kovalam (about 6 hours), the international beach destination of Kerala. Upon arrival, we check into a beach resort and spend the evening relaxing on the soft sands as the sun sets over the Arabian Sea. Overnight stay at Kovalam.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Kovalam & Trivandrum: Heritage & Beach Bliss', 'After breakfast, we visit the capital city Trivandrum to explore iconic landmarks like the Napier Museum, Sri Chitra Art Gallery, Zoo, and the historic Padmanabhapuram Temple. Later, we return to Kovalam to enjoy the beach at leisure, watching another spectacular sunset. Overnight at Kovalam.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 7, 'Kovalam to Trivandrum: Departure with Memories', 'After a final breakfast, we transfer to Trivandrum Airport or Railway Station (about 30 minutes) for your onward journey. Bid farewell to Kerala with sweet memories of lush hills, wildlife, and serene beaches.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kochi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'munnar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'thekkady'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 3 FROM "Destination" d WHERE d."slug" = 'alleppey'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'uttar-pradesh';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'varanasi-spiritual', 'Varanasi Ayodhya Prayagraj Spiritual Tour',
    'Embark on a divine journey through the holiest cities of Hinduism—Varanasi, Ayodhya, and Prayagraj. Witness the eternal Ganga aarti at Dashashwamedh Ghat, walk the sacred streets where Lord Ram once roamed in Ayodhya, and experience the confluence of three rivers at Triveni Sangam. This pilgrimage offers profound spiritual immersion at ancient temples, ghats, and ashrams. Mother India Tour Travels ensures seamless comfort with expert local guides, curated darshan timings, and carefully selected accommodations for a soulful experience.',
    ARRAY['Attend the mesmerizing Ganga Aarti at Dashashwamedh Ghat, Varanasi', 'Morning boat ride on the Ganges at sunrise to see the ghats and cremation sites', 'Visit the Ram Janmabhoomi temple and Hanuman Garhi in Ayodhya', 'Take a holy dip at Triveni Sangam, the confluence of Ganga, Yamuna, and Saraswati', 'Explore ancient temples like Kashi Vishwanath and Sankat Mochan'],
    ARRAY['Accommodation in well-located hotels/ashrams', 'Daily breakfast and dinner (as per itinerary)', 'All transfers and sightseeing by private air-conditioned vehicle', 'Services of an English-speaking local guide', 'Boat ride on the Ganges in Varanasi', 'Priority darshan arrangements at major temples (subject to queue)', 'All applicable taxes and service charges'],
    ARRAY['Air/train fare to and from the starting point', 'Lunch and any meals not mentioned', 'Entrance fees at monuments (if any)', 'Personal expenses like tips, laundry, phone calls', 'Anything not mentioned in inclusions'],
    ARRAY['Dress modestly and remove footwear before entering temples.', 'Photography is restricted inside many temples; check before shooting.', 'Respect local customs and maintain silence during aarti.'],
    'https://images.pexels.com/photos/36527284/pexels-photo-36527284.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/8112552/pexels-photo-8112552.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/38023851/pexels-photo-38023851.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/38023850/pexels-photo-38023850.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Pilgrimage', 20, 12, 'Premium Hotels',
    'Varanasi, Ayodhya, Prayagraj: The ultimate spiritual journey.', FALSE, FALSE, TRUE,
    ARRAY['varanasi', 'ayodhya', 'spiritual', 'pilgrimage', 'ganges', 'prayagraj'], country_id, state_id,
    'Varanasi Ayodhya Prayagraj Spiritual Tour Packages 2025', 'Discover the holy cities Varanasi, Ayodhya, and Prayagraj with our spiritual tour packages. Ganga aarti, Ram temple, Triveni Sangam. 1D to 6D options. Book now!', ARRAY['Varanasi spiritual tour', 'Ayodhya pilgrimage', 'Prayagraj tour packages', 'Ganga aarti', 'Ram Janmabhoomi', 'Triveni Sangam', 'Kashi Vishwanath', 'spiritual India tour'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'pilgrimage-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-prayagraj
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-prayagraj', '05Nt./06 Days Tour: Varanasi Prayagraj Ayodhya Tour',
    5, 6, '5 Nights / 6 Days',
    0, TRUE,
    'https://images.pexels.com/photos/36527284/pexels-photo-36527284.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/8112552/pexels-photo-8112552.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/38023851/pexels-photo-38023851.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/38023850/pexels-photo-38023850.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Varanasi: Arrival & Sarnath Excursion', 'Upon arrival at Varanasi airport or railway station, our representative greets and transfers you to the hotel. After refreshing, drive to Sarnath, the deer park where Lord Buddha delivered his first sermon. Visit the Dhamek Stupa, Chaukhandi Stupa, and the Sarnath Museum housing the Ashoka Lion Capital. Feel the serene atmosphere of this ancient Buddhist site. Return to Varanasi for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Varanasi: Spiritual Ghats & Temple Tour', 'Begin before dawn with a boat ride on the Ganges, witnessing pilgrims offering water to the Sun God and taking holy dips. Return for breakfast, then visit the revered Kashi Vishwanath Temple (one of the 12 Jyotirlingas), Bharat Mata Temple, Sankat Mochan Hanuman Temple, Annapurna Temple, and the vast Banaras Hindu University campus. Also explore Manas Mandir, a temple dedicated to Lord Rama with verses from the Ramcharitmanas. Overnight in Varanasi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Varanasi to Prayagraj: Triveni Sangam & Historic Sites', 'After breakfast, drive 210 km to Prayagraj (Allahabad). Visit the Triveni Sangam, the sacred confluence of Ganga, Yamuna, and the mythical Saraswati rivers. Take a boat ride to the sangam for a holy dip. Also explore the Hanuman Temple (situated on a platform in the river), Anand Bhawan (the Nehru family home turned museum), and Alopi Devi Temple. Check into hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Prayagraj to Ayodhya: Journey to Lord Rama''s Birthplace', 'After breakfast, travel 185 km to Ayodhya, the legendary city of Lord Rama. En route, appreciate the changing landscapes from the Gangetic plains to the sacred city. Upon arrival, check into the hotel and spend the evening at leisure, perhaps strolling near the Saryu River. Overnight in Ayodhya.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 5, 'Ayodhya: Pilgrimage to Ram Janmabhoomi & Temples', 'After breakfast, explore the temples and holy sites of Ayodhya. Visit the Saryu River for a holy dip and ghat walk, then Hanuman Garhi (a temple dedicated to Lord Hanuman with 76 steps). Proceed to Ram Janmabhoomi (the birthplace of Lord Rama), the grand Kanak Bhawan, and Treta Ka Thakur (where Rama performed a horse sacrifice). Feel the divine energy enveloping you. Return to hotel for overnight.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 6, 'Ayodhya to Varanasi: Departure with Divine Memories', 'After breakfast, drive 225 km back to Varanasi. En route, reflect on the spiritual journey. Our driver drops you at Varanasi airport or railway station for your onward journey. Bid farewell with sweet memories of this holy tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'ayodhya'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'prayagraj'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d-varanasi', '02Nt./03 Days Varanasi Tour',
    2, 3, '2 Nights / 3 Days',
    1, FALSE,
    'https://images.pexels.com/photos/35622524/pexels-photo-35622524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/35655143/pexels-photo-35655143.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/21047821/pexels-photo-21047821.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36675455/pexels-photo-36675455.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Varanasi: Arrival and Sarnath Excursion', 'Upon arrival at Varanasi airport or railway station, our company representative assists you and transfers you to your hotel. After refreshing, you drive to Sarnath, the revered site where Lord Buddha delivered his first sermon to his disciples. Explore the Dhamek Stupa, the Ashoka Pillar, and the serene Deer Park. After an enlightening visit, return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Varanasi: Sunrise Ganges Boat Ride and Temple Tour', 'Early morning, you embark on a boat ride along the holy Ganges at the famous ghats of Varanasi. Witness devotees offering water to the Sun God and taking a holy dip, a ritual that has continued for millennia. After returning to the hotel and breakfast, you proceed to visit Bharat Mata Temple, the iconic Kashi Vishwanath Temple (one of the twelve Jyotirlingas), Sankat Mochan (Hanuman Temple), Annapurna Temple, and the sprawling Banaras Hindu University (BHU) campus. The tour also includes Manas Mandir, dedicated to Lord Rama. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Varanasi to Prayagraj: Departure with Memories', 'After breakfast, you check out from the hotel and proceed to Varanasi airport or railway station for your onward journey. The drive to Prayagraj covers 210 kilometers and takes about 3 hours, offering picturesque views of the Gangetic plains. You are dropped off with sweet memories of your spiritual sojourn.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'ayodhya'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'prayagraj'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-prayagraj-v2
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-prayagraj-v2', '05Nt./06 Days Tour: Varanasi Prayagraj Ayodhya Tour',
    5, 6, '5 Nights / 6 Days',
    2, FALSE,
    'https://images.pexels.com/photos/36527284/pexels-photo-36527284.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/8112552/pexels-photo-8112552.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/38023851/pexels-photo-38023851.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/38023850/pexels-photo-38023850.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Varanasi: Arrival & Sarnath Excursion', 'Upon arrival at Varanasi airport or railway station, our representative greets and transfers you to the hotel. After refreshing, drive to Sarnath, the serene site where Lord Buddha delivered his first sermon after enlightenment. Explore the Dhamek Stupa, the Ashoka Pillar, and the Sarnath Museum, which houses ancient relics. Return to Varanasi for an overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Varanasi: Sunrise Boat Ride & Temple Tour', 'Begin before dawn with a private boat ride along the Ganges, witnessing devotees offering water to the Sun God and taking holy dips at the ghats. The flickering lamps and chanting create a mystical atmosphere. After breakfast, visit the Bharat Mata Temple, the iconic Kashi Vishwanath Temple (one of the twelve Jyotirlingas), Sankat Mochan Hanuman Temple, Annapurna Temple, Banaras Hindu University (BHU) campus, and the Tulsi Manas Mandir, where the Ramcharitmanas is inscribed. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Varanasi to Ayodhya: City of Lord Rama', 'After breakfast, travel 225 kilometers (approximately 5 hours) to Ayodhya, the sacred birthplace of Lord Rama. On arrival, check into the hotel and spend the evening at leisure, perhaps taking a stroll along the Saryu River banks. Overnight stay at the hotel in Ayodhya.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Ayodhya: Ram Janmabhoomi & Spiritual Sites', 'Today, after breakfast, explore Ayodhya''s divine landmarks. Visit the serene Saryu River, the Hanuman Garhi temple, the revered Ram Janmabhoomi site (birthplace of Lord Rama), the beautiful Kanak Bhawan, and Treta Ka Thakur temple, which marks the site of the Ashwamedha Yagna. Return to the hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Ayodhya to Prayagraj: Triveni Sangam & Heritage', 'After breakfast, drive 225 kilometers (5 hours) to Prayagraj. Upon arrival, visit the holy Triveni Sangam, the confluence of the Ganges, Yamuna, and mythical Saraswati rivers. Take a boat ride and witness the sacred rites. Also explore the Hanuman Temple (situated on the Sangam), Anand Bhawan (the Nehru family home), and the Alopi Devi Temple. Overnight stay at the hotel in Prayagraj.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Prayagraj: Departure with Blessings', 'After a leisurely breakfast, enjoy free time for last-minute shopping or reflection. Later, you will be transferred to Prayagraj airport or railway station for your onward journey, carrying with you the spiritual essence of the holy cities. Tour concludes with sweet memories.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'ayodhya'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'prayagraj'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d-prayagraj
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d-prayagraj', '04 Night / 05 Days Varanasi Prayagraj Tour',
    4, 5, '4 Nights / 5 Days',
    3, FALSE,
    'https://images.pexels.com/photos/21047821/pexels-photo-21047821.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/35622524/pexels-photo-35622524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/35655143/pexels-photo-35655143.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36675455/pexels-photo-36675455.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Varanasi: Arrival and Sarnath Buddhist Pilgrimage', 'Upon arrival at Varanasi airport or railway station, our representative welcomes and transfers you to the hotel. After refreshing, we drive to Sarnath, the serene site where Lord Buddha delivered his first sermon. Visit the Dhamek Stupa, the Mulagandhakuti Vihara, and the Sarnath Museum housing the iconic Lion Capital. In the evening, return to Varanasi for a peaceful overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Varanasi: Spiritual Dawn at the Ghats and Temple Circuit', 'Well before sunrise, we embark on a boat ride along the Ganges to witness the mesmerizing Subah-e-Banaras – devotees offering water to the Sun God and taking holy dips. Back at the hotel, enjoy breakfast, then proceed to visit the revered Kashi Vishwanath Temple, Bharat Mata Temple, Sankat Mochan Hanuman Temple, Annapurna Temple, and the sprawling Banaras Hindu University campus. We also explore the Manas Mandir and return for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Varanasi to Prayagraj: Journey to the Confluence', 'After breakfast, we check out and drive 120 km to Prayagraj (Allahabad), the city of the sacred Sangam. The journey takes about three hours through the Uttar Pradesh countryside. On arrival, check into the hotel and spend the evening at leisure. Overnight stay in Prayagraj.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Prayagraj: Triveni Sangam and Heritage Exploration', 'Today after breakfast, we visit the holy Triveni Sangam – the confluence of the Ganga, Yamuna, and mythical Saraswati. Take a boat ride to the sangam point and feel the spiritual energy. Then we explore the ancient Hanuman Temple (Bade Hanuman Ji), the historic Anand Bhawan (Nehru family home), and the Alopi Devi Temple. Return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Prayagraj: Departure with Divine Blessings', 'After a final breakfast, check out from the hotel. Our representative transfers you to Prayagraj airport or railway station for your departure, carrying sweet memories of a soul-stirring pilgrimage. We bid you farewell with warm regards.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'ayodhya'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'prayagraj'
  ON CONFLICT DO NOTHING;

  -- Variant: 0n-1d-varanasi-prayagraj
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '0n-1d-varanasi-prayagraj', '09Nt./10 Days Delhi Agra Ayodhya Prayagraj Varanasi Tour',
    0, 1, 'Same Day Tour',
    4, FALSE,
    'https://images.pexels.com/photos/36675455/pexels-photo-36675455.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/35622524/pexels-photo-35622524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/35655143/pexels-photo-35655143.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/21047821/pexels-photo-21047821.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Delhi: Arrival and Transfer to Hotel', 'Upon arrival at Delhi airport, our representative greets and assists you. You are transferred to your hotel for check-in. The rest of the evening is free for relaxation or independent exploration. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Delhi: Mughal Heritage and Old Delhi Sightseeing', 'After breakfast, you explore both Old and New Delhi. Visit the majestic Jama Masjid, the Red Fort, and Rajghat, Mahatma Gandhi''s cremation site. In New Delhi, see India Gate, the President''s House, Parliament House, Qutub Minar, Lotus Temple, and Humayun''s Tomb. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Delhi to Agra: En Route Mathura and Vrindavan', 'After breakfast, depart for Agra (250 km, approx. 3 hours). En route, visit the holy towns of Mathura, Lord Krishna''s birthplace, and Vrindavan, known for its temples. Continue to Agra and check into the hotel. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Agra: Taj Mahal, Agra Fort, and Itmad-ud-Daulah', 'After breakfast, visit the iconic Taj Mahal at sunrise, a UNESCO World Heritage site. Then explore the imposing Agra Fort and the exquisite Itmad-ud-Daulah (Baby Taj), considered a draft of the Taj Mahal. Return to the hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Agra to Ayodhya: Scenic Drive to the Birthplace of Lord Rama', 'After breakfast, drive to Ayodhya (500 km, approx. 8 hours). Upon arrival, check into the hotel and relax. The evening is free for personal activities. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Ayodhya: Saryu River, Hanuman Garhi, and Ram Janmabhoomi', 'After breakfast, explore Ayodhya, the birthplace of Lord Rama. Visit the sacred Saryu River for a holy dip, Hanuman Garhi temple, Ram Janmabhoomi (the birthplace site), Kanak Bhawan, and Treta Ka Thakur. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 7, 'Ayodhya to Prayagraj: Triveni Sangam and Holy Sites', 'After breakfast, drive to Prayagraj (225 km, approx. 5 hours). Visit the Triveni Sangam, the confluence of Ganga, Yamuna, and Saraswati rivers. Also see Hanuman Temple, Anand Bhawan (Nehru family home), and Alopi Devi Temple. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 8, 'Prayagraj to Varanasi: Journey to the Spiritual Capital', 'After breakfast, proceed to Varanasi (120 km, approx. 3 hours). Check into the hotel and spend the evening at leisure. You may take a stroll along the ghats or prepare for the next day''s explorations. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 9, 'Varanasi: Ganges Boat Ride, Temples, and Sarnath', 'Early morning, enjoy a serene boat ride on the Ganges, witnessing devotees offering prayers and bathing. Return to the hotel for breakfast. Then visit Bharat Mata Temple, Kashi Vishwanath Temple, Sankat Mochan Hanuman Temple, Annapurna Temple, Banaras Hindu University (BHU), Manas Mandir, and Sarnath, where Buddha gave his first sermon. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 10, 'Varanasi: Departure Transfer', 'After breakfast, you are transferred to Varanasi airport or railway station for your onward journey, carrying sweet memories of this spiritual tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'ayodhya'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'prayagraj'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'uttarakhand';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'uttarakhand-tours', 'Uttarakhand Tour Packages',
    'Uttarakhand, the ''Land of the Gods,'' beckons adventure seekers with its sacred rivers, dense forests, and towering Himalayan peaks. From white-water rafting in Rishikesh''s Ganges to wildlife safaris in Corbett National Park, every moment thrills. Trek through Nainital''s verdant hills and meditate at Haridwar''s ghats for a holistic experience. Mother India Tour Travels crafts adrenaline-packed itineraries with expert guides, ensuring safety and authenticity.',
    ARRAY['Raft the rapids of the Ganges in Rishikesh, from Brahmapuri to Shivpuri (Class III-IV).', 'Jeep safari in Corbett National Park, tracking Bengal tigers and Asian elephants.', 'Sunrise trek to Naina Peak (2,615 m) overlooking Nainital''s shimmering lake.', 'Evening Ganga Aarti at Har Ki Pauri in Haridwar, with 1,000 diyas floating.', 'Bungee jumping from a 83-meter platform in Rishikesh over a rocky canyon.'],
    ARRAY['All accommodation: 3-star hotels/camps with attached bathrooms and hot water.', 'Daily breakfast and dinner at hotels; lunch during outings.', 'Private air-conditioned vehicle for all transfers and sightseeing.', 'Expert English-speaking adventure guide for activities.', 'Rafting gear (life jacket, helmet) and safety briefing.', 'Corbett jeep safari with naturalist (shared basis).', 'All permits, tolls, parking, and driver allowances.'],
    ARRAY['Airfare or train tickets (unless specified).', 'Personal expenses like laundry, phone calls, or tips.', 'Any adventure activity not mentioned in the itinerary.', 'Camera fees at monuments or national parks.', 'Travel insurance (recommended for adventure packages).'],
    ARRAY['Best time for rafting and safaris: September to June; avoid monsoon (July–August).', 'Minimum age for bungee jumping is 12; weight limit 35–110 kg.', 'Carry valid photo ID for forest permits and hotel check-ins.'],
    'https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/38044214/pexels-photo-38044214.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37613726/pexels-photo-37613726.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Adventure', 20, 12, 'Premium Hotels',
    'Thrills in the Himalayas: Raft, trek, safari.', FALSE, FALSE, TRUE,
    ARRAY['uttarakhand', 'yoga', 'rishikesh', 'nainital', 'adventure', 'wildlife'], country_id, state_id,
    'Uttarakhand Adventure Tour Packages 2025 | Book from ₹12,999', 'Explore Uttarakhand''s adventure with rafting in Rishikesh, safari in Corbett, trekking in Nainital. 3D/11D packages starting ₹12,999. Book now!', ARRAY['Uttarakhand tour packages', 'Uttarakhand adventure tours', 'Rishikesh rafting package', 'Corbett National Park safari', 'Nainital trekking tours', 'Haridwar Ganga Aarti', 'yoga in Rishikesh', 'Himalayan adventure travel'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'adventure-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'pilgrimage-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d-rishikesh
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d-rishikesh', '02 Nights 03 Days: Delhi ! Haridwar ! Rishikesh ! Tour (Uttarakhand Tours Package)',
    2, 3, '2 Nights / 3 Days',
    0, TRUE,
    'https://images.pexels.com/photos/32111239/pexels-photo-32111239.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/32111236/pexels-photo-32111236.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32111279/pexels-photo-32111279.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29495753/pexels-photo-29495753.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19644655/pexels-photo-19644655.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Haridwar: Sacred Temples & Ganga Aarti', 'Your journey begins with a morning pickup from Delhi and a scenic drive to Haridwar. Upon arrival, check into your hotel and freshen up. In the afternoon, visit the Daksh Temple, known for its intricate architecture, followed by Pawan Dham, a modern temple complex with glass mosaics. Stroll through the bustling Moti Bazar, famous for religious souvenirs and local snacks. As evening falls, head to Har Ki Pauri to witness the spectacular Ganga Aarti, a fire ritual accompanied by chants and bells. Return to the hotel for dinner and an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Rishikesh: Divine Dip & Iconic Bridges', 'Start your day with a holy dip in the River Ganga at Haridwar. After breakfast, take a cable car ride to Mansa Devi Temple, perched on a hilltop, for panoramic views of the city. Then, transfer to Rishikesh, the ''Yoga Capital of the World.'' Visit Triveni Ghat, where the Ganga, Yamuna, and Saraswati rivers meet, and the ancient Bharat Mandir. Explore the Lakshman Temple and walk across the famed Lakshman Jhula and Ram Jhula suspension bridges. In the evening, attend the peaceful Ganga Aarti at Parmarth Niketan, an experience that will leave you spiritually uplifted. Return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Haridwar: Chandi Devi Temple & Return to Delhi', 'After breakfast, check out from the hotel and ride a cable car to Chandi Devi Temple, another hilltop shrine dedicated to Goddess Chandi, offering sweeping views of Haridwar and the Ganges. Later, begin your drive back to Delhi, with drop-off at your home, hotel, airport, or railway station as per your preference. The tour concludes with cherished memories of your spiritual journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'rishikesh'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'nainital'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 3 FROM "Destination" d WHERE d."slug" = 'jim-corbett'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d-rishikesh-mussoorie
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d-rishikesh-mussoorie', '04 Nights 05 Days: Delhi ! Haridwar ! Rishikesh ! Mussoorie ! Tour (Uttarakhand Tours Package)',
    4, 5, '4 Nights / 5 Days',
    1, FALSE,
    'https://images.pexels.com/photos/32111236/pexels-photo-32111236.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/32111239/pexels-photo-32111239.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32111279/pexels-photo-32111279.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29495753/pexels-photo-29495753.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19644655/pexels-photo-19644655.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Delhi to Haridwar: Arrival & Sacred Ganga Aarti', 'Upon arrival at Delhi, you are met by our representative and driven to Haridwar (210 km, ~5 hours), the ''Gateway to God'' and one of Hinduism''s holiest cities. In the evening, you witness the spectacular Ganga Aarti at Har Ki Pauri, where priests perform rituals with fire and chanting as the river flows by. Dinner and overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Haridwar to Mussoorie via Rishikesh: Spiritual Bridges & Scenic Drive', 'After breakfast, you drive towards Mussoorie, stopping en route at Rishikesh to explore the famous Ram Jhula and Laxman Jhula – iconic suspension bridges over the Ganges. You also visit old temples in this heritage city before continuing the journey. The drive takes you through the Doon Valley and Shiwalik ranges, offering breathtaking Himalayan views. Dinner and overnight stay at the hotel in Mussoorie.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Mussoorie: Colonial Charm & Scenic Sightseeing', 'After breakfast, you explore Mussoorie''s key attractions including the lively Kempty Falls, where you can enjoy the waterfall and views, serene Mussoorie Lake, and the historic Lal Bahadur Shastri National Academy of Administration. The hill station''s colonial architecture and pine-clad slopes provide a perfect retreat. Dinner and overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Dhanaulti: Excursion to Misty Meadows & Surkanda Devi Temple', 'Today, you take an excursion to Dhanaulti (24 km from Mussoorie), a tranquil hill station in the Garhwal hills known for its misty meadows and deodar forests. You also visit the ancient Mata Surkanda Devi Temple, perched at an altitude of 2,700 meters, offering panoramic vistas of the Himalayas. In the evening, return to Mussoorie for dinner and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Mussoorie to Delhi: Return Journey & Departure', 'After breakfast, you drive back to Delhi (290 km, ~7 hours) via the scenic Himalayan foothills. Upon arrival, you are dropped at Delhi Airport or Railway Station for your onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'rishikesh'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'nainital'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 3 FROM "Destination" d WHERE d."slug" = 'jim-corbett'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 4 FROM "Destination" d WHERE d."slug" = 'mussoorie'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-nainital-corbett
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-nainital-corbett', '05 Nights 06 Days: Delhi ! Mussoorie ! Corbett ! Nainital ! Tour (Uttarakhand Tours Package)',
    5, 6, '5 Nights / 6 Days',
    2, FALSE,
    'https://images.pexels.com/photos/32111279/pexels-photo-32111279.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/32111239/pexels-photo-32111239.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32111236/pexels-photo-32111236.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29495753/pexels-photo-29495753.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19644655/pexels-photo-19644655.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Delhi – Mussoorie: Scenic Drive to the Queen of Hills', 'Today after arriving at Delhi airport or railway station, you proceed to the hill station of Mussoorie, covering approximately 270 kilometers in about 7 hours. Upon arrival, check in to your hotel and spend the remainder of the evening at leisure, soaking in the cool mountain air. Overnight stay in Mussoorie.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Mussoorie: Kempty Falls and Himalayan Vistas', 'After breakfast, you explore the local sights of Mussoorie. Visit the plunging Kempty Falls, where you can enjoy the misty cascade and optional boat rides. Then head to Gun Hill, the second highest point in Mussoorie, offering breathtaking panoramic views of the Himalayan ranges and the Doon Valley. Spend some time shopping at the bustling Mall Road, known for its quaint shops and eateries. Evening is free for leisure. Overnight in Mussoorie.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Mussoorie to Corbett: Into the Wild', 'Today after breakfast, you depart for Jim Corbett National Park, a 250-kilometer drive taking approximately 6 hours. On arrival, check in to your hotel. You have the option to enjoy an evening safari at additional cost, exploring the park''s rich biodiversity. Corbett is famous for its Bengal tigers, elephants, sambar, chital, nilgai, and over 600 species of birds. Overnight in Corbett.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Corbett Morning Safari to Nainital', 'After an early breakfast, you check out and proceed for a morning safari in Jim Corbett National Park, offering a chance to spot wildlife in their natural habitat. Later, you drive to Nainital, covering 150 kilometers in approximately 6 hours. Upon arrival, check in to your hotel and the rest of the day is at leisure to explore the lake town on your own. Overnight in Nainital.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Nainital: Temples and Scenic Heights', 'After breakfast, you set out to explore Nainital. Visit the revered Naina Devi Temple, located on the northern shore of Naini Lake. Then head to Hanuman Garhi, a temple known for its panoramic views of the sunset. Ascend to Naina Peak, the highest point in Nainital, for breathtaking views of the snow-capped Himalayas and the Nainital Valley. In the evening, visit the local market on Mall Road, famous for its candles and handicrafts. Overnight in Nainital.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Nainital to Delhi: Departure', 'After breakfast, you check out and transfer to Delhi airport or railway station, covering approximately 300 kilometers in about 9 hours. You are then dropped off to board your flight or train for your onward journey or hometown. Tour concludes.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'rishikesh'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'nainital'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 3 FROM "Destination" d WHERE d."slug" = 'jim-corbett'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 4 FROM "Destination" d WHERE d."slug" = 'mussoorie'
  ON CONFLICT DO NOTHING;

  -- Variant: 10n-11d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '10n-11d', '10 Nights 11 Days: Delhi ! Char Dham ! Delhi ! Tour (Uttarakhand Tours Package)',
    10, 11, '10 Nights / 11 Days',
    3, FALSE,
    'https://images.pexels.com/photos/29495753/pexels-photo-29495753.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/32111239/pexels-photo-32111239.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32111236/pexels-photo-32111236.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32111279/pexels-photo-32111279.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19644655/pexels-photo-19644655.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Delhi to Haridwar: Arrival and Ganga Aarti', 'Depart from Delhi in the morning and drive to Haridwar, the gateway to the Char Dham. Upon arrival, check into your hotel and relax. In the evening, witness the spectacular Ganga Aarti at Har Ki Pauri, where thousands of devotees offer prayers to the holy river. Explore the bustling local markets before returning to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Haridwar to Phoolchatti: Gateway to Yamunotri', 'After breakfast, drive to Phoolchatti via Barkot, a scenic town at the foot of the Himalayas. En route, enjoy panoramic views of the Yamuna valley and the surrounding hills. Arrive in Phoolchatti, the base camp for the Yamunotri temple trek. Check into your hotel and spend the evening at leisure, soaking in the serene mountain atmosphere. Overnight in Phoolchatti.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Phoolchatti to Harshil: Himalayan Hamlet', 'Today, drive to Harshil, a picturesque hamlet nestled in the Bhagirathi valley. The route offers stunning views of snow-capped peaks and dense forests. Stop at the Harshil village to admire the apple orchards and the pristine environment. Visit the local temples and enjoy a peaceful evening in this offbeat destination. Overnight stay in Harshil.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Harshil to Gangotri and Uttarkashi: Source of the Ganges', 'Early morning, proceed to Gangotri, one of the four Char Dham sites. Visit the sacred Gangotri temple, dedicated to Goddess Ganga, situated on the banks of the Bhagirathi River. After offering prayers, drive to Uttarkashi, a holy town on the banks of the Ganges. En route, stop at the confluence of rivers and enjoy the scenic beauty. Overnight in Uttarkashi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Uttarkashi to Guptkashi via Chamba and New Tehri', 'Depart from Uttarkashi and travel to Guptkashi via Chamba and New Tehri. The drive passes through the Tehri Dam, one of the largest hydroelectric projects in India, offering breathtaking views of the reservoir. Arrive in Guptkashi, a small town known for its ancient Vishwanath temple. Check into your hotel and rest for the upcoming Kedarnath trek. Overnight in Guptkashi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Guptkashi to Kedarnath: The Himalayan Shrine', 'Travel to Gaurikund, the base for the Kedarnath trek. From Gaurikund, begin the 22 km trek to Kedarnath, or opt for a helicopter ride (at additional cost). Upon reaching Kedarnath, visit the ancient Kedarnath temple, one of the twelve Jyotirlingas, dedicated to Lord Shiva. The temple is surrounded by majestic snow-clad peaks. After the darshan, either stay overnight in Kedarnath or trek back to Gaurikund. Overnight in Gaurikund or Kedarnath as per arrangements.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 7, 'Kedarnath to Tilwara: Descent via Rampur', 'After morning prayers at Kedarnath, trek back to Gaurikund. Drive to Rampur, a quaint town on the banks of the Ramganga River. Continue to Tilwara, a quiet hill station known for its apple orchards and panoramic views. Check into your hotel and relax after the strenuous trek. Enjoy a peaceful evening in the lap of nature. Overnight in Tilwara.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 8, 'Tilwara to Badrinath via Joshimath: Divine Darshan', 'Drive from Tilwara to Joshimath, the winter seat of Badrinath. Visit the Joshimath temple, where the idol of Badrinath is brought during winter. Continue to Badrinath, the most revered of the Char Dham shrines. Offer prayers at the Badrinath temple, dedicated to Lord Vishnu, and take a holy dip in the Tapt Kund hot spring. Spend the evening exploring the town. Overnight in Badrinath.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 9, 'Badrinath to Kaleshwar via Joshimath: Return Journey', 'After morning darshan at Badrinath, drive back to Joshimath. En route, stop at the scenic viewpoints. Continue to Kaleshwar, a sacred town known for the Kaleshwar Mahadev temple, dedicated to Lord Shiva. The temple is located on the banks of the Alaknanda River and offers a tranquil atmosphere. Check into your hotel and unwind. Overnight in Kaleshwar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 10, 'Kaleshwar to Haridwar via Kaudiyala: River Rafting Adventure', 'Depart from Kaleshwar and drive to Kaudiyala, a popular spot for white water rafting on the Ganges. Enjoy an exhilarating rafting experience on the rapids (optional, at own cost). Later, continue to Haridwar. Upon arrival, check into your hotel. Spend the evening exploring the local markets or visiting the temples. Overnight in Haridwar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 11, 'Haridwar to Delhi: Departure', 'After breakfast, check out from the hotel and drive back to Delhi. The journey takes approximately 6-7 hours. Drop-off at your desired location in Delhi (airport, railway station, or hotel). The tour concludes with cherished memories of the Char Dham pilgrimage.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'rishikesh'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'nainital'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 3 FROM "Destination" d WHERE d."slug" = 'jim-corbett'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'goa';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'goa-beach-holidays', 'Goa Beach Holiday Packages',
    'Goa, India''s beach paradise, offers a perfect blend of golden sands, vibrant nightlife, and Portuguese colonial heritage. From the bustling shores of Calangute and Baga to the serene coves of Palolem and Agonda, each beach has its own character. Beyond the beaches, explore 16th-century forts like Aguada and Chapora, spice plantations, and the Latin Quarter of Fontainhas. Mother India Tour Travels crafts personalized Goa packages with premium beach resorts, exclusive water-sports, and curated local experiences to make your holiday truly memorable.',
    ARRAY['Sunset party at Tito’s Lane in Baga with live music and beach shacks', 'Watersports at Calangute Beach including parasailing, jet-skiing, and banana boat rides', 'Visit to the 400-year-old Fort Aguada with panoramic Arabian Sea views', 'Traditional Goan fish curry and feni tasting at a local restaurant in Panjim', 'Dolphin spotting cruise from Palolem Beach with snorkeling in clear waters'],
    ARRAY['Accommodation in 4-star beach resort with breakfast and dinner', 'Private airport transfers from Goa International Airport', 'Daily scheduled sightseeing in air-conditioned vehicle with English-speaking driver', 'Half-day water sports package at Candolim Beach (2 activities per person)', 'Guided tour of Old Goa churches and Fort Aguada with entry fees', 'Sunset cruise on Mandovi River with live entertainment and snacks', 'All applicable taxes and GST'],
    ARRAY['International or domestic airfare to/from Goa', 'Lunch and beverages (except as specified in inclusions)', 'Personal expenses like laundry, shopping, and tips', 'Camera fees at monuments and churches', 'Travel insurance (recommended to purchase separately)'],
    ARRAY['Beach activities depend on weather and sea conditions; water sports are generally available from November to May.', 'Goa has a mandatory plastic ban; carry eco-friendly bags for shopping.', 'Many beach shacks operate only during the peak season (October–April); advance booking recommended.'],
    'https://images.pexels.com/photos/28159570/pexels-photo-28159570.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/8037061/pexels-photo-8037061.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/4429334/pexels-photo-4429334.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/14581330/pexels-photo-14581330.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27869485/pexels-photo-27869485.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Beach', 20, 12, 'Premium Hotels',
    'Goa''s beaches, nightlife & heritage – we curate it all.', TRUE, FALSE, TRUE,
    ARRAY['goa', 'beach', 'nightlife', 'water-sports', 'portuguese-heritage'], country_id, state_id,
    'Goa Beach Holiday Packages 2025 | Book from ₹7,999', 'Explore Goa beach packages with water sports, nightlife & heritage tours. 1-4 day options starting ₹7,999. Book now for best beach resorts & customized itine...', ARRAY['Goa beach packages', 'Goa holiday packages', 'Goa tour packages 2025', 'Goa water sports packages', 'Goa nightlife packages', 'Goa beach resort deals', 'Goa Portuguese heritage tours', 'Goa budget holiday packages'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'beach-holidays'
  ON CONFLICT DO NOTHING;

  -- Variant: 3n-4d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '3n-4d', 'Goa Tour Packages 03 Nights 4 Days Tour',
    3, 4, '3 Nights / 4 Days',
    0, TRUE,
    'https://images.pexels.com/photos/14581330/pexels-photo-14581330.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/10521296/pexels-photo-10521296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32262475/pexels-photo-32262475.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32262469/pexels-photo-32262469.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/8037061/pexels-photo-8037061.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Arrival in Goa & Old Goa Heritage Tour', 'Upon arrival at Goa airport or railway station, our representative assists you with a smooth transfer to the hotel. After checking in, you set out to explore Old Goa''s Portuguese heritage. Visit the majestic Basilica of Bom Jesus and the Chapel of St. Francis Xavier, centuries-old cathedrals that showcase baroque architecture. Later, head to Fort Aguada, a 17th-century Portuguese fort offering panoramic views of the Arabian Sea. The day concludes with an overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'North Goa Beaches & Nightlife Experience', 'The second day is dedicated to the iconic beaches of North Goa. You visit Anjuna Beach, famous for its vibrant flea market where you can shop for traditional jewellery, handicrafts, and souvenirs. Next, head to Baga and Calangute beaches, where you indulge in thrilling water sports like parasailing, scuba diving, and water skiing. As evening falls, you experience Goa''s legendary nightlife, with options to visit beach shacks, clubs, or live music venues. Overnight stay in Goa.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'South Goa Beach Relaxation at Colva', 'On the third day, you journey to South Goa to explore Colva Beach, known for its pristine white sand and clear waters. The beach is dotted with shacks, resort complexes, and eateries, offering a more relaxed vibe than its northern counterparts. You spend the day sunbathing, swimming, or enjoying a beachside massage. In the evening, you can stroll along the promenade and savor fresh seafood at local restaurants. Overnight stay in Goa.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Departure from Goa', 'After breakfast at the hotel, you check out and are transferred to Goa Airport or Railway Station for your onward journey. The drive gives you one last glimpse of Goa''s lush landscapes and coastal beauty, leaving you with cherished memories of your beach holiday.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'goa'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d', 'Book This Package 02 Nights 3 Days',
    2, 3, '2 Nights / 3 Days',
    1, FALSE,
    'https://images.pexels.com/photos/10521296/pexels-photo-10521296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14581330/pexels-photo-14581330.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32262475/pexels-photo-32262475.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/32262469/pexels-photo-32262469.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/8037061/pexels-photo-8037061.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Goa: North Goa Beach Hopping & Water Sports', 'Arrive in Goa in the morning and proceed for a full day of North Goa sightseeing. Visit the famous beaches of Calangute, Baga, and Anjuna, where you can indulge in exhilarating water sports such as parasailing, scuba diving, and water skiing. Later, explore the Anjuna Flea Market, renowned for traditional jewellery, handicrafts, and souvenirs. Overnight stay at your hotel in Goa.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Goa: South Goa Relaxation & Vibrant Nightlife', 'After breakfast, head straight to South Goa and visit Colva Beach, a popular stretch lined with shacks, resort complexes, tourist cottages, discos, and eateries. Spend the day relaxing or exploring the beach. In the evening, experience Goa''s legendary nightlife at Tito''s bar, one of the most happening party spots. Alternatively, visit Ingo''s Saturday Night Bazaar for unique shopping and entertainment. Return to your hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Goa: Departure from Goa', 'Enjoy a final breakfast at the hotel before checking out. Then, transfer to Goa Airport or railway station to board your flight or train for your onward journey, taking with you memories of sun, sand, and sea.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'goa'
  ON CONFLICT DO NOTHING;

  -- Variant: 0n-1d-day-trip
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '0n-1d-day-trip', '04 Nights 05 Days Tour',
    0, 1, 'Same Day Tour',
    2, FALSE,
    'https://images.pexels.com/photos/28159570/pexels-photo-28159570.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/8037061/pexels-photo-8037061.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/4429334/pexels-photo-4429334.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/14581330/pexels-photo-14581330.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27869485/pexels-photo-27869485.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Goa: Arrival & Old Goa Heritage Tour', 'Upon arrival at Goa airport or railway station, your tour representative greets you and assists with a smooth transfer to your pre-booked hotel. The afternoon is dedicated to exploring Old Goa''s rich Portuguese heritage. Visit the iconic Basilica of Bom Jesus, a UNESCO World Heritage Site housing the remains of St. Francis Xavier, and the nearby Chapel of St. Francis Xavier. Later, head to the imposing Fort Aguada, a 17th-century Portuguese fort offering panoramic views of the Arabian Sea. Return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'goa'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
  var_id_5 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'nepal';
  state_id := NULL;

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'nepal-himalayan', 'Nepal Himalayan Tour Packages',
    'Nepal, home to eight of the world''s fourteen highest peaks, offers an unparalleled adventure amidst the Himalayas. From the sacred temples of Kathmandu''s Durbar Square to the serene Phewa Lake in Pokhara, and the birthplace of Buddha in Lumbini, this tour unveils the cultural and natural gems of Nepal. Trek through the Annapurna foothills, witness sunrise over Machhapuchhre from Sarangkot, and explore ancient stupas and monasteries. Mother India Tour Travels curates seamless itineraries with expert guides, altitude-friendly logistics, and authentic local experiences, ensuring a safe and thrilling Himalayan adventure.',
    ARRAY['Sunrise over the Annapurna and Machhapuchhre ranges from Sarangkot viewpoint in Pokhara', 'Guided exploration of Kathmandu Valley''s UNESCO sites: Swayambhunath Stupa, Pashupatinath Temple, and Boudhanath Stupa', 'Visit to Lumbini''s sacred Maya Devi Temple, the exact birthplace of Lord Buddha, and the Peace Pagoda', 'White-water rafting or paragliding over Pokhara''s Phewa Lake with mountain backdrop', 'Trekking through rhododendron forests and traditional Gurung villages on the Annapurna Panorama trail'],
    ARRAY['Accommodation in 3-4 star hotels or mountain lodges as per itinerary', 'Daily breakfast and select meals (lunch/dinner) during trekking days', 'English-speaking local guide for all sightseeing and treks', 'All ground transfers in private air-conditioned vehicle', 'Domestic flight (Kathmandu-Pokhara or Pokhara-Kathmandu) if applicable', 'Permits for trekking (ACAP, TIMS) and entry fees for monuments', '24/7 customer support and emergency evacuation arrangement'],
    ARRAY['International airfare and Nepal visa fees', 'Travel insurance (mandatory for trekking)', 'Meals not mentioned in inclusions, beverages, and tips', 'Personal expenses such as laundry, phone calls, and souvenirs', 'Extra nights or upgrades beyond the package itinerary'],
    ARRAY['Altitude acclimatization is essential for any trek above 3,000 meters; our itineraries include rest days.', 'Visa on arrival is available for most nationalities at Kathmandu airport (fee in USD).', 'Best seasons: March to May for clear skies, and October to November for mild temperatures and mountain views.'],
    'https://images.pexels.com/photos/36053351/pexels-photo-36053351.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/36564643/pexels-photo-36564643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29651627/pexels-photo-29651627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19835039/pexels-photo-19835039.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37802524/pexels-photo-37802524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Adventure', 20, 12, 'Premium Hotels',
    'Nepal''s Himalayas, temples, and lakes await your adventure.', FALSE, FALSE, FALSE,
    ARRAY['nepal', 'himalayas', 'kathmandu', 'pokhara', 'trekking', 'buddhism'], country_id, state_id,
    'Nepal Himalayan Tour Packages 2025 | Adventure from ₹25,000', 'Discover Nepal''s Himalayan wonders: Kathmandu''s temples, Pokhara''s lakes, Lumbini''s peace, and trekking trails. Package options 1-6 days from ₹25,000. Book now!', ARRAY['Nepal tour packages', 'Himalayan trekking', 'Kathmandu Pokhara tour', 'Lumbini pilgrimage', 'adventure travel Nepal', 'best Nepal tours', 'Nepal travel 2025', 'Mother India Travels'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'international-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'adventure-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 0n-1d-day-trip
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '0n-1d-day-trip', 'Nepal mountain Venture tour for 9 nights & 10 days',
    0, 1, 'Same Day Tour',
    0, TRUE,
    'https://images.pexels.com/photos/29651627/pexels-photo-29651627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/36053351/pexels-photo-36053351.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/36564643/pexels-photo-36564643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19835039/pexels-photo-19835039.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37802524/pexels-photo-37802524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Kathmandu: Arrival and Welcome Briefing', 'Upon arrival at Tribhuvan International Airport in Kathmandu, you are warmly received by our representative and transferred to your hotel. After settling in, a short briefing about the program provides an overview of the exciting days ahead. The evening is free for relaxation or a leisurely stroll in the Thamel district, setting the stage for your Himalayan adventure.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kathmandu'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pokhara'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'lumbini'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d-himalayan
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d-himalayan', 'Tour Itinerary:- 04 Night 05 Day’s Himalayan Panorama Tour',
    4, 5, '4 Nights / 5 Days',
    1, FALSE,
    'https://images.pexels.com/photos/36564643/pexels-photo-36564643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/36053351/pexels-photo-36053351.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29651627/pexels-photo-29651627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19835039/pexels-photo-19835039.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37802524/pexels-photo-37802524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Arrival in Kathmandu: Transfer and Program Briefing', 'Upon arrival at Tribhuvan International Airport in Kathmandu, you are received by our representative and transferred to your hotel. After check-in, a short briefing outlines the program for the days ahead. The evening is free to rest or explore the local area at your own pace. Overnight stay in Kathmandu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Kathmandu: Full-Day Guided Heritage Sightseeing', 'After breakfast, you embark on a guided sightseeing tour of Kathmandu''s most iconic landmarks. The morning covers Kathmandu Durbar Square, a historic royal palace complex, and Swayambhunath Stupa (Monkey Temple), offering panoramic city views. After lunch, you visit the massive Bouddhanath Stupa, a center of Tibetan Buddhism, and the sacred Pashupatinath Temple dedicated to Lord Shiva. The evening is at leisure back at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Kathmandu to Nagarkot: Bhaktapur Visit and Himalayan Views', 'Today you drive to Nagarkot, famous for its Himalayan panorama. En route, you stop at the medieval Newari town of Bhaktapur, a UNESCO World Heritage Site. Explore its well-preserved palaces, temples, and squares such as Durbar Square, 55 Window Palace, and Nyatapola Temple. Continue to Nagarkot and check into your resort. Spend the evening soaking in the stunning mountain views. Overnight in Nagarkot.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Nagarkot Sunrise and Return to Kathmandu: Leisure Day', 'Wake up early to witness the spectacular sunrise over the Himalayas from Nagarkot viewpoint, with peaks like Mount Everest, Annapurna, and Langtang visible on clear days. After breakfast, drive back to Kathmandu. The rest of the day is free for personal activities such as shopping in Thamel or visiting local markets. Overnight stay in Kathmandu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Kathmandu: Optional Everest Flight and Departure', 'In the morning, you have the option to take an Everest Mountain flight (additional cost) for a one-hour scenic flight over the Himalayas, offering close-up views of Mount Everest and surrounding peaks. After the flight, you are transferred to the airport for your final departure or joining another program. End of tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kathmandu'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pokhara'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'lumbini'
  ON CONFLICT DO NOTHING;

  -- Variant: 3n-4d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '3n-4d', 'Short Trekking In Nepal/Royal Trek – 03 Night’s 04 Day’s',
    3, 4, '3 Nights / 4 Days',
    2, FALSE,
    'https://images.pexels.com/photos/36053351/pexels-photo-36053351.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/36564643/pexels-photo-36564643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29651627/pexels-photo-29651627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19835039/pexels-photo-19835039.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37802524/pexels-photo-37802524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Pokhara to Kalikasthan: Drive to Bijaypur & Trek to Scenic Ridge', 'After a short drive from Pokhara to the trailhead at Bijaypur, the trek begins with a gentle ascent through lush farmlands and small settlements. The trail climbs steadily, offering panoramic views of the Annapurna and Manaslu ranges as you approach the village of Kalikasthan (1370m). This peaceful Gurung settlement perched on a ridge welcomes you with warm hospitality and stunning sunset vistas over the Himalayas.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Kalikasthan to Shaklung: Rhododendron Forests & Mountain Panoramas', 'The second day''s trek leads from Kalikasthan to Shaklung (1730m), winding through dense rhododendron and oak forests alive with bird calls. The trail occasionally opens to reveal sweeping views of the Annapurna massif and the deep valleys below. Shaklung is a tiny hamlet where traditional stone houses and terraced fields blend into the mountainside, offering an intimate glimpse into rural Nepali life.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Shaklung to Chisopani: Descend into Subtropical Greenery', 'Today''s journey descends from Shaklung to Chisopani, passing through terraced rice paddies and subtropical vegetation. The trail meanders along ridges with constant views of the Annapurna foothills. Chisopani, a village known for its friendly locals and simple lodges, provides a perfect base to relax and soak in the tranquil mountain atmosphere before the final day.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Chisopani to Begnas Lake & Return to Pokhara: Lakeside Finale', 'The final trekking day descends gently through farmlands and forests to the pristine Begnas Lake, a tranquil freshwater lake surrounded by lush hills. Upon arrival, enjoy a well-deserved rest by the lakeside, perhaps dipping your feet in the cool water. After a brief stop, you''ll drive back to Pokhara, where the tour concludes with memories of serene trails and majestic peaks.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kathmandu'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pokhara'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'lumbini'
  ON CONFLICT DO NOTHING;

  -- Variant: 3n-4d-v2
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '3n-4d-v2', 'Nepal Tour Package for 04 Days',
    3, 4, '3 Nights / 4 Days',
    3, FALSE,
    'https://images.pexels.com/photos/36053351/pexels-photo-36053351.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/36564643/pexels-photo-36564643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29651627/pexels-photo-29651627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19835039/pexels-photo-19835039.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37802524/pexels-photo-37802524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Kathmandu: Arrival & Thamel Stroll', 'Upon arrival at Tribhuvan International Airport, you receive a warm welcome and are transferred to your hotel in Kathmandu. After check-in, take time to relax and freshen up. In the evening, explore the vibrant streets of Thamel at your leisure, browsing shops, cafes, and local handicrafts. Overnight stay in Kathmandu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Kathmandu: Spiritual & Heritage Sightseeing', 'Immerse yourself in Kathmandu’s rich cultural heritage with a full-day sightseeing tour. Start your day with visits to Pashupatinath Temple and Guheshwori Temple, two of the holiest Hindu sites. Continue to Boudhanath Stupa, one of the largest stupas in the world, where you see prayer flags fluttering. In the afternoon, explore Swayambhunath Stupa, also known as the Monkey Temple, offering panoramic city views. Conclude the day at Kathmandu Durbar Square, a historic palace complex showcasing traditional Nepalese architecture. Overnight stay in Kathmandu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Nagarkot & Bhaktapur: Sunrise & Medieval Marvels', 'Early morning, drive to Nagarkot, a hill station renowned for breathtaking sunrise views over the Himalayas. On a clear day, you may even see Mount Everest in the distance. After breakfast, travel to Bhaktapur, an ancient city rich in history and Newari heritage. Midday, explore Bhaktapur Durbar Square, a UNESCO-listed site with intricate architecture. Visit Nyatapola Temple, Bhairavnath Temple, and other landmarks adorned with exquisite wood and stone craftsmanship. Enjoy a traditional Nepali lunch at a local restaurant in Bhaktapur. Overnight stay in Kathmandu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Kathmandu: Departure with Memories', 'After breakfast at your hotel, you will be transferred to Tribhuvan International Airport for your departure, carrying unforgettable memories of Nepal’s stunning landscapes, spiritual landmarks, and vibrant culture.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kathmandu'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pokhara'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'lumbini'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d-himalayan-v2
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d-himalayan-v2', 'Himalayan Panorama Tour Package for 05 Days',
    4, 5, '4 Nights / 5 Days',
    4, FALSE,
    'https://images.pexels.com/photos/36053351/pexels-photo-36053351.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/36564643/pexels-photo-36564643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29651627/pexels-photo-29651627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19835039/pexels-photo-19835039.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37802524/pexels-photo-37802524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Kathmandu: Arrival & Spiritual Evening at Pashupatinath', 'Upon arrival at Tribhuvan International Airport, your representative escorts you to a pre-booked hotel. In the evening, you visit the sacred Pashupatinath Temple, one of Hinduism''s holiest shrines, and the massive Boudhanath Stupa, a UNESCO site. You join the evening sandhya aarti ceremony at Pashupatinath, a mesmerizing ritual of lamps and chants along the Bagmati River. Overnight stay at the hotel in Kathmandu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Kathmandu: Durbar Square & Buddhist Shrines Guided Tour', 'After breakfast, you enjoy a half-day guided sightseeing tour of Kathmandu Durbar Square, a historic plaza of palaces and temples, and Swayambhunath Stupa (Monkey Temple), offering panoramic valley views. In the afternoon, you revisit Boudhanath Stupa and Pashupatinath Temple to delve deeper into their spiritual significance. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Kathmandu to Nagarkot: Bhaktapur Stopover & Himalayan Views', 'You drive from Kathmandu to Nagarkot, a hill station famous for Himalayan panoramas. En route, you stop at the ancient Newari town of Bhaktapur, a well-preserved medieval city with its Durbar Square, Nyatapola Temple, and pottery square. Arriving in Nagarkot, you check into a resort and enjoy the serene mountain atmosphere. Overnight stay at the resort.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Nagarkot to Kathmandu: Sunrise & Leisure Day', 'Wake up early to witness a spectacular sunrise over the Himalayan peaks, including Mount Everest on clear days, from Nagarkot''s viewpoint. After the magnificent panorama, you drive back to Kathmandu. The rest of the day is free for shopping in Thamel or personal activities. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Kathmandu: Everest Mountain Flight & Departure', 'In the morning, you have the option to take an Everest Mountain Flight for an unforgettable aerial view of the world''s highest peaks. After the flight or free time, you are transferred to Tribhuvan International Airport for your final departure, or you may join another program with Mother India Travels. Depart with memories of Nepal''s Himalayan grandeur.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kathmandu'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pokhara'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'lumbini'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-lumbini-spiritual
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-lumbini-spiritual', 'Spiritual Tour Package  Kathmandu, Lumbini, for 06 Days',
    5, 6, '5 Nights / 6 Days',
    5, FALSE,
    'https://images.pexels.com/photos/36053351/pexels-photo-36053351.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/36564643/pexels-photo-36564643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29651627/pexels-photo-29651627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19835039/pexels-photo-19835039.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37802524/pexels-photo-37802524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_5;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_5;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 1, 'Kathmandu: Arrival and Thamel Exploration', 'Upon arrival at Tribhuvan International Airport, a warm welcome awaits you. You are transferred to your hotel in Kathmandu for check-in and relaxation. In the evening, step out to explore the vibrant Thamel district, a lively hub of shops, cafes, and local culture. Overnight stay in Kathmandu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 2, 'Kathmandu: UNESCO Heritage Sites Tour', 'Today is dedicated to Kathmandu''s rich cultural heritage. Begin with a visit to the sacred Pashupatinath Temple and the nearby Gujeshowri Temple. Proceed to the colossal Boudhanath Stupa, a UNESCO World Heritage Site and one of the largest stupas in the world. In the afternoon, ascend to Swayambhunath Stupa, also known as the Monkey Temple, offering panoramic valley views. Conclude the day at Kathmandu Durbar Square, a historic palace square showcasing exquisite Nepalese architecture.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 3, 'Nagarkot Sunrise and Drive to Pokhara via Manakamana', 'Early morning you drive to Nagarkot to witness a spectacular sunrise over the Himalayan range, including Mt. Everest on clear days. After the sunrise, return to Kathmandu for breakfast. Then embark on a scenic drive to Manakamana Temple, accessible via an exhilarating cable car ride with stunning mountain views. After seeking blessings, continue your journey to Pokhara. Upon arrival, check into your hotel and spend the evening relaxing or exploring the lakeside area. Overnight in Pokhara.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 4, 'Pokhara: Lakes, Caves, and Peace Pagoda', 'Start your day with a tranquil boat ride on Phewa Lake, reflecting the majestic Annapurna range. Visit the Tal Barahi Temple situated on an island in the lake. Next, explore the roaring Davis Falls and the adjacent Gupteshwor Mahadev Cave. In the afternoon, climb to the Peace Pagoda, a serene Buddhist stupa offering panoramic views of Pokhara Valley and the Annapurna Himalayas. Overnight stay in Pokhara.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 5, 'Pokhara to Kathmandu: Return Journey and Leisure', 'After breakfast, drive back to Kathmandu through scenic hills and countryside. Upon arrival, check into your hotel. The remainder of the day is at your leisure. You may choose to do last-minute shopping in Thamel or visit the tranquil Garden of Dreams, a neo-classical garden in the heart of the city. Overnight in Kathmandu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 6, 'Kathmandu: Departure', 'Enjoy a final breakfast at your hotel before being transferred to Tribhuvan International Airport for your departure. As you leave, carry with you the spiritual essence and natural splendor of Nepal. Safe travels!', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kathmandu'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pokhara'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 2 FROM "Destination" d WHERE d."slug" = 'lumbini'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
  var_id_5 TEXT;
  var_id_6 TEXT;
  var_id_7 TEXT;
  var_id_8 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'delhi';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'india-holiday-tours', 'India Holiday Tour Packages',
    'India’s cultural heart beats in the Golden Triangle and the spiritual city of Varanasi. Delhi’s Mughal legacy, Agra’s timeless Taj Mahal, Jaipur’s regal palaces, and Varanasi’s living traditions create an unmatched journey through history and faith. Mother India Tour Travels curates this classic tour with meticulous attention to detail, from sunrise at the Taj to the Ganga Aarti on the ghats. Our expert guides and seamless logistics ensure you experience the soul of India, whether you have one day or fifteen.',
    ARRAY['Witness the Taj Mahal at sunrise from Mehtab Bagh, then explore Agra Fort’s red sandstone halls.', 'Ride a cycle rickshaw through Chandni Chowk, sampling parathas at Paranthe Wali Gali in Old Delhi.', 'Attend the evening Ganga Aarti at Dashashwamedh Ghat in Varanasi, with priests chanting and lamps floating on the river.', 'Walk through Jaipur’s Hawa Mahal and City Palace, followed by a live block-printing demonstration at a local workshop.', 'Explore Qutub Minar and Humayun’s Tomb in Delhi, then savor Mughlai biryani at the legendary Karim’s restaurant.'],
    ARRAY['Accommodation in 3-5 star hotels with daily breakfast', 'Private air-conditioned vehicle for all transfers and sightseeing', 'English-speaking local guides in each city', 'All monument entrance fees (excluding camera fees)', 'Sunrise visit to Taj Mahal including parking charges', 'Boat ride on the Ganges in Varanasi for Ganga Aarti', 'One dinner at a heritage hotel or rooftop restaurant'],
    ARRAY['International or domestic airfare (unless specified)', 'Visa fees and travel insurance', 'Personal expenses such as laundry, phone calls, and tips', 'Camera/video fees at monuments', 'Any meals not mentioned in the inclusions'],
    ARRAY['Best time to visit is October to March for pleasant weather.', 'Regions include historic sites with uneven terrain; comfortable walking shoes are recommended.', 'Customizations available for groups, solo travelers, and special interests. Contact us for a tailor-made itinerary.'],
    'https://images.pexels.com/photos/18881274/pexels-photo-18881274.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/33797752/pexels-photo-33797752.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29232159/pexels-photo-29232159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19867674/pexels-photo-19867674.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31817439/pexels-photo-31817439.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Classic', 20, 12, 'Premium Hotels',
    'Classic India tour: Delhi, Agra, Jaipur & Varanasi. Book now!', FALSE, FALSE, TRUE,
    ARRAY['india', 'holiday', 'multi-destination', 'culture', 'heritage'], country_id, state_id,
    'India Holiday Tour Packages 2025 | Golden Triangle & Vara...', 'Explore Delhi, Agra, Jaipur & Varanasi with our classic India holiday tours. From 1 to 15 days, immerse in culture, heritage & spirituality. Book now!', ARRAY['India holiday packages', 'Golden Triangle tour', 'Varanasi tour packages', 'cultural tours India', 'luxury India tours', 'Delhi Agra Jaipur tour', 'multi-destination India', 'heritage travel India'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'heritage-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 11n-12d-pushkar-ranthambore
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '11n-12d-pushkar-ranthambore', '11Nt./12D Tour: Delhi, Agra, Ranthambore, Jaipur, Pushkar, Jaisalmer, Bikaner, Mandawa, Delhi:',
    11, 12, '11 Nights / 12 Days',
    0, TRUE,
    'https://images.pexels.com/photos/18881274/pexels-photo-18881274.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/33797752/pexels-photo-33797752.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29232159/pexels-photo-29232159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19867674/pexels-photo-19867674.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31817439/pexels-photo-31817439.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Delhi: Arrival and Warm Welcome', 'Upon arrival at Delhi International Airport, a company representative greets you and assists with your transfer to the hotel. The rest of the day is at leisure to relax or begin exploring the bustling capital at your own pace.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Delhi: Mughal Legacy and Colonial Grandeur', 'After breakfast, you embark on a full-day sightseeing tour of Old and New Delhi. Visit the majestic Jama Masjid, the sprawling Red Fort, and Rajghat, the memorial of Mahatma Gandhi. In New Delhi, you see India Gate, the President''s House, and Parliament House, then explore the Qutub Minar, Lotus Temple, and Humayun''s Tomb, all UNESCO World Heritage sites.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Delhi to Agra: Iconic Taj Mahal and Agra Fort', 'After breakfast, you drive to Agra (approx. 3.5 hours). Upon arrival, you visit the breathtaking Taj Mahal, a UNESCO World Heritage site and one of the Seven Wonders of the World. Later, explore the massive Agra Fort, a red sandstone fortress that offers stunning views of the Taj. The evening is free for leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Agra to Ranthambore: Into the Tiger Realm', 'After breakfast, you drive to Ranthambore (approx. 5 hours), home to the famous Ranthambore National Park. Check into your hotel and enjoy the rest of the day at leisure, with the option to prepare for an early morning safari.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 5, 'Ranthambore: Jungle Safari and Drive to Jaipur', 'Early morning, you embark on a jungle safari in Ranthambore National Park (own arrangement) to spot tigers and other wildlife. After breakfast, you drive to Jaipur (approx. 3.5 hours), the Pink City. The evening is at leisure to explore local markets or rest.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 6, 'Jaipur: Amber Fort and Pink City Treasures', 'After breakfast, you visit the ancient capital of Amber, including the magnificent Amber Fort, perched on a hill. Continue to Jaipur city to see the iconic Hawa Mahal (Palace of Winds), the City Palace, and Jantar Mantar (astronomical observatory). Later, you visit a block printing and gemstone cutting factory, showcasing centuries-old crafts.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 7, 'Jaipur to Pushkar: Holy City and Sacred Lake', 'After breakfast, you drive to Pushkar (approx. 2.5 hours), a holy Hindu city. Upon arrival, visit the famous Brahma Temple, one of the few in the world dedicated to Lord Brahma. Also explore the Camel Fair Ground and the sacred Pushkar Lake. The evening is at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 8, 'Pushkar to Jaisalmer: Gateway to the Thar Desert', 'After breakfast, you drive to Jaisalmer (approx. 6 hours), the Golden City. Check into your hotel and enjoy the rest of the day at leisure, soaking in the desert ambiance.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 9, 'Jaisalmer: Fort, Desert Village, and Cultural Night', 'After breakfast, you check out from the hotel and visit the imposing Jaisalmer Fort and the intricately carved Ludarwa Jain Temple. After lunch, you drive to Khuri Desert Village to enjoy the sand dunes at sunset with a camel ride. Return to a desert camp for a Rajasthani folk dance performance and dinner.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 10, 'Jaisalmer to Bikaner: Rat Temple and Royal Charm', 'After breakfast, you drive to Bikaner (approx. 4 hours). Upon check-in at the hotel, in the evening you visit the world-famous Deshnok Temple (Karni Mata Temple), known for its resident rats. The rest of the evening is at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 11, 'Bikaner to Mandawa: Fort and Haveli Walk', 'After breakfast, you visit the magnificent Junagarh Fort in Bikaner. Then drive to Mandawa (approx. 3 hours). In the evening, enjoy a walking tour of the old town to see the beautifully painted havelis (mansions) with intricate frescoes.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 12, 'Mandawa to Delhi: Departure', 'After breakfast, you drive back to Delhi (approx. 5 hours). Upon arrival, you are transferred to Delhi Airport for your onward flight, marking the end of your memorable North India tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 4 FROM "Destination" d WHERE d."slug" = 'pushkar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 5 FROM "Destination" d WHERE d."slug" = 'jaisalmer'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 6 FROM "Destination" d WHERE d."slug" = 'bikaner'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 7 FROM "Destination" d WHERE d."slug" = 'ranthambore'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 8 FROM "Destination" d WHERE d."slug" = 'mandawa'
  ON CONFLICT DO NOTHING;

  -- Variant: 14n-15d-udaipur-pushkar
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '14n-15d-udaipur-pushkar', '14Nt./15D Tour: Delhi, Agra, Ranthambore, Jaipur, Pushkar, Mandawa, Bikaner, Jaisalmer, Jodhpur, Udaipur Drop.',
    14, 15, '14 Nights / 15 Days',
    1, FALSE,
    'https://images.pexels.com/photos/18881274/pexels-photo-18881274.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/33797752/pexels-photo-33797752.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29232159/pexels-photo-29232159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19867674/pexels-photo-19867674.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31817439/pexels-photo-31817439.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Delhi: Arrival & Leisure', 'Upon arrival at Delhi Airport, a company representative greets and assists you. Transfer to your hotel and enjoy the rest of the day at leisure to acclimatize or explore nearby areas independently.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Delhi: Old & New Delhi Sightseeing', 'After breakfast, embark on a full-day tour of Delhi. Visit the majestic Jama Masjid, the imposing Red Fort, and Rajghat, the cremation site of Mahatma Gandhi. Then explore New Delhi landmarks including India Gate, the President''s House, Parliament House, Qutub Minar, Lotus Temple, and Humayun''s Tomb. The evening is free for personal exploration.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Delhi to Agra: Taj Mahal & Agra Fort', 'After breakfast, drive to Agra and visit the iconic Taj Mahal, one of the Seven Wonders of the World, admired for its breathtaking marble architecture. Continue to Agra Fort, a UNESCO World Heritage site showcasing Mughal power. The rest of the day is at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Agra to Ranthambore: Tiger Territory', 'After breakfast, proceed to Ranthambore, famous for its tiger reserve. Check into your hotel and spend the rest of the day at leisure, preparing for the next morning''s safari.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Ranthambore: Morning Safari & Drive to Jaipur', 'Early morning, enjoy a jungle safari in Ranthambore National Park (own arrangement) to spot tigers and wildlife. After breakfast, drive to Jaipur, the Pink City. The evening is free for relaxation.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 6, 'Jaipur: Amber Fort & Pink City Highlights', 'After breakfast, visit the magnificent Amber Fort, overlooking Maota Lake. Then explore Jaipur''s pink city sights: Hawa Mahal (Palace of Winds), City Palace, and Jantar Mantar (astronomical observatory). Also visit traditional block printing and gemstone cutting factories, showcasing centuries-old craftsmanship. Rest of the day at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 7, 'Jaipur to Pushkar: Holy City & Brahma Temple', 'After breakfast, drive to Pushkar, a sacred Hindu town. Visit the revered Brahma Temple, one of the few in the world dedicated to Lord Brahma, and explore the camel fairground (seasonal). Evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 8, 'Pushkar to Mandawa: Painted Havelis Walk', 'After breakfast, travel to Mandawa, a town known for its frescoed havelis. In the evening, enjoy a free walking tour to admire the old painted houses and intricate architecture. Spend the night at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 9, 'Mandawa to Bikaner: Junagarh Fort & Deshnok Temple', 'After breakfast, drive to Bikaner and visit the impressive Junagarh Fort. Later, proceed to the famous Deshnok Temple (Karni Mata Temple), known for its thousands of sacred rats. Evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 10, 'Bikaner to Jaisalmer: Golden City Arrival', 'After breakfast, drive to Jaisalmer, the Golden City, renowned for its sandstone architecture. Check into your hotel and spend the rest of the day at leisure, perhaps exploring the local market.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 11, 'Jaisalmer: Fort, Jain Temple & Desert Safari at Khuri', 'After breakfast, check out and visit Jaisalmer Fort, a living fort with palaces and temples. Also explore the intricately carved Ludarwa Jain Temple. After lunch, proceed to Khuri village for a camel ride and sunset views over the sand dunes. Enjoy Rajasthani folk dance and dinner at a desert camp. Overnight at the camp.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 12, 'Khuri to Jodhpur: Mehrangarh Fort & Jaswant Thada', 'After breakfast, drive to Jodhpur. Visit the imposing Mehrangarh Fort, one of India''s largest forts, and the serene Jaswant Thada memorial. The rest of the day is at leisure in the Blue City.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 13, 'Jodhpur to Udaipur via Ranakpur: Jain Temple Marvel', 'After breakfast, drive to Udaipur via Ranakpur. En route, visit the magnificent Ranakpur Jain Temple, famous for its 1,444 marble pillars. Continue to Udaipur, the City of Lakes. Evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 14, 'Udaipur: City Palace, Jagdish Temple & Boat Ride', 'After breakfast, explore Udaipur''s highlights: Jagdish Temple, the sprawling City Palace overlooking Lake Pichola, and Sahelion Ki Badi (Princes'' Garden). Enjoy a scenic boat ride on Lake Pichola. Rest of the day at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 15, 'Udaipur: Departure Transfer', 'After breakfast, check out from the hotel. Transfer to Udaipur Airport for your onward journey, concluding your memorable India tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 4 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 5 FROM "Destination" d WHERE d."slug" = 'pushkar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 6 FROM "Destination" d WHERE d."slug" = 'jodhpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 7 FROM "Destination" d WHERE d."slug" = 'jaisalmer'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 8 FROM "Destination" d WHERE d."slug" = 'bikaner'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 9 FROM "Destination" d WHERE d."slug" = 'ranthambore'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 10 FROM "Destination" d WHERE d."slug" = 'mandawa'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d', '05 Nt./6D – Delhi Agra Jaipur Golden Triangle Tour',
    5, 6, '5 Nights / 6 Days',
    2, FALSE,
    'https://images.pexels.com/photos/18881274/pexels-photo-18881274.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/33797752/pexels-photo-33797752.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29232159/pexels-photo-29232159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19867674/pexels-photo-19867674.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31817439/pexels-photo-31817439.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Delhi: Arrival and Welcome to the Capital', 'Upon arrival at Delhi Airport, our company representative assists you and transfers you to your hotel. The rest of the day is at leisure to relax or explore nearby markets. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Delhi: Old and New Delhi Sightseeing', 'After breakfast, you embark on a full-day tour of Old and New Delhi. Visit the magnificent Jama Masjid, the largest mosque in India, and the historic Red Fort. Pay respects at Rajghat, Mahatma Gandhi''s cremation site. Drive past India Gate, the President''s House, and Parliament. Explore the UNESCO-listed Qutub Minar, the serene Lotus Temple, and the elegant Humayun''s Tomb. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Delhi to Agra: The Taj Mahal and Agra Fort', 'After breakfast, drive to Agra. Upon arrival, visit the iconic Taj Mahal, the world''s first wonder of love, built by Emperor Shah Jahan. Marvel at its pristine white marble and intricate inlay work. Later, explore the imposing Agra Fort, a UNESCO World Heritage site that offers stunning views of the Taj. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Agra to Jaipur via Fatehpur Sikri', 'After breakfast, proceed to Jaipur, stopping en route at Fatehpur Sikri, the abandoned Mughal capital. Explore its well-preserved palaces, courtyards, and the Buland Darwaza. Continue to Jaipur and check into your hotel. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Jaipur: Amber Fort and Pink City Tour', 'After breakfast, visit the magnificent Amber Fort, perched on a hilltop. You may choose to ascend by jeep or elephant. Later, explore the Pink City, visiting the stunning Hawa Mahal (Palace of Winds), the ornate City Palace, and the astronomical observatory Jantar Mantar. Also, witness centuries-old crafts at block printing and gemstone cutting factories. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Jaipur to Delhi: Departure with Memories', 'After breakfast, drive back to Delhi. You are transferred to Delhi Airport for your onward journey, carrying sweet memories of the Golden Triangle. End of tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  -- Variant: 0n-1d-day-trip
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '0n-1d-day-trip', '05N/06D – Delhi Shimla Manali Tour Packages',
    0, 1, 'Same Day Tour',
    3, FALSE,
    'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34201914/pexels-photo-34201914.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Delhi to Shimla: Scenic Drive & Arrival', 'Upon arrival at Delhi airport or railway station, our representative greets and assists you. You then proceed on a scenic drive to Shimla, the former summer capital of British India. The journey takes you through rolling hills and pine forests. On arrival, check into your hotel and relax. The evening is free to explore the Mall Road or enjoy the cool mountain air.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Shimla: Kufri Valley & Jakhu Temple', 'After breakfast, drive 16 km to Kufri Valley, a scenic spot offering panoramic views of the majestic Himalayan peaks. You can enjoy horse riding or simply soak in the landscape. Return to Shimla to visit Jakhu Temple, dedicated to Lord Hanuman. Either walk or take a horse (at personal cost) to the hilltop temple, which offers excellent views of Shimla town and the surrounding mountains. The rest of the evening is at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Shimla to Manali: Kullu Valley En Route', 'After breakfast, check out and drive to Manali, the ''Valley of Gods''. En route, stop in Kullu town, known for its temples, shawls, and the Beas River. Enjoy the scenic drive through apple orchards and pine forests. Upon arrival in Manali, check into your hotel. The remainder of the day is free to relax or explore nearby markets.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Manali: Hidimba Temple, Vashisth & Club House', 'After breakfast, visit the ancient Hidimba Devi Temple, a unique pagoda-style shrine dedicated to the demoness Hidimba. Next, walk to Vashisth Temple, famous for its natural hot springs where you can soak. Later, visit the Club House, a recreational center offering activities like mini golf and skating. In the evening, enjoy a walking tour around the Mall Road. The rest of the day is at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Manali: Solang Valley Snow Point Day Trip', 'After breakfast, drive to Solang Valley, a picturesque side valley famous for its snow sports and breathtaking views. At the snow point, you can try activities like skiing, snowboarding, or a snow ride (at personal cost). The valley offers stunning vistas of glaciers and pine forests. Return to Manali by evening; the rest of the day is free for relaxation.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Manali to Delhi: Departure', 'After breakfast, check out and drive back to Delhi. The journey takes you through scenic mountain roads and plains. Upon arrival in Delhi, you are dropped at the airport or railway station for your onward journey. The tour concludes with fond memories of the Himalayas.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 4 FROM "Destination" d WHERE d."slug" = 'shimla'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 5 FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-nainital-corbett
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-nainital-corbett', '05 Nights 06 Days: Delhi ! Mussoorie ! Corbett ! Nainital ! Tour',
    5, 6, '5 Nights / 6 Days',
    4, FALSE,
    'https://images.pexels.com/photos/34201914/pexels-photo-34201914.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Delhi to Mussoorie: Scenic Drive to the Queen of Hills', 'Upon arrival at Delhi airport or railway station, you are greeted and driven to Mussoorie, the picturesque ''Queen of Hills''. The journey covers approximately 270 kilometers and takes around 7 hours. On arrival, you check into your hotel and spend the rest of the evening at leisure, soaking in the cool mountain air. Overnight stay in Mussoorie.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Mussoorie: Kempty Falls, Gun Hill & Mall Road', 'After breakfast, you set out to explore Mussoorie''s iconic attractions. First, visit the plunging Kempty Falls, where you can enjoy the cascading water and surrounding greenery. Next, head to Gun Hill, the second-highest peak of Mussoorie, offering breathtaking views of the Himalayan ranges and the Doon Valley. Later, stroll along the bustling Mall Road, perfect for shopping local handicrafts and savoring snacks. The evening is free for leisurely exploration. Overnight in Mussoorie.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Mussoorie to Corbett: Journey into the Wild', 'After breakfast, you drive to Jim Corbett National Park, covering about 250 kilometers in 6 hours. On arrival, check into your hotel. You have the option to enjoy an evening safari (at an additional cost) into the park, renowned for its population of tigers, elephants, sambar, chital, nilgai, and over 600 bird species. The lush jungle and riverine landscapes set the stage for an unforgettable wildlife encounter. Overnight in Corbett.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Corbett to Nainital: Morning Safari & Lakeside Arrival', 'Today begins with an early morning safari into Corbett National Park, where you may spot tigers and other wildlife in their natural habitat. After the safari, you return to the hotel for breakfast and check out. Then, drive to Nainital, 150 kilometers away (approximately 6 hours). Upon arrival, check into your hotel and spend the remainder of the day at leisure, enjoying the serene ambiance of this lake city. Overnight in Nainital.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Nainital: Temples, Peaks & Candle Shopping', 'After breakfast, you explore Nainital''s highlights. Visit the revered Naina Devi Temple, dedicated to the goddess, and then Hanuman Garhi, which offers panoramic views. Ascend to Naina Peak (Naina Height) for stunning vistas of the snow-capped Himalayas and the Nainital Valley. In the evening, wander through the local market near the Mall Road (Shopping Centre Road), known for its variety of candles and souvenirs. Overnight in Nainital.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Nainital to Delhi: Departure with Memories', 'After breakfast, you check out from the hotel and begin the scenic drive back to Delhi, covering approximately 300 kilometers in 9 hours. Upon arrival, you are transferred to Delhi Airport or Railway Station to board your flight or train for your onward journey. The tour concludes with lasting memories of India''s Himalayan charm and wildlife.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 4 FROM "Destination" d WHERE d."slug" = 'nainital'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 5 FROM "Destination" d WHERE d."slug" = 'mussoorie'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 6 FROM "Destination" d WHERE d."slug" = 'jim-corbett'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d-rishikesh
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d-rishikesh', '02 Nights 03 Days: Delhi ! Haridwar ! Rishikesh Tour',
    2, 3, '2 Nights / 3 Days',
    5, FALSE,
    'https://images.pexels.com/photos/35616883/pexels-photo-35616883.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_5;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_5;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 1, 'Delhi to Haridwar: Temples & Ganga Aarti', 'Your driver meets you at your Delhi home, hotel, airport, or railway station and you depart for Haridwar. Upon arrival, check into your hotel and freshen up. Afternoon visits include the modern Daksh Temple, the intricately mirrored Pawan Dham, and the bustling Moti Bazar. As evening falls, head to the sacred Har Ki Pauri ghat to witness the spectacular Ganga Aarti, where priests offer fire and chants to the river. Return to the hotel for dinner and an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 2, 'Haridwar to Rishikesh: Temples, Ghats & Bridges', 'Start the day with a purifying dip in the holy Ganga at Haridwar, then return to the hotel for breakfast. Afterward, ride the cable car to Mansa Devi Temple for panoramic views and blessings. Transfer to Rishikesh and visit Triveni Ghat, the ancient Bharat Mandir, and the Lakshman Temple. Walk across the iconic Lakshman Jhula and Ram Jhula suspension bridges, which offer stunning river views. In the evening, attend the soulful Ganga Aarti at Parmarth Niketan ashram before returning to your hotel for the night.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 3, 'Haridwar to Delhi: Chandi Devi & Departure', 'After breakfast at the hotel, check out and take a cable car ride to Chandi Devi Temple, perched atop a hill for commanding views of Haridwar and the Ganges. Then begin the drive back to Delhi, with drop-off at your home, hotel, airport, or railway station in time for your onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 4 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 5 FROM "Destination" d WHERE d."slug" = 'rishikesh'
  ON CONFLICT DO NOTHING;

  -- Variant: 0n-1d-manali-agra-mandawa
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '0n-1d-manali-agra-mandawa', 'Volvo Coach Package 5N/6D – Delhi Manali Delhi Tour/ Honeymoon Package',
    0, 1, 'Same Day Tour',
    6, FALSE,
    'https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34201914/pexels-photo-34201914.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_6;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_6;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_6, 1, 'Delhi to Manali: Overnight Volvo Journey', 'In the evening, board the Volvo coach at a designated pick-up point in Delhi and settle in for a comfortable overnight ride to Manali. The coach is equipped with reclining seats and blankets for a restful journey through the scenic foothills of the Himalayas. As night falls, you can enjoy light snacks and watch a movie on the onboard entertainment system. Upon arrival in Manali the next morning, you will be transferred to your hotel to begin your Himalayan adventure.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_6, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_6, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_6, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_6, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_6, d."id", 4 FROM "Destination" d WHERE d."slug" = 'manali'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_6, d."id", 5 FROM "Destination" d WHERE d."slug" = 'mandawa'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d-udaipur-pushkar
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d-udaipur-pushkar', '06N/07D Delhi Agra Ranthambhore Jaipur Mandawa Delhi Tour',
    6, 7, '6 Nights / 7 Days',
    7, FALSE,
    'https://images.pexels.com/photos/18881274/pexels-photo-18881274.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/33797752/pexels-photo-33797752.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29232159/pexels-photo-29232159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19867674/pexels-photo-19867674.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31817439/pexels-photo-31817439.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_7;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_7;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 1, 'Arrival in Delhi: Welcome to India', 'Upon arrival at Delhi International Airport, our company representative greets you and assists with your transfer to the hotel. The rest of the day is at leisure, allowing you to relax after your journey or explore nearby areas independently. Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 2, 'Delhi Sightseeing & Drive to Agra', 'After breakfast, we embark on a full-day sightseeing tour of Delhi. We visit the majestic Jama Masjid, the serene Rajghat (Gandhi''s cremation site), India Gate, the President''s House, and Parliament. Later, we explore the UNESCO-listed Qutub Minar, the Lotus Temple, and Humayun''s Tomb. In the afternoon, we drive to Agra (approx 3 hours). Evening is free for leisure. Overnight in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 3, 'Agra to Ranthambhore: Taj Mahal & Fatehpur Sikri', 'Early morning, we visit the iconic Taj Mahal at sunrise, a breathtaking monument of love. After breakfast, we explore the imposing Agra Fort, another UNESCO World Heritage site. We then drive to Ranthambhore, en route stopping at the deserted Mughal city of Fatehpur Sikri to admire its stunning architecture. Upon arrival in Ranthambhore, we check into our hotel and relax. Overnight in Ranthambhore.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 4, 'Ranthambhore Tiger Safari & Drive to Jaipur', 'We rise early for a thrilling jungle safari in Ranthambhore National Park (own arrangement), hoping to spot the majestic Bengal tiger. After the safari and breakfast at the hotel, we depart for Jaipur (approx 4 hours). The afternoon is free to settle in and explore at leisure. Overnight in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 5, 'Jaipur Sightseeing: Amber Fort & Pink City', 'After breakfast, we visit the magnificent Amber Fort, perched on a hilltop, and enjoy a jeep or elephant ride to the entrance. We then proceed to the Pink City to see the Hawa Mahal (Palace of Winds), the City Palace, and the Jantar Mantar observatory. The tour also includes visits to traditional block printing and stone carving workshops, where centuries-old crafts are still practiced. Evening is at leisure. Overnight in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 6, 'Jaipur to Mandawa: Shekhawati''s Painted Havelis', 'Today we drive to Mandawa (approx 4 hours), a charming village in the Shekhawati region known for its beautifully painted havelis. After checking into the hotel, we take a leisurely walk through the village to admire the intricate frescoes on these historic mansions, each telling stories of merchants and royalty. The rest of the day is at leisure to soak in the rustic atmosphere. Overnight in Mandawa.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_7, 7, 'Mandawa to Delhi: Departure', 'After breakfast, we drive back to Delhi (approx 6-7 hours). Upon arrival, we transfer you to the Delhi airport or railway station for your onward journey. The tour concludes with wonderful memories of India''s diverse heritage.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 4 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 5 FROM "Destination" d WHERE d."slug" = 'pushkar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 6 FROM "Destination" d WHERE d."slug" = 'ranthambore'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_7, d."id", 7 FROM "Destination" d WHERE d."slug" = 'mandawa'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-udaipur-pushkar
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-udaipur-pushkar', '09N/10D – Delhi Agra Ranthambore Udaipur Pushkar Jaipur Delhi Tour',
    5, 6, '5 Nights / 6 Days',
    8, FALSE,
    'https://images.pexels.com/photos/18881274/pexels-photo-18881274.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/33797752/pexels-photo-33797752.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/29232159/pexels-photo-29232159.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19867674/pexels-photo-19867674.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31817439/pexels-photo-31817439.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_8;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_8;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 1, 'Delhi Arrival: Warm Welcome and Settle In', 'Upon your arrival at Indira Gandhi International Airport, our company representative greets you and assists with your luggage before transferring you to your pre-booked hotel. The rest of the day is at leisure, allowing you to relax after your journey or take a gentle walk around the neighborhood. Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 2, 'Delhi Sightseeing: Mughal Heritage and Imperial Landmarks', 'After breakfast, embark on a full-day exploration of Delhi. Visit the majestic Jama Masjid, the largest mosque in India, and pay respects at Rajghat, the cremation site of Mahatma Gandhi. Drive past the India Gate, President''s House, and Parliament House, then explore the towering Qutub Minar, the serene Lotus Temple, and the exquisite Humayun''s Tomb. Later, proceed to Agra (approx. 250 km). Check into your hotel and enjoy the evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 3, 'Agra to Ranthambore: Taj Mahal and Fatehpur Sikri', 'Wake up early to visit the Taj Mahal at sunrise, a breathtaking monument of love. Afterward, explore the imposing Agra Fort, a UNESCO World Heritage site. Check out from the hotel and drive towards Ranthambore, stopping en route at the abandoned Mughal city of Fatehpur Sikri to see its stunning red sandstone palaces and the Buland Darwaza. Continue to Ranthambore and check into your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 4, 'Ranthambore Safari and Scenic Drive to Udaipur', 'Before dawn, head out for an exhilarating jungle safari in Ranthambore National Park, renowned for its tiger population and diverse wildlife. Return to the hotel for breakfast, then check out and drive to Udaipur (approx. 415 km). The journey takes you through picturesque Rajasthani landscapes. Upon arrival in Udaipur, check into your hotel and spend the rest of the day at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 5, 'Udaipur: City of Lakes and Palaces', 'After breakfast, begin your Udaipur sightseeing with a visit to the intricately carved Jagdish Temple. Explore the grand City Palace, overlooking Lake Pichola, and stroll through the beautiful Princess Garden (Sahelion Ki Badi). Optionally, enjoy a boat ride on Lake Pichola (own cost) for stunning views of the city. The evening is free to wander through the charming streets or relax at your hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_8, 6, 'Udaipur to Pushkar: Holy City and Brahma Temple', 'After breakfast, drive to the holy city of Pushkar (approx. 280 km). Upon arrival, check into your hotel and visit the sacred Brahma Temple, one of the few temples dedicated to Lord Brahma in India. Experience the spiritual ambiance of Pushkar Lake and the ghats. Optionally, enjoy a camel ride (own cost) across the desert landscape. The evening is free to explore the local markets or relax.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 3 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 4 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 5 FROM "Destination" d WHERE d."slug" = 'pushkar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_8, d."id", 6 FROM "Destination" d WHERE d."slug" = 'ranthambore'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'delhi';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'north-india-tours', 'North India Tour Packages',
    'North India is a living museum of Mughal grandeur, Rajput valor, and spiritual ghats. From the timeless Taj Mahal in Agra to the Pink City of Jaipur and the sacred banks of Haridwar, this heritage trail offers an immersive journey through India''s soul. Mother India Tour Travels curates these routes with expert local guides, premium accommodations, and seamless logistics, ensuring you experience the region''s majesty without hassle. Whether you marvel at Delhi''s Lutyens'' architecture or witness the Ganga aarti, every moment is crafted for authenticity and comfort.',
    ARRAY['Witness the Taj Mahal at sunrise from the Diwan-i-Khas platform, then explore Agra Fort''s Sheesh Mahal', 'Ride an open-top jeep through Delhi''s Chandni Chowk, tasting parathas at the 150-year-old Paranthe Wali Gali', 'Walk the mirrored corridors of Jaipur''s Amber Fort, followed by a visit to Hawa Mahal''s lattice windows', 'Attend the evening Ganga Aarti at Haridwar''s Har Ki Pauri, where thousands of lamps float on the sacred river', 'Spot tigers and Asiatic elephants at Jim Corbett National Park, a 3-hour drive from Haridwar (optional extension)'],
    ARRAY['7 nights / 8 days accommodation in 4-star heritage hotels (Delhi, Agra, Jaipur, Haridwar)', 'Daily buffet breakfast and 3 dinners with local Rajasthani thali or Mughlai cuisine', 'Private air-conditioned vehicle with English-speaking driver for all transfers and sightseeing', 'Expert local guides for monument visits (licensed, with headset audio for group clarity)', 'Monument entry fees including Taj Mahal, Agra Fort, Amber Fort, and Qutub Minar', 'Traditional welcome: tikka ceremony in Jaipur with elephant or jeep ride at Amber Fort', '24/7 assistance from Mother India Tour Travels representative during the trip'],
    ARRAY['International or domestic airfare (suggested flights from Delhi, arrival/departure transfer included)', 'Personal expenses such as laundry, phone calls, or drinks at bar', 'Optional activities like hot air balloon over Jaipur or white-water rafting in Rishikesh', 'Tips and gratuities for guides, drivers, or hotel staff (recommended ₹200-500 per person per day)', 'Travel insurance (recommended to cover cancellations and medical emergencies)'],
    ARRAY['Moderate walking required at most monuments; comfortable shoes and sunscreen recommended.', 'Haridwar is a holy city; dress modestly and avoid footwear near the ghats. Photography is allowed but respectful of rituals.', 'Peak season runs October–March; book 2 months in advance for best room rates and guide availability.'],
    'https://images.pexels.com/photos/30032907/pexels-photo-30032907.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/789750/pexels-photo-789750.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/16952108/pexels-photo-16952108.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19927019/pexels-photo-19927019.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/6472566/pexels-photo-6472566.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Heritage', 20, 12, 'Premium Hotels',
    'Majestic Mughals, Pink Cities & Sacred Ghats: North India''s best.', FALSE, FALSE, TRUE,
    ARRAY['north-india', 'heritage', 'culture', 'wildlife', 'pilgrimage'], country_id, state_id,
    'North India Tour Packages 2025 | Heritage & Culture Tours', 'Explore North India''s iconic heritage: Delhi, Agra, Jaipur, Haridwar. 4-10 day packages with expert guides, 4-star hotels. Book your cultural journey today.', ARRAY['north india tour packages', 'heritage tours india', 'delhi agra jaipur tour', 'haridwar travel packages', 'rajasthan tour with haridwar', 'golden triangle with pilgrimage', 'mother india tour travels', 'india tour operator 2025'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'heritage-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'wildlife-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 3n-4d-rishikesh
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '3n-4d-rishikesh', '03Nt./04D Delhi Haridwar Rishikesh Delhi Tour',
    3, 4, '3 Nights / 4 Days',
    0, TRUE,
    'https://images.pexels.com/photos/30032907/pexels-photo-30032907.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/789750/pexels-photo-789750.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/16952108/pexels-photo-16952108.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19927019/pexels-photo-19927019.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/6472566/pexels-photo-6472566.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Delhi: Mughal & Colonial Heritage Sightseeing', 'Arrive at Delhi airport or railway station and transfer to your hotel. After breakfast, embark on a guided tour of Old and New Delhi. Visit the majestic Red Fort, the bustling Chandni Chowk, the grand Qutub Minar, and the serene Humayun''s Tomb. Drive past the India Gate and Rashtrapati Bhavan. The rest of the day is at leisure to relax or explore nearby markets.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Delhi to Haridwar: Spiritual Sojourn & Ganga Aarti', 'After breakfast, drive 250 km (approx. 6 hours) to the holy city of Haridwar. Check into your hotel and freshen up. In the late afternoon, head to Har Ki Pauri ghat to witness the spectacular Ganga Aarti ceremony, where priests perform rituals with fire and incense as the sun sets. The rhythmic chants and floating diyas create a mesmerizing spiritual atmosphere. Return to the hotel for dinner and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Rishikesh: Suspension Bridges & Ancient Temples', 'After breakfast, drive to nearby Rishikesh (approx. 30 minutes). Cross the iconic Laxman Jhula and Ram Jhula suspension bridges over the Ganges, offering panoramic views of the river and mountains. Visit the Triveni Ghat and several ancient temples, including the Bharat Mandir and Neelkanth Mahadev (optional). Spend time absorbing the peaceful vibe of this yoga capital. Return to Haridwar in the evening.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Haridwar to Delhi: Departure Transfer', 'After breakfast, check out from the hotel and drive back to Delhi (250 km, approx. 6 hours). Upon arrival, you will be dropped at the airport or railway station for your onward journey. The tour concludes with cherished memories of spiritual and cultural immersion in North India''s sacred cities.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 3 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 4 FROM "Destination" d WHERE d."slug" = 'rishikesh'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d-corbett
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d-corbett', 'Delhi Corbett National Tiger Century 04 Nights 05 Days Tour',
    4, 5, '4 Nights / 5 Days',
    1, FALSE,
    'https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34201914/pexels-photo-34201914.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Delhi: Arrival & Leisure', 'Upon arrival at Delhi airport or railway station, you are greeted and transferred to your hotel. The rest of the day is at leisure to relax after your journey. You may choose to explore the nearby local markets or simply unwind at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Delhi: Mughal Heritage & New Delhi Sightseeing', 'After breakfast, embark on a morning tour of Delhi. Visit the majestic Qutub Minar, the towering minaret, and the historic Humayun''s Tomb. Proceed through the grand India Gate and the President''s House. In the afternoon, explore the bustling streets of Chandni Chowk in Old Delhi, taking a rickshaw ride past the Red Fort and Jama Masjid. Evening free for personal activities.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Delhi to Corbett: Journey to the Wild', 'After breakfast, check out and drive to Jim Corbett National Park, approximately 250 km and 6 hours away. Enjoy the scenic drive through the Himalayan foothills. Upon arrival, check into your resort and spend the rest of the day at leisure, perhaps taking a nature walk around the property.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Corbett: Tiger Safari & Local Exploration', 'Early morning, set out for an exciting tiger safari inside Jim Corbett National Park (own arrangement). Keep your eyes peeled for Bengal tigers, elephants, and diverse birdlife. After the safari, return to the hotel for breakfast. Later, proceed for local sightseeing, visiting places like the Corbett Museum or Garjia Temple. Evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Corbett to Delhi: Departure Transfer', 'After breakfast, check out and drive back to Delhi (approx. 6 hours). You are then transferred to the airport or railway station for your onward journey. The tour concludes with cherished memories of wildlife and heritage.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 3 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 4 FROM "Destination" d WHERE d."slug" = 'jim-corbett'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d', '05Nt./06D Delhi Agra Jaipur with Mathura Tour',
    5, 6, '5 Nights / 6 Days',
    2, FALSE,
    'https://images.pexels.com/photos/30032907/pexels-photo-30032907.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/789750/pexels-photo-789750.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/16952108/pexels-photo-16952108.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19927019/pexels-photo-19927019.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/6472566/pexels-photo-6472566.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Delhi: Arrival and Transfer to Hotel', 'Upon arrival at Delhi Airport, our company representative greets you and assists with a smooth transfer to your pre-booked hotel. The remainder of the day is at leisure to relax or explore the nearby areas. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Delhi: Mughal Heritage & Modern Landmarks', 'After breakfast, embark on a guided tour of Delhi''s iconic sights, including the majestic Jama Masjid, Red Fort, India Gate, President''s House, and Parliament House. Continue to the towering Qutub Minar and the serene Lotus Temple. This full-day excursion showcases Delhi''s rich historical tapestry and modern architectural marvels. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Delhi to Agra: En-route Mathura''s Holy Temples', 'After breakfast, depart for Agra with an en-route stop in Mathura, the revered birthplace of Lord Krishna. Visit the Krishna Janmabhoomi Temple, the vibrant ISKCON Temple, and the stunning Prem Mandir temple complex. Continue to Agra and check into your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Agra to Jaipur: Sunrise Taj Mahal & Fatehpur Sikri', 'An early morning guided tour takes you to the Taj Mahal at sunrise, offering a breathtaking view of this marble masterpiece. Return to the hotel for breakfast, then visit the imposing Agra Fort. Later, drive to Jaipur, stopping en route at Fatehpur Sikri, the abandoned Mughal city with its well-preserved palaces and courtyards. Arrive in Jaipur and check into the hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Jaipur: Royal Forts, Palaces & Handicrafts', 'After breakfast, a guided tour takes you to Amber Fort, where you can opt for an elephant ride and explore the intricate palace interiors. Also visit the Water Palace, the iconic Hawa Mahal (Palace of Winds), City Palace, and the Jantar Mantar observatory. Experience traditional block printing and Rajasthani handicraft demonstrations, witnessing centuries-old crafts. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Jaipur to Delhi: Departure with Memories', 'After breakfast, drive back to Delhi (approximately 5-6 hours). Our driver will drop you at the airport or railway station for your onward journey, leaving you with sweet memories of North India''s rich heritage.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 3 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 4 FROM "Destination" d WHERE d."slug" = 'mathura'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-nainital-corbett
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-nainital-corbett', '05Nt./06D Delhi Nainital with Corbett National Park',
    5, 6, '5 Nights / 6 Days',
    3, FALSE,
    'https://images.pexels.com/photos/30032907/pexels-photo-30032907.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/789750/pexels-photo-789750.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/16952108/pexels-photo-16952108.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19927019/pexels-photo-19927019.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/6472566/pexels-photo-6472566.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Delhi: Mughal & Colonial Heritage Exploration', 'Upon arrival at Delhi airport or railway station, you are transferred to your hotel. After freshening up, set out to explore the contrasting worlds of Old and New Delhi. In Old Delhi, visit the magnificent Red Fort, a UNESCO World Heritage Site, and the bustling Chandni Chowk market. In New Delhi, drive past the India Gate, the President''s House, and visit the Qutub Minar. The evening is free for you to relax or explore nearby areas at your own pace.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Delhi to Corbett: Journey into the Wild', 'After breakfast, check out and drive to Jim Corbett National Park, approximately 250 kilometers away (6 hours). Upon arrival, check into your wildlife resort and spend the rest of the day at leisure. You can take a nature walk around the resort or simply relax. Dinner and overnight stay at the resort.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Corbett: Jeep Safari Tiger Hunt', 'Wake up early for a thrilling jeep safari inside Jim Corbett National Park. The park, renowned for its Bengal tiger population, offers a chance to spot tigers, elephants, deer, and numerous bird species. The safari lasts about 3-4 hours. After returning to the resort for breakfast, spend the rest of the day at leisure. You may opt for an evening safari or simply relax.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Corbett to Nainital: Hill Station Arrival', 'After breakfast, drive to Nainital, a picturesque hill station nestled around the Naini Lake (75 kilometers, 2 hours). Check into your hotel and spend the evening at leisure. You can take a leisurely walk along the Mall Road, enjoying the cool mountain air and views of the lake. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Nainital: Local Sightseeing & Lake Views', 'After breakfast, embark on a local sightseeing tour of Nainital. Visit the Naina Devi Temple, perched on the northern shore of Naini Lake, and take a boat ride on the serene lake. Ascend to Tiffin Top (Thandi Sadak) for panoramic views of the Himalayas. Also explore the Governor’s House (Raj Bhawan) and the bustling Tibetan Market. The afternoon is free for personal exploration.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Nainital to Delhi: Departure Drive', 'After breakfast, check out and begin your drive back to Delhi (approximately 325 kilometers, 7 hours). Upon arrival in Delhi, you are dropped off at the airport or railway station for your onward journey. The tour concludes with fond memories of wildlife and Himalayan beauty.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 3 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 4 FROM "Destination" d WHERE d."slug" = 'nainital'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 5 FROM "Destination" d WHERE d."slug" = 'jim-corbett'
  ON CONFLICT DO NOTHING;

  -- Variant: 9n-10d-khajuraho-varanasi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '9n-10d-khajuraho-varanasi', '09Nt./10D – Delhi Jaipur Agra Khajuraho with Varanasi Tour',
    9, 10, '9 Nights / 10 Days',
    4, FALSE,
    'https://images.pexels.com/photos/30032907/pexels-photo-30032907.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/789750/pexels-photo-789750.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/16952108/pexels-photo-16952108.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19927019/pexels-photo-19927019.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/6472566/pexels-photo-6472566.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Delhi: Mughal & Colonial Heritage Tour', 'Your journey begins with an arrival transfer from Delhi airport or railway station to your hotel. After freshening up, embark on a guided tour covering the soaring Qutub Minar, the imposing India Gate, the majestic Red Fort, and the bustling Jama Masjid. The evening is free to explore the vibrant streets of Old Delhi or relax at your hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Delhi to Jaipur: Express Transfer via Pink City', 'After breakfast, you drive approximately 260 km to Jaipur, the Pink City. The journey takes about 6 hours with scenic views of the countryside. Upon arrival, check into your hotel and enjoy the rest of the day at leisure. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Jaipur: Amber Fort & Royal City Palace', 'After breakfast, a guided tour takes you to the magnificent Amber Fort, perched on a hilltop. Continue to the Water Palace (Jal Mahal), the ornate City Palace, and the iconic Hawa Mahal (Palace of Winds). You''ll also visit the Jantar Mantar observatory for a glimpse into ancient astronomy. Return to your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Jaipur to Agra: Fatehpur Sikri En Route', 'After breakfast, depart for Agra (260 km, 7 hours). En route, stop at the UNESCO-listed Fatehpur Sikri, the abandoned Mughal capital. Explore its well-preserved palaces, courtyards, and the Buland Darwaza. Continue to Agra, check into your hotel, and spend the evening at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Agra: Taj Mahal at Sunrise & Mughal Fort', 'Early morning, witness the breathtaking Taj Mahal at sunrise. Then, visit the impressive Agra Fort, a UNESCO World Heritage site. Later, explore the local marble inlay handicrafts workshops, where you can see artisans creating intricate designs. Return to your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Agra to Khajuraho: Orchha Detour', 'After breakfast, drive 415 km to Khajuraho (approx 8 hours). En route, visit the historic town of Orchha, known for its stunning cenotaphs, Jahangir Mahal, and the Chaturbhuj Temple. Arrive in Khajuraho in the evening, check into your hotel, and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 7, 'Khajuraho: Western & Jain Temple Complex', 'After breakfast, explore the famed Western Temples of Khajuraho, celebrated for their intricate erotic sculptures and architectural brilliance. Then, visit the Jain Temples within the same complex. The afternoon is free for optional strolls through the village. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 8, 'Khajuraho to Varanasi: Sacred Journey', 'After breakfast, drive approximately 400 km to Varanasi (9-10 hours). The route passes through rural Uttar Pradesh. Upon arrival, check into your hotel and spend the evening at leisure. Overnight stay in Varanasi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 9, 'Varanasi: Ganges Boat Ride & Temple Tour', 'Early morning, embark on a boat ride on the holy River Ganges, witnessing the ghats and morning rituals. After breakfast, visit the Sankat Mochan Hanuman Temple, the Kashi Vishwanath Temple (one of the twelve Jyotirlingas), and Bharat Mata Mandir. The evening is free for a stroll along the ghats or attend the Ganga Aarti. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 10, 'Varanasi Departure: Drop at Airport or Station', 'After breakfast, you will be transferred to Varanasi airport or railway station for your onward journey. The tour concludes with cherished memories of North India''s cultural and spiritual tapestry.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 3 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 4 FROM "Destination" d WHERE d."slug" = 'khajuraho'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 5 FROM "Destination" d WHERE d."slug" = 'varanasi'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
  var_id_5 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'delhi';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'golden-triangle', 'Golden Triangle Tour Packages',
    'The Golden Triangle Tour is India’s most iconic heritage circuit, linking Delhi, Agra, and Jaipur. Explore Delhi’s Mughal grandeur at the Red Fort and Qutub Minar, witness the eternal beauty of the Taj Mahal at sunrise, and ride into Jaipur’s Amber Fort on elephant back. This curated journey offers deep immersion into India’s royal past, with expert storytelling and seamless logistics. Mother India Tour Travels ensures every detail is handled, from monument entry to luxury accommodations, for a stress-free cultural experience.',
    ARRAY['Sunrise visit to the Taj Mahal, the world’s most celebrated monument of love', 'Guided tour of Delhi’s UNESCO sites: Red Fort, Qutub Minar, and Humayun’s Tomb', 'Elephant ride ascent to Amber Fort and photo stop at Hawa Mahal in Jaipur', 'Traditional Rajasthani dinner at a heritage haveli in Jaipur', 'Rickshaw ride through Chandni Chowk’s bustling spice market in Old Delhi'],
    ARRAY['Accommodation in 4-star or equivalent heritage hotels for all nights', 'Daily breakfast and one dinner at a heritage restaurant in Jaipur', 'Air-conditioned private vehicle with professional driver throughout', 'English-speaking licensed guide at all monuments and cities', 'All monument entrance fees for listed sights', 'Elephant ride at Amber Fort or jeep alternative', '24/7 customer support and welcome kit with maps & water bottles'],
    ARRAY['International or domestic airfare and airport taxes', 'Visa fees and travel insurance', 'Personal expenses such as laundry, telephone calls, and tips', 'Camera fees at monuments or video charges', 'Any meals not mentioned in inclusions or alcoholic beverages'],
    ARRAY['Dress modestly when visiting temples and mosques; remove shoes before entering.', 'Best time to visit is October to March for pleasant weather and clear views of the Taj Mahal.', 'Elephant rides are subject to animal welfare policies; alternative jeep rides are available.'],
    'https://images.pexels.com/photos/30665395/pexels-photo-30665395.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/28257148/pexels-photo-28257148.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19195973/pexels-photo-19195973.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31410457/pexels-photo-31410457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Heritage', 20, 12, 'Premium Hotels',
    'Classic India: Taj Mahal, forts & royal cities.', TRUE, FALSE, TRUE,
    ARRAY['golden-triangle', 'delhi', 'agra', 'jaipur', 'taj-mahal'], country_id, state_id,
    'Golden Triangle Tour Packages 2025 | Book from ₹15,000', 'Explore India’s Golden Triangle: Delhi, Agra & Jaipur. 5 to 11-day heritage tours from ₹15,000. Taj Mahal sunrise, fort rides, luxury stays. Book now!', ARRAY['Golden Triangle tour', 'India heritage packages', 'Delhi Agra Jaipur tour', 'Taj Mahal tour packages', 'Rajasthan holiday', 'Mughal architecture tour', 'private India tour', 'Mother India Tour Travels'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'golden-triangle'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'heritage-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d', '04Nt./05 Days – Delhi Agra Jaipur Delhi Tour',
    4, 5, '4 Nights / 5 Days',
    0, TRUE,
    'https://images.pexels.com/photos/30665395/pexels-photo-30665395.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/28257148/pexels-photo-28257148.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19195973/pexels-photo-19195973.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31410457/pexels-photo-31410457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Delhi: Arrival and Welcome', 'Upon arrival at Delhi airport or railway station, you are greeted and transferred to your hotel. The rest of the day is at leisure to relax or explore nearby attractions. In the evening, enjoy a welcome drink and briefing about your upcoming tour. Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Delhi to Agra: Taj Mahal & Agra Fort', 'After breakfast, drive to Agra (approx. 3 hours). Upon arrival, check into the hotel and freshen up. Then, embark on a guided tour of the magnificent Taj Mahal, a UNESCO World Heritage Site and one of the Seven Wonders of the World. Continue to the imposing Agra Fort, a red sandstone fortress complex that was the main residence of the Mughal emperors. Overnight stay in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Agra to Jaipur: Fatehpur Sikri & Pink City', 'After breakfast, drive towards Jaipur (approx. 6 hours). En route, stop at Fatehpur Sikri, the abandoned Mughal city built by Emperor Akbar. Explore its well-preserved palaces and courtyards, including the Buland Darwaza. Continue the journey to Jaipur, known as the Pink City. Check into the hotel and relax. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Jaipur: Amber Fort, Hawa Mahal & City Palace', 'After breakfast, proceed for a guided tour of Amber Fort, the ancient capital of the Rajputs, perched on a hilltop. Then, visit the iconic Hawa Mahal (Palace of Winds) with its unique facade. Continue to the City Palace, the royal residence, and the Jantar Mantar observatory. The evening is free to explore local bazaars. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 5, 'Jaipur to Delhi: Departure', 'After breakfast, drive back to Delhi (approx. 5 hours). Upon arrival in Delhi, you are transferred to the airport or your desired drop-off point for your onward journey, carrying with you fond memories of the Golden Triangle tour. End of services.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d', '05Nt./06D – Golden Triangle Tour Delhi Agra Jaipur Delhi',
    5, 6, '5 Nights / 6 Days',
    1, FALSE,
    'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34201914/pexels-photo-34201914.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Delhi: Arrival & Welcome to the Capital', 'Upon arrival at Delhi Airport, our company representative greets you and assists with a smooth transfer to your hotel. Spend the rest of the day at leisure, settling in and perhaps enjoying a welcome drink. Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Delhi: Mughal Heritage & Modern Landmarks Sightseeing', 'After breakfast, a guided tour takes you through Delhi''s contrasting layers. Visit the majestic Jama Masjid, the sprawling Red Fort, the iconic India Gate, the President''s House, and Parliament. Later, explore Qutub Minar, the Lotus Temple, and Humayun''s Tomb — a UNESCO World Heritage site. Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Delhi to Agra: Express Drive & Evening at Leisure', 'After breakfast, drive to Agra (approx. 3–4 hours). Upon arrival, check into your hotel and relax. The rest of the day is free to explore the city on your own or simply unwind. Overnight stay in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Agra: Taj Mahal at Sunrise & Fatehpur Sikri En Route to Jaipur', 'An early morning guided tour takes you to the Taj Mahal at sunrise, offering a breathtaking view of this marble marvel bathed in golden light. Return to the hotel for breakfast, then visit the formidable Agra Fort. Later, drive to Jaipur (approx. 6 hours), stopping en route at Fatehpur Sikri, the abandoned Mughal city. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Jaipur: Amber Fort & Pink City Exploration', 'After breakfast, embark on a guided tour of the ancient capital, Amber. Visit the magnificent Amber Fort (by jeep or elephant back), the Water Palace (Jal Mahal), and the iconic Hawa Mahal (Palace of Winds). Continue to the City Palace and the Jantar Mantar observatory. Also, explore the vibrant bazaars showcasing block printing and traditional Rajasthani handicrafts. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 6, 'Jaipur to Delhi: Departure with Memories', 'After breakfast, drive back to Delhi (approx. 5–6 hours). Upon arrival, you are transferred to the airport or railway station for your onward journey, carrying sweet memories of the Golden Triangle.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-v2
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-v2', '05 Night 06 Days Tour : Delhi Jaipur Ranthambhore Agra Delhi',
    5, 6, '5 Nights / 6 Days',
    2, FALSE,
    'https://images.pexels.com/photos/30665395/pexels-photo-30665395.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/28257148/pexels-photo-28257148.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19195973/pexels-photo-19195973.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31410457/pexels-photo-31410457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Delhi: Mughal & Colonial Heritage Tour', 'Upon arrival at Delhi Airport, our representative assists you and transfers you to the hotel. After breakfast, you set out to explore Old Delhi, visiting the majestic Red Fort and the bustling Chandni Chowk market. In New Delhi, you drive past the India Gate, Rashtrapati Bhavan, and visit the Qutub Minar and Humayun''s Tomb. The day ends with an overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Delhi to Agra: Taj Mahal & Agra Fort', 'After breakfast, you drive to Agra (230 km, 3 hours). Upon arrival, check into the hotel and proceed to visit the iconic Taj Mahal at sunset, a masterpiece of Mughal architecture. Later, explore the imposing Agra Fort, a UNESCO World Heritage site. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Agra to Ranthambhore: Fatehpur Sikri En Route', 'After breakfast, you drive to Ranthambhore (280 km, 7 hours). En route, stop at Fatehpur Sikri, the abandoned Mughal capital, and explore its stunning palaces and courtyards including the Buland Darwaza and Panch Mahal. Continue to Ranthambhore, check into the hotel, and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Ranthambhore: Jungle Safari & Transfer to Jaipur', 'Early morning, you embark on a thrilling jungle safari in Ranthambhore National Park (own cost), known for its tiger sightings and diverse wildlife. After breakfast, drive to Jaipur (180 km, 3 hours). Upon arrival, check into the hotel and enjoy the evening at leisure. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Jaipur: Amber Fort & Pink City Sightseeing', 'After breakfast, drive to the ancient capital of Amber and visit the magnificent Amber Fort, a hilltop fortress with intricate mirror work and courtyards. Then proceed to Jaipur, the Pink City, to see the Water Palace, Hawa Mahal (Palace of Winds), City Palace, and Jantar Mantar observatory. You also visit a block printing and gemstone cutting factory. Overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Jaipur to Delhi: Departure', 'After breakfast, you drive to Delhi (260 km, 6 hours) with sweet memories. Our team drops you at the airport or railway station for your onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d-rishikesh
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d-rishikesh', '06Nt./07 Days Tour : Delhi Haridwar/Rishikesh Agra Jaipur Delhi',
    6, 7, '6 Nights / 7 Days',
    3, FALSE,
    'https://images.pexels.com/photos/30665395/pexels-photo-30665395.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/28257148/pexels-photo-28257148.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19195973/pexels-photo-19195973.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31410457/pexels-photo-31410457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Delhi: Imperial Landmarks & Mughal Splendors', 'Upon arrival at Delhi airport, our representative escorts you to your hotel. After refreshing, you embark on a full-day sightseeing tour covering the majestic Red Fort, the serene Rajghat (Gandhi''s memorial), iconic India Gate, President''s House, and Parliament House. Later, visit the soaring Qutub Minar, the lotus-shaped Baháʼí Lotus Temple, and the exquisite Humayun''s Tomb. The evening is free for leisure, allowing you to unwind or explore nearby markets.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Delhi to Haridwar: Spiritual Journey to the Ganges', 'After breakfast, you drive 250 km to Haridwar, one of Hinduism''s holiest cities. Check into your hotel and post-lunch visit the Daksh Temple (Daksh Mahadev), the vibrant Pawan Dham, and the bustling Moti Bazar. As dusk falls, head to Har Ki Pauri to witness the soul-stirring Ganga Aarti, where priests offer fire and prayers to the river. Return to the hotel for dinner and an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Rishikesh: Yoga Capital & Ghats of the Ganges', 'Morning begins with a cable car ride to Mansa Devi Temple for panoramic views. Then you transfer to Rishikesh, the ''Yoga Capital of the World.'' Visit Triveni Ghat, the ancient Bharat Mandir, Lakshman Temple, and the iconic suspension bridges—Lakshman Jhula and Ram Jhula. The evening features the Ganga Aarti at Parmarth Niketan, a serene ceremony on the riverbank. Overnight stay in Rishikesh.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Haridwar to Agra: Scenic Drive to the Taj City', 'After a hearty breakfast, you drive 410 km to Agra, home of the Taj Mahal. The journey passes through varied landscapes of rural Uttar Pradesh. Upon arrival, check into your hotel and relax. The rest of the day is at leisure—opt for a visit to Mehtab Bagh for a sunset view of the Taj Mahal or explore local cuisine. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Agra to Jaipur: Taj Mahal, Agra Fort & Fatehpur Sikri', 'An early morning guided tour takes you to the breathtaking Taj Mahal at sunrise. Next, visit the imposing Agra Fort, a UNESCO World Heritage site. After breakfast, you drive to Jaipur, the Pink City, with an en route stop at Fatehpur Sikri, the deserted Mughal city featuring Buland Darwaza and Jama Masjid. Continue to Jaipur and check into your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Jaipur: Amber Fort & Pink City Heritage', 'After breakfast, you drive to the ancient capital of Amber. Explore the magnificent Amber Fort, with its sprawling courtyards and mirror-work palaces. Capture photos of the Water Palace (Jal Mahal) and the stunning Hawa Mahal (Palace of Winds). Later, visit the City Palace and the Jantar Mantar observatory. The tour concludes with a stop at a Rajasthani handicraft emporium. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 7, 'Jaipur to Delhi: Farewell Drive & Departure', 'Your final morning features breakfast before a 280 km drive to Delhi. Upon arrival, you are transferred to the airport with sweet memories of your Golden Triangle tour enriched by Haridwar and Rishikesh. This journey ensures a perfect blend of heritage, spirituality, and warm Indian hospitality.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 3 FROM "Destination" d WHERE d."slug" = 'haridwar'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 4 FROM "Destination" d WHERE d."slug" = 'rishikesh'
  ON CONFLICT DO NOTHING;

  -- Variant: 10n-11d-udaipur-rajasthan-ext
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '10n-11d-udaipur-rajasthan-ext', '10Nt./11 Days Tour: Delhi Agra Jaipur Udaipur Jodhpur Jaisalmer Bikaner Delhi',
    10, 11, '10 Nights / 11 Days',
    4, FALSE,
    'https://images.pexels.com/photos/30665395/pexels-photo-30665395.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/28257148/pexels-photo-28257148.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11948442/pexels-photo-11948442.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19195973/pexels-photo-19195973.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/31410457/pexels-photo-31410457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Delhi: Arrival & Mughal Heritage Tour', 'Upon arrival at Delhi Airport, our representative greets you and transfers you to the hotel. After breakfast, you explore Old Delhi’s bustling streets, visiting the majestic Red Fort and the iconic Jama Masjid. Then proceed to New Delhi for a drive past the India Gate, President’s House, and Humayun’s Tomb. The day concludes with check-in at your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Delhi to Agra: Express Drive & Taj Mahal', 'After breakfast, you drive to Agra (230 km, 3 hours). Upon arrival, you visit the world-famous Taj Mahal, a masterpiece of Mughal architecture. Later, explore the historic Agra Fort and the exquisite Itimad-Ud-Daulah (Baby Taj). The afternoon is free for shopping or optional visits to local marble inlay workshops. Overnight stay in Agra.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Agra to Jaipur via Fatehpur Sikri', 'After breakfast, you drive to Jaipur (260 km, 6 hours). En route, you stop at Fatehpur Sikri, the abandoned Mughal capital, and explore its palaces and courtyards. Continue to Jaipur, check in at your hotel, and relax. The evening is free to explore the vibrant bazaars of the Pink City. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Jaipur: Amber Fort & Pink City Highlights', 'After breakfast, you visit the ancient capital of Amber, ascending to the magnificent Amber Fort by jeep or elephant. Later, you tour Jaipur’s landmarks: the Water Palace, Hawa Mahal (Palace of Winds), City Palace, and Jantar Mantar observatory. You also witness traditional block printing and gemstone cutting at local factories. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Jaipur to Udaipur via Chittorgarh Fort', 'After breakfast, you drive to Udaipur (400 km, 7 hours). En route, you visit the imposing Chittorgarh Fort, a UNESCO World Heritage site symbolizing Rajput valor. Continue to Udaipur, the City of Lakes, and check in at your hotel. Enjoy a leisurely evening by Lake Pichola. Overnight stay in Udaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Udaipur: City Palace, Temples & Lake Cruise', 'After breakfast, you explore Udaipur’s City Palace, a sprawling complex overlooking Lake Pichola. Next, visit the intricately carved Jagdish Temple and the beautiful Sahelion-ki-Bari (Princess Garden). The highlight is a boat ride on Lake Pichola, offering views of the Lake Palace and Jag Mandir. Overnight stay in Udaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 7, 'Udaipur to Jodhpur via Ranakpur Jain Temple', 'After breakfast, you drive to Jodhpur (250 km, 7 hours). En route, you stop at the serene Ranakpur Jain Temple, renowned for its stunning marble architecture and 1,444 intricately carved pillars. Continue to Jodhpur, check in at your hotel, and explore the vibrant Sardar Market. Overnight stay in Jodhpur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 8, 'Jodhpur to Jaisalmer: Fort & Desert Gateway', 'After breakfast, you visit the imposing Mehrangarh Fort atop a hill, then the serene Jaswant Thada cenotaph. Afterward, you drive to Jaisalmer (285 km, 6 hours). En route, you pass through the Thar Desert landscape. Upon arrival, check in and prepare for the next day’s desert adventure. Overnight stay in Jaisalmer.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 9, 'Jaisalmer: Fort, Havelis & Desert Safari', 'After breakfast, you check out and explore Jaisalmer Fort, a living fort with shops and homes. Inside, visit the Jain Temples and Patwon-ki-Haveli, a cluster of five sandstone havelis. Later, you visit the ancient Lodurva Jain Temple. After lunch, you head to the Sam Sand Dunes for a camel ride and Rajasthani folk dance performance. Stay overnight at a desert resort.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 10, 'Jaisalmer to Bikaner: Fort & Rat Temple', 'After breakfast, you drive to Bikaner (325 km, 6 hours). Upon arrival, visit the majestic Junagarh Fort. After check-in, you proceed to the famous Deshnok Temple, dedicated to the goddess Karni Mata and inhabited by thousands of rats, considered sacred. Overnight stay in Bikaner.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 11, 'Bikaner to Delhi: Painted Havelis & Departure', 'After breakfast, you drive back to Delhi (440 km, 8 hours). En route, you stop to admire the old painted havelis of the Shekhawati region, such as those in Mandawa or Nawalgarh. You are then transferred to Delhi Airport or railway station, concluding your tour with sweet memories of Rajasthan.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 3 FROM "Destination" d WHERE d."slug" = 'udaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 4 FROM "Destination" d WHERE d."slug" = 'jodhpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 5 FROM "Destination" d WHERE d."slug" = 'jaisalmer'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 6 FROM "Destination" d WHERE d."slug" = 'bikaner'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d-pushkar
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d-pushkar', '06 Nights 07 Days Tour : Delhi Agra Pushkar Jaipur Delhi',
    6, 7, '6 Nights / 7 Days',
    5, FALSE,
    'https://images.pexels.com/photos/35616883/pexels-photo-35616883.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14094276/pexels-photo-14094276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19926950/pexels-photo-19926950.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13708235/pexels-photo-13708235.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12409661/pexels-photo-12409661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_5;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_5;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 1, 'Delhi: Arrival & Welcome', 'Upon arrival at Delhi Airport, our representative greets you and escorts you to your pre-booked hotel. After check-in, the evening is free to rest or explore nearby markets. Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 2, 'Delhi: Mughal & Modern Landmarks', 'After breakfast, a guided tour takes you through Delhi''s iconic sights. Visit the majestic Red Fort and the sprawling Jama Masjid, then drive past India Gate, the Lotus Temple, and the ancient Qutub Minar complex. The evening is at leisure. Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 3, 'Delhi to Agra: Fatehpur Sikri En Route', 'After breakfast, check out and drive to Jaipur. En route, stop at the UNESCO-listed Fatehpur Sikri, the abandoned Mughal capital, exploring its palaces and courtyards. Continue to Jaipur, check in at your hotel, and relax. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 4, 'Jaipur: Amber Fort & Pink City', 'Morning guided tour begins at Amber Fort, the ancient Rajput capital, with a ride up the hill. Later, in Jaipur, visit the Water Palace (Jal Mahal), the iconic Hawa Mahal (Palace of Winds), the City Palace, and the Jantar Mantar observatory. The tour ends at a Rajasthani handicraft emporium. Overnight stay in Jaipur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 5, 'Jaipur to Pushkar: Sacred Lake & Bazaars', 'After breakfast, drive to Pushkar. Check in at the hotel, then set out to explore the holy town. Visit Pushkar Lake, a sacred site ringed by ghats and temples. Enjoy a walking tour through the colorful local market, famous for textiles and souvenirs. Overnight stay in Pushkar.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 6, 'Pushkar to Delhi: Return Journey', 'Following breakfast, check out and drive back to Delhi (approx. 7 hours). Arrive in Delhi, check in at your hotel, and unwind after the long drive. The evening is free for last-minute shopping or relaxation. Overnight stay in Delhi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_5, 7, 'Delhi: Departure with Memories', 'After breakfast, check out from the hotel. You are then transferred to Delhi Airport or Railway Station for your onward journey, carrying with you the vibrant memories of North India''s heritage.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 0 FROM "Destination" d WHERE d."slug" = 'delhi'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 1 FROM "Destination" d WHERE d."slug" = 'agra'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 2 FROM "Destination" d WHERE d."slug" = 'jaipur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_5, d."id", 3 FROM "Destination" d WHERE d."slug" = 'pushkar'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'sikkim';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'sikkim-darjeeling', 'Sikkim Darjeeling Tour Packages',
    'Sikkim and Darjeeling offer an unparalleled adventure playground where the majestic Kanchenjunga forms a dramatic backdrop. From the emerald tea gardens of Darjeeling to the ancient monasteries of Gangtok and the rugged trails of Pelling, this region blends natural beauty with rich culture. Adventure seekers can trek through rhododendron forests, raft the Teesta''s rapids, and ride the UNESCO-listed Darjeeling Himalayan Railway. Mother India Tour Travels ensures a seamless experience with expert guides, quality accommodations, and meticulously planned itineraries that capture the essence of the Northeast.',
    ARRAY['Witness the golden sunrise over Kanchenjunga from Tiger Hill, Darjeeling', 'Ride the Darjeeling Himalayan Railway (Toy Train) through misty hills and tea gardens', 'Explore the ancient Pemayangtse Monastery in Pelling, offering panoramic Himalayan views', 'Experience white-water rafting on the Teesta River near Gangtok', 'Visit Yumthang Valley (Sikkim''s Valley of Flowers) and the hot springs at Lachung'],
    ARRAY['Accommodation in premium hotels/resorts on twin-sharing basis', 'Daily breakfast and dinner (starting Day 1 dinner through Day last breakfast)', 'All transfers and sightseeing by private air-conditioned vehicle', 'Services of an English-speaking local guide', 'Entry fees to monuments, parks, and monasteries as per itinerary', 'Permits for restricted areas (e.g., Nathula Pass, if included)', 'All taxes, GST, and service charges'],
    ARRAY['Airfare or train fare (unless specified)', 'Visa fees (for foreign nationals)', 'Personal expenses such as laundry, tips, and beverages', 'Camera fees at monuments and monasteries', 'Any services not mentioned in inclusions'],
    ARRAY['Foreign nationals need Restricted Area Permits for Sikkim; we assist with obtaining them.', 'Best time for adventure activities is March to June and September to November.', 'Altitude acclimatization is recommended for high-altitude treks (e.g., Goecha La).'],
    'https://images.pexels.com/photos/103875/pexels-photo-103875.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/35187617/pexels-photo-35187617.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/35151736/pexels-photo-35151736.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19000373/pexels-photo-19000373.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/1007328/pexels-photo-1007328.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Adventure', 20, 12, 'Premium Hotels',
    'Sikkim Darjeeling: Adventure amidst tea gardens and mountain peaks.', FALSE, FALSE, TRUE,
    ARRAY['sikkim', 'darjeeling', 'tea-gardens', 'mountains', 'northeast'], country_id, state_id,
    'Sikkim Darjeeling Tour Packages | Adventure from ₹9,999', 'Experience the best Sikkim Darjeeling adventure tours. Gangtok, Darjeeling, Pelling. Toy train, river rafting, sunset at Kanchenjunga. 5 packages from ₹9,999.', ARRAY['sikkim-darjeeling-tour-packages', 'adventure-sikkim', 'darjeeling-tea-gardens', 'gangtok-tourism', 'pelling-trekking', 'northeast-india-tours', 'kanchenjunga-tours', 'mother-india-tour-travels'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'hill-station-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'adventure-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 3n-4d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '3n-4d', 'View Details',
    3, 4, '3 Nights / 4 Days',
    0, TRUE,
    'https://images.pexels.com/photos/103875/pexels-photo-103875.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/35187617/pexels-photo-35187617.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/35151736/pexels-photo-35151736.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19000373/pexels-photo-19000373.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/1007328/pexels-photo-1007328.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Gangtok: Arrival & Local Exploration', 'Arrive at Bagdogra Airport or NJP Railway Station and drive to Gangtok (approx. 4 hours). After check-in, visit the bustling MG Marg for a leisurely stroll and shop for local handicrafts. Later, explore the revered Enchey Monastery and the ornate Do-drul Chorten stupa. Overnight in Gangtok.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Gangtok to Darjeeling: Scenic Drive & Mall Road', 'After breakfast, drive to Darjeeling (approx. 4 hours), enjoying panoramic views of the Himalayas. Upon arrival, check into your hotel and head to the iconic Mall Road and Chowrasta, where you can soak in the colonial charm. Visit the Batasia Loop, a spiral railway track offering stunning vistas, and the War Memorial. Overnight in Darjeeling.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Darjeeling to Pelling: Sunrise & Monastery Trail', 'Pre-dawn start for a sunrise visit to Tiger Hill (weather permitting) to witness the golden glow on Mount Kanchenjunga. Return to Darjeeling for breakfast, then visit the Himalayan Mountaineering Institute and the Peace Pagoda. Drive to Pelling (approx. 4 hours), nestled in West Sikkim. Evening at leisure, taking in views of the Kanchenjunga range. Overnight in Pelling.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Pelling: Spirituality & Departure', 'Begin your day with a visit to the 17th-century Pemayangtse Monastery, one of Sikkim''s oldest and most sacred. Then drive to the emerald Khecheopalri Lake, a holy site surrounded by forest. After lunch, transfer back to Bagdogra Airport or NJP Railway Station (approx. 5 hours) for your departure, carrying memories of the Himalayas.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'gangtok'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'darjeeling'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'pelling'
  ON CONFLICT DO NOTHING;

  -- Variant: 8n-9d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '8n-9d', 'View Details',
    8, 9, '8 Nights / 9 Days',
    1, FALSE,
    'https://images.pexels.com/photos/103875/pexels-photo-103875.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/35187617/pexels-photo-35187617.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/35151736/pexels-photo-35151736.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/19000373/pexels-photo-19000373.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/1007328/pexels-photo-1007328.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Arrival in Bagdogra & Scenic Drive to Gangtok', 'Upon arrival at Bagdogra Airport or New Jalpaiguri Railway Station, you are greeted by our representative and transferred to Gangtok, the capital of Sikkim. The 4-hour drive winds through lush green hills, terraced tea gardens, and gushing rivers. After check-in at your hotel, the evening is free to explore MG Marg, the vibrant pedestrian-only street lined with shops and cafes. Overnight in Gangtok.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Gangtok: Tsomgo Lake & Baba Harbhajan Singh Temple', 'After an early breakfast, you drive to Tsomgo Lake (Changu Lake), a glacial lake at 12,400 feet, surrounded by snow-capped peaks and rhododendron forests. Continue to the sacred Baba Harbhajan Singh Temple, dedicated to a soldier revered as a saint. En route, marvel at the dramatic mountain scenery. Return to Gangtok for a relaxed evening. Overnight in Gangtok.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Gangtok: Monasteries & Local Sights', 'Today you explore Gangtok''s cultural treasures. Begin with Rumtek Monastery, one of the largest and most significant in Sikkim. Then visit Enchey Monastery, Do Drul Chorten Stupa, and the Directorate of Handicrafts & Handloom for local crafts. After lunch, take a short hike to Tashi View Point for panoramic views of Kanchenjunga. End the day with a stroll through the flower show. Overnight in Gangtok.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Gangtok to Darjeeling: Tea Gardens & Scenic Drive', 'After breakfast, depart for Darjeeling, the ''Queen of the Hills''. The 4-hour drive passes through the Teesta Valley, with stops at ancient monasteries and local markets. En route, visit a tea garden in the Kurseong area for a glimpse of tea plucking and processing. Arrive in Darjeeling by afternoon and check into your hotel. Evenings are spent on the bustling Mall Road, with views of the Kanchenjunga range. Overnight in Darjeeling.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Darjeeling: Tiger Hill Sunrise & Himalayan Wonders', 'Pre-dawn, you drive to Tiger Hill for a spectacular sunrise over Kanchenjunga and Mount Everest. Return via Batasia Loop and Ghoom Monastery, the oldest in Darjeeling. After breakfast, enjoy a ride on the Darjeeling Himalayan Railway (toy train) from Darjeeling to Ghoom. Later, visit the Himalayan Mountaineering Institute, Padmaja Naidu Himalayan Zoological Park (home to red pandas), and a tea plantation for a tasting session. Overnight in Darjeeling.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 6, 'Darjeeling to Pelling: Journey through West Sikkim', 'After breakfast, drive to Pelling, a charming town in West Sikkim. The 4-hour journey takes you through the scenic Rangit Valley and along winding roads with stunning mountain vistas. En route, stop at the 17th-century Sangachoeling Monastery, one of the oldest in Sikkim. Check into your hotel and spend the evening at leisure, soaking in the serene atmosphere. Overnight in Pelling.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 7, 'Pelling: Ancient Monasteries & Khecheopalri Lake', 'Today you explore Pelling''s spiritual and natural highlights. Visit Pemayangtse Monastery, a 300-year-old Buddhist monastery with intricate woodcarvings, and the neighboring Rabdentse Ruins, the second capital of Sikkim. Next, drive to the sacred Khecheopalri Lake, nestled in the forest and believed to grant wishes. End with a visit to Rimbi Waterfall and the local craft center. Overnight in Pelling.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 8, 'Pelling: Yuksom & Local Village Exploration', 'After breakfast, take a day trip to Yuksom, the first capital of Sikkim (about 1 hour drive). Explore the historic Norbugang Coronation Throne and Tashiding Monastery, set on a hilltop. Alternatively, opt for a guided nature walk through the rhododendron forests of the Khangchendzonga National Park. Return to Pelling for a farewell dinner. Overnight in Pelling.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 9, 'Departure from Pelling to Bagdogra', 'Enjoy a final Himalayan breakfast before driving back to Bagdogra Airport or NJP Railway Station (approx 5 hours). The scenic route offers last glimpses of the mountains and tea gardens. Your tour concludes with memories of Sikkim''s majestic landscapes and cultural riches. Board your flight or train for onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'gangtok'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'darjeeling'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'pelling'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d', 'EXPLORE PELLING/DARJEELING/GANGTOK (06 Night 07 Day’s)',
    6, 7, '6 Nights / 7 Days',
    2, FALSE,
    'https://images.pexels.com/photos/2324780/pexels-photo-2324780.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14916663/pexels-photo-14916663.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/6592571/pexels-photo-6592571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/30733687/pexels-photo-30733687.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13079865/pexels-photo-13079865.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Pelling: Arrival and Leisure Evening', 'Arrive at NJP Railway Station or Bagdogra Airport, where our representative greets you. We then drive to Pelling (115 km, approx. 5 hours), a picturesque hill station. Check into the hotel and freshen up. The evening is free for relaxation, allowing you to soak in the tranquil mountain atmosphere. Rest of the day at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Pelling: Half-Day Sightseeing Tour', 'After breakfast, we set out for a half-day sightseeing tour of Pelling''s highlights. Visit the sacred Khecheopalri Lake, known for its floating leaves, and the stunning Kanchanjunga Falls and Rimbi Falls. Explore the Rock Garden, the ancient Pemayangtsey Monastery, and the ruins of Rabdentcy Palace. Return to the hotel and enjoy the evening with family or friends. Rest of the day at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Pelling to Gangtok: Scenic Drive and Evening at Leisure', 'After breakfast, we depart for Gangtok (130 km, approx. 5 hours), the capital of Sikkim. The drive offers breathtaking views of the Himalayas and lush valleys. Check into the hotel and freshen up. The evening is free for personal exploration or simply relaxing at the hotel. Rest of the day at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Gangtok: Tsomgo Lake and Baba Mandir Excursion', 'After breakfast, we embark on a full-day excursion to three iconic sites. Drive through winding roads to Tsomgo Lake at 12,400 ft, where you can enjoy a yak ride and take photos of the pristine lake surrounded by snow-capped peaks. Continue to Baba Mandir, a revered shrine. Also visit Nathula Pass (if open), the historic border pass. Return to Gangtok in the evening.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Gangtok to Darjeeling: Transfer and Mall Road Stroll', 'After breakfast, we transfer to Darjeeling, enjoying the scenic beauty of the mountain road. Check into the hotel and refresh. The evening is free to explore Darjeeling Mall Road, famous for its vibrant shops, cafes, and the colonial-era architecture. You can also visit the nearby Chowrasta. Rest of the day at leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Darjeeling: Tiger Hill Sunrise and Full-Day Sightseeing', 'Wake up early (around 4 am) and drive to Tiger Hill to witness the spectacular sunrise over Kanchenjunga Peak. On the way back, visit Batasia Loop and Ghoom Monastery. After breakfast, proceed for full-day sightseeing including Himalayan Zoological Park, Mountaineering Institute, Tenzing & Gombu Rock, and a tea estate. Evening free for leisure.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 7, 'Darjeeling: Departure from Bagdogra/NJP', 'After breakfast, check out from the hotel and transfer to NJP Railway Station or Bagdogra Airport for your onward journey. Bid farewell to the hills with cherished memories and a desire to return. Return home with happy memories.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'gangtok'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'darjeeling'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'pelling'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d', 'Sikkim Darjeeling Tour 04 Night 05 Days',
    4, 5, '4 Nights / 5 Days',
    3, FALSE,
    'https://images.pexels.com/photos/30733687/pexels-photo-30733687.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/14916663/pexels-photo-14916663.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/6592571/pexels-photo-6592571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/2324780/pexels-photo-2324780.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13079865/pexels-photo-13079865.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Gangtok: Arrival & Alpine Welcome', 'Your adventure begins with a warm meet-and-greet at NJP Railway Station or Bagdogra Airport. From there, you transfer to Gangtok, the capital of Sikkim, nestled at 5,500 feet. The drive offers glimpses of lush forests, winding rivers, and panoramic mountain views. Upon arrival, check into your hotel and enjoy the evening at leisure to acclimatize to the altitude. Take a stroll along MG Road or simply relax amidst the alpine scenery.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Gangtok: Tsomogo Lake & Baba Mandir Excursion', 'After breakfast, depart at 9:00–9:30 AM for an excursion to Tsomogo Lake, also known as Changu Lake, situated at 3,780 meters. The lake is surrounded by snow-capped mountains and is considered sacred. Continue to Baba Mandir, a shrine dedicated to Sepoy Harbahajan Singh, where you can feel the spiritual aura. Return to Gangtok in the afternoon and spend the evening at leisure, perhaps exploring local markets or enjoying a traditional meal.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Gangtok to Pelling: Cultural Sightseeing & Scenic Transfer', 'Enjoy a half-day sightseeing tour of Gangtok, covering Jhakri Water Falls, Ranka Monastery, and the Research Institute of Tibetology (closed on Sunday and government holidays). Visit Do-Drul Chorten, a prominent stupa, and the Directorate of Handloom (closed Sunday). After lunch, transfer to Pelling, a scenic hill station with majestic views of the Kanchenjunga range. Upon arrival, check into your hotel and relax.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Pelling: Monasteries, Lakes & Himalayan Vistas', 'After breakfast, embark on a full-day sightseeing tour of Pelling. Visit Rimbi Waterfalls, Rock Garden, and the sacred Khecheopalri Lake, believed to fulfill wishes. Explore Darap Village for a glimpse of local life, then continue to Kanchenjunga Water Falls. Discover the historic Pemayangtse Monastery and Rabdentse Ruins, the former capital of Sikkim. End the day at the New Helipad and Kanchenjunga View Tower for panoramic sunset views.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Pelling to Bagdogra/NJP: Departure', 'After breakfast, check out from your hotel and transfer to Bagdogra Airport or NJP Railway Station for your onward journey. The drive takes you through winding hill roads with last glimpses of the Himalayas. Bid farewell to the enchanting landscapes of Sikkim, carrying memories of serene lakes and ancient monasteries.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'gangtok'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'darjeeling'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'pelling'
  ON CONFLICT DO NOTHING;

  -- Variant: 0n-1d-day-trip
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '0n-1d-day-trip', 'Sikkim Darjeeling Gangtok Tour 5 Days',
    0, 1, 'Same Day Tour',
    4, FALSE,
    'https://images.pexels.com/photos/14916663/pexels-photo-14916663.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/6592571/pexels-photo-6592571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/2324780/pexels-photo-2324780.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/30733687/pexels-photo-30733687.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13079865/pexels-photo-13079865.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Arrival in Gangtok via Bagdogra Airport', 'After arriving at Bagdogra Airport, you transfer to Gangtok (120 km, 4.5 hours). Upon arrival, complete check-in at the hotel and enjoy the remainder of the day at leisure. Overnight in Gangtok.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Gangtok Sightseeing – Tsomgo Lake and Baba Mandir', 'After breakfast, proceed for a full-day excursion to Tsomgo Lake (also known as Changu Lake), a glacial wonder on the way to Nathu La Pass. Next, visit Baba Mandir, a shrine dedicated to soldier Harbhajan Singh. Return to Gangtok; evening free for shopping. Optional add-on: Nathula Pass (Indian nationals only).', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Gangtok Half-Day Tour & Transfer to Darjeeling', 'After breakfast, enjoy a half-day sightseeing tour of Gangtok covering Banjhakri Falls, Cottage Industry and Handicraft Center, Flower Show, Dro-dul Chorten, and Institute of Tibetology. Then drive to Darjeeling (115 km, 4 hours). On arrival, check into your hotel. Overnight in Darjeeling.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Darjeeling Sightseeing – Tiger Hill, Tea Gardens, and Monasteries', 'Early morning, depart for Tiger Hill to view the sunrise over Kanchenjunga. After breakfast, visit Padmaja Naidu Zoological Park, Himalayan Mountaineering Institute, and a tea garden to see tea plucking. Continue to Ghoom Monastery, Batasia Loop, Japanese Temple, and Tibetan Refugee Self Help Center. Afternoon at leisure for shopping.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Departure from Darjeeling to Bagdogra Airport', 'After breakfast, check out from the hotel and transfer to Bagdogra Airport (80 km, 3 hours) for your onward flight.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'gangtok'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'darjeeling'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'pelling'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'andaman-nicobar';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'andaman-islands', 'Andaman Island Tour Packages',
    'Escape to the pristine Andaman Islands, where turquoise waters meet powdery white sands and vibrant coral reefs teem with marine life. From the historic Cellular Jail in Port Blair to the serene shores of Radhanagar Beach on Havelock, every moment is a discovery. Snorkel in the crystal-clear waters of Elephant Beach, or simply unwind amidst the untouched beauty of Neil Island. With Mother India Tour Travels, enjoy expertly curated packages that combine adventure, relaxation, and seamless travel across these tropical gems.',
    ARRAY['Witness the historic Cellular Jail and its moving light & sound show in Port Blair', 'Stroll along Radhanagar Beach, Asia''s best beach, on Havelock Island', 'Snorkel at Elephant Beach and swim among colorful corals and exotic fish', 'Explore the natural rock formations and tranquil lagoons of Neil Island', 'Visit Samudrika Marine Museum to learn about the Andaman''s rich marine biodiversity'],
    ARRAY['Accommodation in selected hotels/resorts with breakfast and dinner', 'All transfers and sightseeing by private air-conditioned vehicle', 'Ferry tickets between Port Blair, Havelock, and Neil Island', 'Snorkeling gear and guided snorkeling session at Elephant Beach', 'Entry fees to all monuments, museums, and beaches as per itinerary', 'Services of an English-speaking tour guide', 'All applicable taxes and service charges'],
    ARRAY['Airfare to/from Port Blair', 'Personal expenses such as tips, laundry, and beverages', 'Travel insurance', 'Optional activities like scuba diving or sea walk', 'Any items not mentioned in inclusions'],
    ARRAY['Best time to visit is from October to May for clear skies and calm seas.', 'Carry valid photo ID proof for permits and check-in at hotels and ferries.', 'Pack light cotton clothes, sunscreen, insect repellent, and swimwear.'],
    'https://images.pexels.com/photos/25033671/pexels-photo-25033671.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/37949154/pexels-photo-37949154.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37949155/pexels-photo-37949155.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37949152/pexels-photo-37949152.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/33053824/pexels-photo-33053824.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Beach', 20, 12, 'Premium Hotels',
    'Escape to turquoise waters and white sands – Andaman awaits!', FALSE, FALSE, TRUE,
    ARRAY['andaman', 'islands', 'beaches', 'snorkeling', 'tropical'], country_id, state_id,
    'Andaman Island Tour Packages 2025 | Book from ₹15,999', 'Explore pristine beaches & vibrant coral reefs with our Andaman tour packages. Choose from 4 to 8 days trips to Havelock & Neil Island. Book now!', ARRAY['andaman tour packages', 'andaman islands tourism', 'havlock island tour', 'neil island packages', 'port blair tours', 'beach holidays andaman', 'snorkeling trips andaman', 'tropical island getaways'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'beach-holidays'
  ON CONFLICT DO NOTHING;

  -- Variant: 3n-4d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '3n-4d', 'Port Blair, Havelock Island 03 night 04 days Tour',
    3, 4, '3 Nights / 4 Days',
    0, TRUE,
    'https://images.pexels.com/photos/362690/pexels-photo-362690.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/16827207/pexels-photo-16827207.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/30188165/pexels-photo-30188165.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/10756695/pexels-photo-10756695.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Port Blair: Colonial History & Beach Welcome', 'Arrive at Port Blair Airport, where our representative greets and escorts you to the hotel. Freshen up and head to Corbyn''s Cove Beach, just 10 km away, for swimming and beach activities. Later, visit the Chatham Saw Mill, Samudrika Marine Museum, and Anthropological Museum. In the evening, attend the mesmerizing light and sound show at the historic Cellular Jail, recounting India''s freedom struggle. Return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Havelock Island: Radhanagar Beach Bliss', 'An early 5:30 AM departure by ferry from Port Blair to Havelock Island, covering 54 km across the sea in about 2.5 hours. After checking into the hotel, proceed to the world-famous Radhanagar Beach, often ranked among Asia''s best. Spend the afternoon swimming, sunbathing, and walking along the pristine white sands. Return to the hotel in the late evening for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Havelock to Port Blair: Elephanta Beach Adventure', 'Enjoy a leisurely morning at Havelock before heading to Elephanta Beach, reachable by a short boat ride. Experience a trilogy of sun, sand, and sea like never before, with opportunities for snorkeling and beachcombing. Later, explore another beach of your choice, such as Kalapathar or Vijaynagar. Depart Havelock at 2:00 or 4:00 PM by ferry back to Port Blair, arriving by 4:30 or 6:30 PM. The rest of the evening is at leisure; overnight stay at Port Blair.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Port Blair: Departure Day', 'Morning is free for packing and personal activities. Check out from the hotel in time and transfer to the Jetty or Airport for your onward journey. Tour ends with fond memories of the Andaman Islands.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'port-blair'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'havelock-island'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'neil-island'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d', 'Island Tour for 05 Night 06 Days',
    5, 6, '5 Nights / 6 Days',
    1, FALSE,
    'https://images.pexels.com/photos/16827207/pexels-photo-16827207.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/362690/pexels-photo-362690.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/30188165/pexels-photo-30188165.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/10756695/pexels-photo-10756695.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Port Blair: Corbyn''s Cove & Cellular Jail Light Show', 'Arrive at Port Blair Airport, where our representative greets and escorts you to the hotel. After freshening up, head to Corbyn''s Cove Beach, just 10 km from the city, for swimming and beach activities. In the evening, proceed to the historic Cellular Jail for the enthralling light and sound show that narrates the struggles of India''s freedom fighters. Overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Havelock: Cruise Transfer & Radhanagar Beach', 'After a sumptuous breakfast, transfer to Havelock Island via a comfortable cruise ferry. Upon arrival, check in to your hotel and enjoy lunch. Later, visit Radhanagar Beach, named ''the best beach in Asia'' by Time magazine in 2004. Spend time exploring the serene shoreline and swimming in the crystal-clear waters before returning to the hotel for dinner and an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Havelock: Elephanta Beach Snorkeling & Water Sports', 'Start the day with breakfast at the hotel, then proceed to Havelock jetty for a boat ride to Elephanta Beach. This lovely stretch of sand offers crystal-clear waters where you can spot fish and other sea creatures while swimming. Enjoy included snorkeling, with optional scuba diving and glass-bottom boat rides available at extra cost. Return to the hotel in the afternoon for leisure. Overnight at Havelock.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Neil Island: Bharatpur, Natural Bridge & Laxmanpur Beaches', 'After a delicious breakfast, ferry to serene Neil Island. Check in to your hotel and relax before embarking on a beach safari. Visit Bharatpur Beach, known for its shallow waters, then the Natural Bridge rock formation, and Laxmanpur Beach with its stunning sunset views. Also explore Sitapur Beach, famous for its red sand. Overnight at Neil Island.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Port Blair: Return & Chidiya Tapu Sunset', 'Post breakfast, transfer back to Port Blair by ferry. In the afternoon, head to Chidiya Tapu, located south of Port Blair, renowned as one of the best sunset viewpoints in the Andamans. Enjoy the tranquil atmosphere and panoramic views before returning to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 6, 'Departure: Airport Transfer', 'After a final breakfast, prepare for departure. Our representative will pick you up from the hotel and drop you at Port Blair Airport with ample time for your flight. Bid farewell to the exotic islands, mesmerizing beaches, and unspoiled nature, carrying memories of a remarkable journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'port-blair'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'havelock-island'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'neil-island'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d', 'Andaman relaxing tour for 06 Night 07 Days',
    6, 7, '6 Nights / 7 Days',
    2, FALSE,
    'https://images.pexels.com/photos/30188165/pexels-photo-30188165.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/362690/pexels-photo-362690.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/16827207/pexels-photo-16827207.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/10756695/pexels-photo-10756695.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Port Blair: Arrival & Cellular Jail Light & Sound Show', 'Arrive at Port Blair, where our representative greets you and transfers you to your hotel. After some leisure time, visit Corbyn''s Cove Beach for a relaxing stroll. Later, head to the historic Cellular Jail, a pilgrimage site for India''s freedom fighters. The day concludes with the evocative Sound and Light Show at the jail, recounting the struggles of the past. Overnight at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Port Blair: North Bay Coral Island & Ross Island Excursion', 'After breakfast, embark on a full-day three-island cruise covering North Bay (Coral Island) and Ross Island. North Bay offers vibrant coral reefs and water sports opportunities. Ross Island, the former British administrative headquarters, now houses the Smritika Museum with colonial artifacts and is home to friendly deer. Return to Port Blair for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Transfer to Havelock Island', 'After breakfast, take a ferry to Havelock Island, located 54 km northeast of Port Blair. Upon arrival at Havelock Jetty, our representative assists you with transfer to your hotel. Check in and enjoy the rest of the day at leisure. Dinner and overnight at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Havelock: Radhanagar Beach Exploration', 'After breakfast, proceed to Radhanagar Beach (Beach No. 7), consistently ranked among Asia''s best beaches. Its powdery white sand and clear turquoise waters provide a serene setting for swimming and sunbathing. Spend the afternoon soaking in the scenic beauty and watching the sunset. Return to the hotel for dinner and overnight.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Havelock: Leisure Day & Optional Elephant Beach', 'Today is free for relaxation or optional activities. You may choose to visit Elephant Beach, accessible by boat, known for its excellent snorkeling and scuba diving sites with a house reef teeming with colorful corals and marine life. Alternatively, explore other beaches or simply relax at the resort. Overnight in Havelock.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Neil Island to Port Blair: Chidiyatapu Sunset', 'After breakfast, depart from Neil Island to Port Blair by ferry. Check in at your hotel and later visit Chidiyatapu (Bird Island), a nature park offering panoramic views and rich birdlife, especially at sunset. Return to the hotel for dinner and overnight.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 7, 'Port Blair: Departure Transfer', 'After breakfast at the hotel, transfer to Veer Savarkar International Airport in Port Blair for your onward flight. Bid farewell to the Andaman Islands with cherished memories of your relaxing tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'port-blair'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'havelock-island'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'neil-island'
  ON CONFLICT DO NOTHING;

  -- Variant: 7n-8d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '7n-8d', 'Memorable Beaches Tour for 07Night/ 08 Days',
    7, 8, '7 Nights / 8 Days',
    3, FALSE,
    'https://images.pexels.com/photos/10756695/pexels-photo-10756695.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/362690/pexels-photo-362690.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/16827207/pexels-photo-16827207.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/30188165/pexels-photo-30188165.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Port Blair: Arrival, Cellular Jail & Light & Sound Show', 'Arrive at Port Blair airport, where our representative greets you and transfers you to the hotel. The first half of the day is at leisure to relax. In the afternoon, visit Carbyn''s Cove Beach for a stroll along the shoreline. Later, explore the historic Cellular Jail, a colonial prison that once held Indian freedom fighters. In the evening, attend the moving Light & Sound Show that narrates the jail''s poignant history.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Port Blair: North Bay Coral Island & Ross Island Excursion', 'After breakfast, embark on a full-day three-island cruise covering North Bay and Ross Island. North Bay, also known as Coral Island, offers excellent snorkeling opportunities amidst vibrant coral gardens. Next, visit Ross Island, the former British administrative headquarters, now home to a museum called Smritika displaying colonial-era photographs and antiques. The island is also known for its friendly deer population.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Port Blair to Havelock: Island Transfer & Leisure', 'After breakfast, board a ferry from Port Blair to Havelock Island, a 54-kilometer journey northeast. Arrive at Havelock Jetty, where our representative meets you and escorts you to the hotel. The rest of the day is free for individual activities. Dinner and overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Havelock: Radhanagar Beach (Beach No. 7)', 'After breakfast, proceed to Radhanagar Beach, also known as Beach No. 7, the crown jewel of Havelock Island. Rated among the world''s top beaches, it offers pristine white sands and crystal-clear turquoise waters. Spend the day basking in the sun, swimming, or walking along the scenic shoreline. Dinner and overnight stay at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Havelock to Neil Island: Transfer & Optional Snorkeling at Elephant Beach', 'Day at leisure for individual activities. Optionally, proceed for snorkeling at Elephant Beach, accessible by boat. The beach boasts an easily accessible house reef with beautiful corals and marine life, making it a favorite spot for scuba diving and beginner snorkelers. In the afternoon, drive to Havelock Jetty and board a ferry to Neil Island. Upon arrival, check in at the hotel and visit Howrah Bridge and Bharatpur Beach in the evening.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Neil Island to Port Blair: Chidiyatapu Sunset', 'After breakfast, transfer from Neil Island to Port Blair by ferry. In the evening, visit Chidiyatapu, a picturesque beach known for its stunning sunset views and bird sanctuary. Return to the resort for dinner and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 7, 'Port Blair: Baratang Island Limestone Caves Excursion', 'Start early at 3:40 AM for a full-day tour by road and boat to Baratang Island. Explore the famous limestone caves, formed over thousands of years, accessible through dense mangrove creeks. The journey offers a glimpse into the raw natural beauty of the Andaman islands. Return to Port Blair in the evening for dinner and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 8, 'Port Blair: Departure', 'After breakfast at the hotel, transfer to Port Blair airport in an air-conditioned vehicle to board your flight for your onward destination. The tour concludes with warm memories of the Andaman Islands.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'port-blair'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'havelock-island'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'neil-island'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO state_id FROM "State" WHERE "slug" = 'tamil-nadu';

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'south-india-tours', 'South India Tour Packages',
    'South India’s heritage hill stations blend colonial-era charm with lush natural beauty. In Ooty, ride the Nilgiri Mountain Railway past tea gardens, while Mysore dazzles with its opulent palace and vibrant Dasara festivities. Kodaikanal offers serene lake walks and pine-scented trails, and Coorg’s coffee plantations invite you to savor the aroma of freshly brewed beans. With Mother India Tour Travels, delve into this cultural tapestry through expertly curated tours that combine history, nature, and local traditions.',
    ARRAY['Ride the UNESCO-listed Nilgiri Mountain Railway from Mettupalayam to Ooty, winding through tunnels and waterfalls', 'Explore the Indo-Saracenic Mysore Palace, illuminated with 97,000 bulbs on Sundays and during Dasara', 'Row a boat across Kodaikanal''s star-shaped lake, surrounded by eucalyptus and pine forests', 'Stroll through Coorg’s sprawling coffee estates at Abbey Falls, tasting fresh robusta beans', 'Visit the 10th-century Sri Chamundeshwari Temple atop Chamundi Hill, offering panoramic views of Mysore'],
    ARRAY['Accommodation in heritage boutique hotels or resorts for the duration of the tour', 'Daily breakfast at the hotel; lunch on days with full-day excursions', 'Private air-conditioned vehicle for all transfers and sightseeing', 'English-speaking guide at major monuments and during city tours', 'Entrance fees to all monuments, temples, and national parks as per itinerary', 'Toy train ticket (Nilgiri Mountain Railway) from Mettupalayam to Ooty', '24/7 customer support and assistance throughout your journey'],
    ARRAY['Airfare or rail fare to and from the starting point of the tour', 'Meals not specified in the itinerary (lunch and dinner unless mentioned)', 'Personal expenses such as laundry, phone calls, and shopping', 'Tips and gratuities for drivers and guides', 'Camera fees at monuments and temples (still/video)'],
    ARRAY['Best time to visit is October to March for pleasant weather and clear skies.', 'Carry light woolens as evenings in hill stations can be cool even in summer.', 'Some temples require modest dress code (shoulders and knees covered); remove footwear before entering.'],
    'https://images.pexels.com/photos/16239705/pexels-photo-16239705.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/5330349/pexels-photo-5330349.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34058936/pexels-photo-34058936.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5213208/pexels-photo-5213208.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/38265545/pexels-photo-38265545.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Heritage', 20, 12, 'Premium Hotels',
    'Heritage hill station tours of South India''s misty wonders.', FALSE, FALSE, TRUE,
    ARRAY['south-india', 'hill-stations', 'temples', 'culture', 'ooty'], country_id, state_id,
    'South India Heritage Tour Packages 2025 | Book from ₹X', 'Explore Ooty, Mysore, Kodaikanal, and Coorg with our curated South India heritage tours. 3D to 14D options. Book now for a serene hill station experience!', ARRAY['south india tour packages', 'heritage tours india', 'ooty package', 'mysore travel', 'kodaikanal tour', 'coorg holidays', 'hill station tours', 'temple tours india'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'hill-station-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'heritage-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d', 'Hill Station of South India Tour Duration: 06 Days / 05 Nights',
    5, 6, '5 Nights / 6 Days',
    0, TRUE,
    'https://images.pexels.com/photos/16239705/pexels-photo-16239705.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/5330349/pexels-photo-5330349.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34058936/pexels-photo-34058936.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5213208/pexels-photo-5213208.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/38265545/pexels-photo-38265545.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Bangalore to Coorg: Arrival and Leisure', 'Your journey begins as you arrive in Bangalore and are driven through scenic landscapes to Coorg, also known as Kodagu. Upon arrival, you check into your hotel and spend the rest of the day at leisure, unwinding in the midst of lush coffee estates and rolling hills. Enjoy the cool mountain air and serene surroundings before retiring for the night.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Coorg: Coffee Plantations and Temple Visit', 'After breakfast, you embark on a half-day sightseeing tour of Coorg. Visit the sprawling coffee plantations and orchards that carpet the hillsides, learning about the cultivation process. Next, explore the hilltop fort that offers panoramic views of the town and the ancient Omkareswara Temple, known for its unique architectural blend of Gothic and Islamic styles. Return to the hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Coorg to Mysore: Mysore Palace & Chamundi Hill', 'After breakfast, you check out and drive to Mysore, the City of Palaces. Upon arrival, check into your hotel and proceed to visit the iconic Mysore Palace, a breathtaking example of Indo-Saracenic architecture adorned with intricate carvings, stained glass, and vibrant paintings. Later, ascend Chamundi Hill to visit the Chamundeshwari Temple, offering stunning views of the city. Return to the hotel for the night.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Mysore to Wayanad: Journey to the Hills', 'Post breakfast, you check out and drive to Wayanad, a lush hill district in Kerala. The scenic drive takes you through winding roads flanked by tea and spice plantations. On arrival, check into your hotel and spend the rest of the day at leisure, soaking in the tranquility of the Western Ghats. Overnight at the hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 5, 'Wayanad: Caves, Peak, and Dam Exploration', 'After breakfast, you set out for a full-day sightseeing tour of Wayanad. Visit the famous Edakkal Caves, known for their ancient petroglyphs dating back to the Neolithic era. Trek to Chembra Peak, the highest peak in Wayanad, offering breathtaking views. Continue to the Banasurasagar Dam, the largest earth dam in India, and stop at the Pazhassi Tomb, a memorial to a local ruler. Return to the hotel for overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 6, 'Departure from Calicut', 'After a final breakfast, you check out and are transferred to Calicut (Kozhikode) airport or railway station for your onward journey. The tour ends with fond memories of the hill stations of South India.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'ooty'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'mysore'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'kodaikanal'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 3 FROM "Destination" d WHERE d."slug" = 'coorg'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-v2
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-v2', 'Mesmerizing Western Ghats with Mysore DURATION: 6 DAYS / 5 NIGHTS',
    5, 6, '5 Nights / 6 Days',
    1, FALSE,
    'https://images.pexels.com/photos/16239705/pexels-photo-16239705.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/5330349/pexels-photo-5330349.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/34058936/pexels-photo-34058936.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5213208/pexels-photo-5213208.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/38265545/pexels-photo-38265545.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Bangalore to Mysore: Garden City to Palace City', 'Upon arrival at Bangalore airport, your representative greets you and transfers you to Mysore, a 3-hour drive through the Karnataka countryside. After checking into your hotel, you visit the musical Brindavan Gardens, illuminated with fountains and floral symmetry. Return to the hotel for a welcome drink, dinner, and overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Mysore to Ooty: Heritage & Hills', 'After breakfast, you check out and embark on a sightseeing tour of Mysore. Climb the Chamundi Hills to the temple and Nandi bull, then visit the Bull Temple. The highlight is the magnificent Mysore Palace, with its Indo-Saracenic architecture. You then drive to Ooty, stopping en route at Pykara Lake for its breathtaking views. Arrive in Ooty, check in, enjoy dinner, and retire for the night.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Ooty: Queen of Hill Stations', 'Your day begins with a visit to Doddabetta Peak, the highest point in the Nilgiris, offering panoramic vistas. Next, explore the Botanical Gardens, home to a 20-million-year-old fossil tree. Stroll through Charing Cross for shopping and lunch. In the afternoon, visit the Tea Museum to learn about the region''s tea heritage, followed by a relaxing boat ride on Ooty Lake. Return to the hotel for dinner and an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Ooty to Kodaikanal via Coonoor: Toy Train & Scenic Drive', 'After breakfast, check out and head to Coonoor, where you can opt for the iconic Nilgiri Mountain Railway toy train ride. Upon arrival, visit Sim''s Park, Dolphin''s Nose, and Lamb''s Rock for stunning views. Continue your drive to Kodaikanal, a mist-enshrouded hill station. Check into your hotel, have dinner, and spend the night.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Kodaikanal: Lakes & Lush Greenery', 'After breakfast, explore Kodaikanal''s verdant beauty. Visit the towering Pillar Rocks and the scenic Coaker''s Walk, offering panoramic views of the valley. Later, enjoy boating on the serene Kodai Lake. Return to the hotel for dinner and an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 6, 'Kodaikanal to Coimbatore: Departure', 'After breakfast, check out and drive to Coimbatore airport for your onward journey. The tour concludes with memories of misty mountains, royal palaces, and lush landscapes.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'ooty'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'mysore'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'kodaikanal'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 3 FROM "Destination" d WHERE d."slug" = 'coorg'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d', 'Wayanad Tour Packages 02 Night / 03 Days',
    2, 3, '2 Nights / 3 Days',
    2, FALSE,
    'https://images.pexels.com/photos/25946627/pexels-photo-25946627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/9411142/pexels-photo-9411142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9411137/pexels-photo-9411137.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9411180/pexels-photo-9411180.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9411177/pexels-photo-9411177.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Kozhikode to Wayanad: Arrival & Treehouse Stay at Vythiri Resort', 'Upon arrival at Kozhikode railway station or airport, you meet our representative who assists with the transfer to Wayanad, a scenic 3-hour drive. Arrive at the award-winning Vythiri Resort, perched above the rainforest canopy. Check into your private treehouse, built with local materials and solar energy. The resort''s natural spring water cascades down the hills, creating a serene ambiance. Spend the evening relaxing amidst the verdant surroundings.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Wayanad Sightseeing: Lakes, Waterfalls & Ancient Caves', 'After breakfast, embark on a full-day sightseeing tour of Wayanad. First, visit the placid Lake Pookot, a freshwater lake ideal for boat rides amidst fresh air and greenery. Next, marvel at the three-tiered Soojipara Waterfalls, also known as Sentinel Rock Waterfalls. Continue to the Bansura Sagar Dam, the largest earth dam in India and second largest in Asia, offering tranquil views. Finally, explore the Edakkal Caves, natural rock shelters dating back to the Neolithic age, famous for ancient petroglyphs.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Wayanad to Kozhikode: Departure Transfer', 'On the final day, enjoy a leisurely breakfast at the resort before checking out. You receive an assisted transfer to Kozhikode railway station or airport for your onward journey. Bid farewell to the lush hills of Wayanad, carrying memories of unique treehouse living and rich heritage experiences.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'ooty'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'mysore'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'kodaikanal'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 3 FROM "Destination" d WHERE d."slug" = 'coorg'
  ON CONFLICT DO NOTHING;

  -- Variant: 13n-14d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '13n-14d', '14 Days – The magical south India tours',
    13, 14, '13 Nights / 14 Days',
    3, FALSE,
    'https://images.pexels.com/photos/9411180/pexels-photo-9411180.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/9411142/pexels-photo-9411142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9411137/pexels-photo-9411137.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/25946627/pexels-photo-25946627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9411177/pexels-photo-9411177.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Chennai: Arrival and Welcome', 'Upon arrival at Chennai International Airport, you are warmly greeted and transferred to your hotel. The evening is at leisure to relax after your journey. Overnight stay in Chennai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Chennai: Temple Trails and Coastal Walks', 'After breakfast, proceed for a city tour visiting the ancient Sri Parthasarathy Temple and the vibrant Kapaleeshwar Temple. Explore Fort St. George, the Government Museum, and end at the iconic Marina Beach. Evening free for personal exploration. Dinner and overnight in Chennai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Chennai – Kanchipuram – Mahabalipuram: Silk and Stone', 'After breakfast, drive to Mahabalipuram en route visiting Kanchipuram. In Kanchipuram, admire the Kamakshi Amman Temple, Kailasanathar Temple, and Ekambareswarar Temple. Upon arrival in Mahabalipuram, check in and later visit the Shore Temple and the Five Rathas rock-cut monuments. Dinner and overnight in Mahabalipuram.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Mahabalipuram – Pondicherry: French Quarters and Serenity', 'After breakfast, drive to Pondicherry. Check in and explore the city visiting the Aurobindo Ashram and Pondicherry Museum. Enjoy free time at leisure to relax on the beautiful beaches. Dinner and overnight in Pondicherry.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Pondicherry – Tiruchy – Thanjavur: Rock Forts and Grand Temples', 'After breakfast, drive to Thanjavur via Tiruchy, where you visit the Rock Fort Temple perched on a massive rock. Continue to Thanjavur, check in, and later tour the city including the magnificent Brihadeeswara Temple, a UNESCO World Heritage site. Dinner and overnight in Thanjavur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Thanjavur – Madurai: Dravidian Splendor', 'After breakfast, drive to Madurai. Check in and spend the afternoon exploring the famous Meenakshi Temple, a masterpiece of Dravidian architecture. Also visit Thirumalai Nayak Mahal and Gandhi Museum. Dinner and overnight in Madurai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 7, 'Madurai – Thekkady: Wildlife and Lake Cruise', 'After breakfast, drive to Thekkady. Check into the hotel and in the afternoon visit Periyar Wildlife Reserve, one of the finest in the world. Enjoy a boat cruise on Periyar Lake to spot wildlife. Dinner and overnight in Thekkady.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 8, 'Thekkady – Kumarakom – Alappuzha: Backwater Bliss', 'After breakfast, drive to Kumarakom and board a traditional houseboat. Spend the day cruising the serene backwaters, passing through lush paddy fields and palm-fringed canals. Dinner and overnight on the houseboat.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 9, 'Alappuzha – Cochin: Colonial Charms and Chinese Nets', 'After breakfast on the houseboat, drive to Cochin. Check in and later tour the city visiting the Dutch Palace, Jewish Synagogue, St. Francis Church, Dutch Cemetery, and the iconic Chinese fishing nets at the harbor. Evening at leisure. Dinner and overnight in Cochin.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 10, 'Cochin – Ooty: Journey to the Queen of Hills', 'After breakfast, drive to Ooty, the ''Queen of Hills''. Check into the hotel and spend the day at leisure to acclimatize to the cool climate. Enjoy the scenic surroundings. Dinner and overnight in Ooty.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 11, 'Ooty – Mysore: Gardens, Lakes, and Views', 'After breakfast, visit the Botanical Garden, Ooty Lake, and Doddabetta Peak, the highest point in Ooty. Later drive to Mysore. Check in and relax. Dinner and overnight in Mysore.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 12, 'Mysore: Royal Palace and Illuminated Gardens', 'After breakfast, tour Mysore visiting the opulent Mysore Palace, residence of the royal family. Ascend Chamundi Hills to the Chamundeshwari Temple. After lunch, visit the exquisite Vrindavan Garden, known for its musical fountains. Dinner and overnight in Mysore.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 13, 'Mysore – Bangalore: Historic Srirangapatna and Hoysala Art', 'After breakfast, drive to Bangalore en route visiting Srirangapatna, with its fort and temples, and Somnathpur, famous for the 13th-century Hoysala temple. Check in in Bangalore and enjoy the evening at leisure. Dinner and overnight in Bangalore.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 14, 'Bangalore – Chennai: Gardens, Palace, and Departure', 'After breakfast, tour Bangalore visiting Vidhana Soudha, Tipu''s Palace (summer palace of Tipu Sultan), and Lalbagh Botanical Garden. Transfer to the airport for your onward flight.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'ooty'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'mysore'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'kodaikanal'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 3 FROM "Destination" d WHERE d."slug" = 'coorg'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'malaysia';
  state_id := NULL;

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'malaysia-tours', 'Malaysia Tour Packages',
    'Discover Malaysia, where modern marvels like the Petronas Twin Towers rise above lush rainforests and colonial heritage. Explore Penang''s vibrant George Town, a UNESCO site famed for its street art and hawker food. Cruise Langkawi''s emerald waters and ride the Sky Bridge for panoramic views. Mother India Tour Travels curates seamless journeys with handpicked hotels, expert guides, and authentic cultural encounters.',
    ARRAY['Ascend the iconic Petronas Twin Towers for a skyline view of Kuala Lumpur', 'Wander Penang''s George Town, discovering murals and heritage shophouses', 'Ride the Langkawi Cable Car to the Sky Bridge suspended above ancient rainforest', 'Visit Batu Caves'' golden statue and climb the 272 steps to Hindu shrines', 'Relax on Cenang Beach in Langkawi and shop duty-free at night markets'],
    ARRAY['Return economy airfare from major Indian cities', '5 nights accommodation in 4-star hotels with daily breakfast', 'All airport transfers in air-conditioned vehicles', 'Full-day guided tours in Kuala Lumpur, Penang, and Langkawi', 'Entrance fees to Petronas Towers, Batu Caves, and Langkawi Sky Bridge', 'English-speaking local guide for all sightseeing', 'One complimentary dinner at a traditional Malay restaurant'],
    ARRAY['Malaysia visa fee (e-visa or visa on arrival charges)', 'Personal expenses such as laundry, telephone, and tips', 'Optional tours like night safari or spa sessions', 'Travel insurance (recommended to purchase separately)', 'Any meals not mentioned in inclusions'],
    ARRAY['Indian nationals can get visa on arrival in Malaysia with confirmed return ticket and hotel booking, but e-visa is recommended for faster entry.', 'Best time to visit is March to October for sunny weather, though November to February is also pleasant.', 'Langkawi is a duty-free island; carry extra luggage space for shopping.'],
    'https://images.pexels.com/photos/4239543/pexels-photo-4239543.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/4239544/pexels-photo-4239544.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27544402/pexels-photo-27544402.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9395978/pexels-photo-9395978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/26108669/pexels-photo-26108669.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Classic', 20, 12, 'Premium Hotels',
    'Classic Malaysia: Petronas, Penang & Langkawi from ₹49,999', FALSE, FALSE, FALSE,
    ARRAY['malaysia', 'kuala-lumpur', 'petronas', 'langkawi', 'culture'], country_id, state_id,
    'Malaysia Tour Packages 2025 | Book from ₹49,999', 'Classic Malaysia tour packages covering Kuala Lumpur, Penang & Langkawi. 3D-7D options. Best prices, guided tours, and hotels included. Book now!', ARRAY['malaysia tour packages', 'kuala lumpur tours', 'petronas towers', 'langkawi packages', 'penang street art', 'malaysia holiday', 'classic malaysia tour', 'best malaysia packages'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'international-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 2n-3d-kl
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '2n-3d-kl', 'Kuala Lumpur City Escape - 3 Days',
    2, 3, '2 Nights / 3 Days',
    0, TRUE,
    'https://images.pexels.com/photos/4239543/pexels-photo-4239543.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/4239544/pexels-photo-4239544.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27544402/pexels-photo-27544402.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9395978/pexels-photo-9395978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/26108669/pexels-photo-26108669.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Kuala Lumpur: Iconic Landmarks & City Sights', 'Upon arrival at Kuala Lumpur International Airport, you are greeted by your private guide and transferred to the city. Spend the morning visiting the iconic Petronas Twin Towers, capturing photos from the Skybridge on the 41st floor. Then, head to the historic Batu Caves, a Hindu shrine set within limestone caves, and climb the 272 steps for panoramic views. For lunch, explore the bustling Jalan Alor food street for local delicacies like satay and nasi lemak. In the afternoon, visit the Sultan Abdul Samad Building and Merdeka Square before checking into your hotel. Overnight in Kuala Lumpur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Penang: Heritage & Street Art in George Town', 'After an early breakfast, you are transferred to the airport for a short flight to Penang. Upon arrival, your guide takes you on a walking tour of George Town, a UNESCO World Heritage site. Discover famous street art by Ernest Zacharevic, including the ''Children on a Bicycle'' mural, and visit the Clan Jetties and the Pinang Peranakan Mansion. For lunch, indulge in Penang''s legendary street food at Gurney Drive, such as char koay teow and assam laksa. In the late afternoon, take a ferry to Langkawi, enjoying the scenic crossing. Arrive in Langkawi and transfer to your beach resort for overnight.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Langkawi: Cable Car, Sky Bridge & Beach Relaxation', 'Begin your day with a visit to the Langkawi Cable Car, which ascends to the top of Gunung Mat Cincang. From the Sky Bridge, you have breathtaking views of the Andaman Sea and surrounding islands. Afterward, head to Pantai Cenang for a leisurely time on the white sandy beach, with opportunities for swimming or parasailing. Enjoy a final lunch of fresh seafood at a beachfront restaurant. Depending on your flight schedule, you may also visit the Eagle Square (Dataran Lang) for a photo with the iconic eagle statue. Later, you are transferred to Langkawi International Airport for your departure.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kuala-lumpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'penang'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'langkawi'
  ON CONFLICT DO NOTHING;

  -- Variant: 3n-4d-penang
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '3n-4d-penang', 'Penang Cultural Heritage Tour - 4 Days',
    3, 4, '3 Nights / 4 Days',
    1, FALSE,
    'https://images.pexels.com/photos/4239543/pexels-photo-4239543.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/4239544/pexels-photo-4239544.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27544402/pexels-photo-27544402.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9395978/pexels-photo-9395978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/26108669/pexels-photo-26108669.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Kuala Lumpur: Colonial Landmarks & City Icons', 'Upon arrival at Kuala Lumpur International Airport, you are met and transferred to your hotel. The afternoon begins with a visit to the iconic Petronas Twin Towers, where you admire the skyline from the Skybridge. Continue to Merdeka Square, surrounded by Moorish-style buildings like the Sultan Abdul Samad Building, and explore the historic Kuala Lumpur Railway Station. The evening is free to stroll through Bukit Bintang''s vibrant streets.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Kuala Lumpur to Penang: George Town Heritage Walk', 'After breakfast, transfer to the airport for a short flight to Penang. Upon arrival in George Town, a UNESCO World Heritage Site, your guided walking tour covers the iconic Cheong Fatt Tze Mansion (Blue Mansion) and the lively Clan Jetties along the waterfront. You also visit the Kapitan Keling Mosque and the ornate Sri Mahamariamman Temple. Lunch is a feast of Penang street food at Chulia Street. Overnight at your George Town hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Penang: Hilltop Temples & Peranakan Culture', 'Today begins with a trip to Kek Lok Si Temple, the largest Buddhist temple in Malaysia, with its seven-tiered pagoda and thousands of Buddha statues. Next, take the funicular train up Penang Hill for panoramic views of the island. After lunch, explore the Pinang Peranakan Mansion, a museum showcasing the opulent lifestyle of the Straits Chinese. The evening concludes at Batu Feringghi beach for a relaxing sunset stroll.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Penang to Langkawi: Island Farewell & Departure', 'After an early breakfast, take a morning ferry to Langkawi (approx. 2.5 hours). On arrival, visit the iconic Eagle Square (Dataran Lang) before a quick trip to the Langkawi Cable Car for a bird''s-eye view of the island''s rainforest and sea. Depending on your flight schedule, enjoy some last-minute shopping at Kuah Town before transferring to Langkawi International Airport for your departure.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kuala-lumpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'penang'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'langkawi'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d-langkawi
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d-langkawi', 'Langkawi Island Paradise - 5 Days',
    4, 5, '4 Nights / 5 Days',
    2, FALSE,
    'https://images.pexels.com/photos/4239543/pexels-photo-4239543.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/4239544/pexels-photo-4239544.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27544402/pexels-photo-27544402.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9395978/pexels-photo-9395978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/26108669/pexels-photo-26108669.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Kuala Lumpur: Arrival & City Highlights Tour', 'Upon arrival at Kuala Lumpur International Airport, you are welcomed by our representative and transferred to your hotel. After freshening up, embark on a half-day city tour visiting the iconic Petronas Twin Towers, the majestic Batu Caves with its golden statue of Lord Murugan, and the historic Merdeka Square. Enjoy a welcome drink at the hotel before retiring for the night.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Kuala Lumpur to Penang: Heritage & Street Food', 'After breakfast, you are transferred to the airport for a short flight to Penang. Upon arrival, explore George Town, a UNESCO World Heritage site, featuring the ornate Khoo Kongsi clanhouse, Cheong Fatt Tze mansion, and vibrant street art. In the evening, indulge in Penang''s famous street food at Gurney Drive, sampling dishes like char kway teow and assam laksa. Overnight in Penang.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Penang to Langkawi: Island Arrival & Cable Car', 'After breakfast, you take a scenic ferry from Penang to Langkawi. Upon arrival, check into your beach resort. Later, visit the Langkawi Cable Car and ride to the top of Mount Machinchang for breathtaking views from the Sky Bridge. Stop at Eagle Square to see the giant eagle statue, a symbol of Langkawi. Overnight in Langkawi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Langkawi: Mangrove Tour & Beach Relaxation', 'After breakfast, depart for a mangrove river safari through the Kilim Karst Geoforest Park, where you spot eagles, monitor lizards, and explore limestone caves. Return to Pantai Cenang beach for free time to swim or relax. In the evening, enjoy an optional sunset cruise along the coastline. Overnight in Langkawi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Langkawi: Departure with Duty-Free Shopping', 'After a leisurely breakfast, visit Kuah Town for duty-free shopping, where you can purchase chocolates, perfumes, and batik. Then, transfer to Langkawi International Airport for your flight home, concluding your Malaysian island paradise tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kuala-lumpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'penang'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'langkawi'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d', 'Malaysian Highlands Retreat - 5 Days',
    4, 5, '4 Nights / 5 Days',
    3, FALSE,
    'https://images.pexels.com/photos/4239543/pexels-photo-4239543.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/4239544/pexels-photo-4239544.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27544402/pexels-photo-27544402.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9395978/pexels-photo-9395978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/26108669/pexels-photo-26108669.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Kuala Lumpur: Arrival & City Orientation', 'Arrive at Kuala Lumpur International Airport, where your private driver greets you and transfers you to your hotel. After freshening up, embark on a half-day city tour visiting the iconic Petronas Twin Towers, the historic Merdeka Square, and the bustling streets of Chinatown. Enjoy a welcome dinner at a local restaurant offering traditional Malaysian cuisine like nasi lemak and satay. Overnight stay in Kuala Lumpur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Kuala Lumpur to Genting Highlands: Mountain Retreat & Theme Park', 'After breakfast, drive 45 minutes to Genting Highlands, a cool mountain resort nestled 1,800 meters above sea level. Ride the Genting Skyway cable car for sweeping views of the rainforest, then explore the indoor and outdoor theme parks at Resorts World Genting. Visit the SkyCasino and enjoy a buffet lunch before returning to Kuala Lumpur. Spend the evening shopping and dining in the vibrant Bukit Bintang district. Overnight in Kuala Lumpur.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Penang: George Town Heritage & Street Food Delights', 'Transfer to the airport for a short flight to Penang. Upon arrival, immerse yourself in George Town, a UNESCO World Heritage site, with its colonial architecture, vibrant street art, and clan jetties. Visit the ornate Kek Lok Si Temple, the largest Buddhist temple in Malaysia, and enjoy a famous Penang street food lunch at Gurney Drive, tasting char kway teow and assam laksa. Check into your beachfront resort in Batu Ferringhi and relax by the sea. Overnight in Penang.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Langkawi: Island Escape & Cable Car Adventure', 'After breakfast, fly to Langkawi, an archipelago of 99 islands in the Andaman Sea. Visit the Langkawi SkyBridge, a curved pedestrian bridge suspended 700 meters above sea level, accessed by a thrilling cable car ride. Explore the Eagle Square (Dataran Lang) and take a mangrove boat tour where you feed eagles in their natural habitat. Check into a beachfront resort at Pantai Cenang and watch the sunset over the sea. Overnight in Langkawi.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Langkawi: Leisure & Departure', 'Spend the morning at leisure, perhaps swimming, snorkeling, or indulging in a spa treatment at your resort. If time permits, visit the Langkawi duty-free shopping area for souvenirs and local crafts. Later, transfer to Langkawi International Airport for your departure flight, taking with you memories of Malaysia''s highlands and islands.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kuala-lumpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'penang'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'langkawi'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d-borneo
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d-borneo', 'East Malaysia Borneo Adventure - 7 Days',
    6, 7, '6 Nights / 7 Days',
    4, FALSE,
    'https://images.pexels.com/photos/4239543/pexels-photo-4239543.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/4239544/pexels-photo-4239544.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/27544402/pexels-photo-27544402.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/9395978/pexels-photo-9395978.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/26108669/pexels-photo-26108669.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Kuala Lumpur: Arrival & City Lights', 'Upon arrival at Kuala Lumpur International Airport, you are transferred to your hotel in the city center. Spend the afternoon at leisure or explore the bustling Bukit Bintang shopping district. In the evening, enjoy a guided visit to the iconic Petronas Twin Towers, where you ascend to the Skybridge and observation deck for panoramic views of the city lights. Return to your hotel for an overnight stay.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Kuala Lumpur: Cultural & Colonial Heritage', 'After breakfast, embark on a comprehensive city tour. Visit the Batu Caves, a limestone hill featuring Hindu temples and the towering statue of Lord Murugan. Then explore the colonial heart of Kuala Lumpur, including Merdeka Square, the Sultan Abdul Samad Building, and the National Mosque. Continue to the vibrant Chinatown at Petaling Street for a taste of local street food and shopping. The evening is free for you to discover the city''s nightlife or enjoy a traditional Malaysian dinner.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Kuala Lumpur to Penang: Island Heritage', 'After breakfast, check out and transfer to the airport for a short flight to Penang (or optional private transfer by road and ferry). Upon arrival in Penang, you are met and transferred to your hotel in George Town. Spend the afternoon exploring the UNESCO-listed heritage zone on a walking tour, discovering colorful street art, clan jetties, and historic shophouses. Visit the iconic Khoo Kongsi clan house and the Cheong Fatt Tze Mansion (Blue Mansion). Dinner is at a local hawker center sampling Penang''s famous street food like char kway teow and assam laksa.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Penang: Hilltop Views & Temple Splendor', 'Start the day with a funicular ride up Penang Hill for breathtaking views of the island and mainland. Visit the Owl Museum and enjoy a leisurely walk through the colonial-era gardens. Descend to the Kek Lok Si Temple, one of Southeast Asia''s largest Buddhist temples complex, with its seven-story pagoda and bronze statue of Kuan Yin. Afternoon is free for exploring Batu Feringghi beach or shopping at Gurney Drive. In the evening, consider a cultural performance or dinner at a seaside restaurant.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Penang to Langkawi: Mangroves & Eagles', 'After breakfast, transfer to the ferry terminal for a high-speed ferry to Langkawi (approx 2.5 hours). Upon arrival, check into your resort and then proceed for a mangrove and eagle-feeding tour in the Kilim Karst Geoforest Park. Glide through limestone cliffs and clear waters, spotting eagles, monkeys, and exotic birds. Later, visit the famous Eagle Statue at Eagle Square and the nearby Craft Culture Complex. Evening at leisure on Pantai Cenang beach.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Langkawi: Cable Car, Sky Bridge & Island Hopping', 'Morning visit to the Langkawi Cable Car for a ride to the top of Mount Mat Cincang. Walk across the curved Sky Bridge for stunning views of the Andaman Sea. Then, enjoy a half-day island-hopping tour to the Dayang Bunting Island (Lake of the Pregnant Maiden) for a swim, and the nearby Pulau Beras Basah for pristine white-sand beaches. Return to your hotel with the remainder of the evening free for duty-free shopping or a sunset cruise.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 7, 'Langkawi: Departure', 'Enjoy a final breakfast at your resort. Depending on your flight schedule, you may have time for last-minute souvenir shopping at the Langkawi Parade or visiting the Oriental Village. Check out and transfer to Langkawi International Airport for your departure flight, taking with you unforgettable memories of Malaysia''s diverse landscapes and cultures.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'kuala-lumpur'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'penang'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'langkawi'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
  var_id_4 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'thailand';
  state_id := NULL;

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'thailand-tours', 'Thailand Tour Packages',
    'Thailand beckons with shimmering temples, turquoise waters, and electric nightlife—a tropical paradise that blends ancient spirituality with modern revelry. From Bangkok''s golden Wat Pho and Grand Palace to Phuket''s powdery sands of Patong Beach, every moment ignites the senses. Chiang Mai''s misty mountains and elephant sanctuaries offer serene contrast, while Pattaya''s vibrant Walking Street pulses with energy. Mother India Tour Travels curates seamless itineraries with handpicked hotels, expert guides, and 24/7 support, ensuring your Thai escape is flawless.',
    ARRAY['Wat Phra Kaew (Temple of the Emerald Buddha) in Bangkok', 'Phi Phi Islands snorkeling from Phuket', 'Night bazaar and Doi Suthep temple in Chiang Mai', 'Pattaya''s Coral Island speedboat ride', 'Floating market experience at Damnoen Saduak'],
    ARRAY['Return economy airfare from major Indian cities (check variant)', '4-9 nights'' accommodation in 4-star hotels', 'Daily breakfast and selected meals', 'All transfers and sightseeing by private AC vehicle', 'English-speaking local guides', 'Boat rides and entrance fees as per itinerary', 'Travel insurance and visa assistance'],
    ARRAY['International airfare if not specified (for domestic-only packages)', 'Personal expenses like laundry, tips, and shopping', 'Optional tours and activities (e.g., bungee jumping, spa)', 'GST and applicable taxes extra', 'Visa fees (onsite or e-visa)'],
    ARRAY['Indian nationals require a passport with 6 months validity; e-visa recommended.', 'Best time to visit is November to February for pleasant weather.', 'Dress modestly when visiting temples; shoulders and knees covered.'],
    'https://images.pexels.com/photos/19041654/pexels-photo-19041654.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/20889589/pexels-photo-20889589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11104933/pexels-photo-11104933.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13022780/pexels-photo-13022780.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12681176/pexels-photo-12681176.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Beach', 20, 12, 'Premium Hotels',
    'Thailand: Beaches, Temples & Nightlife – Book Now!', FALSE, FALSE, FALSE,
    ARRAY['thailand', 'bangkok', 'phuket', 'temples', 'beaches', 'nightlife'], country_id, state_id,
    'Thailand Tour Packages 2025 | Starting ₹29,999', 'Explore Bangkok, Phuket, Pattaya & Chiang Mai. Tailored beach holidays with temple tours, nightlife, and Thai cuisine. 5-10 day packages. Book your Thailand ...', ARRAY['Thailand tour packages', 'Thailand holiday packages from India', 'Bangkok Pattaya tour', 'Phuket tour packages', 'Chiang Mai travel', 'Thailand beach vacation', 'Thailand package with flights', 'Mother India Tour Travels Thailand'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'international-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'beach-holidays'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d-pattaya
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d-pattaya', 'Bangkok & Pattaya Experience - 5 Days',
    4, 5, '4 Nights / 5 Days',
    0, TRUE,
    'https://images.pexels.com/photos/19041654/pexels-photo-19041654.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/20889589/pexels-photo-20889589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11104933/pexels-photo-11104933.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13022780/pexels-photo-13022780.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12681176/pexels-photo-12681176.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Bangkok: Grand Palace & Chao Phraya Evening Cruise', 'Arrive in Bangkok and meet your guide at the airport. Begin with a visit to the Grand Palace and the sacred Wat Phra Kaew (Temple of the Emerald Buddha). After lunch, explore Wat Pho to see the Reclining Buddha. In the evening, enjoy a dinner cruise along the Chao Phraya River, passing illuminated temples and the iconic Rama VIII Bridge. Overnight in Bangkok.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Bangkok to Pattaya: Floating Market & Beach Leisure', 'After breakfast, drive to Pattaya with a stop at the Damnoen Saduak Floating Market, where you can shop from longtail boats. Arrive in Pattaya by noon and check into your beachfront hotel. Spend the afternoon relaxing on Pattaya Beach or visiting the Sanctuary of Truth, a massive wooden temple. In the evening, explore the vibrant Walking Street with its bars, clubs, and street performances. Overnight in Pattaya.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Pattaya to Phuket: Island Paradise & Patong Nightlife', 'Take a morning flight from Bangkok (transferred from Pattaya) to Phuket. Upon arrival, check into your hotel near Patong Beach. Spend the afternoon lounging on the sand or taking a short boat trip to nearby Coral Island for snorkeling. As dusk falls, head to Bangla Road for Phuket''s legendary nightlife, with its neon signs, live music, and bustling bars. Overnight in Phuket.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Phuket: Phi Phi Island Day Trip & Seafood Dinner', 'Depart early for a full-day excursion to the Phi Phi Islands. Cruise past Maya Bay (made famous by ''The Beach''), snorkel in crystal-clear waters, and enjoy a buffet lunch on Phi Phi Don. Return to Phuket in the late afternoon. In the evening, savor a fresh seafood dinner at a beachfront restaurant in Rawai. Overnight in Phuket.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 5, 'Phuket to Chiang Mai: Doi Suthep Temple & Night Bazaar', 'Fly from Phuket to Chiang Mai in the morning. After check-in, ascend the 306 steps to Wat Phra That Doi Suthep, offering panoramic views of the city. Visit the temple''s golden chedi and listen to the monks'' chanting. Later, explore the old city''s wall and moat, then browse the Night Bazaar for handicrafts and street food. Depart from Chiang Mai airport for your onward journey.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'bangkok'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pattaya'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'phuket'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 3 FROM "Destination" d WHERE d."slug" = 'chiang-mai'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d-phuket
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d-phuket', 'Phuket & Phi Phi Islands - 6 Days',
    5, 6, '5 Nights / 6 Days',
    1, FALSE,
    'https://images.pexels.com/photos/19041654/pexels-photo-19041654.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/20889589/pexels-photo-20889589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11104933/pexels-photo-11104933.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13022780/pexels-photo-13022780.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12681176/pexels-photo-12681176.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Bangkok: Royal Grandeur & Temples of the Dawn', 'Arrive in Bangkok and meet your private guide. Visit the magnificent Grand Palace, home of the Emerald Buddha, then stroll through Wat Pho to see the colossal Reclining Buddha. In the evening, explore the vibrant Khao San Road for street food and souvenirs.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Bangkok to Pattaya: Beachside Bliss & the Sanctuary of Truth', 'Drive to Pattaya (2 hours). Visit the stunning Sanctuary of Truth, a wooden temple by the sea. Spend the afternoon relaxing on Pattaya Beach or trying water sports. Evening is free to explore Walking Street''s neon-lit nightlife.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Pattaya to Phuket: Arrival & Patong Sunset', 'Fly from Bangkok to Phuket (domestic flight not included). Transfer to your beachfront hotel. Spend the evening at Patong Beach, watching the sunset from Bangla Road. Enjoy a Thai massage or dine at a seaside restaurant.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Phuket: Phi Phi Islands Snorkeling & Beach Paradise', 'Embark on a full-day speedboat tour to Phi Phi Islands. Snorkel in clear waters at Pileh Lagoon, relax on Maya Bay beach, and enjoy lunch on Phi Phi Don. Watch for monkeys at Monkey Beach before returning to Phuket.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Phuket to Chiang Mai: Cultural Welcome & Night Bazaar', 'Fly to Chiang Mai (domestic flight not included). Visit the old city''s temples like Wat Chedi Luang. In the evening, explore the bustling Night Bazaar for handicrafts and local street food. Overnight in Chiang Mai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 6, 'Chiang Mai: Doi Suthep Temple & Elephant Encounter', 'Climb the 306 steps to Wat Phra That Doi Suthep for panoramic views of Chiang Mai. Then visit an ethical elephant sanctuary to feed and bathe rescued elephants. Return to the city for departure transfer.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'bangkok'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pattaya'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'phuket'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 3 FROM "Destination" d WHERE d."slug" = 'chiang-mai'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d-chiang-mai
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d-chiang-mai', 'Chiang Mai & Northern Thailand - 7 Days',
    6, 7, '6 Nights / 7 Days',
    2, FALSE,
    'https://images.pexels.com/photos/19041654/pexels-photo-19041654.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/20889589/pexels-photo-20889589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11104933/pexels-photo-11104933.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13022780/pexels-photo-13022780.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12681176/pexels-photo-12681176.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Bangkok: Grand Palace & Chao Phraya Evening', 'Arrive in Bangkok and transfer to your hotel. In the afternoon, visit the magnificent Grand Palace and the revered Wat Phra Kaew (Emerald Buddha Temple). Later, take a long-tail boat along the Chao Phraya River, passing iconic landmarks like Wat Arun. End the day with a welcome dinner at a riverside restaurant, sampling authentic Thai cuisine.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Bangkok to Pattaya: Sanctuary of Truth & Beach Time', 'After breakfast, drive to Pattaya (approx. 2 hours). Upon arrival, explore the stunning Sanctuary of Truth, an intricately carved wooden temple by the sea. Spend the afternoon relaxing on Pattaya Beach or try water sports like parasailing. In the evening, stroll along Walking Street for vibrant nightlife and dinner at a seafood restaurant.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Pattaya to Phuket: Coral Island Snorkeling', 'Fly from Bangkok to Phuket (early morning flight). Transfer to your beach resort and head out for a half-day snorkeling trip to Coral Island (Hae Island). Swim in crystal-clear waters, see colorful marine life, and relax on white sand. Return to Phuket for a sunset cocktail at Kata Beach.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Phuket: Phi Phi Islands Day Excursion', 'Take a speedboat to the iconic Phi Phi Islands. Visit Maya Bay (made famous by ''The Beach''), snorkel at Pileh Lagoon, and enjoy lunch on Phi Phi Don. Later, explore Viking Cave and Monkey Beach. Return to Phuket in the evening and enjoy a traditional Thai massage at your hotel.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Phuket to Chiang Mai: Night Bazaar & Lanna Culture', 'Fly to Chiang Mai in the morning. Check into your hotel in the Old City. In the afternoon, visit Wat Phra Singh and Wat Chedi Luang, two ancient temples. As dusk falls, explore the bustling Chiang Mai Night Bazaar for handicrafts, street food, and live music. Sample khao soi, a local curry noodle soup.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 6, 'Chiang Mai: Elephant Nature Park & Doi Suthep', 'Spend the morning at the Elephant Nature Park, a sanctuary where you can feed and bathe rescued elephants. After lunch, ascend Doi Suthep mountain to the golden Wat Phra That Doi Suthep. Enjoy panoramic views of Chiang Mai city. End the day with a khantoke dinner and traditional Lanna dance performance.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 7, 'Chiang Mai: Farewell & Departure', 'Enjoy a leisurely breakfast and some last-minute souvenir shopping at the local markets. Depending on your flight time, visit Wat Suan Dok or the artsy Nimmanhaemin Road. Transfer to Chiang Mai International Airport for your departure, filled with memories of an incredible Thai adventure.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'bangkok'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pattaya'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'phuket'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 3 FROM "Destination" d WHERE d."slug" = 'chiang-mai'
  ON CONFLICT DO NOTHING;

  -- Variant: 9n-10d-uae
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '9n-10d-uae', 'Complete Thailand Experience - 10 Days',
    9, 10, '9 Nights / 10 Days',
    3, FALSE,
    'https://images.pexels.com/photos/19041654/pexels-photo-19041654.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/20889589/pexels-photo-20889589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11104933/pexels-photo-11104933.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13022780/pexels-photo-13022780.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12681176/pexels-photo-12681176.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Bangkok: Arrival & Evening Canal Tour', 'Upon arrival at Suvarnabhumi Airport, you are met by our representative and transferred to your hotel. After settling in, enjoy a relaxing evening canal tour through Bangkok''s vibrant canals, known as the ''Venice of the East''. Cruise past traditional wooden houses and the iconic Wat Arun illuminated at dusk. Overnight in Bangkok.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Bangkok: Grand Palace & Temple Exploration', 'After breakfast, visit the Grand Palace, the former royal residence, and the revered Wat Phra Kaew (Temple of the Emerald Buddha). Continue to Wat Pho, home to the colossal Reclining Buddha, and Wat Arun on the Thonburi side of the river. In the evening, explore the bustling Khao San Road or enjoy a traditional Thai massage. Overnight in Bangkok.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Bangkok to Pattaya: Beach & Walking Street', 'After breakfast, drive two hours to Pattaya, the beach resort city. Check into your hotel and spend the afternoon relaxing on Pattaya Beach or Jomtien Beach. In the evening, experience the vibrant Walking Street with its neon lights, bars, and street performances. Overnight in Pattaya.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Pattaya: Coral Island Excursion', 'Today, take a speedboat to Coral Island (Koh Larn), known for its crystal-clear waters and white sandy beaches. Enjoy snorkeling, parasailing, or simply lounging on the beach. Return to Pattaya in the late afternoon. Evening free to explore the Alcazar Cabaret Show or enjoy seafood dinner at the beachfront. Overnight in Pattaya.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Pattaya to Phuket: Old Town Charms', 'After breakfast, transfer to Bangkok airport for a flight to Phuket (flight not included). Upon arrival, visit Phuket Old Town''s Sino-Portuguese architecture, colorful shophouses, and the Sunday Walking Street Market (if applicable). Check into your hotel and relax at Patong Beach. Overnight in Phuket.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Phuket: Phi Phi Islands Day Trip', 'Embark on a full-day speedboat excursion to the stunning Phi Phi Islands. Visit Maya Bay (subject to seasonal closure), enjoy snorkeling at Pileh Lagoon and Bamboo Island. Lunch is served on Phi Phi Don. Return to Phuket in the late afternoon. Evening at leisure. Overnight in Phuket.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 7, 'Phuket: James Bond Island & Canoeing', 'Take a tour to Phang Nga Bay, famous for its limestone karst formations. Visit James Bond Island (Khao Phing Kan) and explore sea caves by canoe. Enjoy lunch on a floating village. Return to the hotel by late afternoon. Optional: Simon Cabaret or night markets. Overnight in Phuket.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 8, 'Phuket to Chiang Mai: Night Bazaar', 'After breakfast, fly to Chiang Mai (flight not included). Upon arrival, explore the ancient city''s moats and temples. In the evening, visit the Chiang Mai Night Bazaar on Chang Klan Road, where you can shop for handicrafts, silverware, and Thai silk. Overnight in Chiang Mai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 9, 'Chiang Mai: Doi Suthep & Elephant Sanctuary', 'Morning visit to Doi Suthep temple, perched on a mountain with panoramic views. Then, transfer to an ethical elephant sanctuary for a half-day experience: feed, bathe, and learn about elephant conservation. Return to the city in the late afternoon. Overnight in Chiang Mai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 10, 'Chiang Mai: Departure', 'After breakfast, enjoy a Thai cooking class where you learn to prepare Pad Thai and Green Curry. Last-minute souvenir shopping at Warorot Market. Transfer to Chiang Mai International Airport for your onward journey, concluding your Complete Thailand Experience.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'bangkok'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pattaya'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'phuket'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 3 FROM "Destination" d WHERE d."slug" = 'chiang-mai'
  ON CONFLICT DO NOTHING;

  -- Variant: 7n-8d-islands
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '7n-8d-islands', 'Thai Islands Hopping - 8 Days',
    7, 8, '7 Nights / 8 Days',
    4, FALSE,
    'https://images.pexels.com/photos/19041654/pexels-photo-19041654.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/20889589/pexels-photo-20889589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/11104933/pexels-photo-11104933.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/13022780/pexels-photo-13022780.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/12681176/pexels-photo-12681176.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_4;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_4;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 1, 'Bangkok: Arrival & Grand Palace Evening', 'Arrive at Suvarnabhumi Airport and transfer to your hotel. In the afternoon, visit the iconic Grand Palace and the Temple of the Emerald Buddha (Wat Phra Kaew). As dusk falls, enjoy a Chao Phraya River dinner cruise, passing illuminated temples and skyscrapers. Overnight in Bangkok.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 2, 'Bangkok: Floating Market & Jim Thompson House', 'After breakfast, drive to Damnoen Saduak Floating Market to see vendors in longtail boats selling tropical fruits and souvenirs. Return to the city for a guided tour of Jim Thompson House, a museum of Thai silk and traditional architecture. Spend the evening exploring Khao San Road or enjoy a rooftop bar. Overnight in Bangkok.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 3, 'Bangkok to Pattaya: Sanctuary of Truth & Beach', 'Travel by private vehicle to Pattaya (2 hours). Visit the Sanctuary of Truth, a massive wooden temple carved with Hindu and Buddhist motifs. Relax on Pattaya Beach or take a stroll along Walking Street, known for its nightlife. Overnight in Pattaya.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 4, 'Pattaya to Phuket: Patong Beach & Simon Cabaret', 'Fly from Bangkok (or via U-Tapao) to Phuket. Check into your beachfront hotel on Patong Beach. Spend the afternoon swimming or sunbathing. In the evening, enjoy the Simon Cabaret Show, a famous transvestite performance. Overnight in Phuket.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 5, 'Phuket: Phi Phi Islands Speedboat Tour', 'Embark on a full-day speedboat excursion to Phi Phi Islands. Snorkel in crystal-clear waters at Maya Bay and Loh Samah Bay. Enjoy a beachside lunch on Phi Phi Don, then explore Viking Cave and Monkey Beach. Return to Phuket for overnight.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 6, 'Phuket: Phang Nga Bay & James Bond Island', 'Join a day trip to Phang Nga Bay, famous for limestone karsts. Canoe through mangrove caves at Hong Islands and visit James Bond Island, featured in ''The Man with the Golden Gun''. Return to Phuket for a farewell dinner at a seafood restaurant. Overnight in Phuket.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 7, 'Phuket to Chiang Mai: Doi Suthep & Night Bazaar', 'Fly from Phuket to Chiang Mai. Visit Wat Phra That Doi Suthep, a sacred temple atop Doi Suthep mountain, offering panoramic views of the city. In the evening, explore the Chiang Mai Night Bazaar for handicrafts and street food. Overnight in Chiang Mai.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_4, 8, 'Chiang Mai: Elephant Sanctuary & Departure', 'Spend the morning at an ethical elephant sanctuary, where you can feed and observe elephants in a natural setting. After lunch, transfer to Chiang Mai International Airport for your departure flight.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 0 FROM "Destination" d WHERE d."slug" = 'bangkok'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 1 FROM "Destination" d WHERE d."slug" = 'pattaya'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 2 FROM "Destination" d WHERE d."slug" = 'phuket'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_4, d."id", 3 FROM "Destination" d WHERE d."slug" = 'chiang-mai'
  ON CONFLICT DO NOTHING;

END $$;

DO $$
DECLARE
  pkg_id TEXT;
  country_id TEXT;
  state_id TEXT;
  var_id_0 TEXT;
  var_id_1 TEXT;
  var_id_2 TEXT;
  var_id_3 TEXT;
BEGIN
  SELECT "id" INTO country_id FROM "Country" WHERE "slug" = 'bhutan';
  state_id := NULL;

  INSERT INTO "Package" ("id","slug","name","overview","highlights","inclusions","exclusions","notes","heroImage","galleryImages","tourStyle","groupSizeMax","groupSizeAvg","stayType","marketingPitch","isPopular","isFeatured","isDomestic","tags","countryId","stateId","seoTitle","seoDescription","seoKeywords","publishedAt","createdAt","updatedAt")
  VALUES (
    gen_random_uuid(), 'bhutan-tours', 'Bhutan Tour Packages — The Happiness Kingdom',
    'Bhutan, the last great Himalayan kingdom, is renowned for its unique philosophy of Gross National Happiness. This adventure tour package takes you through the cultural heartland of Paro, Thimphu, and Punakha, where ancient dzongs and monasteries perch on dramatic cliffs. Experience the thrill of trekking to the iconic Tiger''s Nest Monastery, and witness living traditions like archery and masked dances. With Mother India Tour Travels, you get expertly curated itineraries, seamless logistics, and authentic local experiences, ensuring a journey that is both exhilarating and enlightening.',
    ARRAY['Hike to the legendary Tiger''s Nest Monastery (Paro Taktsang), clinging to a sheer cliff 900 meters above the valley.', 'Explore the magnificent Punakha Dzong, strategically located at the confluence of two rivers, and learn its storied history.', 'Visit the Tashichho Dzong in Thimphu, the seat of the Bhutanese government and a masterpiece of traditional architecture.', 'Drive over the scenic Dochula Pass, dotted with 108 chortens and offering panoramic views of the eastern Himalayas.', 'Attend a traditional archery match, Bhutan''s national sport, and try your hand at shooting with local champions.'],
    ARRAY['Accommodation in carefully selected 3-4 star hotels and boutique lodges', 'Daily breakfast and dinner at the hotel or local restaurants', 'All private transfers and sightseeing in comfortable vehicles', 'Services of an experienced, English-speaking local guide', 'All necessary permits, including the Bhutan visa fee', 'Bottled water and refreshments during day tours', 'Travel insurance covering basic medical and evacuation'],
    ARRAY['International airfare to/from Paro', 'Personal expenses such as laundry, phone calls, and souvenirs', 'Tips and gratuities for guides and drivers', 'Lunch and any meals not specified in the itinerary', 'Optional activities like hot stone baths or spa treatments'],
    ARRAY['Bhutan operates a high-value, low-impact tourism policy; the daily tariff covers accommodation, meals, guide, and transport, and is non-negotiable.', 'Visa is processed through a licensed tour operator; we handle all arrangements for you.', 'Best time to visit is March to May and September to November for clear skies and pleasant weather.'],
    'https://images.pexels.com/photos/37908899/pexels-photo-37908899.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/67548/the-tiger-s-nest-monastery-taktsang-palphug-monastery-buddha-67548.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/910368/pexels-photo-910368.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/4153826/pexels-photo-4153826.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37992661/pexels-photo-37992661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'],
    'Adventure', 20, 12, 'Premium Hotels',
    'Bhutan awaits: ancient monasteries, stunning Himalayan views, pure happiness.', FALSE, FALSE, FALSE,
    ARRAY['bhutan', 'happiness-kingdom', 'tigers-nest', 'dzong', 'himalaya'], country_id, state_id,
    'Bhutan Tour Packages 2025 | Book Best Deals', 'Explore Bhutan — the Happiness Kingdom — with adventure tours to Paro, Thimphu, Punakha. Hike Tiger''s Nest, visit dzongs. 5-8 day packages. Book now!', ARRAY['Bhutan tour packages', 'Bhutan travel', 'Happiness Kingdom', 'Tiger''s Nest trek', 'Paro Thimphu Punakha tour', 'Bhutan adventure tours', 'Best Bhutan holiday packages', 'Mother India Tour Travels Bhutan'],
    NOW(), NOW(), NOW()
  )
  ON CONFLICT ("slug") DO UPDATE SET
    "name" = EXCLUDED."name", "overview" = EXCLUDED."overview",
    "highlights" = EXCLUDED."highlights", "inclusions" = EXCLUDED."inclusions",
    "exclusions" = EXCLUDED."exclusions", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages", "seoTitle" = EXCLUDED."seoTitle",
    "seoDescription" = EXCLUDED."seoDescription", "seoKeywords" = EXCLUDED."seoKeywords",
    "isPopular" = EXCLUDED."isPopular", "isFeatured" = EXCLUDED."isFeatured",
    "tags" = EXCLUDED."tags", "marketingPitch" = EXCLUDED."marketingPitch"
  RETURNING "id" INTO pkg_id;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'international-tours'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId")
  SELECT pkg_id, c."id" FROM "Category" c WHERE c."slug" = 'adventure-tours'
  ON CONFLICT DO NOTHING;

  -- Variant: 5n-6d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '5n-6d', 'Bhutan Tour 5N 6D',
    5, 6, '5 Nights / 6 Days',
    0, TRUE,
    'https://images.pexels.com/photos/37908899/pexels-photo-37908899.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/910368/pexels-photo-910368.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/4153826/pexels-photo-4153826.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37992661/pexels-photo-37992661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5011707/pexels-photo-5011707.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_0;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_0;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 1, 'Paro: Arrival & Iron Bridge Temple', 'Upon arrival at Paro International Airport, you are warmly welcomed by our representative. En route to Thimphu, stop at Tachogang Lhakhang, a 15th-century temple famous for its iron suspension bridge. Spend the evening at leisure exploring Thimphu''s charming streets before overnight stay in Thimphu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 2, 'Thimphu: Buddha Dordenma & Tashichho Dzong', 'After breakfast, visit the National Memorial Chorten, built in 1974 in memory of the Third King. Continue to Devi Panchayan Mandir, then marvel at the giant Buddha Dordenma statue overlooking the valley. Explore the National Folk Heritage Museum, one of Bhutan''s oldest historical sites, before visiting Tashichho Dzong, a 17th-century fortress on the Wang Chhu riverbank. Stroll through the authentic craft street and enjoy a free evening in Thimphu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 3, 'Thimphu to Punakha: Dochula Pass & Punakha Dzong', 'Drive to Punakha via the scenic Dochula Pass (3,088 m), where clear days reveal panoramic Himalayan peaks. Visit Druk Wangyal Chorten and take a nature walk among 108 stupas. In Lobesa, hike to Chimi Lhakhang, the temple of the Divine Madman. Continue to Punakha Dzong, built in 1637 at the confluence of two rivers, and cross Bhutan''s longest suspension bridge. Evening free to explore Punakha town.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 4, 'Punakha to Paro: Nunnery & Paro Dzong', 'After breakfast, drive back to Paro, stopping at Sangchen Dorji Lhuendrup Nunnery, a Buddhist college and meditation center. Visit the Royal Botanical Park (Lampheri), a 125-acre haven of diverse flora and endemic species. Enjoy a bird''s-eye view of Paro Airport from the riverside viewpoint, then explore Paro Dzong, a fortress built in 1646. The evening is free for strolling around Paro.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 5, 'Paro: Taktsang Monastery Hike & National Museum', 'After breakfast, drive to the hiking trailhead for Taktsang Monastery, famously perched on a cliff edge (approx. 2-3 hour hike). The Tiger''s Nest offers stunning views and a profound spiritual experience. Descend to visit the National Museum of Bhutan (Ta-Dzong), housing unique historical artifacts. Spend the evening at leisure in Paro.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_0, 6, 'Paro: Departure with Sweet Memories', 'Enjoy a final breakfast in Bhutan before being transferred to Paro International Airport for your flight onward. Depart with cherished memories of the Kingdom of Happiness.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 0 FROM "Destination" d WHERE d."slug" = 'paro'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 1 FROM "Destination" d WHERE d."slug" = 'thimphu'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_0, d."id", 2 FROM "Destination" d WHERE d."slug" = 'punakha'
  ON CONFLICT DO NOTHING;

  -- Variant: 6n-7d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '6n-7d', 'Bhutan Tour 6N 7D',
    6, 7, '6 Nights / 7 Days',
    1, FALSE,
    'https://images.pexels.com/photos/910368/pexels-photo-910368.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/37908899/pexels-photo-37908899.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/4153826/pexels-photo-4153826.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37992661/pexels-photo-37992661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5011707/pexels-photo-5011707.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_1;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_1;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 1, 'Paro to Thimphu: Arrival & Riverside Temple', 'On arrival at Paro International Airport, our representative greets you and escorts you on a scenic 54 km drive to Thimphu, the capital city. En route, stop at Tachogang Lhakhang, a 15th-century temple with an iron suspension bridge. The evening is free to wander the city streets, explore local markets, and soak in the vibrant atmosphere. Overnight stay in Thimphu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 2, 'Thimphu: Dzongs, Stupas & Buddha Dordenma', 'After breakfast, visit the Memorial Chorten, built in 1974 in memory of the third King of Bhutan. Proceed to the Devi Panchayan Mandir and the colossal Buddha Dordenma statue, one of the largest Buddha rupas in the world. Explore the National Folk Heritage Museum, housed in Bhutan''s oldest historical site, and the majestic Tashichho Dzong, a fortress built in 1641 on the banks of the Wang Chhu river. Stroll through the authentic craft street for local handicrafts. Evening free for city exploration. Overnight stay in Thimphu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 3, 'Thimphu to Phobjikha: Dochu-la Pass & Black-Necked Cranes', 'After breakfast, drive 134 km to Phobjikha Valley via the Dochu-la Pass (3,088 m), offering panoramic views of the highest Himalayan peaks on clear days. Visit the Druk Wangyal Chorten at the pass. Continue to the stunning Phobjikha Valley, surrounded by snow-capped mountains and verdant meadows, renowned as the winter home of the endangered black-necked cranes. Stop at the Black-Necked Crane Information Center and enjoy nature walks in the valley. Overnight stay in Phobjikha.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 4, 'Phobjikha to Punakha: Gangtey Monastery & Punakha Dzong', 'After breakfast, visit Gangtey Monastery, one of the largest and most famous Nyingma monasteries in Bhutan, perched on a hilltop overlooking the valley. Then drive 87 km to Punakha, with lunch en route. Explore the magnificent Punakha Dzong, built in 1637 at the confluence of the Pho Chhu and Mo Chhu rivers, and cross one of Bhutan''s longest suspension bridges. Evening free to stroll around the charming town. Overnight stay in Punakha.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 5, 'Punakha to Paro: Chimi Lhakhang & Paro Dzong', 'After breakfast, drive 125 km to Paro, stopping in Lobesa for a short hike to Chimi Lhakhang, the fertility temple. Visit the Royal Botanical Park at Lampheri, spanning 125 acres of diverse ecosystems and endemic species. Enjoy an airport bird''s-eye view point and riverside before exploring Paro Dzong, built in 1646. Evening free to wander the town. Overnight stay in Paro.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 6, 'Paro: Tiger''s Nest Monastery Hike & National Museum', 'After breakfast, drive to the hiking trailhead for the iconic Taktsang Monastery (Tiger''s Nest), perched on a sheer cliff ledge. The hike takes several hours, and lunch is served at a popular tourist restaurant in town. Later, visit the National Museum (Ta-Dzong), housed in an ancient watchtower with unique historical collections. Evening free for exploration. Alternatively, opt for a day excursion to Cheli-la Pass, offering superb views of Mt. Jhomolhari and Jichu Drake on clear days, then return to Paro for the museum visit. Overnight stay in Paro.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_1, 7, 'Paro Departure: Farewell to the Himalayas', 'After breakfast, drive to Paro International Airport for your flight to your onward destination, carrying sweet memories of the Happiness Kingdom. Our services conclude with your departure.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 0 FROM "Destination" d WHERE d."slug" = 'paro'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 1 FROM "Destination" d WHERE d."slug" = 'thimphu'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_1, d."id", 2 FROM "Destination" d WHERE d."slug" = 'punakha'
  ON CONFLICT DO NOTHING;

  -- Variant: 4n-5d
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '4n-5d', 'Bhutan Tour 4N 5D',
    4, 5, '4 Nights / 5 Days',
    2, FALSE,
    'https://images.pexels.com/photos/4153826/pexels-photo-4153826.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/37908899/pexels-photo-37908899.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/910368/pexels-photo-910368.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/37992661/pexels-photo-37992661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5011707/pexels-photo-5011707.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_2;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_2;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 1, 'Paro to Thimphu: Arrival & Enchanting Encounters', 'Upon arrival at Paro International Airport, your guide welcomes you and drives to Thimphu, the capital city. En route, you stop at the 15th-century Tachogang Lhakhang temple and its iron suspension bridge, offering stunning valley views. Upon reaching Thimphu, the evening is free to wander the vibrant streets, explore local markets, or visit a traditional crafts bazaar. Overnight stay in Thimphu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 2, 'Thimphu: Dochu La Pass & Cultural Immersion', 'After breakfast, you drive to the Dochu La Pass (3,088 m), where on clear days the Himalayas including Mount Jomolhari reveal themselves in breathtaking glory. You visit the Druk Wangyal Chorten, a beautiful temple built in honor of the fourth king. Returning to Thimphu, after lunch you explore the National Folk Heritage Museum, the historic Tashichho Dzong fortress by the Wang Chhu River, and the lively craft street. Evening is free for further exploration. Overnight stay in Thimphu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 3, 'Thimphu to Paro: Sacred Sites & Scenic Views', 'After breakfast, you visit the Memorial Chorten, built in 1974 in memory of the third king, followed by the Devi Panchayan Mandir and the monumental Buddha Dordenma statue, one of the world''s largest Buddha rupas. Then you drive to Paro, stopping at the airport bird''s eye viewpoint and riverside. Later, you explore Paro Dzong, a fortress-monastery built in 1646. The evening is free to leisurely explore Paro town. Overnight stay in Paro.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 4, 'Paro: Tiger''s Nest Monastery Hike or Cheli La Pass Excursion', 'After an early breakfast, you drive to the trailhead for the iconic hike to Taktsang Monastery, also known as Tiger''s Nest, perched on a cliff ledge 900 meters above the valley. The hike takes about 3-4 hours each way, rewarding you with spectacular views. After lunch, you visit the National Museum (Ta-Dzong), which houses priceless historical art and artifacts. Alternatively, you can opt for an excursion to Cheli La Pass for panoramic views of Mount Jhomolhari and Jichu Drake. Evening leisure at Paro. Overnight stay in Paro.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_2, 5, 'Paro: Departure from the Happiness Kingdom', 'After a final breakfast at your hotel, you are transferred to Paro International Airport for your departure flight. As you bid farewell to the serene valleys and prayer flags, you carry with you the lasting memories of Bhutan''s unique culture and natural beauty. End of tour services.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 0 FROM "Destination" d WHERE d."slug" = 'paro'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 1 FROM "Destination" d WHERE d."slug" = 'thimphu'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_2, d."id", 2 FROM "Destination" d WHERE d."slug" = 'punakha'
  ON CONFLICT DO NOTHING;

  -- Variant: 7n-8d-surface
  INSERT INTO "PackageVariant" ("id","packageId","slug","label","nights","days","durationText","sortOrder","isDefault","heroImage","galleryImages")
  VALUES (
    gen_random_uuid(), pkg_id, '7n-8d-surface', 'Bhutan Surface Tour 7N 8D',
    7, 8, '7 Nights / 8 Days',
    3, FALSE,
    'https://images.pexels.com/photos/37992661/pexels-photo-37992661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', ARRAY['https://images.pexels.com/photos/37908899/pexels-photo-37908899.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/910368/pexels-photo-910368.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/4153826/pexels-photo-4153826.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/5011707/pexels-photo-5011707.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  )
  ON CONFLICT ("packageId", "slug") DO UPDATE SET
    "label" = EXCLUDED."label", "heroImage" = EXCLUDED."heroImage",
    "galleryImages" = EXCLUDED."galleryImages"
  RETURNING "id" INTO var_id_3;

  DELETE FROM "ItineraryDay" WHERE "variantId" = var_id_3;
  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 1, 'Arrival in Phuentsholing: Border Town Exploration', 'Upon arrival at Bagdogra airport or railway station, our representative greets you and drives to Phuentsholing, the gateway to Bhutan. After check-in, visit the serene Zangto Pelri Lhakhang and the adjacent park. The evening is free to explore the bustling border town, known for its vibrant markets and fusion of Indian and Bhutanese cultures. Overnight stay in Phuentsholing.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 2, 'Phuentsholing to Thimphu: Scenic Drive & Cultural Stops', 'After breakfast, drive to Thimphu, the capital of Bhutan. En route, stop at the Karbandi Temple, Sangay Migyur Ling Lhakhang, and the towering Milarepa statue—the tallest structure in Bhutan. Witness the cascading Wankha Waterfalls and pause at Chojun for stunning photo opportunities. Arrive in Thimphu and spend the evening at leisure, exploring local shops or cafes. Overnight stay in Thimphu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 3, 'Thimphu: Spiritual & Cultural Highlights', 'After breakfast, visit the Memorial Chorten, built in 1974 in memory of the third king, followed by a stop at Devi Panchayan Mandir. Continue to the colossal Buddha Dordenma statue, one of the world''s largest Buddha rupas. Explore Simply Bhutan, a living museum and photo studio, then walk through the historic Tashichho Dzong, a fortress built in 1641 along the Wang Chhu River. End the day at the authentic craft street for souvenirs. Evening free. Overnight stay in Thimphu.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 4, 'Thimphu to Punakha: Himalayan Passes & River Fortress', 'After breakfast, drive to Punakha via the scenic Dochu-la Pass at 3,088 meters. On a clear day, enjoy spectacular views of the Himalayan peaks. Visit the Druk Wangyal Chorten and take a nature walk amid rhododendron forests. En route, stop at Sangchen Dorji Lhuendrup Nunnery, a Buddhist college and meditation center. Upon arrival, explore the magnificent Punakha Dzong, situated between the male and female rivers. Walk across one of Bhutan''s longest suspension bridges. Optional river rafting is available at extra cost. Evening at leisure. Overnight stay in Punakha.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 5, 'Punakha to Paro: Temples, Parks & Fortresses', 'After breakfast, drive to Paro with stops along the way. Visit Chimi Lhakhang, the temple of the divine madman, after a short hike from Lobesa. Continue to Lhampheri Recreational Park and enjoy the Airport Bird’s Eye View point and riverside. Upon arrival in Paro, explore Paro Dzong, a fortress built in 1646. Evenings are free for strolling around Paro town, known for its traditional architecture and handicrafts. Overnight stay in Paro.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 6, 'Paro: Tiger''s Nest Monastery Trek & National Museum', 'After breakfast, drive to the trailhead for the iconic Taktsang Monastery (Tiger''s Nest), perched on a sheer cliff 900 meters above the valley. Enjoy a moderate hike through pine forests, with breathtaking views of the Paro Valley. After descending, have lunch in town. Visit the National Museum (Ta-Dzong), housing ancient artifacts, thangkas, and religious relics. Evenings free for exploring Paro. Overnight stay in Paro.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 7, 'Paro: At Leisure & Optional Exploration', 'Enjoy a relaxed day in Paro. Optionally, visit Drukgyel Dzong, a ruined fortress with stunning views of Mount Jomolhari, or explore local farmhouses and traditional crafts. Take a leisurely walk along the Paro River or indulge in a traditional hot stone bath. Evening free for last-minute shopping for Bhutanese souvenirs like handwoven textiles and incense. Overnight stay in Paro.', ARRAY[]::TEXT[]);

  INSERT INTO "ItineraryDay" ("id","variantId","day","title","description","images")
  VALUES (gen_random_uuid(), var_id_3, 8, 'Paro: Departure with Memorable Impressions', 'After breakfast, transfer to Paro International Airport for your onward journey. Bid farewell to the Land of the Thunder Dragon, carrying memories of serene landscapes, spiritual encounters, and the warmth of Bhutanese hospitality. End of tour.', ARRAY[]::TEXT[]);

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 0 FROM "Destination" d WHERE d."slug" = 'paro'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 1 FROM "Destination" d WHERE d."slug" = 'thimphu'
  ON CONFLICT DO NOTHING;

  INSERT INTO "PackageDestination" ("variantId","destinationId","sortOrder")
  SELECT var_id_3, d."id", 2 FROM "Destination" d WHERE d."slug" = 'punakha'
  ON CONFLICT DO NOTHING;

END $$;
