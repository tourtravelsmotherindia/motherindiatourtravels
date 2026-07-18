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
INSERT INTO "SiteSection" ("id","key","tagline","subtitle","image") VALUES
(gen_random_uuid(), 'faq', 'All You Should Know Before Embarking on Your Journey', 'We''ve got answers to the most common travel questions from our customers.', 'https://motherindiatourtravels.com/images/trip_ladakh.png'),
(gen_random_uuid(), 'gallery', 'Our Travel Gallery', 'Catch a glimpse of the mesmerizing landscapes, historical monuments, and soulful cultures captured during our curated trips.', NULL),
(gen_random_uuid(), 'why-choose-us', 'Why Choose Us', 'Two decades of trust, expertise, and unforgettable journeys across India and the world.', NULL),
(gen_random_uuid(), 'testimonials', 'What Our Travelers Say', 'Thousands of happy travelers have explored India with us. Here''s what they say about their experience.', NULL),
(gen_random_uuid(), 'destinations', 'Explore Destinations', 'From the snow-capped Himalayas to tropical beaches, discover India''s incredible diversity with our handpicked destinations.', NULL)
ON CONFLICT ("key") DO UPDATE SET
  "tagline" = EXCLUDED."tagline", "subtitle" = EXCLUDED."subtitle", "image" = EXCLUDED."image";

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
INSERT INTO "FAQ" ("id","question","answer","sortOrder") VALUES
(gen_random_uuid(), 'What is included in your tour packages?', 'Our packages typically include accommodation, transportation (AC vehicle with driver), sightseeing as per itinerary, and a dedicated tour manager. Meals and flights are added as per the selected package. Please refer to the specific package inclusions for details.', 1),
(gen_random_uuid(), 'Can I customize a tour package?', 'Absolutely! All our tour packages are fully customizable. You can add destinations, change hotels, extend duration, or create a completely personalized itinerary. Contact us via WhatsApp or phone and our travel experts will design your dream trip.', 2),
(gen_random_uuid(), 'How do I book a tour package?', 'You can book by filling out the inquiry form on the package page, calling us at +91 9810140121, or messaging us on WhatsApp. We will confirm availability, share the detailed itinerary, and once you approve, collect an advance payment to secure your booking.', 3),
(gen_random_uuid(), 'What is your cancellation policy?', 'Cancellations made 30+ days before departure receive 90% refund. 15–30 days: 70% refund. 7–15 days: 50% refund. Less than 7 days: no refund. We recommend travel insurance for peace of mind.', 4),
(gen_random_uuid(), 'Do you provide visa assistance for international tours?', 'Yes, we provide visa guidance and documentation support for international packages. However, the visa fee and final approval is the responsibility of the concerned embassy. We help you prepare the correct documents to maximize approval chances.', 5),
(gen_random_uuid(), 'Are your tours suitable for senior citizens?', 'Yes! We design all our tours keeping comfort and accessibility in mind. We use comfortable AC vehicles, select senior-friendly hotels, and our tour managers are experienced in assisting elderly travelers. Just let us know your specific requirements.', 6),
(gen_random_uuid(), 'Do you offer group discounts?', 'Yes, we offer attractive discounts for groups of 10 or more. We also specialize in school trips, corporate outings, and pilgrimage group tours. Contact us for a customized group quote.', 7),
(gen_random_uuid(), 'What payment methods do you accept?', 'We accept bank transfer (NEFT/RTGS/IMPS), UPI (GPay, PhonePe, Paytm), cash, and cheque. For international clients, we also accept wire transfers. A booking advance of 25–30% is required to confirm your tour.', 8)
ON CONFLICT DO NOTHING;

-- ─────────────────────────────────────────────
-- TESTIMONIALS
-- ─────────────────────────────────────────────
INSERT INTO "Testimonial" ("id","reviewer","review","rating","packageName","source","isApproved","isFeatured","createdAt") VALUES
(gen_random_uuid(), 'Rajesh Sharma', 'Had an absolutely wonderful experience with Mother India Tour Travels! Our Golden Triangle tour was perfectly organized. The hotel choices were excellent, the driver was courteous, and the guide was very knowledgeable. Will definitely book again!', 5, 'Golden Triangle Tour', 'Google', TRUE, TRUE, NOW()),
(gen_random_uuid(), 'Priya Mehta', 'Our Kashmir honeymoon was a dream come true thanks to this team. The houseboat on Dal Lake, the shikara rides, Gulmarg snow — everything was perfectly arranged. The team was available 24/7 for any need. Highly recommend!', 5, 'Kashmir Honeymoon Package', 'Google', TRUE, TRUE, NOW()),
(gen_random_uuid(), 'Suresh & Family', 'Booked a 7-day Kerala backwaters tour for our family of 6. The houseboat was spacious and clean, the food was delicious, and the Munnar tea gardens were magical. Mother India Tour Travels took care of everything seamlessly!', 5, 'Kerala Family Tour', 'TripAdvisor', TRUE, TRUE, NOW()),
(gen_random_uuid(), 'Anita Kapoor', 'The Char Dham Yatra package was meticulously planned. Comfortable hotels at each dhama, smooth transportation even on mountain roads, and a very caring team. This was a once-in-a-lifetime spiritual journey. Thank you!', 5, 'Char Dham Yatra Package', 'Google', TRUE, FALSE, NOW()),
(gen_random_uuid(), 'Vikram Singh', 'Excellent Dubai tour! All transfers, Burj Khalifa, desert safari, dhow cruise — everything was on time and perfectly organized. Great value for money. Our family of 4 had a fantastic vacation!', 5, 'Dubai Family Package', 'Google', TRUE, TRUE, NOW()),
(gen_random_uuid(), 'Meena Agarwal', 'We were a group of 15 senior citizens for the Varanasi-Prayagraj pilgrimage. The team arranged everything keeping our age and comfort in mind — from wheelchair assistance to dietary needs. Truly a blessed journey. 5 stars!', 5, 'Varanasi Prayagraj Spiritual Tour', 'Google', TRUE, FALSE, NOW())
ON CONFLICT DO NOTHING;

-- ─────────────────────────────────────────────
-- RELATIONAL PACKAGES, VARIANTS, & ITINERARIES
-- ─────────────────────────────────────────────

-- ─────────────────────────────────────────────
-- rel_packages_variants_itineraries GENERATED BY ANTIGRAVITY
-- ─────────────────────────────────────────────
DO $$
DECLARE
  india_id TEXT; nepal_id TEXT; uae_id TEXT; thailand_id TEXT; malaysia_id TEXT; singapore_id TEXT;
  delhi_state TEXT; up_state TEXT; raj_state TEXT; hp_state TEXT; uk_state TEXT; jk_state TEXT; kerala_state TEXT; goa_state TEXT; wb_state TEXT; sikkim_state TEXT; andaman_state TEXT; mp_state TEXT; punjab_state TEXT; haryana_state TEXT; karnataka_state TEXT;
  dom_cat TEXT; int_cat TEXT; north_cat TEXT; south_cat TEXT; honey_cat TEXT; fam_cat TEXT; spirit_cat TEXT; adv_cat TEXT; beach_cat TEXT; hill_cat TEXT;

  -- Destination variables
  dest_port_blair TEXT;
  dest_havelock_island TEXT;
  dest_neil_island TEXT;
  dest_munnar TEXT;
  dest_thekkady TEXT;
  dest_alleppey TEXT;
  dest_cochin TEXT;
  dest_goa TEXT;
  dest_srinagar TEXT;
  dest_gulmarg TEXT;
  dest_pahalgam TEXT;
  dest_sonamarg TEXT;
  dest_varanasi TEXT;
  dest_ayodhya TEXT;
  dest_prayagraj TEXT;
  dest_delhi TEXT;
  dest_agra TEXT;
  dest_jaipur TEXT;
  dest_pushkar TEXT;
  dest_khajuraho TEXT;
  dest_udaipur TEXT;
  dest_jodhpur TEXT;
  dest_jaisalmer TEXT;
  dest_bikaner TEXT;
  dest_ranthambore TEXT;
  dest_jim_corbett TEXT;
  dest_haridwar TEXT;
  dest_rishikesh TEXT;
  dest_nainital TEXT;
  dest_mandawa TEXT;
  dest_shimla TEXT;
  dest_manali TEXT;
  dest_dharamshala TEXT;
  dest_dalhousie TEXT;
  dest_amritsar TEXT;
  dest_chandigarh TEXT;
  dest_kathmandu TEXT;
  dest_nagarkot TEXT;
  dest_mussoorie TEXT;
  dest_gangtok TEXT;
  dest_darjeeling TEXT;
  dest_pelling TEXT;
  dest_lumbini TEXT;
  dest_pokhara TEXT;
  dest_chitrakoot TEXT;
  dest_kovalam TEXT;
  dest_chitwan TEXT;
  dest_bangalore TEXT;
  dest_mysore TEXT;
  dest_coorg TEXT;
  dest_wayanad TEXT;
  dest_mathura TEXT;
  dest_leh TEXT;
  dest_bangkok TEXT;
  dest_pattaya TEXT;
  dest_phuket TEXT;
  dest_kuala_lumpur TEXT;
  dest_genting_highlands TEXT;
  dest_dubai TEXT;

  -- Package variables
  pkg_andaman_tour TEXT := 'andaman-tour';
  pkg_kashmir_tour TEXT := 'kashmir-tour';
  pkg_kerala_tour TEXT := 'kerala-tour';
  pkg_goa_tour TEXT := 'goa-tour';
  pkg_himachal_tour TEXT := 'himachal-tour';
  pkg_uttarakhand_tour TEXT := 'uttarakhand-tour';
  pkg_sikkim_tour TEXT := 'sikkim-tour';
  pkg_nepal_tour TEXT := 'nepal-tour';
  pkg_varanasi_ayodhya_tour TEXT := 'varanasi-ayodhya-tour';
  pkg_golden_triangle_tour TEXT := 'golden-triangle-tour';
  pkg_rajasthan_tour TEXT := 'rajasthan-tour';

  -- Variant variables
  var_andaman_tour_6n_7d TEXT := gen_random_uuid();
  var_kerala_tour_5n_6d TEXT := gen_random_uuid();
  var_kerala_tour_3n_4d TEXT := gen_random_uuid();
  var_kashmir_tour_5n_6d TEXT := gen_random_uuid();
  var_golden_triangle_tour_1n_2d TEXT := gen_random_uuid();
  var_golden_triangle_tour_2n_3d TEXT := gen_random_uuid();
  var_golden_triangle_tour_5n_6d_khajuraho TEXT := gen_random_uuid();
  var_golden_triangle_tour_7n_8d TEXT := gen_random_uuid();
  var_golden_triangle_tour_8n_9d TEXT := gen_random_uuid();
  var_golden_triangle_tour_5n_6d TEXT := gen_random_uuid();
  var_golden_triangle_tour_3n_4d TEXT := gen_random_uuid();
  var_golden_triangle_tour_4n_5d TEXT := gen_random_uuid();
  var_golden_triangle_tour_5n_6d_udaipur TEXT := gen_random_uuid();
  var_golden_triangle_tour_9n_10d TEXT := gen_random_uuid();
  var_golden_triangle_tour_2n_3d_mathura TEXT := gen_random_uuid();
  var_uttarakhand_tour_4n_5d TEXT := gen_random_uuid();
  var_golden_triangle_tour_5n_6d_haridwar TEXT := gen_random_uuid();
  var_uttarakhand_tour_3n_4d TEXT := gen_random_uuid();
  var_golden_triangle_tour_11n_12d TEXT := gen_random_uuid();
  var_uttarakhand_tour_5n_6d TEXT := gen_random_uuid();
  var_golden_triangle_tour_7n_8d_shimla TEXT := gen_random_uuid();
  var_nepal_tour_4n_5d TEXT := gen_random_uuid();
  var_golden_triangle_tour_5n_6d_mandawa TEXT := gen_random_uuid();
  var_golden_triangle_tour_6n_7d_udaipur TEXT := gen_random_uuid();
  var_uttarakhand_tour_2n_3d TEXT := gen_random_uuid();
  var_andaman_tour_5n_6d TEXT := gen_random_uuid();
  var_nepal_tour_3n_4d TEXT := gen_random_uuid();
  var_andaman_tour_3n_4d TEXT := gen_random_uuid();
  var_rajasthan_tour_9n_10d TEXT := gen_random_uuid();
  var_rajasthan_tour_10n_11d TEXT := gen_random_uuid();
  var_rajasthan_tour_11n_12d TEXT := gen_random_uuid();
  var_rajasthan_tour_13n_14d TEXT := gen_random_uuid();
  var_rajasthan_tour_14n_15d TEXT := gen_random_uuid();
  var_rajasthan_tour_20n_21d TEXT := gen_random_uuid();
  var_rajasthan_tour_9n_10d_khajuraho TEXT := gen_random_uuid();
  var_golden_triangle_tour_6n_7d TEXT := gen_random_uuid();
  var_golden_triangle_tour_0n_1d TEXT := gen_random_uuid();
  var_himachal_tour_5n_6d TEXT := gen_random_uuid();
  var_himachal_tour_6n_7d TEXT := gen_random_uuid();
  var_himachal_tour_4n_5d TEXT := gen_random_uuid();
  var_nepal_tour_5n_6d TEXT := gen_random_uuid();
  var_uttarakhand_tour_10n_11d TEXT := gen_random_uuid();
  var_varanasi_ayodhya_tour_5n_6d TEXT := gen_random_uuid();
  var_varanasi_ayodhya_tour_5n_6d_chitrakoot TEXT := gen_random_uuid();
  var_varanasi_ayodhya_tour_4n_5d TEXT := gen_random_uuid();
  var_varanasi_ayodhya_tour_2n_3d TEXT := gen_random_uuid();
  var_himachal_tour_5n_6d_volvo TEXT := gen_random_uuid();
  var_golden_triangle_tour_10n_11d TEXT := gen_random_uuid();
  var_kashmir_tour_4n_5d TEXT := gen_random_uuid();
  var_goa_tour_4n_5d TEXT := gen_random_uuid();
  var_goa_tour_3n_4d TEXT := gen_random_uuid();
  var_goa_tour_2n_3d TEXT := gen_random_uuid();
  var_kashmir_tour_2n_3d TEXT := gen_random_uuid();
  var_kerala_tour_6n_7d TEXT := gen_random_uuid();
  var_nepal_tour_9n_10d TEXT := gen_random_uuid();
  var_kashmir_tour_3n_4d TEXT := gen_random_uuid();
BEGIN
  -- Clean and Insert Hero Slides (5 Slides with Pexels images)
  DELETE FROM "HeroSlide";
  INSERT INTO "HeroSlide" ("id", "heroConfigId", "image", "tag", "title", "description", "sortOrder") VALUES
    (gen_random_uuid(), 1, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'Taj Mahal, Agra', 'Discover the Wonder of the World', 'Experience the timeless beauty of the Taj Mahal and the rich Mughal heritage of Agra.', 1);
  INSERT INTO "HeroSlide" ("id", "heroConfigId", "image", "tag", "title", "description", "sortOrder") VALUES
    (gen_random_uuid(), 1, 'https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb', 'Dal Lake, Kashmir', 'Paradise on Earth', 'Float through the shimmering Dal Lake on a shikara and experience the magic of Kashmir.', 2);
  INSERT INTO "HeroSlide" ("id", "heroConfigId", "image", "tag", "title", "description", "sortOrder") VALUES
    (gen_random_uuid(), 1, 'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb', 'Kerala Backwaters', 'God''s Own Country Awaits', 'Glide through the serene backwaters of Kerala on a traditional houseboat surrounded by luxury greenery.', 3);
  INSERT INTO "HeroSlide" ("id", "heroConfigId", "image", "tag", "title", "description", "sortOrder") VALUES
    (gen_random_uuid(), 1, 'https://images.pexels.com/photos/34086724/pexels-photo-34086724.jpeg?auto=compress&cs=tinysrgb', 'Jaipur, Rajasthan', 'The Land of Kings', 'Explore majestic forts, vibrant bazaars, and the royal splendor of Rajasthan''s Pink City.', 4);
  INSERT INTO "HeroSlide" ("id", "heroConfigId", "image", "tag", "title", "description", "sortOrder") VALUES
    (gen_random_uuid(), 1, 'https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb', 'Goa Beaches', 'Sun, Sand & Beach Serenity', 'Relax on the golden sands of Goa, enjoy warm ocean breezes, and experience coastal bliss.', 5);

  -- Get Geography Country IDs
  SELECT "id" INTO india_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO nepal_id FROM "Country" WHERE "slug" = 'nepal';
  SELECT "id" INTO uae_id FROM "Country" WHERE "slug" = 'uae';
  SELECT "id" INTO thailand_id FROM "Country" WHERE "slug" = 'thailand';
  SELECT "id" INTO malaysia_id FROM "Country" WHERE "slug" = 'malaysia';
  SELECT "id" INTO singapore_id FROM "Country" WHERE "slug" = 'singapore';

  -- Get State IDs
  SELECT "id" INTO delhi_state FROM "State" WHERE "slug" = 'delhi';
  SELECT "id" INTO up_state FROM "State" WHERE "slug" = 'uttar-pradesh';
  SELECT "id" INTO raj_state FROM "State" WHERE "slug" = 'rajasthan';
  SELECT "id" INTO hp_state FROM "State" WHERE "slug" = 'himachal-pradesh';
  SELECT "id" INTO uk_state FROM "State" WHERE "slug" = 'uttarakhand';
  SELECT "id" INTO jk_state FROM "State" WHERE "slug" = 'jammu-kashmir';
  SELECT "id" INTO kerala_state FROM "State" WHERE "slug" = 'kerala';
  SELECT "id" INTO goa_state FROM "State" WHERE "slug" = 'goa';
  SELECT "id" INTO wb_state FROM "State" WHERE "slug" = 'west-bengal';
  SELECT "id" INTO sikkim_state FROM "State" WHERE "slug" = 'sikkim';
  SELECT "id" INTO andaman_state FROM "State" WHERE "slug" = 'andaman-nicobar';
  SELECT "id" INTO mp_state FROM "State" WHERE "slug" = 'madhya-pradesh';
  SELECT "id" INTO punjab_state FROM "State" WHERE "slug" = 'punjab';
  SELECT "id" INTO haryana_state FROM "State" WHERE "slug" = 'haryana';
  SELECT "id" INTO karnataka_state FROM "State" WHERE "slug" = 'karnataka';

  -- Get Category IDs
  SELECT "id" INTO dom_cat FROM "Category" WHERE "slug" = 'domestic-tour-packages';
  SELECT "id" INTO int_cat FROM "Category" WHERE "slug" = 'international-tour-packages';
  SELECT "id" INTO north_cat FROM "Category" WHERE "slug" = 'north-india-tour-packages';
  SELECT "id" INTO south_cat FROM "Category" WHERE "slug" = 'south-india-tour-packages';
  SELECT "id" INTO honey_cat FROM "Category" WHERE "slug" = 'honeymoon-tour-packages';
  SELECT "id" INTO fam_cat FROM "Category" WHERE "slug" = 'family-tour-packages';
  SELECT "id" INTO spirit_cat FROM "Category" WHERE "slug" = 'spiritual-tour-packages';
  SELECT "id" INTO adv_cat FROM "Category" WHERE "slug" = 'adventure-tour-packages';
  SELECT "id" INTO beach_cat FROM "Category" WHERE "slug" = 'beach-tour-packages';
  SELECT "id" INTO hill_cat FROM "Category" WHERE "slug" = 'hill-station-tour-packages';

  -- Get existing destination IDs into variables
  SELECT "id" INTO dest_delhi FROM "Destination" WHERE "slug" = 'delhi';
  SELECT "id" INTO dest_agra FROM "Destination" WHERE "slug" = 'agra';
  SELECT "id" INTO dest_varanasi FROM "Destination" WHERE "slug" = 'varanasi';
  SELECT "id" INTO dest_mathura FROM "Destination" WHERE "slug" = 'mathura';
  SELECT "id" INTO dest_ayodhya FROM "Destination" WHERE "slug" = 'ayodhya';
  SELECT "id" INTO dest_prayagraj FROM "Destination" WHERE "slug" = 'prayagraj';
  SELECT "id" INTO dest_khajuraho FROM "Destination" WHERE "slug" = 'khajuraho';
  SELECT "id" INTO dest_jaipur FROM "Destination" WHERE "slug" = 'jaipur';
  SELECT "id" INTO dest_pushkar FROM "Destination" WHERE "slug" = 'pushkar';
  SELECT "id" INTO dest_ranthambore FROM "Destination" WHERE "slug" = 'ranthambore';
  SELECT "id" INTO dest_shimla FROM "Destination" WHERE "slug" = 'shimla';
  SELECT "id" INTO dest_manali FROM "Destination" WHERE "slug" = 'manali';
  SELECT "id" INTO dest_rishikesh FROM "Destination" WHERE "slug" = 'rishikesh';
  SELECT "id" INTO dest_haridwar FROM "Destination" WHERE "slug" = 'haridwar';
  SELECT "id" INTO dest_mussoorie FROM "Destination" WHERE "slug" = 'mussoorie';
  SELECT "id" INTO dest_jim_corbett FROM "Destination" WHERE "slug" = 'jim-corbett';
  SELECT "id" INTO dest_nainital FROM "Destination" WHERE "slug" = 'nainital';
  SELECT "id" INTO dest_srinagar FROM "Destination" WHERE "slug" = 'srinagar';
  SELECT "id" INTO dest_gulmarg FROM "Destination" WHERE "slug" = 'gulmarg';
  SELECT "id" INTO dest_pahalgam FROM "Destination" WHERE "slug" = 'pahalgam';
  SELECT "id" INTO dest_leh FROM "Destination" WHERE "slug" = 'leh';
  SELECT "id" INTO dest_darjeeling FROM "Destination" WHERE "slug" = 'darjeeling';
  SELECT "id" INTO dest_gangtok FROM "Destination" WHERE "slug" = 'gangtok';
  SELECT "id" INTO dest_pelling FROM "Destination" WHERE "slug" = 'pelling';
  SELECT "id" INTO dest_cochin FROM "Destination" WHERE "slug" = 'cochin';
  SELECT "id" INTO dest_munnar FROM "Destination" WHERE "slug" = 'munnar';
  SELECT "id" INTO dest_alleppey FROM "Destination" WHERE "slug" = 'alleppey';
  SELECT "id" INTO dest_thekkady FROM "Destination" WHERE "slug" = 'thekkady';
  SELECT "id" INTO dest_goa FROM "Destination" WHERE "slug" = 'goa';
  SELECT "id" INTO dest_port_blair FROM "Destination" WHERE "slug" = 'port-blair';
  SELECT "id" INTO dest_havelock_island FROM "Destination" WHERE "slug" = 'havelock-island';
  SELECT "id" INTO dest_kathmandu FROM "Destination" WHERE "slug" = 'kathmandu';
  SELECT "id" INTO dest_pokhara FROM "Destination" WHERE "slug" = 'pokhara';
  SELECT "id" INTO dest_chitwan FROM "Destination" WHERE "slug" = 'chitwan';
  SELECT "id" INTO dest_bangkok FROM "Destination" WHERE "slug" = 'bangkok';
  SELECT "id" INTO dest_pattaya FROM "Destination" WHERE "slug" = 'pattaya';
  SELECT "id" INTO dest_phuket FROM "Destination" WHERE "slug" = 'phuket';
  SELECT "id" INTO dest_kuala_lumpur FROM "Destination" WHERE "slug" = 'kuala-lumpur';
  SELECT "id" INTO dest_genting_highlands FROM "Destination" WHERE "slug" = 'genting-highlands';
  SELECT "id" INTO dest_dubai FROM "Destination" WHERE "slug" = 'dubai';

  -- Insert missing destinations
  dest_neil_island := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_neil_island, 'Neil Island', 'neil-island', andaman_state, india_id, 'ISLAND', FALSE, 'Neil Island (Shaheed Dweep) is a quiet and scenic island in the Andamans, known for its coral reefs, sandy beaches, and relaxed vibes.', 'October to March', 'Moderate', 11.8336, 93.0489, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Neil Island Tour Packages', 'Explore Neil Island with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_neil_island;

  dest_wayanad := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_wayanad, 'Wayanad', 'wayanad', kerala_state, india_id, 'HILL_STATION', FALSE, 'Wayanad is a scenic hill station in Kerala, famous for its waterfalls, caves, spice plantations, and wildlife sanctuaries.', 'October to March', 'Moderate', 11.6854, 76.132, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Wayanad Tour Packages', 'Explore Wayanad with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_wayanad;

  dest_coorg := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_coorg, 'Coorg', 'coorg', karnataka_state, india_id, 'HILL_STATION', FALSE, 'Coorg (Kodagu) is a mountainous district in Karnataka, renowned for its coffee plantations, lush forests, and waterfalls.', 'October to March', 'Moderate', 12.3375, 75.8069, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Coorg Tour Packages', 'Explore Coorg with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_coorg;

  dest_bangalore := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_bangalore, 'Bangalore', 'bangalore', karnataka_state, india_id, 'CITY', FALSE, 'Bangalore (Bengaluru) is the capital of Karnataka and India''s tech hub, known for its parks, nightlife, and pleasant weather.', 'October to March', 'Moderate', 12.9716, 77.5946, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Bangalore Tour Packages', 'Explore Bangalore with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_bangalore;

  dest_mysore := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_mysore, 'Mysore', 'mysore', karnataka_state, india_id, 'HERITAGE', FALSE, 'Mysore (Mysuru) is a historic city in Karnataka, famous for its grand Mysore Palace, royal heritage, and silk production.', 'October to March', 'Moderate', 12.2958, 76.6394, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Mysore Tour Packages', 'Explore Mysore with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_mysore;

  dest_amritsar := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_amritsar, 'Amritsar', 'amritsar', punjab_state, india_id, 'PILGRIMAGE', FALSE, 'Amritsar is the spiritual center of Sikhism, home to the magnificent Golden Temple and rich culinary heritage.', 'October to March', 'Moderate', 31.634, 74.8723, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Amritsar Tour Packages', 'Explore Amritsar with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_amritsar;

  dest_chandigarh := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_chandigarh, 'Chandigarh', 'chandigarh', haryana_state, india_id, 'CITY', FALSE, 'Chandigarh is a modern, planned city designed by Le Corbusier, acting as the joint capital of Punjab and Haryana.', 'October to March', 'Moderate', 30.7333, 76.7794, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Chandigarh Tour Packages', 'Explore Chandigarh with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_chandigarh;

  dest_lumbini := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_lumbini, 'Lumbini', 'lumbini', NULL, nepal_id, 'PILGRIMAGE', FALSE, 'Lumbini is a UNESCO World Heritage Site in Nepal, revered as the birthplace of Siddhartha Gautama (Lord Buddha).', 'October to March', 'Moderate', 27.4789, 83.2753, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Lumbini Tour Packages', 'Explore Lumbini with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_lumbini;

  dest_chitrakoot := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_chitrakoot, 'Chitrakoot', 'chitrakoot', up_state, india_id, 'PILGRIMAGE', FALSE, 'Chitrakoot is a sacred town associated with the Ramayana, known for its temples, ghats, and spiritual atmosphere.', 'October to March', 'Moderate', 25.1112, 80.8587, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Chitrakoot Tour Packages', 'Explore Chitrakoot with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_chitrakoot;

  dest_mandawa := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_mandawa, 'Mandawa', 'mandawa', raj_state, india_id, 'HERITAGE', FALSE, 'Mandawa is a town in the Shekhawati region of Rajasthan, famous for its historic Havelis adorned with colorful frescoes.', 'October to March', 'Moderate', 28.056, 75.1432, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Mandawa Tour Packages', 'Explore Mandawa with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_mandawa;

  dest_sonamarg := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_sonamarg, 'Sonamarg', 'sonamarg', jk_state, india_id, 'HILL_STATION', FALSE, 'Sonamarg, the Meadow of Gold, is a beautiful glacier valley in Kashmir, famous for the Thajiwas Glacier and trekking paths.', 'October to March', 'Moderate', 34.3022, 75.2952, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Sonamarg Tour Packages', 'Explore Sonamarg with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_sonamarg;

  dest_udaipur := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_udaipur, 'Udaipur', 'udaipur', raj_state, india_id, 'HERITAGE', FALSE, 'Udaipur, the City of Lakes, is famous for its stunning palaces, scenic lakes, and historic heritage houses.', 'October to March', 'Moderate', 24.5854, 73.7125, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Udaipur Tour Packages', 'Explore Udaipur with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_udaipur;

  dest_jodhpur := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_jodhpur, 'Jodhpur', 'jodhpur', raj_state, india_id, 'HERITAGE', FALSE, 'Jodhpur, the Sun City and Blue City, is famous for its massive Mehrangarh Fort and royal heritage.', 'October to March', 'Moderate', 26.2389, 73.0243, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Jodhpur Tour Packages', 'Explore Jodhpur with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_jodhpur;

  dest_jaisalmer := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_jaisalmer, 'Jaisalmer', 'jaisalmer', raj_state, india_id, 'HERITAGE', FALSE, 'Jaisalmer, the Golden City, is famous for its sandstone fort and desert safari dunes in the Thar Desert.', 'October to March', 'Moderate', 26.9157, 70.9083, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Jaisalmer Tour Packages', 'Explore Jaisalmer with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_jaisalmer;

  dest_bikaner := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_bikaner, 'Bikaner', 'bikaner', raj_state, india_id, 'HERITAGE', FALSE, 'Bikaner is famous for its massive Junagarh Fort, desert landscapes, and rich camel-breeding traditions.', 'October to March', 'Moderate', 28.0194, 73.3117, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Bikaner Tour Packages', 'Explore Bikaner with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_bikaner;

  dest_dharamshala := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_dharamshala, 'Dharamshala', 'dharamshala', hp_state, india_id, 'HILL_STATION', FALSE, 'Dharamshala is a scenic hill station in the Himalayas, home to the Dalai Lama and Tibetan culture.', 'October to March', 'Moderate', 32.219, 76.3234, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Dharamshala Tour Packages', 'Explore Dharamshala with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_dharamshala;

  dest_dalhousie := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_dalhousie, 'Dalhousie', 'dalhousie', hp_state, india_id, 'HILL_STATION', FALSE, 'Dalhousie is a quiet hill town in Himachal Pradesh, famous for its colonial bungalows and forest walks.', 'October to March', 'Moderate', 32.5387, 75.971, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Dalhousie Tour Packages', 'Explore Dalhousie with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_dalhousie;

  dest_nagarkot := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_nagarkot, 'Nagarkot', 'nagarkot', NULL, nepal_id, 'HILL_STATION', FALSE, 'Nagarkot is a scenic hill village in Nepal, offering spectacular sunrise views over the Himalayas including Mt. Everest.', 'October to March', 'Moderate', 27.7174, 85.5222, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Nagarkot Tour Packages', 'Explore Nagarkot with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_nagarkot;

  dest_kovalam := gen_random_uuid();
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
    (dest_kovalam, 'Kovalam', 'kovalam', kerala_state, india_id, 'BEACH', FALSE, 'Kovalam is a famous beach town in Kerala, known for its iconic lighthouse, crescent beaches, and calm waters.', 'October to March', 'Moderate', 8.402, 76.9784, 'https://images.unsplash.com/photo-1500000000000?auto=format&fit=crop&w=800&q=80', 'Kovalam Tour Packages', 'Explore Kovalam with Mother India Tour Travels. Best holiday deals.', NOW(), NOW())
    ON CONFLICT ("slug") DO UPDATE SET "name" = EXCLUDED."name" RETURNING "id" INTO dest_kovalam;


  -- Clean up old packages to allow updates
  DELETE FROM "PackageCategory" WHERE "packageId" IN ('andaman-tour', 'kashmir-tour', 'kerala-tour', 'goa-tour', 'himachal-tour', 'uttarakhand-tour', 'sikkim-tour', 'nepal-tour', 'varanasi-ayodhya-tour', 'golden-triangle-tour', 'rajasthan-tour');
  DELETE FROM "PackageDestination" WHERE "variantId" IN (SELECT "id" FROM "PackageVariant" WHERE "packageId" IN ('andaman-tour', 'kashmir-tour', 'kerala-tour', 'goa-tour', 'himachal-tour', 'uttarakhand-tour', 'sikkim-tour', 'nepal-tour', 'varanasi-ayodhya-tour', 'golden-triangle-tour', 'rajasthan-tour'));
  DELETE FROM "PackageAttraction" WHERE "variantId" IN (SELECT "id" FROM "PackageVariant" WHERE "packageId" IN ('andaman-tour', 'kashmir-tour', 'kerala-tour', 'goa-tour', 'himachal-tour', 'uttarakhand-tour', 'sikkim-tour', 'nepal-tour', 'varanasi-ayodhya-tour', 'golden-triangle-tour', 'rajasthan-tour'));
  DELETE FROM "ItineraryDay" WHERE "variantId" IN (SELECT "id" FROM "PackageVariant" WHERE "packageId" IN ('andaman-tour', 'kashmir-tour', 'kerala-tour', 'goa-tour', 'himachal-tour', 'uttarakhand-tour', 'sikkim-tour', 'nepal-tour', 'varanasi-ayodhya-tour', 'golden-triangle-tour', 'rajasthan-tour'));
  DELETE FROM "PackageVariant" WHERE "packageId" IN ('andaman-tour', 'kashmir-tour', 'kerala-tour', 'goa-tour', 'himachal-tour', 'uttarakhand-tour', 'sikkim-tour', 'nepal-tour', 'varanasi-ayodhya-tour', 'golden-triangle-tour', 'rajasthan-tour');
  DELETE FROM "Package" WHERE "id" IN ('andaman-tour', 'kashmir-tour', 'kerala-tour', 'goa-tour', 'himachal-tour', 'uttarakhand-tour', 'sikkim-tour', 'nepal-tour', 'varanasi-ayodhya-tour', 'golden-triangle-tour', 'rajasthan-tour');

  -- Insert Main Packages
  -- Package: Andaman Tropical Escapes
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_andaman_tour, 'andaman-tour', 'Andaman Tropical Escapes',
    'Explore the tropical paradise of Andaman. Discover pristine beaches, clear blue waters, rich marine life, and historic colonial remnants in Port Blair, Havelock Island, and Neil Island. Ideal for honeymooners, adventure seekers, and family vacations.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/29175703/pexels-photo-29175703.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37949152/pexels-photo-37949152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37950306/pexels-photo-37950306.jpeg?auto=compress&cs=tinysrgb'],
    'Beach', 12, 8, 'Premium Stay',
    'Explore the best of Andaman Tropical Escapes with our expertly crafted itineraries.',
    TRUE, TRUE, ARRAY['beach', 'island', 'andaman', 'nature'], india_id, andaman_state,
    'Andaman Tropical Escapes Packages | Tours & Travels | Mother India',
    'Book customized Andaman Tropical Escapes packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['beach package', 'island package', 'andaman package', 'nature package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_andaman_tour, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_andaman_tour, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_andaman_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_andaman_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Package: Kashmir Paradise & Valley Highlights
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_kashmir_tour, 'kashmir-tour', 'Kashmir Paradise & Valley Highlights',
    'Welcome to the Paradise on Earth. Experience the serene Dal Lake on a traditional shikara, walk through the historic Mughal gardens of Srinagar, explore the snow slopes of Gulmarg, and trek through the lush green meadows of Pahalgam.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/25786565/pexels-photo-25786565.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/11866095/pexels-photo-11866095.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/5776631/pexels-photo-5776631.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb'],
    'Classic', 12, 8, 'Premium Stay',
    'Explore the best of Kashmir Paradise & Valley Highlights with our expertly crafted itineraries.',
    TRUE, TRUE, ARRAY['kashmir', 'snow', 'valleys', 'lakes'], india_id, jk_state,
    'Kashmir Paradise & Valley Highlights Packages | Tours & Travels | Mother India',
    'Book customized Kashmir Paradise & Valley Highlights packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['kashmir package', 'snow package', 'valleys package', 'lakes package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_kashmir_tour, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_kashmir_tour, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_kashmir_tour, hill_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_kashmir_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_kashmir_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Package: Kerala Backwaters & Hill Stations
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_kerala_tour, 'kerala-tour', 'Kerala Backwaters & Hill Stations',
    'Discover God''s Own Country. Glide through peaceful palm-fringed backwaters on a luxury houseboat in Alleppey, walk through the rolling misty tea estates of Munnar, explore the wildlife and spice gardens of Thekkady, and enjoy historic Cochin.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/12950219/pexels-photo-12950219.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32518360/pexels-photo-32518360.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36998153/pexels-photo-36998153.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/34588372/pexels-photo-34588372.jpeg?auto=compress&cs=tinysrgb'],
    'Classic', 12, 8, 'Premium Stay',
    'Explore the best of Kerala Backwaters & Hill Stations with our expertly crafted itineraries.',
    TRUE, TRUE, ARRAY['kerala', 'backwaters', 'hills', 'ayurveda'], india_id, kerala_state,
    'Kerala Backwaters & Hill Stations Packages | Tours & Travels | Mother India',
    'Book customized Kerala Backwaters & Hill Stations packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['kerala package', 'backwaters package', 'hills package', 'ayurveda package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_kerala_tour, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_kerala_tour, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_kerala_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_kerala_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Package: Goa Beach Sunshine Getaway
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_goa_tour, 'goa-tour', 'Goa Beach Sunshine Getaway',
    'Relax on the golden sandy beaches of Goa. Swim in warm waters, participate in thrilling water sports, explore centuries-old Portuguese churches and heritage bungalows, and indulge in delicious local seafood curry and beach-shack nightlife.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/1604287/pexels-photo-1604287.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/27869489/pexels-photo-27869489.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/4429334/pexels-photo-4429334.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/8037061/pexels-photo-8037061.jpeg?auto=compress&cs=tinysrgb'],
    'Beach', 12, 8, 'Premium Stay',
    'Explore the best of Goa Beach Sunshine Getaway with our expertly crafted itineraries.',
    TRUE, TRUE, ARRAY['goa', 'beach', 'nightlife', 'heritage'], india_id, goa_state,
    'Goa Beach Sunshine Getaway Packages | Tours & Travels | Mother India',
    'Book customized Goa Beach Sunshine Getaway packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['goa package', 'beach package', 'nightlife package', 'heritage package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_goa_tour, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_goa_tour, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_goa_tour, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_goa_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_goa_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Package: Himachal Hills & Snowy Peaks
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_himachal_tour, 'himachal-tour', 'Himachal Hills & Snowy Peaks',
    'Journey through the majestic Western Himalayas. Explore the British-era colonial architecture on Mall Road in Shimla, enjoy river rafting and paragliding in Manali, and witness the scenic pine forests and snow-capped peaks of Kullu Valley.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37454902/pexels-photo-37454902.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32464426/pexels-photo-32464426.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/16889248/pexels-photo-16889248.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/14572763/pexels-photo-14572763.jpeg?auto=compress&cs=tinysrgb'],
    'Classic', 12, 8, 'Premium Stay',
    'Explore the best of Himachal Hills & Snowy Peaks with our expertly crafted itineraries.',
    TRUE, TRUE, ARRAY['himachal', 'snow', 'hills', 'adventure'], india_id, hp_state,
    'Himachal Hills & Snowy Peaks Packages | Tours & Travels | Mother India',
    'Book customized Himachal Hills & Snowy Peaks packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['himachal package', 'snow package', 'hills package', 'adventure package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_himachal_tour, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_himachal_tour, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_himachal_tour, hill_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_himachal_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_himachal_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Package: Uttarakhand Wilderness & Sacred Temples
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_uttarakhand_tour, 'uttarakhand-tour', 'Uttarakhand Wilderness & Sacred Temples',
    'Experience the spiritual energy and wild beauty of the Land of the Gods. Attend the magical Ganga Aarti in Haridwar, practice yoga on the banks of the Ganges in Rishikesh, spot tigers in Jim Corbett, and enjoy the lakes of Nainital.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb'],
    'Pilgrimage', 12, 8, 'Premium Stay',
    'Explore the best of Uttarakhand Wilderness & Sacred Temples with our expertly crafted itineraries.',
    TRUE, TRUE, ARRAY['uttarakhand', 'temples', 'wildlife', 'hills'], india_id, uk_state,
    'Uttarakhand Wilderness & Sacred Temples Packages | Tours & Travels | Mother India',
    'Book customized Uttarakhand Wilderness & Sacred Temples packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['uttarakhand package', 'temples package', 'wildlife package', 'hills package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_uttarakhand_tour, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_uttarakhand_tour, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_uttarakhand_tour, spirit_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_uttarakhand_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_uttarakhand_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Package: Sikkim & Darjeeling Himalayan Wonders
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_sikkim_tour, 'sikkim-tour', 'Sikkim & Darjeeling Himalayan Wonders',
    'Walk the majestic trails of the Eastern Himalayas. Watch a glorious sunrise over Mt. Kanchenjunga from Tiger Hill in Darjeeling, ride the heritage toy train, visit serene Buddhist monasteries in Gangtok, and explore scenic lakes in Pelling.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/14916663/pexels-photo-14916663.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/14916663/pexels-photo-14916663.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/6592571/pexels-photo-6592571.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/30733687/pexels-photo-30733687.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37866434/pexels-photo-37866434.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/2324780/pexels-photo-2324780.jpeg?auto=compress&cs=tinysrgb'],
    'Classic', 12, 8, 'Premium Stay',
    'Explore the best of Sikkim & Darjeeling Himalayan Wonders with our expertly crafted itineraries.',
    TRUE, TRUE, ARRAY['sikkim', 'himalayas', 'monasteries', 'tea'], india_id, sikkim_state,
    'Sikkim & Darjeeling Himalayan Wonders Packages | Tours & Travels | Mother India',
    'Book customized Sikkim & Darjeeling Himalayan Wonders packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['sikkim package', 'himalayas package', 'monasteries package', 'tea package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_sikkim_tour, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_sikkim_tour, hill_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_sikkim_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_sikkim_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Package: Nepal Himalayan Heights & Culture
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_nepal_tour, 'nepal-tour', 'Nepal Himalayan Heights & Culture',
    'Explore the land of the world''s highest mountains. Visit medieval temples and stupas in Kathmandu Valley, capture reflecting views of Annapurna peak in Pokhara''s Phewa Lake, and walk through the peaceful gardens of Lumbini, birthplace of Lord Buddha.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/28831413/pexels-photo-28831413.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/14725559/pexels-photo-14725559.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32343720/pexels-photo-32343720.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32343708/pexels-photo-32343708.jpeg?auto=compress&cs=tinysrgb'],
    'Adventure', 12, 8, 'Premium Stay',
    'Explore the best of Nepal Himalayan Heights & Culture with our expertly crafted itineraries.',
    TRUE, FALSE, ARRAY['nepal', 'himalayas', 'temples', 'trekking'], nepal_id, NULL,
    'Nepal Himalayan Heights & Culture Packages | Tours & Travels | Mother India',
    'Book customized Nepal Himalayan Heights & Culture packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['nepal package', 'himalayas package', 'temples package', 'trekking package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_nepal_tour, int_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_nepal_tour, adv_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_nepal_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_nepal_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Package: Ganges & Ramayana Spiritual Circuit
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_varanasi_ayodhya_tour, 'varanasi-ayodhya-tour', 'Ganges & Ramayana Spiritual Circuit',
    'Immerse yourself in India''s ancient spiritual traditions. Witness the magical evening Ganga Aarti on Varanasi''s holy ghats, explore the sacred birthplace of Lord Ram in Ayodhya, and bathe at the holy Sangam confluence in Prayagraj.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17869844/pexels-photo-17869844.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/8112552/pexels-photo-8112552.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36440702/pexels-photo-36440702.jpeg?auto=compress&cs=tinysrgb'],
    'Pilgrimage', 12, 8, 'Premium Stay',
    'Explore the best of Ganges & Ramayana Spiritual Circuit with our expertly crafted itineraries.',
    TRUE, TRUE, ARRAY['ganges', 'temples', 'spiritual', 'heritage'], india_id, up_state,
    'Ganges & Ramayana Spiritual Circuit Packages | Tours & Travels | Mother India',
    'Book customized Ganges & Ramayana Spiritual Circuit packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['ganges package', 'temples package', 'spiritual package', 'heritage package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_varanasi_ayodhya_tour, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_varanasi_ayodhya_tour, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_varanasi_ayodhya_tour, spirit_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_varanasi_ayodhya_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_varanasi_ayodhya_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Package: Golden Triangle Classic Tour (Delhi, Agra, Jaipur)
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_golden_triangle_tour, 'golden-triangle-tour', 'Golden Triangle Classic Tour (Delhi, Agra, Jaipur)',
    'India''s classic cultural introduction. Witness the Mughal grandeur of Red Fort and Qutub Minar in Delhi, look upon the timeless beauty of the Taj Mahal in Agra, and explore the majestic forts and pink palaces of royal Jaipur.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb'],
    'Heritage', 12, 8, 'Premium Stay',
    'Explore the best of Golden Triangle Classic Tour (Delhi, Agra, Jaipur) with our expertly crafted itineraries.',
    TRUE, TRUE, ARRAY['golden-triangle', 'taj-mahal', 'culture', 'palaces'], india_id, delhi_state,
    'Golden Triangle Classic Tour (Delhi, Agra, Jaipur) Packages | Tours & Travels | Mother India',
    'Book customized Golden Triangle Classic Tour (Delhi, Agra, Jaipur) packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['golden-triangle package', 'taj-mahal package', 'culture package', 'palaces package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_golden_triangle_tour, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_golden_triangle_tour, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_golden_triangle_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_golden_triangle_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Package: Royal Rajasthan Forts & Desert Safari
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_rajasthan_tour, 'rajasthan-tour', 'Royal Rajasthan Forts & Desert Safari',
    'Step into the land of Rajput kings. Visit massive fortresses rising above cities, stay in grand heritage palaces, witness folk music and dance performances, and ride camels across the golden sand dunes of Jaisalmer.',
    ARRAY['Complete guided sightseeing tour', 'Comfortable transfers in private AC vehicle', 'Handpicked premium stays with breakfast', 'Scenic routes and major attractions covered'],
    ARRAY['Accommodation in 3/4-star properties', 'Daily Breakfast', 'All transfers & sightseeing by private AC car', 'Toll taxes, driver allowances, and parking fees'],
    ARRAY['Airfare/Train tickets', 'Monument entrance tickets', 'Lunch & Dinner unless specified', 'Personal expenses (tips, laundry, phone bills)'],
    ARRAY['Package is fully customizable as per requirements', 'Itinerary is subject to change based on weather or local factors'],
    'https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb',
    ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb'],
    'Heritage', 12, 8, 'Premium Stay',
    'Explore the best of Royal Rajasthan Forts & Desert Safari with our expertly crafted itineraries.',
    TRUE, TRUE, ARRAY['rajasthan', 'forts', 'desert', 'palaces'], india_id, raj_state,
    'Royal Rajasthan Forts & Desert Safari Packages | Tours & Travels | Mother India',
    'Book customized Royal Rajasthan Forts & Desert Safari packages with Mother India. Enjoy premium stays, scenic transfers, and local guiding. Inquire now!',
    ARRAY['rajasthan package', 'forts package', 'desert package', 'palaces package'], NOW(), NOW(), NOW()
  );

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_rajasthan_tour, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_rajasthan_tour, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_rajasthan_tour, fam_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_rajasthan_tour, honey_cat) ON CONFLICT DO NOTHING;

  -- Insert Package Variants, Itineraries, and Destination Mappings
  -- Variant: 6 Nights / 7 Days Andaman Relaxing Tour (File: Andaman-relaxing-tour-for-06-Night-07-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_andaman_tour_6n_7d, pkg_andaman_tour, '6n-7d', '6 Nights / 7 Days Andaman Relaxing Tour', 6, 7, '6 Nights / 7 Days',
    NULL, NULL, 1, FALSE, 'https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/29175703/pexels-photo-29175703.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37949152/pexels-photo-37949152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37950306/pexels-photo-37950306.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_andaman_tour_6n_7d, dest_port_blair, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_andaman_tour_6n_7d, dest_havelock_island, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_andaman_tour_6n_7d, dest_neil_island, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_andaman_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_port_blair
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_andaman_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_havelock_island
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_andaman_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_neil_island
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_6n_7d, 1, 'ARRIVAL – PORT BLAIR – CELLULAR JAIL – LIGHT & SOUND SHOW Arrival to Port Blair', '. Meet our representative, who will assist you to transfer you to the hotel. First half of the day is at leisure. Later in the afternoon visit Carbyn Cove Beach and Cellular jail followed by light and sound show. The Cellular Jail was the pilgrimage destination for freedom fighters. Many freedom fighters spent time here during the freedom struggle against the British Government. The day draws to a gentle close with the Sound and Light Show at the historic Cellular Jail which gives you a vivid experience of its strong association with the freedom fighters and their struggle. Come back to the hotel for overnight stay.', ARRAY['https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_6n_7d, 2, 'PORT BLAIR – NORTH BAY (CORAL ISLAND) – ROSS ISLAND Today after breakfast embark on a day-long three island cruise', '. One of the most sought after activities. It covers a panorama of seven harbors that include the North Bay and Ross island. It leaves a lasting impression. Ross Island. Was the administrative headquarters of the British. This island is now under the Indian Navy. You can also visit a museum named Smritika, it holds photographs and the other antiques of the Britishers relevant to these islands. The island is famous for friendly flocks of Deer and lush green walking trails. North Bay, the water lovers may enjoy snorkeling or take a glass bottom boat ride (Optional on direct payment) in its shallow waters with a chance to see corals up close. Return to the hotel. Dinner and stay overnight at the Hotel.', ARRAY['https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_6n_7d, 3, 'PORT BLAIR – HAVELOCK Today after breakfast depart to Havelock by boat', '. Havelock is one of the famous Island in Andaman region. Its about 54 kilometers northeast of Port Blair, the Island is a hidden jewel. It is famous for the water sports activities. Arrive at Havelock Jetty, you are met and assisted by our representative. Board the waiting vehicles and drive to the hotel. Check in at the hotel. Dinner and stay overnight at the Hotel.', ARRAY['https://images.pexels.com/photos/29175703/pexels-photo-29175703.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_6n_7d, 4, 'HAVELOCK – RADHANAGAR BEACH (OR BEACH NO', '. 7) Today after breakfast, proceed for Radhanagar Beach (or Beach No. 7) is the jewel in the crown of Havelock Island. It is rated one of the top ranked beaches by many travelers. Located on the western side of the island, it stands away from the cluster. There is no mean of visiting Havelock Island without visiting Radha Nagar Beach. It provides scenic view to its visitors. Dinner and stay overnight at the Hotel', ARRAY['https://images.pexels.com/photos/37949152/pexels-photo-37949152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_6n_7d, 5, 'HAVELOCK – Neil Island Day at Leisure for individual activities', '. OPTIONAL ELEPHANTA BEACH Proceed for snorkeling at Elephant beach. Elephant Beach is small can be reached by boat. The beach is also an extremely good place for snorkeling with an easily accessible house reef, which boasts of beautiful corals and other marine life. The beach has also emerged as Havelock’s favorite spot for scuba diving. It is tailor made to be a beginners dive site.', ARRAY['https://images.pexels.com/photos/37950306/pexels-photo-37950306.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_6n_7d, 6, 'Neil Island to Port Blair In the evening visit the Chidiyatapu,return back to your resort have Dinner and stay overnight at the Hotel', '.', ARRAY['https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_6n_7d, 7, 'DEPART FROM PORT BLAIR After breakfast at the hotel, transfer to the Port Blair airport to board the flight for onward destination', '.', ARRAY['https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Cochin, Munnar, Thekkady & Alleppey Tour (File: Cochin - Munnar - Thekkady - Alleppey.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_kerala_tour_5n_6d, pkg_kerala_tour, '5n-6d', '5 Nights / 6 Days Cochin, Munnar, Thekkady & Alleppey Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 2, TRUE, 'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/12950219/pexels-photo-12950219.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32518360/pexels-photo-32518360.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36998153/pexels-photo-36998153.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/34588372/pexels-photo-34588372.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_5n_6d, dest_munnar, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_5n_6d, dest_thekkady, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_5n_6d, dest_alleppey, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_5n_6d, dest_cochin, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_munnar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_thekkady
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_alleppey
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_cochin
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_5n_6d, 1, 'Cochin to Munnar ( 140 kms 5 hrs', '. approx.) On arrival at Cochin, proceed for Munnar-India’s highest tea estate. On the way, you can enjoy the scenic beauty & the marvellous waterfalls, high mountains with the low flying clouds passing by. Check in at your hotel. Overnight at Munnar.', ARRAY['https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_5n_6d, 2, 'Munnar After breakfast, proceed for sightseeing in Munnar', '. Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY['https://images.pexels.com/photos/12950219/pexels-photo-12950219.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_5n_6d, 3, 'Munnar to Thekkady ( 140 kms', '. 4 hrs. approx.): After breakfast depart to Thekkady (Periyar Wild life Sanctuary). Check in your hotel. In the afternoon go for a boat ride (You have to take the ticket directly from the counter . It is subject to the availability) at Periyar Tiger reserve to view the wildlife in the sanctuary. The boat ride on the lake is a delightful way of spotting elephants and avifauna, for which the park is well known. Overnight at Thekkady.', ARRAY['https://images.pexels.com/photos/32518360/pexels-photo-32518360.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_5n_6d, 4, 'Thekkady to Alleppey ( 140 kms ) A/C Deluxe Houseboat After breakfast depart to Alleppey', '. Check in your House boat .. The boat will take you to the virgin Kerala backwater villages… to see the real life of Keralities. Overnight at House boat.', ARRAY['https://images.pexels.com/photos/36998153/pexels-photo-36998153.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_5n_6d, 5, 'Alleppey to Cochin ( 90 kms', '. 2 hrs. approx.) After breakfast, Proceed to Cochin & drop you at Cochin airport/ Rly. station with sweet memories.', ARRAY['https://images.pexels.com/photos/34588372/pexels-photo-34588372.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 3 Nights / 4 Days Cochin & Munnar Tour (File: Cochin-Munnar-Cochin.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_kerala_tour_3n_4d, pkg_kerala_tour, '3n-4d', '3 Nights / 4 Days Cochin & Munnar Tour', 3, 4, '3 Nights / 4 Days',
    NULL, NULL, 3, FALSE, 'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/12950219/pexels-photo-12950219.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32518360/pexels-photo-32518360.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36998153/pexels-photo-36998153.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/34588372/pexels-photo-34588372.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_3n_4d, dest_munnar, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_3n_4d, dest_cochin, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_3n_4d, dest_goa, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_munnar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_cochin
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_goa
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_3n_4d, 1, 'Arrival at Cochin proceed to Munnar (130 Kms', '. 05 hrs. approx.): Munnar is 1800 mts above sea level and also the home of South India''s highest peak (anamudi-2695 mts). On the way to Munnar visit Valparai, Cheeyappara waterfalls and Tea Plantations. Upon arrival at Munnar & transfer to the Hotel. Check in at Hotel. Afternoon visit Rajamala (eravikulam National Park - open as per the directions by the forest authorities), the best place to see Nilgiri Tahr (hemitragus Hilarious)- the mountain goat of South India. You may visit the Tea Museum surrounded by Tea Gardens- the only Museum of its kind; which illustrates the timeworn method of Tea production. Evening have a short visit to Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY['https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_3n_4d, 2, 'Munnar After breakfast, proceed for sightseeing in Munnar', '. Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY['https://images.pexels.com/photos/12950219/pexels-photo-12950219.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_3n_4d, 3, 'Munnar to Cochin (130 kms', '. 5 hrs. approx.): Morning after breakfast transfer to Cochin, and drop you at Cochin airport/railway station.', ARRAY['https://images.pexels.com/photos/32518360/pexels-photo-32518360.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Charming Kashmir Tour (File: Days Charming Kashmir Tour.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_kashmir_tour_5n_6d, pkg_kashmir_tour, '5n-6d', '5 Nights / 6 Days Charming Kashmir Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 4, TRUE, 'https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/25786565/pexels-photo-25786565.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/11866095/pexels-photo-11866095.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/5776631/pexels-photo-5776631.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_5n_6d, dest_srinagar, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_5n_6d, dest_gulmarg, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_5n_6d, dest_pahalgam, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_5n_6d, dest_sonamarg, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_srinagar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_gulmarg
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_pahalgam
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_sonamarg
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_5n_6d, 1, 'Arrive Srinagar, Pickup and transfer to Houseboat', '. Rest of day Srinagar Sightseeing. Enjoy the site scene of the famous places Cheshma Shahi “Royal Spring” Shalimar “Garden of Love”Nishat Garden “Garden of Pleasure”On return visit a local Handicrafts Emporium for hand-knotted specialty silken carpets, shawls, jewelry ornaments. Overnight stay Houseboat.', ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_5n_6d, 2, 'SRINAGAR TO GULMARG - 52 Kms – 2 Hrs approx: After breakfast you will proceed for a full day excursion to Gulmarg, Meadow of Flowers(66kms / 2 hr) situated at an altitude of 2730 meters, full day at leisure to take the leisurely walks on the lush green meadows of flowers with a backdrop of the snow capped mountains', '. Enjoy a pony ride or Gondola ride (rope way at your own cost) to Khilanmarg at your own cost- Overnight in the Gulmarg.', ARRAY['https://images.pexels.com/photos/25786565/pexels-photo-25786565.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_5n_6d, 3, 'GULMARG TO PAHALGAM (154 Kms – 4 Hrs', '.) Morning after breakfast you will be transferred by road to Pahalgam Valley of Shepherds, Arrive and proceed to your hotel, rest of the day at leisure to explore the countryside and enjoy leisurely walks through the pine forest along the river Lidder, stay at Pahalgam. En- route you will have a rare opportunity to visit the Saffron fields and Avantipur Temple.', ARRAY['https://images.pexels.com/photos/11866095/pexels-photo-11866095.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_5n_6d, 4, 'PAHALGAM After breakfast you Proceed to Pahalgam sight for Aru valley and Chandanwari by car (at your own cost)', '. Aru is a small village, 11 kms upstream the Lidder River, is a beautiful locality. The route is picturesque with ample campsites. This village is the starting point for treks to the Kolahoi glacier. The most beautiful of these is the huge, undulating meadow of Baisaran,surrounded by thickly wooded forests of pine. Hajan and Beetab valley on the way to chandanwari.Overnight in the hotel.', ARRAY['https://images.pexels.com/photos/5776631/pexels-photo-5776631.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_5n_6d, 5, 'PAHALGAM TO SRINAGAR AND Enjoy Tulip Festival and other attractions After Breakfast drive Pahalgam to Srinagar and visit the amazing Tulip Festival', '. Once you reach the ethereal expanses, check-in to the houseboat. Once you relax, get ready to partake in the most charming Tulip Festival. Organized every year in April, Indira Gandhi Memorial Tulip Garden, situated in the foothills of the Zabarwan range in Srinagar, overlooking the Dal Lake, plays host to Asia & largest Tulip Flower Show. Also Visit to famous Mughal Gardens Chashma Shahi, Nishat, Shalimar & Shankaracharya Temple ..Overnight stay at Hotel.', ARRAY['https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_5n_6d, 6, 'SRINAGAR TO SONAMARG (96 Kms – 3 Hrs', '. approx.) After breakfast drive to Sonamarg ,Excursion to Sonmarg . The mountains around Sonamarg(90 kms/ 3 hr) is covered with several glaciers, one of the most famous being the Thajiwas Glacier. This scenic river of ice is set amidst lush meadows and foliage and is a three-km walk or pony ride,back stay at Srinagar. Overnight in the Hotel.', ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_5n_6d, 7, 'SRINAGAR DEPARTURE After breakfast drop at Srinagar airport to catch the flight for your onward Destinationend the Tour with Sweet Memories', '.', ARRAY['https://images.pexels.com/photos/25786565/pexels-photo-25786565.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 1 Night / 2 Days Delhi & Agra Tour (File: Delhi-Agra-Delhi-Tour-Package-for-02-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_1n_2d, pkg_golden_triangle_tour, '1n-2d', '1 Night / 2 Days Delhi & Agra Tour', 1, 2, '1 Nights / 2 Days',
    NULL, NULL, 5, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_1n_2d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_1n_2d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_1n_2d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_1n_2d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_1n_2d, 1, 'Pick up from airport/hotels/ railway stn', '. and proceed to Agra it will take 3/4 Hrs. and a guided tour to visit The Taj Mahal, Agra fort and overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_1n_2d, 2, 'After breakfast proceed to Delhi and a guided tour to visit Lotus Temple, Qutun minar, India Gate, President house and drop you at the airport/ hotels/railway stn', '. with sweet memories.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 2 Nights / 3 Days Delhi & Agra Tour (File: Delhi-Agra-Delhi-Tour-Package-for-03-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_2n_3d, pkg_golden_triangle_tour, '2n-3d', '2 Nights / 3 Days Delhi & Agra Tour', 2, 3, '2 Nights / 3 Days',
    NULL, NULL, 6, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_2n_3d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_2n_3d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_2n_3d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_2n_3d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_2n_3d, 1, 'Arrival at Delhi Airport/Railway station company representative assist you & proceed to Agra', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_2n_3d, 2, 'Today, After breakfast a guided tour to visit Taj Mahal & Agra fort & after lunch proceed to Delhi', '. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_2n_3d, 3, 'After breakfast, a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Humayun Tomb, Qutub Minar, & departure transfer to the airport/railway station', '.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Golden Triangle with Khajuraho Tour (File: Delhi-Agra-Jaipur-Khajuraho-Tour-package-for-06-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_5n_6d_khajuraho, pkg_golden_triangle_tour, '5n-6d-khajuraho', '5 Nights / 6 Days Golden Triangle with Khajuraho Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 7, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_khajuraho, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_khajuraho, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_khajuraho, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_khajuraho, dest_pushkar, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_khajuraho, dest_khajuraho, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_khajuraho, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_khajuraho, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_khajuraho, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_khajuraho, "id" FROM "Attraction" WHERE "destinationId" = dest_pushkar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_khajuraho, "id" FROM "Attraction" WHERE "destinationId" = dest_khajuraho
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_khajuraho, 1, 'Delhi: Arrival at Delhi Airport company representative assist you and transfer to the hotel', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_khajuraho, 2, 'Delhi to Agra (230 Kms', '. 3-4 Hrs.): Today after breakfast proceed to Agra & a guided tour to visit Taj Mahal, Agra. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_khajuraho, 3, 'Agra to Jaipur (260 Kms', '. 6 Hrs. Approx.): After breakfast drive to Jaipur En-Route visit Fatehpur Sikri . Overnight stay at the hotel Jaipur.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_khajuraho, 4, 'After breakfast, a guided tour to visit the ancient capital of Amber and visit beautiful Amber fort & proceed to the pink city Jaipur we will visit Water Palace, Hawa Mahal (Window Palace), Rajasthani handicraft', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_khajuraho, 5, 'Jaipur to Pushkar (150 Kms', '. 3 Hrs.): Today after breakfast, proceed to Pushkar, check in at the hotel & after refresh visit Brahma Temple, Pushkar Lake, City Walking tour & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_khajuraho, 6, 'Pushkar to Delhi (415 Kms', '. 7-8 Hrs. Approx.): Today after breakfast proceed to Delhi & stop for lunch (direct payment basis). Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_khajuraho, 7, 'After breakfast, a guided tour to visit Red fort, Jama masjid, India Gate, Lotus temple, Qutub minar & drop you at the Airport/Railway Station with sweet memories', '.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 7 Nights / 8 Days Golden Triangle with Khajuraho & Varanasi (File: Delhi-Agra-Jaipur-Khajuraho-Varanasi-Tour-package-for-08-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_7n_8d, pkg_golden_triangle_tour, '7n-8d', '7 Nights / 8 Days Golden Triangle with Khajuraho & Varanasi', 7, 8, '7 Nights / 8 Days',
    NULL, NULL, 8, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_7n_8d, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_7n_8d, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_7n_8d, dest_agra, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_7n_8d, dest_jaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_7n_8d, dest_khajuraho, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_7n_8d, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_7n_8d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_7n_8d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_7n_8d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_7n_8d, "id" FROM "Attraction" WHERE "destinationId" = dest_khajuraho
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d, 1, 'Arrival at Delhi Airport company representatives assisted you, and a guided tour to visit Qutub minar, Lotus temple, India gate President house, & overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d, 2, 'Delhi to Jaipur (260 Kms', '. approx. 6 Hrs.): After breakfast, proceed to Jaipur. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d, 3, 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), Rajasthani handicraft', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d, 4, 'Jaipur to Agra (260 Kms', '. approx. 6 Hrs. approx.): After breakfast, proceed to Agra, check in at the hotel, after refreshing a guided tour to visit Taj Mahal. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d, 5, 'Agra to Khajuraho (400 KM', '. Approx. 6-7 Hrs. Approx.): Today after breakfast, proceed to Khajuraho, En-Route visit Orchha & drive to Khajuraho & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d, 6, 'After breakfast proceed to visit Western temple, Jain temple & overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d, 7, 'Khajuraho to Varanasi (390 Kms', '. 7/8 Hrs. approx.): After breakfast, proceed to Varanasi & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d, 8, 'Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site', '.(River boating - direct payment basis) and back to hotel, After breakfast, proceed to visit Vishwanath temple, Sankat mochan temple, BHEU & drop you at Varanasi Airport/Railway station for your onward journey.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 8 Nights / 9 Days Golden Triangle with Khajuraho & Varanasi (File: Delhi-Agra-Jaipur-Khajuraho-Varanasi-Tour-package-for-09-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_8n_9d, pkg_golden_triangle_tour, '8n-9d', '8 Nights / 9 Days Golden Triangle with Khajuraho & Varanasi', 8, 9, '8 Nights / 9 Days',
    NULL, NULL, 9, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_8n_9d, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_8n_9d, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_8n_9d, dest_agra, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_8n_9d, dest_jaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_8n_9d, dest_khajuraho, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_8n_9d, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_8n_9d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_8n_9d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_8n_9d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_8n_9d, "id" FROM "Attraction" WHERE "destinationId" = dest_khajuraho
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_8n_9d, 1, 'Arrival at Delhi Airport company representatives assisted you, and proceed to hotel', '. overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_8n_9d, 2, 'After beakfast a guided tour to visit Red fort, Jama masjid, India gate, Qutub minar, Lotus temple, President house, & overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_8n_9d, 3, 'Delhi to Jaipur (260 Kms', '. approx. 6 Hrs.): After breakfast, proceed to Jaipur. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_8n_9d, 4, 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous block printing & Rajasthani handicraft work being done for centuries in Jaipur', '. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_8n_9d, 5, 'Jaipur to Agra (260 Kms', '. approx. 6 Hrs. approx.): After breakfast, proceed to Agra, check in at the hotel, after refreshing a guided tour to visit Taj Mahal. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_8n_9d, 6, 'Agra to Khajuraho (400 KM', '. Approx. 6-7 Hrs. Approx.): Today after breakfast, proceed to Khajuraho, En-Route visit Orchha & drive to Khajuraho & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_8n_9d, 7, 'After breakfast proceed to visit Western temple, Jain temple & overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_8n_9d, 8, 'Khajuraho to Varanasi (390 Kms', '. 7/8 Hrs. approx.): After breakfast, proceed to Varanasi & overnight stay at the hotel. OR drop at Khajuraho airport & arrival at Varanasi airport. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_8n_9d, 9, 'Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site', '.(River boating - direct payment basis) and back to hotel, After breakfast, proceed to visit Vishwanath temple, Sankat mochan temple, BHEU & drop you at Varanasi Airport/Railway station for your onward journey.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Golden Triangle Tour (File: Delhi-Agra-Jaipur-Tour-for-06-Days-tour-package.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_5n_6d, pkg_golden_triangle_tour, '5n-6d', '5 Nights / 6 Days Golden Triangle Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 10, TRUE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d, 1, 'Arrival at Delhi Airport company representative assist you and transfer to the hotel', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d, 2, 'Delhi sightseeing: Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d, 3, 'Delhi to Agra (250 KM', '. Approx. 3-4 Hrs. approx.): Today after breakfast, proceed to Agra and Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d, 4, 'Agra to Jaipur (260 Kms', '. approx. 6 Hrs.): Today early morning a guided tour to visit Taj Mahal on Sun Rise, and back to the hotel. After breakfast, proceed to visit Agra Fort and drive to Jaipur on the way to visit Fatehpur Sikri . Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d, 5, 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous block printing & Rajasthani handicraft work being done for centuries in Jaipur', '. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d, 6, 'Jaipur – Delhi (280 KM', '. Approx. 5-6 Hrs.): Today after breakfast, proceed to Delhi and drop you at the Airport/Railway station with sweet memories.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 3 Nights / 4 Days Golden Triangle Quick Tour (File: Delhi-Agra-Jaipur-Tour-package-for-04-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_3n_4d, pkg_golden_triangle_tour, '3n-4d', '3 Nights / 4 Days Golden Triangle Quick Tour', 3, 4, '3 Nights / 4 Days',
    NULL, NULL, 11, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_3n_4d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_3n_4d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_3n_4d, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_3n_4d, 1, 'Delhi to Agra (250 Kms', '. 3-4 Hrs. approx.): Early Arrival at Delhi Airport/railway station company representatives assisted you, and a guided tour to visit Qutub minar, Lotus temple, India gate & proceed to Agra & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_3n_4d, 2, 'Agra to Jaipur (250 KM', '. Approx. 3-4 Hrs. approx.): Early morning Sun rise time a guided tour to visit Taj Mahal, after breakfast, check out from the hotel & proceed to Jaipur En-Route stop to visit Fatehpur Sikri, Lunch on the way (direct payment basis). Overnight stay at the hotel Jaipur.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_3n_4d, 3, 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous block printing & Rajasthani handicraft work being done for centuries in Jaipur', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_3n_4d, 4, 'Jaipur to Delhi (280 KM', '. Approx. 5-6 Hrs.): Today after breakfast, proceed to Delhi and drop you at the Airport/Railway station with sweet memories.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 4 Nights / 5 Days Golden Triangle Classic Tour (File: Delhi-Agra-Jaipur-Tour-package-for-05-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_4n_5d, pkg_golden_triangle_tour, '4n-5d', '4 Nights / 5 Days Golden Triangle Classic Tour', 4, 5, '4 Nights / 5 Days',
    NULL, NULL, 12, TRUE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_4n_5d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_4n_5d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_4n_5d, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_4n_5d, 1, 'Arrival at Delhi Airport company representatives assisted you, and a guided tour to visit Qutub minar, Lotus temple, India gate President house, Humayun Tomb & overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_4n_5d, 2, 'Delhi to Agra (250 KM', '. Approx. 3-4 Hrs. approx.): Today after breakfast, proceed to Agra, check in at the hotel and after refresh a guided tour to visit The Taj Mahal & Agra fort. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_4n_5d, 3, 'Agra to Jaipur (260 Kms', '. approx. 6 Hrs.): After breakfast, proceed to Jaipur, En-Route stop to visit Fatehpur Sikri, Lunch on the way (direct payment basis). Overnight stay at the hotel Jaipur.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_4n_5d, 4, 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous block printing & Rajasthani handicraft work being done for centuries in Jaipur', '. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_4n_5d, 5, 'Jaipur to Delhi (280 KM', '. Approx. 5-6 Hrs.): Today after breakfast, proceed to Delhi and drop you at the Airport/Railway station with sweet memories.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Golden Triangle with Udaipur Tour (File: Delhi-Agra-Jaipur-Tour-package-for-06-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_5n_6d_udaipur, pkg_golden_triangle_tour, '5n-6d-udaipur', '5 Nights / 6 Days Golden Triangle with Udaipur Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 13, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_udaipur, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_udaipur, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_udaipur, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_udaipur, dest_udaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_udaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_udaipur, 1, 'Arrival at Delhi Airport company representatives assisted you, and a guided tour to visit Qutub minar, Lotus temple, India gate President house, Humayun Tomb & overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_udaipur, 2, 'Delhi to Agra (250 KM', '. Approx. 3-4 Hrs. approx.): Today after breakfast, proceed to Agra, check in at the hotel and after refresh a guided tour to visit The Taj Mahal & Agra fort. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_udaipur, 3, 'Agra to Jaipur (260 Kms', '. approx. 6 Hrs.): After breakfast, proceed to Jaipur, En-Route stop to visit Fatehpur Sikri, Lunch on the way (direct payment basis). Overnight stay at the hotel Jaipur.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_udaipur, 4, 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory Jantar Mantar Rajasthani handicraft work being done for centuries in Jaipur', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_udaipur, 5, 'Jaipur to Udaipur (400 KM', '. Approx. 6-7 Hrs. Approx.): Today after breakfast, proceed to Udaipur, En-Route visit Chittorgarh fort. Overnight stay at the hotel Udaipur.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_udaipur, 6, 'Udaipur sightseeing & dropping: After breakfast a guide tour to visit Jagdish temple, City palace, Princess garden and drop you at Udaipur airport/railway station', '.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 9 Nights / 10 Days Golden Triangle with Varanasi Tour (File: Delhi-Agra-Jaipur-Tour-with-Varanasi-10-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_9n_10d, pkg_golden_triangle_tour, '9n-10d', '9 Nights / 10 Days Golden Triangle with Varanasi Tour', 9, 10, '9 Nights / 10 Days',
    NULL, NULL, 14, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_9n_10d, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_9n_10d, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_9n_10d, dest_agra, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_9n_10d, dest_jaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_9n_10d, dest_khajuraho, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_khajuraho
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_9n_10d, 1, 'Arrival at Delhi Airport company representative assist you and transfer to the hotel', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_9n_10d, 2, 'Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_9n_10d, 3, 'Delhi to Jaipur(260 kms', '. 6 hrs. approx.): Today, after breakfast, proceed to Jaipur. Lunch on the way and overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_9n_10d, 4, 'Jaipur sightseeing: Today after breakfast, a guided tour to visit Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), Rajasthani handicraft', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_9n_10d, 5, 'Jaipur to Agra (260 kms', '. 6 hrs. approx.): Today after breakfast, proceed to Agra, a guided tour to visit the Tajmahal. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_9n_10d, 6, 'Agra to Khajuraho(400 kms', '. 9 hrs. approx.), Today after breakfast drive to Khajuraho En-Route visiting Orchha. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_9n_10d, 7, 'Khajuraho Sightseeing: After breakfast, proceed to visit the most famous Western Temple’s, Jain Temple, and city centre walk, Overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_9n_10d, 8, 'Khajuraho to Varanasi (400 kms', '. 9-10 hrs. approx.): After breakfast proceed to Varanasi & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_9n_10d, 9, 'Varanasi sightseeing: Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site', '. After breakfast, visit Vishwanath temple, Sankat mochan temple, BHEU & Sarnath. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_9n_10d, 10, 'Today after breakfast drop you at Varanasi Airport/Railway station for your onward journey', '.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 2 Nights / 3 Days Delhi, Agra & Mathura Tour (File: Delhi-Agra-Mathura-Tour-Package-for-03 Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_2n_3d_mathura, pkg_golden_triangle_tour, '2n-3d-mathura', '2 Nights / 3 Days Delhi, Agra & Mathura Tour', 2, 3, '2 Nights / 3 Days',
    NULL, NULL, 15, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_2n_3d_mathura, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_2n_3d_mathura, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_2n_3d_mathura, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_2n_3d_mathura, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_2n_3d_mathura, 1, 'Arrival at Delhi Airport/Railway station company representative assist you & proceed to Agra, En-Route visit Krishna Janmabhoomi Temple at Mathura and visit Prem Mandir, ISKCON Temple at Vrindavan', '. Overnight stay at the hotel Agra.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_2n_3d_mathura, 2, 'Agra to Delhi (250 Kms', '. 3-4 Hrs.): Today, After breakfast a guided tour to visit Taj Mahal & Agra fort & proceed to Delhi. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_2n_3d_mathura, 3, 'After breakfast, a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Humayun Tomb, Qutub Minar, & departure transfer to the airport/railway station', '.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 4 Nights / 5 Days Delhi-Corbett National Park Tour (File: Delhi-Corbett-National-Tiger-Century-04-Nights-05-Days-Tour.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_uttarakhand_tour_4n_5d, pkg_uttarakhand_tour, '4n-5d', '4 Nights / 5 Days Delhi-Corbett National Park Tour', 4, 5, '4 Nights / 5 Days',
    NULL, NULL, 16, TRUE, 'https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_4n_5d, dest_jim_corbett, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_4n_5d, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_jim_corbett
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_4n_5d, 1, 'Delhi: Arrival transfer at Delhi airport/railway station & proceed to hotel', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_4n_5d, 2, 'Delhi sightseeing: After breakfast sightseeing Old and New Delhi', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_4n_5d, 3, 'Delhi to Corbett (250 Kms', '. 6 Hrs.); After breakfast proceed to Corbett National Park. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_4n_5d, 4, 'Corbett : Tiger safari tour (Own Arrangement) & back to hotel after proceed local sightseeing', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_4n_5d, 5, 'Corbett to Delhi (250 Kms', '. 6 Hrs.): After breakfast proceed to Delhi and drop you at the Airport/Railway Station.', ARRAY['https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Delhi, Haridwar, Rishikesh & Agra Tour (File: Delhi-Haridwar-Rishikesh-Agra-Tour-package-for-06-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_5n_6d_haridwar, pkg_golden_triangle_tour, '5n-6d-haridwar', '5 Nights / 6 Days Delhi, Haridwar, Rishikesh & Agra Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 17, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_haridwar, dest_haridwar, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_haridwar, dest_rishikesh, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_haridwar, dest_delhi, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_haridwar, dest_agra, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_haridwar, "id" FROM "Attraction" WHERE "destinationId" = dest_haridwar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_haridwar, "id" FROM "Attraction" WHERE "destinationId" = dest_rishikesh
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_haridwar, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_haridwar, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_haridwar, 1, 'Arrival at Delhi Airport company representative assist you and transfer to the hotel', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_haridwar, 2, 'Delhi to Haridwar (260 KM', '. 5-6 Hrs. approx.): Today after breakfast, proceed to Haridwar, check in at the hotel, Evening Ganga Aarti at Har-Ki-Podi. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_haridwar, 3, 'After breakfast, proceed to Rishikesh & visit Lakshman jhula, Ram jhula, Triveni ghat & drive to Haridwar & vehicle drop/Pick you at Har-Ki-Podi for walking tour', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_haridwar, 4, 'Haridwar to Agra (260 Kms', '. 7/8 Hrs. Approx.): Today After breakfast, proceed to Agra & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_haridwar, 5, 'Agra to Delhi (250 Kms', '. 3/4 Hrs. Approx.): Today, after breakfast a guided tour to visit Taj Mahal & Agra fort & proceed to Delhi & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_haridwar, 6, 'After breakfast, proceed to visit Red fort, India gate, President house, Lotus temple, Qutub minar and drop you at the airport/railway station', '.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 3 Nights / 4 Days Haridwar, Rishikesh & Delhi Tour (File: Delhi-Haridwar-Rishikesh-Delhi-Tour-three-nights-four-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_uttarakhand_tour_3n_4d, pkg_uttarakhand_tour, '3n-4d', '3 Nights / 4 Days Haridwar, Rishikesh & Delhi Tour', 3, 4, '3 Nights / 4 Days',
    NULL, NULL, 18, FALSE, 'https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_3n_4d, dest_haridwar, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_3n_4d, dest_rishikesh, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_3n_4d, dest_delhi, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_haridwar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_rishikesh
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_3n_4d, 1, 'Delhi: Arrival Delhi & drop you hotel & after breakfast proceed to sightseeing Old and New Delhi', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_3n_4d, 2, 'Delhi to Haridwar (250 Kms', '. 6 Hrs.): After breakfast proceed to . Haridwar check in at the hotel & after refresh proceed to go Har-Ki-Podi for evening Ganga AArti. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_3n_4d, 3, 'After breakfast visit Laxman Jhula, Ram Jhula and Temples', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_3n_4d, 4, 'Haridwar to Delhi (250 Kms', '. 6 Hrs.): After breakfast proceed to Delhi and drop you at the Airport/Railway Station.', ARRAY['https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 11 Nights / 12 Days Golden Triangle with Khajuraho & Varanasi (File: Delhi-Jaipur-Agra-Khajuraho-Varanasi-Tour-For-12-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_11n_12d, pkg_golden_triangle_tour, '11n-12d', '11 Nights / 12 Days Golden Triangle with Khajuraho & Varanasi', 11, 12, '11 Nights / 12 Days',
    NULL, NULL, 19, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_11n_12d, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_11n_12d, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_11n_12d, dest_agra, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_11n_12d, dest_jaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_11n_12d, dest_khajuraho, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_khajuraho
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 1, 'Arrival at Delhi Airport company representative assist you and transfer to the hotel', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 2, 'Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Humayun tomb', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 3, 'Delhi to Jaipur (260 kms', '. 6 hrs. approx.): Today, after breakfast, proceed to Jaipur. Lunch on the way and overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 4, 'Jaipur sightseeing: Today after breakfast, a guided tour to visit Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & James & Stone cutting factory work being done for centuries in Jaipur', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 5, 'Jaipur – Agra VIA Fatehpur Sikri(260 kms', '. 6 hrs. approx.): Today after breakfast, proceed to Jaipur on the way to visit Fatehpur Sikri. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 6, 'Agra sightseeing: Today, a guided tour to visit Taj Mahal, Agra Fort , and visiting famous fine marble inlay work which is still being done in Agra', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 7, 'Agra to Khajuraho (400 kms', '. 8 hrs. approx.): Today after breakfast, proceed to Khajuraho. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 8, 'Khajuraho Sightseeing: After breakfast, proceed to visit the most famous Western Temple’s, Jain Temple, and city centre walk, Overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 9, 'Khajuraho to Varanasi (400 kms', '. 9 hrs. approx.): After breakfast proceed to Varanasi & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 10, 'Varanasi sightseeing: Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site', '. After breakfast, visit Vishwanath temple, Sankat mochan temple, BHEU & Sarnath. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 11, 'Today after breakfast drop you at Varanasi Airport/Railway & pick up at Delhi airport/railway station and overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_11n_12d, 12, 'After breakfast drop you at Delhi airport/railway station with sweet memories', '.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Delhi, Nainital & Corbett Tour (File: Delhi-Nainital-with-Corbett-National-Park-five-nights-six-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_uttarakhand_tour_5n_6d, pkg_uttarakhand_tour, '5n-6d', '5 Nights / 6 Days Delhi, Nainital & Corbett Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 20, TRUE, 'https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_5n_6d, dest_jim_corbett, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_5n_6d, dest_nainital, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_5n_6d, dest_delhi, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_jim_corbett
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_nainital
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_5n_6d, 1, 'Delhi: Arrival transfer & proceed to visit Old & New Delhi', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_5n_6d, 2, 'Delhi to Jim Corbett (250 Kms', '. 6 Hrs.): After breakfast proceed to Jim Corbett National Park. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_5n_6d, 3, 'Corbett: Tiger century by Jeep safari tour & back to hotel', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_5n_6d, 4, 'Corbett to Nainital (75 Kms', '. 2 Hrs.): After breakfast proceed to Nainital. Evening free for walking tour. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_5n_6d, 5, 'Nainital: After breakfast proceed to local sightseeing', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_5n_6d, 6, 'Nainital to Delhi (325 Kms', '. 7 Hrs.): After breakfast proceed to Delhi and drop you at the Airport/Railway Station.', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 7 Nights / 8 Days Golden Triangle with Shimla & Manali (File: Delhi-Shimla-Manali-Agra-Tour-package-for-08-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_7n_8d_shimla, pkg_golden_triangle_tour, '7n-8d-shimla', '7 Nights / 8 Days Golden Triangle with Shimla & Manali', 7, 8, '7 Nights / 8 Days',
    NULL, NULL, 21, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_7n_8d_shimla, dest_shimla, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_7n_8d_shimla, dest_manali, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_7n_8d_shimla, dest_delhi, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_7n_8d_shimla, dest_agra, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_7n_8d_shimla, "id" FROM "Attraction" WHERE "destinationId" = dest_shimla
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_7n_8d_shimla, "id" FROM "Attraction" WHERE "destinationId" = dest_manali
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_7n_8d_shimla, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_7n_8d_shimla, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d_shimla, 1, 'New Delhi to Shimla (360Kms 7/8 Hours Approx', '.); Upon arrival Morning at the Airport/ Railways station and drive towards Shimla. Shimla, a very popular holiday-retreat, is well-known for its Victorian architecture, which is reflected in certain areas of the Mall and The Ridge. Upon arrival at Shimla, Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d_shimla, 2, 'Shimla; After breakfast at the hotel, proceed for a half day excursion to Kufri (2500mts)', '. Kufri is also renowned for other adventure activities such as skiing, tobogganing (sliding downhill on a sled), etc. Kufri has the oldest skiing slopes in Himachal Pradesh. You can also take a hike or a Pony up to Mashu Peak. Afternoon: Guests will be dropped at the Shimla elivetore & explore by themselves. Attractions of the mall road include Shimla Church, Scandal Point, Gaiety Theater, Town hall, Jaku Temple & shopping. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d_shimla, 3, 'Shimla to Manali (272Kms 7/8 Hours Approx', '.) ; After breakfast at the hotel, depart for Manali. Drive past Beas-Sutlej Link project, Pandoh Dam & En-Rout halt Kullu Valley (Boat ride direct payment basi) - Lunch shall be en-route on direct payment basis. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d_shimla, 4, 'Manali : After Breakfast, Proceed for local sightseeing of Manali ( Day Trip )', '. Visit Solang Valley, You can opt for adventure sports like Paragliding, Zorbing, and Skiing (subject to snow & weather conditions) on a direct payment basis. Overnight at the hotel. (Optional tour costing Extra Atul Tunel, Sissu & Rohtang)', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d_shimla, 5, 'Manali : Sightseeing; After Breakfast, Proceed for local sightseeing of Manali', '. Visit Vashishtha Kund & Hadimba Temple, Tibetan Monastery & Mall Road, Van vihar. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d_shimla, 6, 'Manali to Delhi (550 Kms', './ 12-13 Hours Approx.) : After breakfast Proceed to Delhi & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d_shimla, 7, 'Delhi to Agra (250 Kms', './ 3-4 Hours Approx.) ; After breakfast Proceed to Agra a guided tour to visit Taj Mahal & Agra fort. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_7n_8d_shimla, 8, 'Agra to Delhi (250 Kms', './3-4 Hours Approx.): After breakfast proceed to Delhi and a guided tour to visit India gate, President house, Lotus temple, Qutub minar & drop you at airport/railway station with sweet memories.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 4 Nights / 5 Days Himalayan View Tour (File: Himalayan-Panorama-Tour-Package-for-05-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_nepal_tour_4n_5d, pkg_nepal_tour, '4n-5d', '4 Nights / 5 Days Himalayan View Tour', 4, 5, '4 Nights / 5 Days',
    NULL, NULL, 22, TRUE, 'https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/28831413/pexels-photo-28831413.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/14725559/pexels-photo-14725559.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32343720/pexels-photo-32343720.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32343708/pexels-photo-32343708.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_4n_5d, dest_kathmandu, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_4n_5d, dest_nagarkot, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_kathmandu
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_nagarkot
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_4n_5d, 1, 'Welcome to Nepal', '. Upon arrival at Tribhuvan International airport our representative will be waiting for you, and will take you to a pre- booked hotel. In the evening tour, Pasupatinatha and Boudhanatha Stupa. You can also join for sandhya arati. Back to hotel and Overnight in Kathmandu.', ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_4n_5d, 2, 'After breakfast, drive to Kathmandu Durbar square and Swayambhunath stupa for half day guided sightseeing tour, PM: visiting Boudhanath and Pashupatinath temple, Overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/28831413/pexels-photo-28831413.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_4n_5d, 3, 'Transfer to Nagarkot for Himalayan panorama tour, visit historical Newari town Bhaktapur on the way, which is as typical as early days O/N Resort', '.', ARRAY['https://images.pexels.com/photos/14725559/pexels-photo-14725559.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_4n_5d, 4, 'After the magnificent trip to Nagarkot, drive back to Kathmandu, rest of the day free for shopping and personal activities, O/N Hotel', '.', ARRAY['https://images.pexels.com/photos/32343720/pexels-photo-32343720.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_4n_5d, 5, 'Everest Mountain flight (optional) in the morning and transfer to the airport for your final departure or join our other program', '.', ARRAY['https://images.pexels.com/photos/32343708/pexels-photo-32343708.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Golden Triangle with Ranthambhore & Mandawa (File: India-holiday-tour-Delhi-Agra-Ranthambhore-Jaipur-Mandawa.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_5n_6d_mandawa, pkg_golden_triangle_tour, '5n-6d-mandawa', '5 Nights / 6 Days Golden Triangle with Ranthambhore & Mandawa', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 23, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_mandawa, dest_manali, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_mandawa, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_mandawa, dest_agra, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_mandawa, dest_jaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_5n_6d_mandawa, dest_mandawa, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_mandawa, "id" FROM "Attraction" WHERE "destinationId" = dest_manali
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_mandawa, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_mandawa, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_mandawa, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_5n_6d_mandawa, "id" FROM "Attraction" WHERE "destinationId" = dest_mandawa
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_mandawa, 1, 'Delhi – Manali: Pick up Volvo Coach from proceed Delhi to Manali in the evening', '.Overnight in the Bus.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_mandawa, 2, 'Manali Arrival(Half day local sightseeing: Arrive Manali in the morning , Check in to the hotel and after Breakfast & proceed to visit Hadimba Temple, Vashist Temple, Club House, Mall Road & Stay at hotel', '.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_mandawa, 3, 'Day trip to Rohtang, Solang Valley/Snow Point: Enjoy the morning breakfast at the hotel and later get ready for an excursion to visit Solang Valley', '.Solang Valley is outstandingly beautiful and is an ideal spot to view the majestic snow covered Himalayas, serene natural surrounding, pristine lake and fairy white snow round the year. After cover the sightseeing back to hotel. Stay in hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_mandawa, 4, 'Day trip to visit Manikaran Gurudwara, Kullu valley enjoy boat ride & back to hotel & stay', '. Day 05. Manali To Delhi Departure: Morning after breakfast, Check-out from hotel evening catch the Volvo from Manali to proceed Delhi. Overnight Journey.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_5n_6d_mandawa, 5, 'Delhi – Arrival at Delhi Bus stand Rama Krishna Ashram Metro Station', '. proceed for your onward destination….', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 6 Nights / 7 Days Golden Triangle with Ranthambore, Udaipur & Pushkar (File: India-holiday-tour-Delhi-Agra-Ranthambore-Udaipur-Pushkar-Jaipur-Delhi.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_6n_7d_udaipur, pkg_golden_triangle_tour, '6n-7d-udaipur', '6 Nights / 7 Days Golden Triangle with Ranthambore, Udaipur & Pushkar', 6, 7, '6 Nights / 7 Days',
    NULL, NULL, 24, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d_udaipur, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d_udaipur, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d_udaipur, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d_udaipur, dest_pushkar, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d_udaipur, dest_udaipur, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d_udaipur, dest_ranthambore, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d_udaipur, dest_mandawa, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_pushkar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_udaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_ranthambore
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d_udaipur, "id" FROM "Attraction" WHERE "destinationId" = dest_mandawa
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d_udaipur, 1, 'Arrival at Delhi Airport company representative assist you and transfer to the hotel', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d_udaipur, 2, 'Delhi – Agra, (250 KM', '. Approx 3 Hrs.) Today after breakfast visit Old & New Delhi visit Jama Masjid, Rajghat (Gandhi Cremation place), India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb, & After proceed to Agra. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d_udaipur, 3, 'Agra – Ranthambore VIA Fatehpur Sikri (300 KM', '. Approx 6 Hrs.) : Today, after breakfast check out from hotel & proceed to visit memory of Love The Taj Mahal & after visit Agra Fort and proceed to Ranthambore En-Rout visit Fatehpur Sikri. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d_udaipur, 4, 'Ranthambore – Jaipur (160 KM', '. Approx 4 Hrs.) : Today, Early morning proceed to Jungle Safari Tiger Century (Own Arrangement) & after come back to hotel & after breakfast proceed to Jaipur. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d_udaipur, 5, 'Jaipur Sightseeing : Today, after breakfast proceed to visit ancient capital of Amber', '. Visit beautiful Amber Fort after Amber Fort proceed to the pink city Jaipur we will visit Hawa Mahal(Window Palace), City Place and Observatory (Jantar Mantar) after visit famous block printing & James & Stone cutting factory work being done since centuries in Jaipur. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d_udaipur, 6, 'Jaipur – Mandawa (200 KM', '. Approx 4 Hrs.): Today, after breakfast proceed to Mandawa after check in walk around Mandawa it’s a small village in Shekhawati Region & visit beautiful painted old houses (Haveli’s) . Rest of the day at leisure. Day 07. Mandawa – Delhi (260 KM. Approx 6-7 Hrs.): Today, after breakfast proceed to Delhi & drop you at Delhi Airport/Railway Station for your onward journey.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 2 Nights / 3 Days Rishikesh & Haridwar Escape (File: India-holiday-tour-rishikesh-hridwar-two-nights-three-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_uttarakhand_tour_2n_3d, pkg_uttarakhand_tour, '2n-3d', '2 Nights / 3 Days Rishikesh & Haridwar Escape', 2, 3, '2 Nights / 3 Days',
    NULL, NULL, 25, FALSE, 'https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_2n_3d, dest_haridwar, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_2n_3d, dest_rishikesh, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_2n_3d, dest_delhi, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_2n_3d, "id" FROM "Attraction" WHERE "destinationId" = dest_haridwar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_2n_3d, "id" FROM "Attraction" WHERE "destinationId" = dest_rishikesh
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_2n_3d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_2n_3d, 1, 'Delhi to Haridwar, Today, Morning meet our driver at your Home | Hotel | Airport | Railway Station and transfer to Haridwar', '. Check in to the hotel at Arrival in Haridwar/Rishikesh. Afternoon visit Daksh Temple, Pawan Dham as well as Moti Bazar. Go To Har Ki Pauri for Ganga Aarti. Return to the hotel. Dinner and Night stay at the hotel.', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_2n_3d, 2, 'Sightseeing with Rishikesh: Morning you can take a divine dip in the river Ganga', '. Later on, returne to hotel. After breakfast visit Mansa Devi Temple (By cable car). Transfer to Rishikesh. Go to Triveni Ghat, Bharat Mandir, Lakshman Temple, Lakshman Jhula as well as Ram Jhula. Evening visit Ganga Aarti at Parmarth Niketan. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_2n_3d, 3, 'Haridwar To Delhi – Morning after breakfast, check out from the hotel', '. Go to Chandi Devi Temple (by cable car). Transfer to Delhi. Dropping at Delhi home/ hotel/ airport/ railway station.', ARRAY['https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Andaman Island Tour (File: Island-Tour-for-05-Night-06-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_andaman_tour_5n_6d, pkg_andaman_tour, '5n-6d', '5 Nights / 6 Days Andaman Island Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 26, TRUE, 'https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/29175703/pexels-photo-29175703.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37949152/pexels-photo-37949152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37950306/pexels-photo-37950306.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_andaman_tour_5n_6d, dest_port_blair, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_andaman_tour_5n_6d, dest_havelock_island, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_andaman_tour_5n_6d, dest_neil_island, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_andaman_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_port_blair
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_andaman_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_havelock_island
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_andaman_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_neil_island
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_5n_6d, 1, 'Port Blair: Arriving at Andaman’s at Port Blair Airport, Our representative will receive and escort you to the hotel', '. Check in to make yourself comfortable, After freshen Up proceed to the very first beach, the Corbyn’s Cove Beach for swimming and beach activity which is 10 km away from Port Blair City , Later proceed for In the evening, we go for light and sound show at Cellular Jail. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_5n_6d, 2, 'Havelock: The second day of your Andaman tour will start with a sumptuous breakfast in hotel’s main restaurant', '. After some leisure time, you will be transferred to Havelock Island in a cruise ferry. Upon reaching, you can have lunch and check-in to your hotel. After a while, you will be driven to your first stop in Havelock – Radhanagar Beach. This beach is so beautiful and serene that it was named ‘The best beach in Asia’ by Time in 2004. Enjoy your visit while exploring the beach. In the evening, you will be dropped back to your hotel for a nice night meal and comfortable stay.', ARRAY['https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_5n_6d, 3, 'Havelock: At Havelock Island – Lovely Elephanta Beach after breakfast in the hotel in the morning vehicle will pick you by 9:00 am to Havelock jetty for a boat ride to Elephanta beach Elephant beach is amazing and lovely beach rather long, the water is crystal clear water you can see fishes and other sea creatures while swimming, this place is famous for its beach sporting activities like…', '. *Scuba diving (extra charge) * Snorkeling,(included) . * Glass bottom – under water Coral (extra charge). Over all you will get a lovely experience in this beach. In the noon we reach back to the hotel where you can refresh and have your lunch In the evening you can have a walk to market or if you are staying in a beach property you can have a walk in the shore… Night stay @ Havelock.', ARRAY['https://images.pexels.com/photos/29175703/pexels-photo-29175703.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_5n_6d, 4, 'Neil Island: Start your day with a delicious breakfast in the hotel', '. After enjoying the food, it will be time for you to head to Neil Island. Extremely beautiful and tranquil, Neil will be welcomed treat for you with its chatter free environment and blue expanses of water. Enjoy a couple of hours resting or exploring the hotel after check-in. Post lunch, the Beach Safari will start with a trip to two of the most famous beaches of Andaman – Bharatpur Beach, Natural Bridge and Laxmanpur Beach. The peaceful atmosphere at Sitapur Beach, known for its Red Sand, would leave you spellbound. You will be driven back to the hotel in the evening. Have your dinner and spend a memorable night in Neil.', ARRAY['https://images.pexels.com/photos/37949152/pexels-photo-37949152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_5n_6d, 5, 'Port Blair: After a healthy breakfast in Neil, you will be transferred back to Port Blair', '.Towards afternoon, start for Chidiya Tapu which is south of Port Blair. Chidiya Tapu is one of the best places to watch the sunset in Port Blair.', ARRAY['https://images.pexels.com/photos/37950306/pexels-photo-37950306.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_5n_6d, 6, 'Departure: Airport drop time will vary as per your flight timings', '. After enjoying the beauty of exotic islands, mesmerizing beaches, unexploited nature and knowing our culture its now time for us to tell you good bye. We will be thankful for giving us the opportunity to serve you and will expect to serve you many more times in the future. Our representative will receive you from the Hotel and drop you at the Airport.', ARRAY['https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 3 Nights / 4 Days Nepal Cultural Tour (File: Nepal-Tour-Package-for-04-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_nepal_tour_3n_4d, pkg_nepal_tour, '3n-4d', '3 Nights / 4 Days Nepal Cultural Tour', 3, 4, '3 Nights / 4 Days',
    NULL, NULL, 27, FALSE, 'https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/28831413/pexels-photo-28831413.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/14725559/pexels-photo-14725559.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32343720/pexels-photo-32343720.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32343708/pexels-photo-32343708.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_3n_4d, dest_kathmandu, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_3n_4d, dest_nagarkot, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_kathmandu
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_nagarkot
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_3n_4d, 1, 'Arrival in Kathmandu: Upon arrival at Tribhuvan International Airport, you will receive a warm welcome and be transferred to your hotel in Kathmandu', '. After check-in, take some time to relax. In the In the evening, explore the vibrant streets of Thamel at your leisure. Overnight stay in Kathmandu.', ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_3n_4d, 2, 'Kathmandu Sightseeing Immerse yourself in Kathmandu’s rich cultural heritage with a full-day sightseeing tour', '. Start your day with visits to Pashupatinath Temple and Guheshwori Temple. Continue to Boudhanath Stupa, one of the largest stupas in the world. In the afternoon, explore Swayambhunath Stupa, also known as the Monkey Temple, before concluding the day at Kathmandu Durbar Square, a historic palace complex showcasing traditional Nepalese architecture. Overnight stay in Kathmandu.', ARRAY['https://images.pexels.com/photos/28831413/pexels-photo-28831413.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_3n_4d, 3, 'Nagarkot – Bhaktapur – Kathmandu Early Morning: Drive to Nagarkot, a hill station known for its breathtaking sunrise views over the Himalayas', '. On a clear day, you may even see Mount Everest. Morning: After breakfast, travel to Bhaktapur, an ancient city rich in history, culture, and traditional Newari heritage. Midday: Explore Bhaktapur Durbar Square, a UNESCO-listed heritage site renowned for its intricate architecture. Visit Nyatapola Temple, Bhairavnath Temple, and other historic landmarks adorned with exquisite wood and stone craftsmanship. Afternoon: Enjoy a traditional Nepali lunch at a local restaurant. Later, visit pottery and woodcraft workshops to witness skilled artisans preserving centuries-old techniques. Evening: Spend some leisure time strolling through Bhaktapur’s lively streets and shopping for souvenirs before returning to Kathmandu. Overnight stay in Kathmandu.', ARRAY['https://images.pexels.com/photos/14725559/pexels-photo-14725559.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_3n_4d, 4, 'Departure from Kathmandu After breakfast at your hotel, you will be transferred to Tribhuvan International Airport for your departure, carrying unforgettable memories of Nepal’s stunning landscapes, spiritual landmarks, and vibrant culture', '.', ARRAY['https://images.pexels.com/photos/32343720/pexels-photo-32343720.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 3 Nights / 4 Days Port Blair & Havelock Tour (File: Port-Blair-Havelock-Island-03-night-04-days-Tour.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_andaman_tour_3n_4d, pkg_andaman_tour, '3n-4d', '3 Nights / 4 Days Port Blair & Havelock Tour', 3, 4, '3 Nights / 4 Days',
    NULL, NULL, 28, FALSE, 'https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/29175703/pexels-photo-29175703.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37949152/pexels-photo-37949152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37950306/pexels-photo-37950306.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_andaman_tour_3n_4d, dest_port_blair, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_andaman_tour_3n_4d, dest_havelock_island, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_andaman_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_port_blair
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_andaman_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_havelock_island
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_3n_4d, 1, 'Arrival Port Blair Half Day Local Arriving at Andaman’s at Port Blair Airport, Our representative will receive and escort you to the hotel', '. Check in make yourself comfortable, After freshen Up proceed to the very first beach the Corbyn’s Cove Beach for swimming and beach activity which is 10 km away from Port Blair City , Later proceed for visit Chatham Saw Mill, Samudrika, Anthropological Museum, In the evening, we go for light and sound show at Cellular Jail. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7826585/pexels-photo-7826585.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_3n_4d, 2, 'Port Blair To Havelock Island At 0530 in the morning, we proceed to Havelock Island by Boat – 54 Kms from Port Blair by Sea', '. The journey takes 2 ½ hrs one way , After check in at hotel proceed for visiting world famous Radha Nagar beach , Return to hotel in the late evening. O/n stay at a hotel.', ARRAY['https://images.pexels.com/photos/27817216/pexels-photo-27817216.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_3n_4d, 3, 'Havelock Island To Port Blair Leisure At Havelock -Sightseeing to Elephanta Beach,', '. Experience a trilogy of yourself, sun , sand the sea like never before. Later You’ll explore one another beach, Leave Havelock Island at 2PM / 4 PM forPortblair by Boat. Arrive in the evening at 430 /630 PM and rest of the evening at leisure. Overnight stay at Portblair.', ARRAY['https://images.pexels.com/photos/29175703/pexels-photo-29175703.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_andaman_tour_3n_4d, 4, 'Departure from Port Blair Morning free for packing & personal activities', '. In time Check out from the hotel and transfer to Jetty or Airport. – Tour Ends .', ARRAY['https://images.pexels.com/photos/37949152/pexels-photo-37949152.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 9 Nights / 10 Days Forts & Palaces of Rajasthan (File: Rajasthan-Tour-Packages-for-10-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_rajasthan_tour_9n_10d, pkg_rajasthan_tour, '9n-10d', '9 Nights / 10 Days Forts & Palaces of Rajasthan', 9, 10, '9 Nights / 10 Days',
    NULL, NULL, 29, FALSE, 'https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d, dest_pushkar, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d, dest_udaipur, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d, dest_jodhpur, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d, dest_ranthambore, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_pushkar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_udaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_jodhpur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_ranthambore
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d, 1, 'Delhi: Arrival at Delhi Airport company representative assist you and transfer to the hotel', '.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d, 2, 'After breakfast, proceed to visit Jama Masjid, Red Fort, India Gate, President House, Humayun Temple, Lotus Temple, Qutub Minar', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d, 3, 'Delhi to Agra (240 Kms', '. 3 Hrs.): After breakfast drive to Agra & visit Taj Mahal, Agra Fort & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d, 4, 'Agra to Ranthambore (305 kms', '. 6/7 Hrs.): After breakfast, proceed to Ranthambore, En-Route visit Fatehpur sikri. Overnight stay at the hotel Ranthambore.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d, 5, 'Ranthambore to Udaipur (405 kms', '. 7/8 Hrs. approx.): Today after breakfast, proceed to Udaipur, En-Route visit ChittorGarh fort, Overnight stay at the hotel Udaipur.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d, 6, 'Day 08', '. Today after breakfast, proceed to Jagdish Temple, City palace, Saheliyo ki Baadi (Princess garden), boat ride at Lake pichola (Own Cost) and overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d, 7, 'Udaipur to Jodhpur (260 Kms', '. 5/6 Hrs. approx): Today after breakfast, proceed to Jodhpur & visit Jodhpur fort, Jaswant thada. Overnight stay at the hotel Jodhpur.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d, 8, 'Jodhpur to Jaipur (350 kms', '. 6/7 hrs. approx.): Today, after breakfast, proceed to Jaipur, En-Route visit Pushkar and after lunch proceed to Jaipur & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d, 9, 'Today after breakfast, a guided tour to visit the ancient capital of Amber, visited beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & Rajasthani handicraft', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d, 10, 'Jaipur to Delhi (260 Kms', '. 5/6 Hrs. approx.): Today after breakfast, proceed to Delhi & drop you at Delhi airport/railway station with sweet memories.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 10 Nights / 11 Days Rajasthan Heritage Explorer (File: Rajasthan-Tour-Packages-for-11-Days-Tour.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_rajasthan_tour_10n_11d, pkg_rajasthan_tour, '10n-11d', '10 Nights / 11 Days Rajasthan Heritage Explorer', 10, 11, '10 Nights / 11 Days',
    NULL, NULL, 30, FALSE, 'https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_10n_11d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_10n_11d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_10n_11d, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_10n_11d, dest_udaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_10n_11d, dest_jodhpur, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_10n_11d, dest_jaisalmer, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_10n_11d, dest_bikaner, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_udaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_jodhpur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaisalmer
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_bikaner
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 1, 'Arrival at Delhi Airport company representative assist you and transfer to the hotel', '. After refreshment a guided tour to visit Red fort, Jama Masjid, India gate, Qutub minar. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 2, 'Delhi to Agra (230 Kms', '. 3-4 Hrs. approx.): Today after breakfast proceed to Agra & a guide tour to visit Taj Mahal, Agra Fort, Marble handicrafts. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 3, 'Agra to Jaipur (260 Kms', '. 6 Hrs. Approx.): After breakfast drive to Jaipur & En-Route visit Fatehpur Sikri . Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 4, 'After breakfast, a guided tour to visit Amber fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous Rajasthani handicraft', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 5, 'Jaipur to Udaipur (400 Kms', '. 7/8 Hrs.): Today after breakfast, proceed to Udaipur & En-Route visit ChittorGarh fort, Overnight stay at hotel', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 6, 'After breakfast, a guided tour to visit City palace, Jagdish temple, Sahelion ki bari (Princess garden) & boat ride at Lake Pichola (direct payment basis)', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 7, 'Udaipur to Jodhpur (250 Kms', '. 6/7 Hrs. approx.): Today after breakfast proceed to Jodhpur & En-Route visit Ranakpur Jain Temple. Overnight stay at the hotel Jodhpur.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 8, 'Jodhpur to Jaisalmer (285 Kms', '. 5/6 Hrs. approx.) : After breakfast check out from the hotel & visit Jodhpur Fort, Jaswant Thada & drive to Jaisalmer. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 9, 'After breakfast check out from the hotel & proceed to visit Jaisalmer fort, Jain Temple, Patwon-ki-haveli & after lunch proceed to sand dunes village resort & enjoy Camel ride, Traditional Rajasthani folk dance', '. stay at a desert resort.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 10, 'Jaisalmer to Bikaner (325 Kms', '. 6/7 Hrs. approx.) : After breakfast check out & proceed to Bikaner visit Bikaner fort. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_10n_11d, 11, 'Bikaner to Delhi (440 Kms', '. 8/9 Hrs. approx.) : After breakfast check out & proceed to Delhi En-Route visit Old painted Havelis & drop you at Delhi airport/railway station with sweet memories.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 11 Nights / 12 Days Classic Rajasthan Desert Safari (File: Rajasthan-Tour-packages-for-12-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_rajasthan_tour_11n_12d, pkg_rajasthan_tour, '11n-12d', '11 Nights / 12 Days Classic Rajasthan Desert Safari', 11, 12, '11 Nights / 12 Days',
    NULL, NULL, 31, FALSE, 'https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_11n_12d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_11n_12d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_11n_12d, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_11n_12d, dest_udaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_11n_12d, dest_jodhpur, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_11n_12d, dest_jaisalmer, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_11n_12d, dest_bikaner, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_udaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_jodhpur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaisalmer
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_11n_12d, "id" FROM "Attraction" WHERE "destinationId" = dest_bikaner
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 1, 'Delhi: Arrival at Delhi Airport company representative assist you and transfer to the hotel', '.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 2, 'After breakfast, proceed to visit Jama Masjid, Red Fort, India Gate, President House, Humayun Temple, Lotus Temple, Qutub Minar', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 3, 'Delhi to Agra (240 Kms', '. 3 Hrs.): After breakfast drive to Agra & visit Taj Mahal, Agra Fort & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 4, 'Agra to Jaipur (260 KM', '. Approx. 6 Hrs.): Today after breakfast, proceed to Jaipur, En-Route visit Fatehpur Sikri, Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 5, 'Today after breakfast, a guided tour to visit the ancient capital of Amber, visited beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & Rajasthani handicraft', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 6, 'Jaipur to Udaipur (400 Kms', '. 6/7 Hrs. approx.): Today after breakfast, proceed to Udaipur on the way to visit Chittogarh fort. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 7, 'Today after breakfast, proceed to Jagdish Temple, City palace, Saheliyo ki Baadi (Princess garden), boat ride at Lake pichola (Own Cost) and overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 8, 'Udaipur to Jodhpur (260 Kms', '. 5/6 Hrs. approx): Today after breakfast, proceed to Jodhpur & En-Route visit Ranakpur Jain temple. Overnight stay at the hotel Jodhpur.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 9, 'Jodhpur to Jaisalmer (280 kms', '. 5/6 hrs. approx.): Today, after breakfast, proceed to visit Jodhpur fort, Jaswant thada & proceed to Jaisalmer & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 10, 'After breakfast check out from the hotel & proceed to visit Jaisalmer fort, Jain Temple, Patwon-ki-haveli & after lunch we proceed to sand dunes village resort & enjoy Camel ride, Traditional Rajasthani folk dance', '. stay at a desert resort.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 11, 'Jaisalmer to Bikaner (330 kms', '. 5/6 Hrs. approx): After breakfast, proceed to Bikaner and visit Bikaner fort & stay at the hotel.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_11n_12d, 12, 'Bikaner to Delhi (450 kms', '. 8/9 Hrs. approx.): After breakfast, proceed to Delhi & drop you at Airport/Railway station for onward journey.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 13 Nights / 14 Days Grand Rajasthan Tour (File: Rajasthan-Tour-packages-for-14-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_rajasthan_tour_13n_14d, pkg_rajasthan_tour, '13n-14d', '13 Nights / 14 Days Grand Rajasthan Tour', 13, 14, '13 Nights / 14 Days',
    NULL, NULL, 32, FALSE, 'https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_13n_14d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_13n_14d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_13n_14d, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_13n_14d, dest_pushkar, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_13n_14d, dest_udaipur, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_13n_14d, dest_jodhpur, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_13n_14d, dest_jaisalmer, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_13n_14d, dest_bikaner, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_13n_14d, dest_mandawa, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_13n_14d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_13n_14d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_13n_14d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_13n_14d, "id" FROM "Attraction" WHERE "destinationId" = dest_pushkar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_13n_14d, "id" FROM "Attraction" WHERE "destinationId" = dest_udaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_13n_14d, "id" FROM "Attraction" WHERE "destinationId" = dest_jodhpur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_13n_14d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaisalmer
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_13n_14d, "id" FROM "Attraction" WHERE "destinationId" = dest_bikaner
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_13n_14d, "id" FROM "Attraction" WHERE "destinationId" = dest_mandawa
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 1, 'Delhi: Arrival at Delhi Airport company representative assist you and transfer to the hotel', '.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 2, 'After breakfast, proceed to visit Jama Masjid, Red Fort, India Gate, President House, Humayun Temple, Lotus Temple, Qutub Minar', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 3, 'Delhi to Agra (240 Kms', '. 3 Hrs.): After breakfast drive to Agra & visit Taj Mahal, Agra Fort & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 4, 'Agra to Jaipur (260 KM', '. Approx. 6 Hrs.): Today after breakfast, proceed to Jaipur, En-Route visit Fatehpur Sikri, Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 5, 'Today after breakfast, a guided tour to visit the ancient capital of Amber, visited beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & Rajasthani handicraft', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 6, 'Jaipur to Pushkar (150 Kms', '. 3 Hrs. approx.): Today after breakfast, proceed to Pushkar check in at the hotel & after refreshment proceed to visit Brahma temple, Pushkar lake, and evening aarti for sun set. Overnight Stay at hotel.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 7, 'Pushkar to Udaipur (300 Kms', '. 5/6 Hrs. approx.): Today after breakfast, proceed to Udaipur on the way to visit Chittogarh fort. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 8, 'Today after breakfast, proceed to Jagdish Temple, City palace, Saheliyo ki Baadi (Princess garden), boat ride at Lake pichola (Own Cost) and overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 9, 'Udaipur to Jodhpur (260 Kms', '. 5/6 Hrs.): Today after breakfast, proceed to Jodhpur & En-Route visit Ranakpur Jain temple. Overnight stay at the hotel Jodhpur.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 10, 'Today, after breakfast, proceed to visit Jodhpur fort & Jaswant thada, proceed to Jaisalmer & stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 11, 'After breakfast check out from the hotel & proceed to visit Jaisalmer fort, Jain Temple, Patwon-ki-haveli & after lunch we proceed to sand dunes village resort & enjoy Camel ride, Traditional Rajasthani folk dance', '. stay at a desert resort.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 12, 'Jaisalmer to Bikaner (330 kms', '. 5/6 Hrs. approx): After breakfast, proceed to Bikaner and visit Bikaner fort & stay at the hotel.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 13, 'Bikaner to Mandawa (200 kms', '. 3/4 Hrs. approx.): After breakfast, proceed to Mandawa, check in at the hotel & visit old painted havelis and walkin tour. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_13n_14d, 14, 'Mandawa to Delhi (250 kms', '. 5/6 Hrs. approx.): After breakfast, proceed to Delhi & drop you at Airport/Railway station for onward journey.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 14 Nights / 15 Days Complete Rajasthan Royal Journey (File: Rajasthan-Tour-packages-for-15-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_rajasthan_tour_14n_15d, pkg_rajasthan_tour, '14n-15d', '14 Nights / 15 Days Complete Rajasthan Royal Journey', 14, 15, '14 Nights / 15 Days',
    NULL, NULL, 33, FALSE, 'https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_14n_15d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_14n_15d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_14n_15d, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_14n_15d, dest_pushkar, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_14n_15d, dest_udaipur, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_14n_15d, dest_jodhpur, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_14n_15d, dest_jaisalmer, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_14n_15d, dest_bikaner, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_14n_15d, dest_mandawa, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_14n_15d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_14n_15d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_14n_15d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_14n_15d, "id" FROM "Attraction" WHERE "destinationId" = dest_pushkar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_14n_15d, "id" FROM "Attraction" WHERE "destinationId" = dest_udaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_14n_15d, "id" FROM "Attraction" WHERE "destinationId" = dest_jodhpur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_14n_15d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaisalmer
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_14n_15d, "id" FROM "Attraction" WHERE "destinationId" = dest_bikaner
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_14n_15d, "id" FROM "Attraction" WHERE "destinationId" = dest_mandawa
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 1, 'Delhi: Arrival at Delhi Airport company representative assist you and transfer to the hotel', '. After breakfast a guided tour to visit Red fort, Jama masjid, India gate, President house, Lotus temple, overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 2, 'Delhi to Agra (230 Kms', '. 3 Hrs. approx.): Today after breakfast proceed to Agra, check in at the hotel & after refreshment a guided tour to visit Taj Mahal, Agra Fort. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 3, 'After breakfast, proceed to visit Taj Mahal 7 famous marble factory/Handicraft', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 4, 'Agra to Jaipur (260 Kms', '. 6 Hrs. approx.): After breakfast drive to Jaipur and stop for a guided tour to visit Fatehpur Sikri. Overnight stay at the hote', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 5, 'After breakfast a guided tour to visit Amber Fort', '. After Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and after visit famous Rajasthani handicraft. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 6, 'Jaipur to Pushkar ( 150 Kms', '. 3 Hrs. approx.): After breakfast proceed to Pushkar & after check in at the hotel and after refresh proceed to visit Brahma Temple, Pushkar lake, Pushkar fair ground & walking tour. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 7, 'Udaipur (250 Kms', '. 6 Hrs. approx.): Today after breakfast, drive to Udaipur, En-Route visit ChittorGarh fort,. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 8, 'After breakfast visit Udaipur City palace, Jagdish temple, Sahelion ki bari(Princess garden) & boat ride at Lake Pichola', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 9, 'Udaipur to Jodhpur (250 Kms', '. 7 Hrs. approx.): Today after breakfast proceed to Jodhpur En-Route visit Ranakpur Jain Temple. overnight stay at the hotel Jodhpur.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 10, 'After breakfast proceed to visit Jodhpur Fort, Jaswant Thada & Old city walking tour', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 11, 'Jodhpur to Jaisalmer (285 Kms', '. 6 Hrs. Approx.): After breakfast check out from the hotel and proceed to Jaisalmer (Golden city). Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 12, 'Jaisalmer: After breakfast check out from the hotel & proceed to visit Jaisalmer fort, Jain Temple, Patwon-ki-haveli & after lunch we proceed to sand dunes village resort & enjoy Camel ride, Traditional Rajasthani folk dance', '. stay at a desert resort.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 13, 'Jaisalmer to Bikaner (325 Kms', '. 6 Hrs. approx.): After breakfast check out & proceed to Bikaner visit Bikaner fort & check in at the hotel after refresh proceed to visit world famous Deshnok Temple (Ret Temple). Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 14, 'Bikaner to Mandawa (200 Kms', '. 3 Hrs. approx.)) After breakfast, proceed to Mandawa En-Route to visit Old painted havelis, check in hotel & evening walking tour to visit the Old painted havelis. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_14n_15d, 15, 'Mandawa – Delhi (280 Kms', '. 6/7 Hrs. approx.): After breakfast check out & proceed to Delhi En-Route visit Old painted Havelis & drop you at Delhi airport/railway station with sweet memories.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 20 Nights / 21 Days Rajasthan, Taj Mahal & Ganges Tour (File: Rajasthan-Tour-with-Delhi-Agra-Khajuraho-Varanasi-Tour-20-Nights-21-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_rajasthan_tour_20n_21d, pkg_rajasthan_tour, '20n-21d', '20 Nights / 21 Days Rajasthan, Taj Mahal & Ganges Tour', 20, 21, '20 Nights / 21 Days',
    NULL, NULL, 34, FALSE, 'https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_agra, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_jaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_pushkar, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_udaipur, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_jodhpur, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_jaisalmer, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_bikaner, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_mandawa, 10) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_20n_21d, dest_khajuraho, 11) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_pushkar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_udaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_jodhpur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaisalmer
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_bikaner
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_mandawa
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_20n_21d, "id" FROM "Attraction" WHERE "destinationId" = dest_khajuraho
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 1, 'Arrival at Delhi Airport company representative assist you and transfer to the hotel', '.Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 2, 'Delhi sightseeing: Today after breakfast, a guided tour to visit Jama Masjid, Red Fort, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb, Rest of the day at leisure', '.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 3, 'Delhi – Mandawa (260 Kms', '. 6 Hrs. approx.): Today, after breakfast, drive to Mandawa & checked in at the hotel. Evening a guided walking tour to visit old painted houses (Havelis). Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 4, 'Mandawa – Bikaner (200 kms', '. 4 hrs.): Today after breakfast, proceed to Bikaner and visit Bikaner Fort (JunaGarh Fort). After checking in the hotel Proceed to visit Deshnok Temple. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 5, 'Bikaner – Jaisalmer(340 kms', '. 6 hrs. approx.): Today after breakfast proceed to Jaisalmer. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 6, 'Today after breakfast check out from the hotel and visit Jaisalmer fort, Patwon-ki haveli and after lunch, proceed to Khuri/Sam (SanDunes Desert Village) and enjoy village and dunes sun set point by camel ride and back to desert camp, Rajasthani Folk Dance , Dinner', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 7, 'Khuri – Jodhpur (270 kms', '. 6 hrs. approx.): Today after breakfast proceed to Jodhpur. Visit Jodhpur Fort Mehrangarh and Jaswant Thada. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 8, 'Jodhpur – Ranakpur (200 kms', '. 3 hrs. approx.): Today after breakfast, proceed to Ranakpur & visit Ranakpur Jain Temple. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 9, 'Ranakpur – Udaipur (100 kms', '. 3 hrs. approx.): Today after breakfast proceed to Udaipur. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 10, 'Udaipur sightseeing: Today after breakfast, proceed to visit Jagdish Temple, City Palace, Princes Garden (Sahelio Ki Badi), and Boat Ride', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 11, 'Udaipur – Pushkar(280 kms', '. 6 hrs. approx.): Today after breakfast proceed to Pushkar Hindu holy city. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 12, 'Pushkar – Jaipur (150 kms', '. 3 hrs. approx.): Today after breakfast Visit Brahma Temple, Camel Fare Ground and proceed to Jaipur. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 13, 'Jaipur sightseeing: Today after breakfast, a guided tour to visit the ancient capital of Amer', '. Visit the beautiful Amer Fort, Hawa Mahal(Window Palace), City Place and Observatory(Jantar Mantar), visiting famous block printing & James & Stone cutting factory work being done for centuries in Jaipur. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 14, 'Jaipur – Agra VIA Fatehpur Sikri(260 kms', '. 6 hrs. approx.): Today after breakfast proceed to Jaipur on the way to Fatehpur Sikri.Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 15, 'Agra sightseeing: Today, a guided tour to visit Taj Mahal, Agra Fort , and visiting famous fine marble inlay work which is still being done in Agra', '. Rest of the day at leisure .', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 16, 'Agra – Orchha(260 kms', '. 6 hrs. approx.): Today after breakfast proceed to Orchha and visit Orchcha fort & free for walking tour. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 17, 'Orchha – Khajuraho(180 kms', '. 4 hrs. approx.): Today after breakfast proceed to Khajuraho. Checkin at the hotel and after refresh visit Western temple and Jain temple. Rest of the at leisure.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 18, 'Khajuraho – Varanasi(400 kms', '. 9 hrs. approx.): Today, after breakfast drive to Varanasi. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 19, 'Varanasi sightseeing: Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site', '. After breakfast, visit Vishwanath temple, Sankat mochan temple, BHEU & Sarnath. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 20, 'Today after breakfast drop you at Varanasi Airport/Railway station and pickup at Delhi rest of the day leisure for your onward journey', '.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_20n_21d, 21, 'After breakfast departure transfer to Delhi Airport/Railway station with sweet meomeries', '.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 9 Nights / 10 Days Rajasthan with Khajuraho & Varanasi (File: Rajasthan-Tour-with-Khajuraho-and-Varanasi-for-10-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_rajasthan_tour_9n_10d_khajuraho, pkg_rajasthan_tour, '9n-10d-khajuraho', '9 Nights / 10 Days Rajasthan with Khajuraho & Varanasi', 9, 10, '9 Nights / 10 Days',
    NULL, NULL, 35, FALSE, 'https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d_khajuraho, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d_khajuraho, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d_khajuraho, dest_agra, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d_khajuraho, dest_jaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_rajasthan_tour_9n_10d_khajuraho, dest_khajuraho, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d_khajuraho, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d_khajuraho, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d_khajuraho, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d_khajuraho, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_rajasthan_tour_9n_10d_khajuraho, "id" FROM "Attraction" WHERE "destinationId" = dest_khajuraho
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d_khajuraho, 1, 'Delhi: Arrival at Delhi Airport company representatives assist you and transfer to the hotel after refresh proceed a guided tour to visit Red fort, Jama masjid, India gate, President house, Lotus temple, overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d_khajuraho, 2, 'Delhi to Jaipur ( 260 Kms', '. 6 Hrs. approx.): After breakfast proceed to Pink city Jaipur. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d_khajuraho, 3, 'Today after breakfast, a guided tour to visit Amer Fort, Jal Mahal ( water palace), Hawa Mahal (Window Palace), City Place and Observatory(Jantar Mantar)', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d_khajuraho, 4, 'Jaipur to Agra (260 Kms', '. 6 Hrs. approx.): VIA Fatehpur Sikri, Today after breakfast proceed to Agra and stop for visiting Fatehpur Sikri. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d_khajuraho, 5, 'Today after breakfast, a guided tour to visit The Taj Mahal, Agra Fort', '. Rest of the day at leisure .', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d_khajuraho, 6, 'Agra – Khajuraho (410 Kms', '. 6/7 Hrs. approx.): Today after breakfast proceed to Khajuraho En-Route to visit Orchha (Temple Town ). Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/35929819/pexels-photo-35929819.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d_khajuraho, 7, 'Today after breakfast, proceed to sightseeing and visit Western Temples and Jain Temples', '. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/9497619/pexels-photo-9497619.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d_khajuraho, 8, 'Khajuraho – Varanasi (400 Kms', '. 8/9 Hrs. approx.), Today after breakfast proceed to Varanasi. Rest of the day at leisure.', ARRAY['https://images.pexels.com/photos/21923152/pexels-photo-21923152.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d_khajuraho, 9, 'Today early morning boat ride excursion on the holly river Ganges to see the famous bathing Ghats and cremation site, back to hotel and after breakfast, a guided tour to visit Vishweshwar temple, Bharat Mata Temple and Sarnath & Rest of the day at leisure', '.', ARRAY['https://images.pexels.com/photos/36020918/pexels-photo-36020918.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_rajasthan_tour_9n_10d_khajuraho, 10, 'Today after breakfast in the morning, proceed to drop you at Varanasi Airport/Railway station to board a flight for your onward journey', '.', ARRAY['https://images.pexels.com/photos/35130760/pexels-photo-35130760.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 6 Nights / 7 Days Golden Triangle with Ranthambore Safari (File: Ranthambore-Tour-with-Delhi-Agra-Jaipur-for-07-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_6n_7d, pkg_golden_triangle_tour, '6n-7d', '6 Nights / 7 Days Golden Triangle with Ranthambore Safari', 6, 7, '6 Nights / 7 Days',
    NULL, NULL, 36, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d, dest_jaipur, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_6n_7d, dest_ranthambore, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_ranthambore
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d, 1, 'Delhi: Arrival at Delhi Airport company representative assist you and a guide tour to visit Qutub minar, Lotus temple, India gate, President house', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d, 2, 'Delhi to Agra (230 Kms', '. 3 Hrs.): Today, after breakfast, proceed to Agra. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d, 3, 'After breakfast, a guided tour to visit Taj Mahal, Agra Fort and famous marble handicraft factory', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d, 4, 'Agra to Ranthambore (280 Kms', '. 7 Hrs. Approx.): After breakfast drive to Ranthambore. En-route we make a stop and visit Fatehpur Sikri, Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d, 5, 'Ranthambore to Jaipur (200 Kms', '. 4 Hrs. approx.): Early morning start your Jungle safari tour (own cost) after breakfast drive to Jaipur & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d, 6, 'Jaipur Sightseeing: After breakfast, a guided tour to visit the beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), Rajasthani handicraft', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_6n_7d, 7, 'Jaipur to Delhi (260 Kms', '. 6 Hrs. approx.): Today after breakfast proceed to Delhi & drop you at the airport/railway station.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 0 Nights / 1 Day Same Day Taj Mahal Tour (File: Same Day Agra Tour from Delhi.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_0n_1d, pkg_golden_triangle_tour, '0n-1d', '0 Nights / 1 Day Same Day Taj Mahal Tour', 0, 1, '0 Nights / 1 Days',
    NULL, NULL, 37, TRUE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_0n_1d, dest_delhi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_0n_1d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_0n_1d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_0n_1d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_0n_1d, 1, 'Sightseeing & Leisure', 'Enjoy the scenic beauty and guided sightseeing of the region.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Shimla, Kullu & Manali Tour (File: Shimla Kullu Manali Tour Package 06 Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_himachal_tour_5n_6d, pkg_himachal_tour, '5n-6d', '5 Nights / 6 Days Shimla, Kullu & Manali Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 38, TRUE, 'https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37454902/pexels-photo-37454902.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32464426/pexels-photo-32464426.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/16889248/pexels-photo-16889248.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/14572763/pexels-photo-14572763.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_5n_6d, dest_shimla, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_5n_6d, dest_manali, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_5n_6d, dest_chandigarh, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_5n_6d, dest_delhi, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_shimla
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_manali
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_chandigarh
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d, 1, 'Delhi/Chandigarh – Shimla (350 Kms', '. 8 Hrs. approx.)(Chandigarh to Shimla 120 Kms 4 Hrs. approx.): Arrival at Delhi/Chandigarh Airport/Railway Station company representative assist you and proceed to Shimla & Stay at hotel.', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d, 2, 'After breakfast at the hotel, proceed for a half day excursion to Kufri (2500mts)', '. Kufri is also renowned for other adventure activities such as skiing, tobogganing (sliding downhill on a sled), etc. Kufri has the oldest skiing slopes in Himachal Pradesh. You can also take a hike or a Pony up to Mashu Peak(own cost direct payment basis). Afternoon: Guests will be dropped at the Shimla elevator & explore by themselves. Attractions of the mall road include Shimla Church, Scandal Point, Gaiety Theater, Town hall, Jaku Temple & shopping. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/37454902/pexels-photo-37454902.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d, 3, 'Shimla – Manali (240 Kms', '. 8 Hrs. approx.):After breakfast at the hotel, depart for Manali. Drive past Beas-Sutlej Link project, Pandoh Dam & En-Rout halt Kullu Valley (Boat ride-Direct payment basis) . Lunch shall be en-route on direct payment basis. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/32464426/pexels-photo-32464426.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d, 4, 'After breakfast go for a full day excursion to Solang valley day tour, Solang Valley with its rolling meadows, ski slopes and paragliding activities ( Own cost-Direct payment basis), Overnight stay at the hotel', '. *Optional Tour with extra paid: Atul tunel, Sissu, Rohtang pas', ARRAY['https://images.pexels.com/photos/16889248/pexels-photo-16889248.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d, 5, 'After Breakfast, Proceed for local sightseeing of Manali', '. visit Vashishtha Kund & Hadimba Temple, Van Vihar, Tibetan Monastery & Mall Road. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/14572763/pexels-photo-14572763.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d, 6, 'Manali to Delhi/Chandigarh (550 Kms', './ 12-13 Hours approx.) - Manali to Chandigarh (270 Kms. 6/7 Hrs. approx.): After breakfast Proceed to Chandigarh/Delhi & drop you at airport/railway station .', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 6 Nights / 7 Days Shimla, Manali & Chandigarh Tour (File: Shimla Manali Chandigarh Tour Packages 07 Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_himachal_tour_6n_7d, pkg_himachal_tour, '6n-7d', '6 Nights / 7 Days Shimla, Manali & Chandigarh Tour', 6, 7, '6 Nights / 7 Days',
    NULL, NULL, 39, FALSE, 'https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37454902/pexels-photo-37454902.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32464426/pexels-photo-32464426.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/16889248/pexels-photo-16889248.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/14572763/pexels-photo-14572763.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_6n_7d, dest_shimla, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_6n_7d, dest_manali, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_6n_7d, dest_chandigarh, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_6n_7d, dest_delhi, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_shimla
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_manali
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_chandigarh
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_6n_7d, 1, 'Delhi/Chandigarh – Shimla (350 Kms', '. 8 Hrs. approx.)(Chandigarh to Shimla 120 Kms 4 Hrs. approx.): Arrival at Delhi/Chandigarh Airport/Railway Station company representative assist you and proceed to Shimla & Stay at hotel.', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_6n_7d, 2, 'After breakfast at the hotel, proceed for a half day excursion to Kufri (2500mts)', '. Kufri is also renowned for other adventure activities such as skiing, tobogganing (sliding downhill on a sled), etc. Kufri has the oldest skiing slopes in Himachal Pradesh. You can also take a hike or a Pony up to Mashu Peak(own cost direct payment basis). Afternoon: Guests will be dropped at the Shimla elevator & explore by themselves. Attractions of the mall road include Shimla Church, Scandal Point, Gaiety Theater, Town hall, Jaku Temple & shopping. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/37454902/pexels-photo-37454902.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_6n_7d, 3, 'Shimla – Manali (240 Kms', '. 8 Hrs. approx.):After breakfast at the hotel, depart for Manali. Drive past Beas-Sutlej Link project, Pandoh Dam & En-Rout halt Kullu Valley (Boat ride-Direct payment basis) . Lunch shall be en-route on direct payment basis. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/32464426/pexels-photo-32464426.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_6n_7d, 4, 'After breakfast go for a full day excursion to Solang valley day tour, Solang Valley with its rolling meadows, ski slopes and paragliding activities ( Own cost-Direct payment basis), Overnight stay at the hotel', '. * Optional Tour with extra paid: Atul tunel, Sissu, Rohtang pas', ARRAY['https://images.pexels.com/photos/16889248/pexels-photo-16889248.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_6n_7d, 5, 'After Breakfast, Proceed for local sightseeing of Manali', '. visit Vashishtha Kund & Hadimba Temple, Van Vihar, Tibetan Monastery & Mall Road. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/14572763/pexels-photo-14572763.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_6n_7d, 6, 'Manali to Chandigarh (270 Kms', '. 7/8 Hrs. approx.); After breakfast Proceed to Chandigarh & visit Pinjore garden. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_6n_7d, 7, 'Chandigarh to Delhi (250 Kms', '. 5/6 Hrs. approx.); After breakfast, proceed to visit Rose garden, Rock garden and proceed to Delhi & drop you at airport/railway station .', ARRAY['https://images.pexels.com/photos/37454902/pexels-photo-37454902.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 4 Nights / 5 Days Shimla & Manali Tour (File: Shimla Manali Tour Package for 05 Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_himachal_tour_4n_5d, pkg_himachal_tour, '4n-5d', '4 Nights / 5 Days Shimla & Manali Tour', 4, 5, '4 Nights / 5 Days',
    NULL, NULL, 40, TRUE, 'https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37454902/pexels-photo-37454902.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32464426/pexels-photo-32464426.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/16889248/pexels-photo-16889248.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/14572763/pexels-photo-14572763.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_4n_5d, dest_shimla, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_4n_5d, dest_manali, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_4n_5d, dest_chandigarh, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_4n_5d, dest_delhi, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_shimla
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_manali
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_chandigarh
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_4n_5d, 1, 'Delhi to Shimla (350 Kms', '. 7/8 Hrs. approx.): Arrival at Delhi Airport/railway station company representative assist you and proceed to Shimla & Stay at hotel.', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_4n_5d, 2, 'Shimla Kufri & local sightseeing: After breakfast,', '. Kufri is also renowned for other adventure activities such as skiing, tobogganing (sliding downhill on a sled), etc. Kufri has the oldest skiing slopes in Himachal Pradesh. You can also take a hike or a Pony up to Mashu Peak(Direct payment basis), Afternoon: Guests will be dropped at the Shimla elevator & explore by themselves. Attractions of the mall road include Shimla Church, Scandal Point, Gaiety Theater, Town hall, Jaku Temple & shopping. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/37454902/pexels-photo-37454902.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_4n_5d, 3, 'Shimla to Manali (240 Kms', '. 8 Hrs. approx.): Today after breakfast proceed to Manali on the way to the Kullu valley, Enjoy river rafting(direct payment basis). Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/32464426/pexels-photo-32464426.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_4n_5d, 4, 'Today after breakfast, proceed to visit Solang Valley, Hadimba Temple, Vashisht Temple, Monastery, Mall road, Van vihar', '. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/16889248/pexels-photo-16889248.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_4n_5d, 5, 'Manali to Delhi (550 Kms', './ 12-13 Hours approx.) And Manali to Chandigarh (9 Hrs. approx.): After breakfast Proceed to Chandigarh/Delhi & drop you at airport/railway station.', ARRAY['https://images.pexels.com/photos/14572763/pexels-photo-14572763.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Spiritual Kathmandu & Lumbini Tour (File: Spiritual-Tour-Package-Kathmandu-Lumbini-for-06-Days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_nepal_tour_5n_6d, pkg_nepal_tour, '5n-6d', '5 Nights / 6 Days Spiritual Kathmandu & Lumbini Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 41, TRUE, 'https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/28831413/pexels-photo-28831413.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/14725559/pexels-photo-14725559.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32343720/pexels-photo-32343720.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32343708/pexels-photo-32343708.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_5n_6d, dest_kathmandu, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_5n_6d, dest_lumbini, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_5n_6d, dest_pokhara, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_5n_6d, dest_nagarkot, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_kathmandu
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_lumbini
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_pokhara
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_nagarkot
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_5n_6d, 1, 'Arrival in Kathmandu After arrival at Tribhuvan International Airport, you’ll be warmly welcomed and transferred to your hotel in Kathmandu', '. After check-in, you can relax. In the evening, explore the lively Thamel area at your leisure time. Overnight stay in Kathmandu.', ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_5n_6d, 2, 'Kathmandu Sightseeing Today, engage yourself in Kathmandu’s rich cultural heritage with a full-day sightseeing tour', '. Begin with a visit to Pashupatinath Temple and Gujeshowri Temple. Continue to Boudhanath Stupa, one of the largest stupas in the world and a UNESCO World Heritage Site. In the afternoon, explore Swayambhunath Stupa, also known as the Monkey Temple, and finish the day at Kathmandu Durbar Square, a historic palace square that showcases traditional Nepalese architecture.', ARRAY['https://images.pexels.com/photos/28831413/pexels-photo-28831413.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_5n_6d, 3, 'Early Morning Trip to Nagarkot and Drive to Pokhara via Manakamana Early in the morning, drive to Nagarkot to witness a breathtaking sunrise over the Himalayas', '. After enjoying the stunning views, return to your hotel in Kathmandu for breakfast. Following breakfast, embark on a scenic drive to Manakamana Temple, accessible by a cable car ride that offers spectacular views of the surrounding landscape. After visiting the temple, continue your journey to Pokhara. Upon arrival, check into your hotel and take the evening to relax or explore the lakeside area. Overnight stay in Pokhara.', ARRAY['https://images.pexels.com/photos/14725559/pexels-photo-14725559.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_5n_6d, 4, 'Explore Pokhara Begin exploring Pokhara’s highlights, with a boat ride on Phewa Lake to watch the stunning mountain reflections', '. Visit Tal Barahi Temple on an island in the lake, and head to Davis Falls and Gupteshwor Mahadev Cave. Wrap up the day with a visit to the Peace Pagoda, which offers panoramic views of the Annapurna range and Pokhara Valley.', ARRAY['https://images.pexels.com/photos/32343720/pexels-photo-32343720.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_5n_6d, 5, 'Return to Kathmandu After breakfast, the journey back to Kathmandu will begin by road', '. Upon arrival, check into your hotel and spend the remainder of the day at your leisure. You can use this time for some last-minute shopping in Thamel or visit the Garden of Dreams, a beautiful, peaceful garden in the city & heart. Stay in Kathmandu.', ARRAY['https://images.pexels.com/photos/32343708/pexels-photo-32343708.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_5n_6d, 6, 'Departure from Kathmandu On your final day, enjoy breakfast at your hotel before being transferred to Tribhuvan International Airport for your departure', '. Depart with memories of Nepal’s diverse landscapes, spiritual sites, and rich culture.', ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 10 Nights / 11 Days Char Dham Yatra Tour (File: Uttarakhand-Holiday-Tour-Packages-ten-nights-eleven-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_uttarakhand_tour_10n_11d, pkg_uttarakhand_tour, '10n-11d', '10 Nights / 11 Days Char Dham Yatra Tour', 10, 11, '10 Nights / 11 Days',
    NULL, NULL, 42, FALSE, 'https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_10n_11d, dest_haridwar, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_uttarakhand_tour_10n_11d, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_haridwar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_uttarakhand_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 1, 'DELHI TO HARIDWAR Day', 'DELHI TO HARIDWAR Day', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 2, 'HARIDWAR TO PHOOLCHATTI, VIA BARKOT', 'HARIDWAR TO PHOOLCHATTI, VIA BARKOT', ARRAY['https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 3, 'PHOOLCHATTI TO YAMUNOTRI', 'PHOOLCHATTI TO YAMUNOTRI', ARRAY['https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 4, 'PHOOLCHATTI TO HARSHL DAY', 'PHOOLCHATTI TO HARSHL DAY', ARRAY['https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 5, 'HARSIL TO GANGOTRI AND UTTARKASHI', 'HARSIL TO GANGOTRI AND UTTARKASHI', ARRAY['https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 6, 'UTTARKASHI TO GUPTKASHI, VIA CHAMBA/NEW TEHRI', 'UTTARKASHI TO GUPTKASHI, VIA CHAMBA/NEW TEHRI', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 7, 'GUPTKASHI TO KEDARNATH, VIA GAURIKUND', 'GUPTKASHI TO KEDARNATH, VIA GAURIKUND', ARRAY['https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 8, 'KEDARNATH, GAURIKUND/RAMPUR TO TILWARA', 'KEDARNATH, GAURIKUND/RAMPUR TO TILWARA', ARRAY['https://images.pexels.com/photos/33855219/pexels-photo-33855219.png?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 9, 'TILWARA, JOSHIMATH, BADRINATH', 'TILWARA, JOSHIMATH, BADRINATH', ARRAY['https://images.pexels.com/photos/17693658/pexels-photo-17693658.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 10, 'BADRINATH, JOSHIMATH, KALESHWAR', 'BADRINATH, JOSHIMATH, KALESHWAR', ARRAY['https://images.pexels.com/photos/36123978/pexels-photo-36123978.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 11, 'KALESHWAR, KAUDIYALA, HARIDWAR', 'KALESHWAR, KAUDIYALA, HARIDWAR', ARRAY['https://images.pexels.com/photos/10620256/pexels-photo-10620256.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_uttarakhand_tour_10n_11d, 12, 'HARIDWAR TO DELHI', 'HARIDWAR TO DELHI', ARRAY['https://images.pexels.com/photos/20035462/pexels-photo-20035462.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Varanasi & Ayodhya Heritage Tour (File: Varanasi-Ayodhya-Tour-Package-details.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_varanasi_ayodhya_tour_5n_6d, pkg_varanasi_ayodhya_tour, '5n-6d', '5 Nights / 6 Days Varanasi & Ayodhya Heritage Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 43, TRUE, 'https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17869844/pexels-photo-17869844.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/8112552/pexels-photo-8112552.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36440702/pexels-photo-36440702.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_5n_6d, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_5n_6d, dest_ayodhya, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_5n_6d, dest_prayagraj, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_5n_6d, dest_agra, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_ayodhya
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_prayagraj
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_5n_6d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_5n_6d, 1, 'Sightseeing & Leisure', 'Enjoy the scenic beauty and guided sightseeing of the region.', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Varanasi, Prayagraj & Chitrakoot Tour (File: Varanasi-Prayagraj-Chitrakoot-Tour-five-nights-six-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_varanasi_ayodhya_tour_5n_6d_chitrakoot, pkg_varanasi_ayodhya_tour, '5n-6d-chitrakoot', '5 Nights / 6 Days Varanasi, Prayagraj & Chitrakoot Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 44, FALSE, 'https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17869844/pexels-photo-17869844.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/8112552/pexels-photo-8112552.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36440702/pexels-photo-36440702.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_5n_6d_chitrakoot, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_5n_6d_chitrakoot, dest_ayodhya, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_5n_6d_chitrakoot, dest_prayagraj, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_5n_6d_chitrakoot, dest_chitrakoot, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_5n_6d_chitrakoot, dest_agra, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_5n_6d_chitrakoot, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_5n_6d_chitrakoot, "id" FROM "Attraction" WHERE "destinationId" = dest_ayodhya
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_5n_6d_chitrakoot, "id" FROM "Attraction" WHERE "destinationId" = dest_prayagraj
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_5n_6d_chitrakoot, "id" FROM "Attraction" WHERE "destinationId" = dest_chitrakoot
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_5n_6d_chitrakoot, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_5n_6d_chitrakoot, 1, 'Varanasi: Arrival at Varanasi Airport/Railway station company representative assist you and transfer to the hotel & refresh drive to visit Sarnath which is known as the place where Lord Budda delivered his first sermon to his disciples', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_5n_6d_chitrakoot, 2, 'Varanasi sightseeing: Early morning visit the popular ghat of Ganges through boat ride of Varanasi, peoples offering water to Sun God along with taking a holy dip in the Ganges river water, back to hotel & after breakfast proceed to visit Bharat Mata temple, Vishwanath Temple, Sankat Mochan (Hanuman Temple), Annapurna Temple, Banaras Hindu University (BHEU) & Manas Mandir', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17869844/pexels-photo-17869844.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_5n_6d_chitrakoot, 3, 'Varanasi to Ayodhya (225 Kms', '. 5 Hrs.): After breakfast proceed to Ayodhya City Of Lord Rama. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_5n_6d_chitrakoot, 4, 'Ayodhya: Today, after breakfast, proceed to visit the city of Lord Rama to see The Saryu River, Hanuman Garhi, Ram Janam Bhumi, Kanak Bhawan & Treta Ka Thakur', '. Check in at the hotel & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/8112552/pexels-photo-8112552.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_5n_6d_chitrakoot, 5, 'Ayodhya to Prayagraj (225 kMS', '. 5 Hrs.): After breakfast proceed to Prayagraj & visit Holi Triveni Sangam, Hanuman Temple, Anand Bhawan & Alopi Devi Temple. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/36440702/pexels-photo-36440702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_5n_6d_chitrakoot, 6, 'Prayagraj to Chitrakoot (140 Kms', '. 3 Hrs.): Today, After breakfast, drive to Chitrakoot & visit hole day visit chitrakoot Parvat Mala includes Kamad Giri, Hanuman Dhara, Janki Kund, Lakshman pahari, and Devangana famous Religious mountains and later return back to hotel and night stay in Chitrakoot.', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_5n_6d_chitrakoot, 7, 'Chitrakoot to Prayagraj (140 Kms', '.3 Hrs.): After breakfast, proceed to Prayagraj & drop you at the airport/railway station or with sweet memories.', ARRAY['https://images.pexels.com/photos/17869844/pexels-photo-17869844.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 4 Nights / 5 Days Varanasi & Prayagraj Tour (File: Varanasi-Prayagraj-Tour-four-nights-five-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_varanasi_ayodhya_tour_4n_5d, pkg_varanasi_ayodhya_tour, '4n-5d', '4 Nights / 5 Days Varanasi & Prayagraj Tour', 4, 5, '4 Nights / 5 Days',
    NULL, NULL, 45, TRUE, 'https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17869844/pexels-photo-17869844.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/8112552/pexels-photo-8112552.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36440702/pexels-photo-36440702.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_4n_5d, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_4n_5d, dest_prayagraj, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_4n_5d, dest_agra, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_prayagraj
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_4n_5d, 1, 'Varanasi: Arrival at Varanasi Airport/Railway station company representative assist you and transfer to the hotel & refresh drive to visit Sarnath which is known as the place where Lord Budda delivered his first sermon to his disciples', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_4n_5d, 2, 'Varanasi sightseeing: Early morning visit the popular ghat of Ganges through boat ride of Varanasi, peoples offering water to Sun God along with taking a holy dip in the Ganges river water, back to hotel & after breakfast proceed to visit Bharat Mata temple, Vishwanath Temple, Sankat Mochan (Hanuman Temple), Annapurna Temple, Banaras Hindu University (BHEU) & Manas Mandir', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17869844/pexels-photo-17869844.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_4n_5d, 3, 'Varanasi to Prayagraj (120 Kms', '. 3 Hrs.): Today after breakfast, proceed to Prayagraj & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_4n_5d, 4, 'Prayagraj sightseeing: After breakfast, drive to visit Holi Triveni Sangam, Hanuman Temple, Anand Bhawan & Alopi Devi Temple', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/8112552/pexels-photo-8112552.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_4n_5d, 5, 'Prayagraj departure transfer: After breakfast checkout from the hotel & drop you at airport/railway station with sweet memories', '.', ARRAY['https://images.pexels.com/photos/36440702/pexels-photo-36440702.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 2 Nights / 3 Days Varanasi Spiritual Tour (File: Varanasi-Tour-tw0-night-three-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_varanasi_ayodhya_tour_2n_3d, pkg_varanasi_ayodhya_tour, '2n-3d', '2 Nights / 3 Days Varanasi Spiritual Tour', 2, 3, '2 Nights / 3 Days',
    NULL, NULL, 46, FALSE, 'https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17869844/pexels-photo-17869844.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/8112552/pexels-photo-8112552.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36440702/pexels-photo-36440702.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_2n_3d, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_2n_3d, dest_prayagraj, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_varanasi_ayodhya_tour_2n_3d, dest_agra, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_2n_3d, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_2n_3d, "id" FROM "Attraction" WHERE "destinationId" = dest_prayagraj
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_varanasi_ayodhya_tour_2n_3d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_2n_3d, 1, 'Varanasi: Arrival at Varanasi Airport/Railway station company representative assist you and transfer to the hotel & refresh drive to visit Sarnath which is known as the place where Lord Budda delivered his first sermon to his disciples', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/27670662/pexels-photo-27670662.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_2n_3d, 2, 'Varanasi sightseeing: Early morning visit the popular ghat of Ganges through boat ride of Varanasi, peoples offering water to Sun God along with taking a holy dip in the Ganges river water, back to hotel & after breakfast proceed to visit Bharat Mata temple, Vishwanath Temple, Sankat Mochan (Hanuman Temple), Annapurna Temple, Banaras Hindu University (BHEU) & Manas Mandir', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17869844/pexels-photo-17869844.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_varanasi_ayodhya_tour_2n_3d, 3, 'Varanasi to Prayagraj (210 Kms', '. 3 Hrs.): Today after breakfast, proceed to Varanasi airport/railway station & drop you with sweet memories.', ARRAY['https://images.pexels.com/photos/13449407/pexels-photo-13449407.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 5 Nights / 6 Days Volvo Delhi-Manali-Delhi Tour (File: Volvo Tour Packages Delhi Manali Delhi .html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_himachal_tour_5n_6d_volvo, pkg_himachal_tour, '5n-6d-volvo', '5 Nights / 6 Days Volvo Delhi-Manali-Delhi Tour', 5, 6, '5 Nights / 6 Days',
    NULL, NULL, 47, FALSE, 'https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37454902/pexels-photo-37454902.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32464426/pexels-photo-32464426.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/16889248/pexels-photo-16889248.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/14572763/pexels-photo-14572763.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_5n_6d_volvo, dest_manali, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_himachal_tour_5n_6d_volvo, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_5n_6d_volvo, "id" FROM "Attraction" WHERE "destinationId" = dest_manali
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_himachal_tour_5n_6d_volvo, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d_volvo, 1, 'Delhi to Manali by A/C Volvo Bus, Overnight journey', 'Delhi to Manali by A/C Volvo Bus, Overnight journey', ARRAY['https://images.pexels.com/photos/29494184/pexels-photo-29494184.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d_volvo, 2, 'Pick up from Manali Bus stand & proceed to hotel after refreshments proceed to a half day city tour visiting Hadimba Temple, Manu Temple, Vashisht Temple and Tibetan Monastery', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37454902/pexels-photo-37454902.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d_volvo, 3, 'Solang Valley day trip: After breakfast go for a full day excursion to Solang valley visit Solang Valley with its rolling meadows, ski slopes and paragliding activities ( Own cost), Overnight stay at the hotel', '. * Optional Tour with extra paid: Atul tunel, Sissu, Rohtang pas', ARRAY['https://images.pexels.com/photos/32464426/pexels-photo-32464426.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d_volvo, 4, 'Kullu – Manikaran day trip: After early breakfast, a full day excursion visiting Manikaran ( Hot water springs) en-route Kas0l and Kullu – Shamshi (A Famous industry for Kullu Shawl), boat ride (own cost)', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/16889248/pexels-photo-16889248.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_himachal_tour_5n_6d_volvo, 5, 'Return to Delhi by A/C Volvo Bus: Check out from hotel and overnight journey to Delhi by AC deluxe Volvo', '.', ARRAY['https://images.pexels.com/photos/14572763/pexels-photo-14572763.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 10 Nights / 11 Days Grand Golden Triangle with Khajuraho & Varanasi (File: delhi-jaipur-agra-khajuraho-varanasi-tour-for-10nights and 11 days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_golden_triangle_tour_10n_11d, pkg_golden_triangle_tour, '10n-11d', '10 Nights / 11 Days Grand Golden Triangle with Khajuraho & Varanasi', 10, 11, '10 Nights / 11 Days',
    NULL, NULL, 48, FALSE, 'https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_10n_11d, dest_varanasi, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_10n_11d, dest_delhi, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_10n_11d, dest_agra, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_10n_11d, dest_jaipur, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_golden_triangle_tour_10n_11d, dest_khajuraho, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_varanasi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_delhi
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_jaipur
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_golden_triangle_tour_10n_11d, "id" FROM "Attraction" WHERE "destinationId" = dest_khajuraho
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 1, 'Arrival at Delhi Airport company representative assist you and transfer to the hotel', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 2, 'Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 3, 'Delhi to Jaipur(260 kms', '. 6 hrs. approx.): Today, after breakfast, proceed to Jaipur. Lunch on the way and overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 4, 'Jaipur sightseeing: Today after breakfast, a guided tour to visit Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & James & Stone cutting factory work being done for centuries in Jaipur', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 5, 'Jaipur – Agra VIA Fatehpur Sikri(260 kms', '. 6 hrs. approx.): Today after breakfast, proceed to Jaipur on the way to visit Fatehpur Sikri. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 6, 'Agra sightseeing: Today, a guided tour to visit Taj Mahal, Agra Fort , and visiting famous fine marble inlay work which is still being done in Agra', '. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 7, 'Agra to Khajuraho (400 kms', '. 8 hrs. approx.): Today after breakfast, proceed to Khajuraho. Overnight at the hotel.', ARRAY['https://images.pexels.com/photos/37126715/pexels-photo-37126715.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 8, 'Khajuraho Sightseeing: After breakfast, proceed to visit the most famous Western Temple’s, Jain Temple, and city centre walk, Overnight stay at the hotel', '.', ARRAY['https://images.pexels.com/photos/7800309/pexels-photo-7800309.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 9, 'Khajuraho to Varanasi (400 kms', '. 9 hrs. approx.): After breakfast proceed to Varanasi & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/20476702/pexels-photo-20476702.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 10, 'Varanasi sightseeing: Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site', '. After breakfast, visit Vishwanath temple, Sankat mochan temple, BHEU & Sarnath. Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17423832/pexels-photo-17423832.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_golden_triangle_tour_10n_11d, 11, 'Today after breakfast drop you at Varanasi Airport/Railway station for your onward journey', '.', ARRAY['https://images.pexels.com/photos/38447327/pexels-photo-38447327.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 4 Nights / 5 Days Paradise Kashmir Tour (File: four Night five Days Paradise Kashmir Tour.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_kashmir_tour_4n_5d, pkg_kashmir_tour, '4n-5d', '4 Nights / 5 Days Paradise Kashmir Tour', 4, 5, '4 Nights / 5 Days',
    NULL, NULL, 49, TRUE, 'https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/25786565/pexels-photo-25786565.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/11866095/pexels-photo-11866095.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/5776631/pexels-photo-5776631.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_4n_5d, dest_srinagar, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_4n_5d, dest_gulmarg, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_4n_5d, dest_pahalgam, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_4n_5d, dest_sonamarg, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_srinagar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_gulmarg
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_pahalgam
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_sonamarg
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_4n_5d, 1, 'Arrive Srinagar | Srinagar Local Sightseeing: Welcome to Srinagar, the Lake City', '. On arrival at Srinagar Airport, begin your Kashmir Tour. You will be transferred to the Hotel. Proceed on a city tour visiting the Shankar Acharya temple situated on the highest hill of Srinagar, the famous Mughal Gardens-Chashmashahi, Nishat Shalimar. These gardens were Mughal Emperor&#39;s concept of Paradise and today these are popular picnic spots. Visit Hazratbal Dargah Also. Overnight stay in a hotel.', ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_4n_5d, 2, 'Srinagar – Sonamarg – Srinagar: Today you embark on a full day excursion to the picturesque meadow of gold’ Sonamarg', '. Sonamarg is the last stop of Kashmir district. From here starts the territory of ladakh. Situated at an altitude of 2743 mt above sea level. The fast-flowing Sindh River makes it popular for trout and masher fishing in summer. You can opt for a pony ride (Own cost) to one of the Thajiwas glaciers for some fun in snow and ice (by your own payment). You can also visit Zero Point/Zojila Pass (by your own cost) . Return to the Hotel in Srinagar in the evening and enjoy a comfortable overnight stay.', ARRAY['https://images.pexels.com/photos/25786565/pexels-photo-25786565.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_4n_5d, 3, 'Srinagar – Pahalgam – Srinagar', '. After breakfast drive to Pahalgam (The valley of shepherds). Which is about 96 kms from Srinagar, which will be covered in the app. 3 hours. You Can visit the saffron fields of pampore, Awantipura Ruins (1100 years old temple of Lord Vishnu built by the King Awantivarman), Mattan Temple on En-route. Drive through the pine forests. Arrive at Pahalgam and enjoy Lidder stream. After You can hire a union car (at your own cost) visit Aru, betaab valley and chandanwari &amp; You can go for Pony ride and also visit Kashmir Valley, Dabyan, Baisaran, Snow Valley, Waterfall, Kanimarag(at your own cost). Evening return dinner and Overnight stay.', ARRAY['https://images.pexels.com/photos/11866095/pexels-photo-11866095.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_4n_5d, 4, 'Srinagar –Gulmarg - Srinagar : After breakfast check out from the hotel in Srinagar drive to Gulmarg (2440 Meters above Sea level)', '. It is one of the most beautiful hill stations and also called “Meadows of Flower”. It has the world’s highest golf course and Gulmarg is also famous for winter sports like skiing. On arrival and after refreshment one can visit Jai Jai Shiv Shankar Temple and also enjoy a Gondola ride (Cable car, own cost) from Gulmarg to Kongdori and affarwat. Evening return dinner and overnight stay Srinagar.', ARRAY['https://images.pexels.com/photos/5776631/pexels-photo-5776631.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_4n_5d, 5, 'Today, After breakfast transfer to Srinagar Airport to board your flight with Sweet memories', '.', ARRAY['https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 4 Nights / 5 Days Goa Explorer Tour (File: goa-tour-package-four-nights-five-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_goa_tour_4n_5d, pkg_goa_tour, '4n-5d', '4 Nights / 5 Days Goa Explorer Tour', 4, 5, '4 Nights / 5 Days',
    NULL, NULL, 50, TRUE, 'https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/1604287/pexels-photo-1604287.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/27869489/pexels-photo-27869489.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/4429334/pexels-photo-4429334.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/8037061/pexels-photo-8037061.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_goa_tour_4n_5d, dest_goa, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_goa_tour_4n_5d, dest_agra, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_goa_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_goa
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_goa_tour_4n_5d, "id" FROM "Attraction" WHERE "destinationId" = dest_agra
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_4n_5d, 1, 'Upon your arrival at Goa airport/ railway station, our tour representative assists you in smooth transfer to the hotel for a pre-booked stay', '.The first day of your Goa trip will acquaint you with the rich Portuguese culture and heritage of this tiny Indian state. There are several remnants in Old Goa in the form of century old cathedrals such as Basilica of Bom Jesus and Chapel of St. Francis Xavier.Goa is also known for its massive forts which were built by Indian rulers and Portuguese colonies which settled in Goa in the 15th century. Besides, you can visit the famous ‘Fort Aguada’ whose major portions have been converted into a luxury hotel. Post sightseeing, return to the hotel for dinner and night stay.', ARRAY['https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_4n_5d, 2, 'Tour to Goa is dedicated to the exploration of North Goa beaches', '. The charm of Goa beaches lies in its beautiful beaches lined on the seashore and attracts a huge crowd of Indian and international tourists. Some popular beaches that you can visit include Anjuna, Baga and Calangute. These beaches will allow you to indulge in water sports such as Parasailing, scuba diving and water skiing.Besides, you can visit the local markets at Anjuna where you can purchase traditional jewellery, handicrafts and souvenirs.The 2nd day of your Goa Trip will make you experience the nightlife of Goa. Proceed towards the Tito’s bar, one of the most happening party places in Goa to enjoy the vibrant nightlife. Besides, you can also visit the Ingo’s Saturday Night Bazaar famous for shopping. Overnight stay in Goa.', ARRAY['https://images.pexels.com/photos/1604287/pexels-photo-1604287.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_4n_5d, 3, 'On the 3rd day of your Goa Trip, you will head straight towards South Goa', '. Colva is a popular beach in South Goa. The beach is home to shacks, resort complexes, tourist cottages, discos and eateries. Overnight stay in Goa.', ARRAY['https://images.pexels.com/photos/27869489/pexels-photo-27869489.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_4n_5d, 4, 'After breakfast proceed to visit Dudh Sagra day trip', '. Overnight stay at the hotel', ARRAY['https://images.pexels.com/photos/4429334/pexels-photo-4429334.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_4n_5d, 5, 'transfer to the Goa Airport/Railway station to board flight/train for onward journey', '.', ARRAY['https://images.pexels.com/photos/8037061/pexels-photo-8037061.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 3 Nights / 4 Days Leisure Goa Tour (File: goa-tour-package-three-nights-four-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_goa_tour_3n_4d, pkg_goa_tour, '3n-4d', '3 Nights / 4 Days Leisure Goa Tour', 3, 4, '3 Nights / 4 Days',
    NULL, NULL, 51, FALSE, 'https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/1604287/pexels-photo-1604287.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/27869489/pexels-photo-27869489.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/4429334/pexels-photo-4429334.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/8037061/pexels-photo-8037061.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_goa_tour_3n_4d, dest_goa, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_goa_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_goa
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_3n_4d, 1, 'Upon your arrival at Goa airport/ railway station, our tour representative assists you in smooth transfer to the hotel for a pre-booked stay', '.The first day of your Goa trip will acquaint you with the rich Portuguese culture and heritage of this tiny Indian state. There are several remnants in Old Goa in the form of century old cathedrals such as Basilica of Bom Jesus and Chapel of St. Francis Xavier.Goa is also known for its massive forts which were built by Indian rulers and Portuguese colonies which settled in Goa in the 15th century. Besides, you can visit the famous ‘Fort Aguada’ whose major portions have been converted into a luxury hotel. Post sightseeing, return to the hotel for dinner and night stay.', ARRAY['https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_3n_4d, 2, 'Tour to Goa is dedicated to the exploration of North Goa beaches', '. The charm of Goa beaches lies in its beautiful beaches lined on the seashore and attracts a huge crowd of Indian and international tourists. Some popular beaches that you can visit include Anjuna, Baga and Calangute. These beaches will allow you to indulge in water sports such as Parasailing, scuba diving and water skiing.Besides, you can visit the local markets at Anjuna where you can purchase traditional jewellery, handicrafts and souvenirs.The 2nd day of your Goa Trip will make you experience the nightlife of Goa. Proceed towards the Tito’s bar, one of the most happening party places in Goa to enjoy the vibrant nightlife. Besides, you can also visit the Ingo’s Saturday Night Bazaar famous for shopping. Overnight stay in Goa.', ARRAY['https://images.pexels.com/photos/1604287/pexels-photo-1604287.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_3n_4d, 3, 'On the 3rd day of your Goa Trip, you will head straight towards South Goa', '. Colva is a popular beach in South Goa. The beach is home to shacks, resort complexes, tourist cottages, discos and eateries. Overnight stay in Goa.', ARRAY['https://images.pexels.com/photos/27869489/pexels-photo-27869489.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_3n_4d, 4, 'After breakfast transfer to the Goa Airport/Railway station to board flight/train for onward journey', '.', ARRAY['https://images.pexels.com/photos/4429334/pexels-photo-4429334.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 2 Nights / 3 Days Goa Beach Escape (File: goa-tour-package-two-nights-three-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_goa_tour_2n_3d, pkg_goa_tour, '2n-3d', '2 Nights / 3 Days Goa Beach Escape', 2, 3, '2 Nights / 3 Days',
    NULL, NULL, 52, FALSE, 'https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/1604287/pexels-photo-1604287.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/27869489/pexels-photo-27869489.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/4429334/pexels-photo-4429334.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/8037061/pexels-photo-8037061.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_goa_tour_2n_3d, dest_goa, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_goa_tour_2n_3d, "id" FROM "Attraction" WHERE "destinationId" = dest_goa
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_2n_3d, 1, 'Arrival in the Morning & Full Day North Goa Sightseeing', '. visit include Anjuna, Baga and Calangute. These beaches will allow you to indulge in water sports such as Parasailing, scuba diving and water skiing.Besides, you can visit the local markets at Anjuna where you can purchase traditional jewellery, handicrafts and souvenirs. Overnight stay in Goa.', ARRAY['https://images.pexels.com/photos/3754547/pexels-photo-3754547.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_2n_3d, 2, 'Full Day South Goa Sightseeing', '. Today after breakfast you will head straight towards South Goa. Colva is a popular beach in South Goa. The beach is home to shacks, resort complexes, tourist cottages, discos and eateries.The 2nd day of your Goa Trip will make you experience the nightlife of Goa. Proceed towards the Tito’s bar, one of the most happening party places in Goa to enjoy the vibrant nightlife. Besides, you can also visit the Ingo’s Saturday Night Bazaar famous for shopping.Overnight stay in Goa.', ARRAY['https://images.pexels.com/photos/1604287/pexels-photo-1604287.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_goa_tour_2n_3d, 3, 'After breakfast transfer to the Goa Airport/Railway station to board flight/train for onward journey', '.', ARRAY['https://images.pexels.com/photos/27869489/pexels-photo-27869489.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 2 Nights / 3 Days Kashmir Tour with Maa Vaishno Devi (File: kashmir three das maa vaisho devi.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_kashmir_tour_2n_3d, pkg_kashmir_tour, '2n-3d', '2 Nights / 3 Days Kashmir Tour with Maa Vaishno Devi', 2, 3, '2 Nights / 3 Days',
    NULL, NULL, 53, FALSE, 'https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/25786565/pexels-photo-25786565.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/11866095/pexels-photo-11866095.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/5776631/pexels-photo-5776631.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_2n_3d, 1, 'Sightseeing & Leisure', 'Enjoy the scenic beauty and guided sightseeing of the region.', ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 6 Nights / 7 Days Kerala Lovers Tour (File: kerala six days seven night tour.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_kerala_tour_6n_7d, pkg_kerala_tour, '6n-7d', '6 Nights / 7 Days Kerala Lovers Tour', 6, 7, '6 Nights / 7 Days',
    NULL, NULL, 54, FALSE, 'https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/12950219/pexels-photo-12950219.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32518360/pexels-photo-32518360.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/36998153/pexels-photo-36998153.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/34588372/pexels-photo-34588372.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_6n_7d, dest_munnar, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_6n_7d, dest_thekkady, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_6n_7d, dest_cochin, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_6n_7d, dest_kovalam, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kerala_tour_6n_7d, dest_goa, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_munnar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_thekkady
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_cochin
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_kovalam
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kerala_tour_6n_7d, "id" FROM "Attraction" WHERE "destinationId" = dest_goa
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_6n_7d, 1, 'Cochin to Munnar (130 Kms', '. 05 hrs. approx.): Morning arrival & proceed Munnar, Munnar is 1800 mts above sea level and also the home of South India''s highest peak (anamudi-2695 mts). On the way to Munnar visit Valparai, Cheeyappara waterfalls and Tea Plantations. Upon arrival at Munnar & transfer to the Hotel. Check in at Hotel. Afternoon visit Rajamala (eravikulam National Park - open as per the directions by the forest authorities), the best place to see Nilgiri Tahr (hemitragus Hilarious)- the mountain goat of South India. You may visit the Tea Museum surrounded by Tea Gardens- the only Museum of its kind; which illustrates the timeworn method of Tea production. Evening have a short visit to Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_6n_7d, 2, 'Munnar After breakfast, proceed for sightseeing in Munnar', '. Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY['https://images.pexels.com/photos/12950219/pexels-photo-12950219.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_6n_7d, 3, 'Munnar to Thekkady (100 kms', '. 03 hrs. approx.) Morning have breakfast at the resort, later check out the resort and drive to Thekkady. Thekkady is a world famous wildlife sanctuary and it is also called as Periyar. On arrival check in Hotel Afternoon proceed for a game viewing cruise on the Periyar Lake (direct payment basis). The rest of the day is at leisure.', ARRAY['https://images.pexels.com/photos/32518360/pexels-photo-32518360.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_6n_7d, 4, 'Thekkady: After breakfast, Here you will be able to see a large variety of wildlife, ( Jeep safari direct payment basis) which include elephants, monkeys, deer, wild boar etc', '. In the evening you can take a Elephant ride at Periyar wildlife (direct payment basis). Overnight stay at the hotel.', ARRAY['https://images.pexels.com/photos/36998153/pexels-photo-36998153.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_6n_7d, 5, 'Thekkady to Kovalam (220kms/6 hrs', '. approx.): After having breakfast, check out the houseboat and drive to your beach resort at Kovalam; The international beach destination of Kerala. Check in to the beach resort and enjoy the beach till the sun sets in the Arabian Sea. Overnight stay at Kovalam.', ARRAY['https://images.pexels.com/photos/34588372/pexels-photo-34588372.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_6n_7d, 6, 'Kovalam-Trivandrum-Kovalam : sightseeing – After having breakfast, Proceed to visit the iconic spots of Old Travancore Kingdom’s capital Trivandrum which includes Napier Museum, Sri Chitra Art Gallery, Zoo, Padmanabhapuram Temple etc', '. And enjoy the beach till the sun sets in the Arabian Sea. Overnight stay at Kovalam.', ARRAY['https://images.pexels.com/photos/17928231/pexels-photo-17928231.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kerala_tour_6n_7d, 7, 'Kovalam- Trivandrum(12 km/30 min', '.) approx.: Transfer to Trivandrum, drop at Airport/Railway Station with sweet journey.', ARRAY['https://images.pexels.com/photos/12950219/pexels-photo-12950219.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 9 Nights / 10 Days Nepal Mountain Venture (File: nepal-tour-package-nine-nights-ten-days.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_nepal_tour_9n_10d, pkg_nepal_tour, '9n-10d', '9 Nights / 10 Days Nepal Mountain Venture', 9, 10, '9 Nights / 10 Days',
    NULL, NULL, 55, FALSE, 'https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/28831413/pexels-photo-28831413.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/14725559/pexels-photo-14725559.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32343720/pexels-photo-32343720.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/32343708/pexels-photo-32343708.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_9n_10d, dest_kathmandu, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_9n_10d, dest_pokhara, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_nepal_tour_9n_10d, dest_chitwan, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_kathmandu
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_pokhara
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_nepal_tour_9n_10d, "id" FROM "Attraction" WHERE "destinationId" = dest_chitwan
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_9n_10d, 1, 'Arrival at TIA airport Kathmandu, Received and transfer to Hotel, short briefing about the program, O/N at Hotel', '.', ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_9n_10d, 2, 'A full day guided sightseeing tour in Kathmandu, including Durbar Square, Swyambhu Nath, Bouddha Nath and Pashupati Nath, O/N at Hotel', '.', ARRAY['https://images.pexels.com/photos/28831413/pexels-photo-28831413.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_9n_10d, 3, 'Half day guided sightseeing tour to fine art city of Patan and surrounding area, O/N at Hotel', '.', ARRAY['https://images.pexels.com/photos/14725559/pexels-photo-14725559.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_9n_10d, 4, 'Early morning drive to Chitwan Safari park by tourist coach, arrival transfer to Resort, and Tharu village walk, O/N at Resort', '.', ARRAY['https://images.pexels.com/photos/32343720/pexels-photo-32343720.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_9n_10d, 5, 'Full day Jungle activities in and out side of the national park like, Elephant back safari, canoeing, visit elephant breeding center with a nature guide and Tharu cultural show in the evening, O/N Resort', '.', ARRAY['https://images.pexels.com/photos/32343708/pexels-photo-32343708.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_9n_10d, 6, 'Wake up breakfast and drive to next panoramic destination Pokhara, arrival and transfer to Hotel, rest of the time free personal activities, O/N at Hotel', '.', ARRAY['https://images.pexels.com/photos/36564714/pexels-photo-36564714.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_9n_10d, 7, 'AM: transfer to Sarangkot a hilltop station best for Annapurna range of Himalayan view and Sunrise', '. PM: visit Bindya Bashini temple and Mahendra cave O/N Hotel.', ARRAY['https://images.pexels.com/photos/28831413/pexels-photo-28831413.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_9n_10d, 8, 'Half day trip to David fall and Peace stupa and boating on Phewa Lake, O/N at Hotel', '.', ARRAY['https://images.pexels.com/photos/14725559/pexels-photo-14725559.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_9n_10d, 9, 'Early morning drive back to Kathmandu, arrival and transfer to Hotel, rest of time free for shopping, traditional Nepali dinner with cultural show in the evening, O/N Hotel', '.', ARRAY['https://images.pexels.com/photos/32343720/pexels-photo-32343720.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_nepal_tour_9n_10d, 10, 'Everest Mountain flight (optional) in the morning, transfer to Airport for your final departure or join our next program', '.', ARRAY['https://images.pexels.com/photos/32343708/pexels-photo-32343708.jpeg?auto=compress&cs=tinysrgb']::text[]);

  -- Variant: 3 Nights / 4 Days Srinagar, Pahalgam & Gulmarg (File: three Nights four Days - Srinagar - Pahalgam - Gulmarg.html)
  INSERT INTO "PackageVariant" (
    "id", "packageId", "slug", "label", "nights", "days", "durationText",
    "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages"
  ) VALUES (
    var_kashmir_tour_3n_4d, pkg_kashmir_tour, '3n-4d', '3 Nights / 4 Days Srinagar, Pahalgam & Gulmarg', 3, 4, '3 Nights / 4 Days',
    NULL, NULL, 56, FALSE, 'https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb', ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/25786565/pexels-photo-25786565.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/11866095/pexels-photo-11866095.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/5776631/pexels-photo-5776631.jpeg?auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/18758350/pexels-photo-18758350.jpeg?auto=compress&cs=tinysrgb']
  );

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_3n_4d, dest_srinagar, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_3n_4d, dest_gulmarg, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_kashmir_tour_3n_4d, dest_pahalgam, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_srinagar
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_gulmarg
    ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId")
    SELECT var_kashmir_tour_3n_4d, "id" FROM "Attraction" WHERE "destinationId" = dest_pahalgam
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_3n_4d, 1, 'Arrive Srinagar | Srinagar Local Sightseeing', '. Welcome to Srinagar, the Lake City. On arrival at Srinagar Airport, begin your Kashmir Tour. You will be transferred to the Hotel. Proceed on a city tour visiting the Shankar Acharya temple situated on the highest hill of Srinagar, the famous Mughal Gardens – Chashmashahi, Nishat & Shalimar. These gardens were Mughal Emperor concepts of Paradise and today these are popular picnic spots. Visit Hazratbal Dargah Also. Overnight stay in a hotel.', ARRAY['https://images.pexels.com/photos/6739193/pexels-photo-6739193.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_3n_4d, 2, 'Srinagar – Pahalgam – Srinagar After breakfast drive to Pahalgam (The valley of shepherds)', '. Which is about 96 kms from Srinagar, which will be covered in the app. 3 hours. You Can visit the saffron fields of pampore, Awantipura Ruins (1100 years old temple of Lord Vishnu built by the King Awantivarman), Mattan Temple, on En-route. Drive through the pine forests. Arrive at Pahalgam and You can go for Pony ride, visit Kashmir Valley, Dabyan, Baisaran/ mini-Switzerland, Denow Valley Waterfall (At your own cost). visit Aru, betaab valley and chandanwari(at Own cost). Evening return dinner and Overnight stay.', ARRAY['https://images.pexels.com/photos/25786565/pexels-photo-25786565.jpeg?auto=compress&cs=tinysrgb']::text[]);
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_kashmir_tour_3n_4d, 3, 'Srinagar –Gulmarg– Srinagar, After breakfast check out from the hotel in Srinagar drive to Gulmarg (2440 Meters above Sea level)', '. It is one of the most beautiful hill stations and also called “Meadows of Flower”. It has the world’s highest golf course and Gulmarg is also famous for winter sports like skiing. On arrival and after refreshment one can visit Jai Jai Shiv Shankar Temple and also enjoy a Gondola ride (Cable car, own cost) from Gulmarg to Kongdori and affarwat. Evening return dinner and overnight stay Srinagar. Day 04: Return Home with Happy Memories: After breakfast transfer to Srinagar Airport to board your flight with Sweet memories.', ARRAY['https://images.pexels.com/photos/11866095/pexels-photo-11866095.jpeg?auto=compress&cs=tinysrgb']::text[]);

  RAISE NOTICE '✅ Seeding Relational Packages & Variants Completed Successfully!';
END $$;
