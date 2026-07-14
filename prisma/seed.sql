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
  "latitude", "longitude", "updatedAt"
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
  (gen_random_uuid(), 'Varanasi', 'varanasi', up_state, india_id, 'PILGRIMAGE', TRUE, 'Varanasi, one of the world''s oldest cities, is India''s spiritual capital. The ghats along the Ganges, evening Ganga Aarti, and ancient temples make it unforgettable.', 'October to March', 'Humid subtropical', 25.3176, 82.9739, '', 'Varanasi Tour Packages | Spiritual City of India | Ganga Aarti', 'Visit Varanasi, the spiritual heart of India. Witness Ganga Aarti, ancient ghats and temples. Book with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Mathura', 'mathura', up_state, india_id, 'PILGRIMAGE', FALSE, 'Mathura is the birthplace of Lord Krishna, a sacred city on the banks of the Yamuna river with over 1,000 temples.', 'October to March', 'Semi-arid', 27.4924, 77.6737, '', 'Mathura Tour Packages | Krishna Birthplace | Pilgrimage Tour', 'Visit Mathura, birthplace of Lord Krishna. Best Mathura tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Ayodhya', 'ayodhya', up_state, india_id, 'PILGRIMAGE', FALSE, 'Ayodhya, birthplace of Lord Ram, is one of the seven sacred cities in Hinduism and home to the newly constructed Ram Mandir.', 'October to March', 'Humid subtropical', 26.7957, 82.1997, '', 'Ayodhya Tour Packages | Ram Mandir | Pilgrimage Tour', 'Visit Ayodhya and Ram Mandir. Best Ayodhya pilgrimage tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Prayagraj', 'prayagraj', up_state, india_id, 'PILGRIMAGE', FALSE, 'Prayagraj (Allahabad) is the confluence of Ganga, Yamuna, and Saraswati rivers — a sacred site and venue of the Kumbh Mela.', 'October to March', 'Humid subtropical', 25.4358, 81.8463, '', 'Prayagraj Tour Packages | Sangam | Kumbh Mela | Pilgrimage', 'Visit Prayagraj Sangam. Best Prayagraj tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Khajuraho', 'khajuraho', mp_state, india_id, 'HERITAGE', FALSE, 'Khajuraho is world-famous for its group of stunning medieval Hindu and Jain temples adorned with erotic sculptures.', 'October to March', 'Tropical', 24.8318, 79.9199, '', 'Khajuraho Tour Packages | Temple Heritage | UNESCO World Heritage', 'Visit Khajuraho temples. Best Khajuraho tour packages by Mother India Tour Travels.', NOW(), NOW()),
  -- Rajasthan
  (gen_random_uuid(), 'Jaipur', 'jaipur', raj_state, india_id, 'HERITAGE', TRUE, 'Jaipur, the Pink City, is the capital of Rajasthan. Known for its stunning palaces, forts, and vibrant bazaars — a treasure trove of Rajput heritage.', 'October to March', 'Semi-arid – very hot summers, mild winters', 26.9124, 75.7873, 'https://img.freepik.com/free-photo/hawa-mahal-palace-jaipur-india_53876-31311.jpg', 'Jaipur Tour Packages | Pink City Holiday Deals | Rajasthan', 'Explore Jaipur, the Pink City of India. Best Jaipur tour packages including Amber Fort, Hawa Mahal and more. Book with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Pushkar', 'pushkar', raj_state, india_id, 'PILGRIMAGE', FALSE, 'Pushkar is a sacred Hindu pilgrimage town beside a holy lake, famous for the annual Camel Fair — one of the world''s largest livestock fairs.', 'October to March', 'Semi-arid', 26.4897, 74.5554, '', 'Pushkar Tour Packages | Camel Fair | Rajasthan Pilgrimage', 'Visit Pushkar, the holy lake town. Best Pushkar tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Ranthambore', 'ranthambore', raj_state, india_id, 'WILDLIFE', FALSE, 'Ranthambore National Park is India''s most famous tiger reserve, where you can spot Bengal tigers in the ruins of a medieval fort.', 'October to June', 'Semi-arid', 25.9931, 76.5026, '', 'Ranthambore Tour Packages | Tiger Safari | Wildlife Tour', 'Book Ranthambore tiger safari tour packages. Best wildlife holidays by Mother India Tour Travels.', NOW(), NOW()),
  -- Himachal Pradesh
  (gen_random_uuid(), 'Shimla', 'shimla', hp_state, india_id, 'HILL_STATION', TRUE, 'Shimla, the former summer capital of British India, is a charming hill station known for its colonial architecture, apple orchards, and scenic Himalayan views.', 'March to June, September to November', 'Highland – cool summers, snowy winters', 31.1048, 77.1734, '', 'Shimla Tour Packages | Himachal Pradesh Holiday | Best Deals', 'Book Shimla tour packages. Explore Mall Road, colonial architecture and scenic Himalayas. Shimla holiday packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Manali', 'manali', hp_state, india_id, 'ADVENTURE', TRUE, 'Manali is a high-altitude Himalayan resort town known for skiing, trekking, adventure sports, and breathtaking views of snow-capped mountains.', 'October to June (snow), July to September (trekking)', 'Alpine – cold winters with heavy snowfall', 32.2396, 77.1887, '', 'Manali Tour Packages | Himachal Pradesh | Snow Adventure', 'Book Manali tour packages for adventure, snow and scenic beauty. Best Manali holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Uttarakhand
  (gen_random_uuid(), 'Rishikesh', 'rishikesh', uk_state, india_id, 'ADVENTURE', TRUE, 'Rishikesh, the Yoga Capital of the World, sits at the Himalayan foothills. Famous for ashrams, river rafting, bungee jumping, and the iconic Laxman Jhula.', 'September to November, February to May', 'Humid subtropical', 30.0869, 78.2676, '', 'Rishikesh Tour Packages | Yoga Capital | River Rafting', 'Book Rishikesh tour packages. Yoga, meditation, river rafting and more. Best Rishikesh holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Haridwar', 'haridwar', uk_state, india_id, 'PILGRIMAGE', FALSE, 'Haridwar is one of the seven holiest places in Hinduism. The evening Ganga Aarti at Har Ki Pauri ghat is a spectacular spiritual experience.', 'October to March', 'Humid subtropical', 29.9457, 78.1642, '', 'Haridwar Tour Packages | Ganga Aarti | Spiritual Travel India', 'Visit Haridwar with Mother India Tour Travels. Experience the sacred Ganga Aarti. Best Haridwar tour packages.', NOW(), NOW()),
  (gen_random_uuid(), 'Mussoorie', 'mussoorie', uk_state, india_id, 'HILL_STATION', FALSE, 'Mussoorie, the Queen of Hills, is a charming hill station with colonial-era hotels, Kempty Falls, and panoramic Himalayan views.', 'March to June, September to November', 'Highland', 30.4598, 78.0772, '', 'Mussoorie Tour Packages | Queen of Hills | Hill Station Holiday', 'Book Mussoorie tour packages. Explore colonial charm and Himalayan views. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Jim Corbett', 'jim-corbett', uk_state, india_id, 'WILDLIFE', FALSE, 'Jim Corbett National Park is India''s oldest national park, home to Bengal tigers, elephants, and over 600 species of birds.', 'November to June', 'Subtropical', 29.5300, 78.7747, '', 'Jim Corbett Tour Packages | Tiger Safari | Wildlife Holiday', 'Book Jim Corbett National Park safari packages. Tiger safari and wildlife tours by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Nainital', 'nainital', uk_state, india_id, 'HILL_STATION', FALSE, 'Nainital is a charming lake district hill station with the serene Naini Lake, surrounded by forested mountains and a colonial-era town.', 'March to June, September to November', 'Highland', 29.3801, 79.4582, '', 'Nainital Tour Packages | Lake District | Hill Station Holiday', 'Book Nainital tour packages. Naini Lake, boating and scenic Himalayas. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Jammu & Kashmir / Ladakh
  (gen_random_uuid(), 'Srinagar', 'srinagar', jk_state, india_id, 'CITY', TRUE, 'Srinagar, the summer capital of Jammu & Kashmir, is famous for its Dal Lake houseboats, Mughal Gardens, and stunning surrounding peaks.', 'April to October', 'Highland continental', 34.0837, 74.7973, '', 'Srinagar Tour Packages | Kashmir Tour | Dal Lake Houseboat', 'Book Srinagar Kashmir tour packages. Experience Dal Lake houseboats, Mughal Gardens and snow peaks. Best Kashmir tours by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Gulmarg', 'gulmarg', jk_state, india_id, 'ADVENTURE', FALSE, 'Gulmarg, the Meadow of Flowers, is Asia''s highest and largest ski resort, offering world-class skiing, a gondola, and breathtaking views.', 'December to March (skiing), April to June (spring)', 'Alpine', 34.0500, 74.3800, '', 'Gulmarg Tour Packages | Ski Resort | Kashmir Snow Adventure', 'Book Gulmarg ski resort packages. Asia''s highest ski resort and gondola ride. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Pahalgam', 'pahalgam', jk_state, india_id, 'ADVENTURE', FALSE, 'Pahalgam, the Valley of Shepherds, is a scenic town on the Lidder River — base camp for Amarnath Yatra and stunning Himalayan treks.', 'May to October', 'Highland', 34.0167, 75.3167, '', 'Pahalgam Tour Packages | Kashmir Valley | Amarnath Yatra', 'Book Pahalgam Kashmir tour packages. Beautiful valleys, trekking and Amarnath Yatra. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Leh', 'leh', ladakh_state, india_id, 'ADVENTURE', FALSE, 'Leh, the capital of Ladakh, is a high-altitude desert town of ancient monasteries, stunning mountain landscapes, and the famed Khardung La pass.', 'May to September', 'Cold desert', 34.1526, 77.5771, '', 'Leh Ladakh Tour Packages | High Altitude Adventure | Best Deals', 'Book Leh Ladakh tour packages. Pangong Lake, Nubra Valley, monasteries. Best Ladakh adventure tours by Mother India Tour Travels.', NOW(), NOW()),
  -- West Bengal / Sikkim
  (gen_random_uuid(), 'Darjeeling', 'darjeeling', wb_state, india_id, 'HILL_STATION', TRUE, 'Darjeeling, the Queen of Hills, offers spectacular views of Kangchenjunga, world-famous tea gardens, and the charming Darjeeling Himalayan Railway toy train.', 'March to May, September to November', 'Highland – cool and foggy', 27.0410, 88.2627, '', 'Darjeeling Tour Packages | Tea Garden Holiday | Hill Station', 'Explore Darjeeling''s tea gardens, toy train and Himalayan views. Best Darjeeling tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Gangtok', 'gangtok', sikkim_state, india_id, 'CITY', FALSE, 'Gangtok, the capital of Sikkim, offers beautiful mountain scenery, Buddhist monasteries, and cable car rides with views of Kangchenjunga.', 'March to May, October to December', 'Subtropical highland', 27.3314, 88.6138, '', 'Gangtok Tour Packages | Sikkim Holiday | Monastery Tours', 'Book Gangtok Sikkim tour packages. Explore monasteries, mountain views and Nathu La Pass. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Pelling', 'pelling', sikkim_state, india_id, 'HILL_STATION', FALSE, 'Pelling is a small hill town in West Sikkim offering magnificent close-up views of Kangchenjunga and ancient Pemayangtse Monastery.', 'March to May, September to December', 'Highland', 27.2885, 88.2433, '', 'Pelling Tour Packages | Sikkim | Kangchenjunga Views', 'Book Pelling Sikkim tour packages. Stunning mountain views and monasteries. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Kerala
  (gen_random_uuid(), 'Cochin', 'cochin', kerala_state, india_id, 'CITY', FALSE, 'Cochin (Kochi) is Kerala''s largest city and a major port, known for its colonial heritage, Chinese fishing nets, and vibrant cultural scene.', 'October to March', 'Tropical monsoon', 9.9312, 76.2673, '', 'Cochin Tour Packages | Kochi Kerala | Heritage City Tours', 'Explore Cochin with its colonial heritage and backwaters. Best Cochin tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Munnar', 'munnar', kerala_state, india_id, 'HILL_STATION', TRUE, 'Munnar is a hill station in Kerala known for its vast tea plantations, misty mountains, and lush green scenery.', 'September to March', 'Subtropical highland – cool and misty', 10.0889, 77.0597, '', 'Munnar Tour Packages | Kerala Tea Garden | Hill Station', 'Book Munnar tour packages. Explore tea gardens, national parks and scenic hills. Best Munnar holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Alleppey', 'alleppey', kerala_state, india_id, 'BEACH', TRUE, 'Alleppey (Alappuzha), the Venice of the East, is famous for its tranquil backwaters, houseboat cruises, and beautiful beaches.', 'November to February', 'Tropical monsoon', 9.4981, 76.3388, '', 'Alleppey Tour Packages | Kerala Backwaters | Houseboat Cruise', 'Experience Kerala''s backwaters and houseboat cruises in Alleppey. Best Alleppey tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Thekkady', 'thekkady', kerala_state, india_id, 'WILDLIFE', FALSE, 'Thekkady is home to Periyar National Park, one of India''s richest wildlife sanctuaries where you can spot elephants on boat safaris.', 'October to March', 'Tropical monsoon', 9.6031, 77.1740, '', 'Thekkady Tour Packages | Periyar National Park | Wildlife Tour', 'Book Thekkady tour packages. Periyar boat safari, elephants and spice plantations. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Goa
  (gen_random_uuid(), 'Goa', 'goa', goa_state, india_id, 'BEACH', TRUE, 'Goa, India''s smallest state, is famous for its stunning beaches, Portuguese heritage, vibrant nightlife, and seafood cuisine.', 'November to March', 'Tropical monsoon', 15.2993, 74.1240, '', 'Goa Tour Packages | Beach Holiday | Best Goa Deals', 'Book Goa tour packages. Enjoy beaches, nightlife and Portuguese heritage. Best Goa holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Andaman
  (gen_random_uuid(), 'Port Blair', 'port-blair', andaman_state, india_id, 'ISLAND', FALSE, 'Port Blair, the capital of the Andaman Islands, is the gateway to this pristine archipelago with its colonial history and crystal-clear waters.', 'November to April', 'Tropical', 11.6234, 92.7265, '', 'Port Blair Tour Packages | Andaman Islands | Best Deals', 'Book Port Blair Andaman tour packages. Cellular Jail, Ross Island, water sports. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Havelock Island', 'havelock-island', andaman_state, india_id, 'ISLAND', FALSE, 'Havelock Island (Swaraj Dweep) is home to the famous Radhanagar Beach, ranked among Asia''s most beautiful beaches.', 'November to April', 'Tropical', 12.0000, 92.9700, '', 'Havelock Island Tour | Radhanagar Beach | Andaman Holiday', 'Book Havelock Island Andaman tour packages. Radhanagar Beach, snorkeling, diving. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Nepal
  (gen_random_uuid(), 'Kathmandu', 'kathmandu', NULL, nepal_id, 'CITY', TRUE, 'Kathmandu, Nepal''s capital, is a city of temples, festivals, and mountain adventure. The Pashupatinath Temple and Boudhanath Stupa are world-famous.', 'September to November, March to May', 'Subtropical highland', 27.7172, 85.3240, '', 'Nepal Tour Packages | Kathmandu | Himalayan Holiday', 'Book Nepal tour packages to Kathmandu, Pokhara and more. Himalayan adventures and spiritual journeys. Book with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Pokhara', 'pokhara', NULL, nepal_id, 'CITY', FALSE, 'Pokhara is Nepal''s adventure capital, a lakeside city with views of the Annapurna range, perfect for trekking, paragliding, and kayaking.', 'September to November, March to May', 'Subtropical', 28.2096, 83.9856, '', 'Pokhara Tour Packages | Nepal Adventure | Annapurna Trekking', 'Book Pokhara Nepal tour packages. Phewa Lake, paragliding, Annapurna trekking. Best Nepal deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Chitwan', 'chitwan', NULL, nepal_id, 'WILDLIFE', FALSE, 'Chitwan National Park is a UNESCO World Heritage Site, home to one-horned rhinoceroses, Bengal tigers, and gharial crocodiles.', 'October to June', 'Subtropical', 27.5291, 84.4284, '', 'Chitwan Tour Packages | Nepal Safari | Rhinoceros Safari', 'Book Chitwan National Park safari packages. One-horned rhino and tiger safari. Best Nepal wildlife tours by Mother India Tour Travels.', NOW(), NOW()),
  -- Thailand
  (gen_random_uuid(), 'Bangkok', 'bangkok', NULL, thailand_id, 'CITY', TRUE, 'Bangkok, Thailand''s capital, is a city of contrasts with ancient temples, modern malls, vibrant street food, and electrifying nightlife.', 'November to April', 'Tropical savanna', 13.7563, 100.5018, '', 'Thailand Tour Packages | Bangkok Pattaya | Best Thailand Deals', 'Book Thailand tour packages. Explore Bangkok, Pattaya and Phuket. Best Thailand holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Pattaya', 'pattaya', NULL, thailand_id, 'BEACH', FALSE, 'Pattaya is a beachside resort city known for its beaches, water sports, theme parks, and vibrant nightlife scene.', 'November to April', 'Tropical savanna', 12.9236, 100.8831, '', 'Pattaya Tour Packages | Beach Resort | Thailand Holiday', 'Book Pattaya Thailand tour packages. Beaches, water sports, Coral Island. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Phuket', 'phuket', NULL, thailand_id, 'BEACH', FALSE, 'Phuket is Thailand''s largest island, famed for its stunning beaches, clear waters, vibrant nightlife at Patong, and island-hopping excursions.', 'November to April', 'Tropical monsoon', 7.8804, 98.3922, '', 'Phuket Tour Packages | Thailand Beach | Best Phuket Deals', 'Book Phuket Thailand tour packages. Patong Beach, island hopping, diving. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- Malaysia
  (gen_random_uuid(), 'Kuala Lumpur', 'kuala-lumpur', NULL, malaysia_id, 'CITY', TRUE, 'Kuala Lumpur is Malaysia''s vibrant capital featuring the iconic Petronas Twin Towers, rich multicultural food scene, and Batu Caves.', 'May to July, December to January', 'Tropical rainforest', 3.1390, 101.6869, '', 'Malaysia Tour Packages | Kuala Lumpur | Best Malaysia Deals', 'Book Malaysia tour packages. Visit Petronas Towers, Batu Caves and more. Best Malaysia holiday deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Genting Highlands', 'genting-highlands', NULL, malaysia_id, 'ADVENTURE', FALSE, 'Genting Highlands is a cool highland resort city 50km from KL, home to Resorts World Genting, theme parks, and Malaysia''s only casino.', 'Year round (best Mar-Oct)', 'Highland – cool and misty', 3.4239, 101.7944, '', 'Genting Highlands Tour | Malaysia | Theme Park Holiday', 'Book Genting Highlands Malaysia packages. Resorts World, theme parks, cool weather. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  -- UAE
  (gen_random_uuid(), 'Dubai', 'dubai', NULL, uae_id, 'CITY', TRUE, 'Dubai, a jewel in the desert, is a city of superlatives – the world''s tallest building, largest mall, and most luxurious hotels.', 'November to March', 'Hot desert', 25.2048, 55.2708, '', 'Dubai Tour Packages | UAE Holiday | Best Dubai Deals', 'Book Dubai tour packages. Visit Burj Khalifa, Desert Safari and more. Best Dubai holiday deals by Mother India Tour Travels.', NOW(), NOW())
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
(gen_random_uuid(), 'faq', 'Have Questions?', 'We''ve got answers to the most common travel questions from our customers.', 'https://motherindiatourtravels.com/images/trip_ladakh.png'),
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
-- RELATIONAL PACKAGES, VARIANTS, & ITINERARIES (AUTOGENERATED FROM OLD HTML)
-- ─────────────────────────────────────────────
DO $$
DECLARE
  -- Country IDs
  india_id TEXT; nepal_id TEXT; thailand_id TEXT; malaysia_id TEXT; uae_id TEXT; singapore_id TEXT;
  
  -- State IDs
  delhi_state TEXT; up_state TEXT; raj_state TEXT; hp_state TEXT; uk_state TEXT;
  jk_state TEXT; kerala_state TEXT; goa_state TEXT; wb_state TEXT; sikkim_state TEXT;
  andaman_state TEXT; mp_state TEXT; tn_state TEXT; kar_state TEXT; ladakh_state TEXT;
  punjab_state TEXT; chandigarh_state TEXT;

  -- Category IDs
  dom_cat TEXT; int_cat TEXT; north_cat TEXT; south_cat TEXT;
  honey_cat TEXT; fam_cat TEXT; spirit_cat TEXT; adv_cat TEXT; beach_cat TEXT; hill_cat TEXT;
  wild_cat TEXT; raj_cat TEXT;

  -- New Destination variables
  chandigarh_dest TEXT; kedarnath_dest TEXT; badrinath_dest TEXT; kullu_dest TEXT;
  dalhousie_dest TEXT; lumbini_dest TEXT; jodhpur_dest TEXT; gangotri_dest TEXT;
  amritsar_dest TEXT; udaipur_dest TEXT; jaisalmer_dest TEXT; yamunotri_dest TEXT;
  bikaner_dest TEXT; dharamshala_dest TEXT; chitrakoot_dest TEXT; mandawa_dest TEXT;
  neil_island_dest TEXT; katra_dest TEXT; vaishno_devi_dest TEXT;

  -- Existing Destination variables
  delhi_dest TEXT; agra_dest TEXT; varanasi_dest TEXT; mathura_dest TEXT;
  ayodhya_dest TEXT; prayagraj_dest TEXT; khajuraho_dest TEXT; jaipur_dest TEXT;
  pushkar_dest TEXT; ranthambore_dest TEXT; shimla_dest TEXT; manali_dest TEXT;
  rishikesh_dest TEXT; haridwar_dest TEXT; mussoorie_dest TEXT; jim_corbett_dest TEXT;
  nainital_dest TEXT; srinagar_dest TEXT; gulmarg_dest TEXT; pahalgam_dest TEXT;
  leh_dest TEXT; darjeeling_dest TEXT; gangtok_dest TEXT; pelling_dest TEXT;
  cochin_dest TEXT; munnar_dest TEXT; alleppey_dest TEXT; thekkady_dest TEXT;
  goa_dest TEXT; port_blair_dest TEXT; havelock_island_dest TEXT; kathmandu_dest TEXT;
  pokhara_dest TEXT; chitwan_dest TEXT; bangkok_dest TEXT; pattaya_dest TEXT;
  phuket_dest TEXT; kuala_lumpur_dest TEXT; genting_highlands_dest TEXT; dubai_dest TEXT;

  -- Package IDs
  pkg_id TEXT;
  var_id TEXT;
BEGIN
  -- Get Country IDs
  SELECT "id" INTO india_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO nepal_id FROM "Country" WHERE "slug" = 'nepal';
  SELECT "id" INTO thailand_id FROM "Country" WHERE "slug" = 'thailand';
  SELECT "id" INTO malaysia_id FROM "Country" WHERE "slug" = 'malaysia';
  SELECT "id" INTO uae_id FROM "Country" WHERE "slug" = 'uae';
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
  SELECT "id" INTO tn_state FROM "State" WHERE "slug" = 'tamil-nadu';
  SELECT "id" INTO kar_state FROM "State" WHERE "slug" = 'karnataka';
  SELECT "id" INTO ladakh_state FROM "State" WHERE "slug" = 'ladakh';
  SELECT "id" INTO punjab_state FROM "State" WHERE "slug" = 'punjab';
  SELECT "id" INTO chandigarh_state FROM "State" WHERE "slug" = 'chandigarh-ut';

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
  SELECT "id" INTO wild_cat FROM "Category" WHERE "slug" = 'wildlife-tour-packages';
  SELECT "id" INTO raj_cat FROM "Category" WHERE "slug" = 'rajasthan-tour-packages';


  -- ─────────────────────────────────────────────
  -- INSERT NEW DESTINATIONS
  -- ─────────────────────────────────────────────
  INSERT INTO "Destination" ("id","name","slug","stateId","countryId","type","isFeatured","description","bestTimeToVisit","climate","latitude","longitude","image","seoTitle","seoDescription","createdAt","updatedAt") VALUES
  (gen_random_uuid(), 'Chandigarh', 'chandigarh', chandigarh_state, india_id, 'CITY', FALSE, 'Chandigarh is a modern planned city serving as the capital of Punjab and Haryana, designed by Le Corbusier.', 'October to March', 'Humid subtropical', 30.7333, 76.7794, '', 'Chandigarh Tour Packages | Capital City Holiday', 'Visit Chandigarh with Mother India Tour Travels. Best sightseeing packages.', NOW(), NOW()),
  (gen_random_uuid(), 'Kedarnath', 'kedarnath', uk_state, india_id, 'PILGRIMAGE', FALSE, 'Kedarnath is a sacred Hindu town in Uttarakhand, famous for the Kedarnath Temple dedicated to Lord Shiva.', 'May to June, September to October', 'Cold Alpine', 30.7352, 79.0669, '', 'Kedarnath Tour Packages | Char Dham Pilgrimage', 'Book Kedarnath temple pilgrimage tours with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Badrinath', 'badrinath', uk_state, india_id, 'PILGRIMAGE', FALSE, 'Badrinath is a holy town in Uttarakhand, home to the Badrinath Temple dedicated to Lord Vishnu.', 'May to June, September to October', 'Cold Alpine', 30.7433, 79.4938, '', 'Badrinath Tour Packages | Char Dham Pilgrimage', 'Book Badrinath temple pilgrimage tours with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Kullu', 'kullu', hp_state, india_id, 'HILL_STATION', FALSE, 'Kullu is a beautiful open valley in Himachal Pradesh, famous for its scenic beauty and temples.', 'March to June, September to November', 'Temperate', 31.9578, 77.1095, '', 'Kullu Tour Packages | Himachal Valley Holiday', 'Explore Kullu valley. Best holiday packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Dalhousie', 'dalhousie', hp_state, india_id, 'HILL_STATION', FALSE, 'Dalhousie is a high-altitude town in Himachal Pradesh, known for colonial-era buildings and pine-clad valleys.', 'March to June, September to November', 'Highland cool', 32.5387, 75.9710, '', 'Dalhousie Tour Packages | Hill Station Holiday', 'Book Dalhousie tour packages. Best hill station holidays by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Lumbini', 'lumbini', NULL, nepal_id, 'PILGRIMAGE', FALSE, 'Lumbini is a Buddhist pilgrimage site in Nepal, the birthplace of Siddhartha Gautama (Lord Buddha).', 'October to March', 'Subtropical', 27.5020, 83.2758, '', 'Lumbini Tour Packages | Birthplace of Buddha Pilgrimage', 'Visit sacred Lumbini birthplace of Lord Buddha with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Jodhpur', 'jodhpur', raj_state, india_id, 'HERITAGE', FALSE, 'Jodhpur, the Blue City, is famous for its majestic Mehrangarh Fort, palaces, and heritage architecture.', 'October to March', 'Hot semi-arid', 26.2389, 73.0243, '', 'Jodhpur Tour Packages | Blue City Rajasthan Holiday', 'Explore Jodhpur Mehrangarh Fort. Best Rajasthan holiday packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Gangotri', 'gangotri', uk_state, india_id, 'PILGRIMAGE', FALSE, 'Gangotri is a sacred pilgrim town in Uttarakhand, the source of the holy River Ganges.', 'May to June, September to October', 'Cold Alpine', 30.9944, 78.9398, '', 'Gangotri Tour Packages | Char Dham Pilgrimage', 'Book Gangotri pilgrimage tours with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Amritsar', 'amritsar', punjab_state, india_id, 'PILGRIMAGE', FALSE, 'Amritsar is the spiritual and cultural center of the Sikh religion, famous for the Golden Temple.', 'October to March', 'Semiarid continental', 31.6340, 74.8723, '', 'Amritsar Tour Packages | Golden Temple Tour Deals', 'Visit Amritsar Golden Temple and Wagah Border. Best deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Udaipur', 'udaipur', raj_state, india_id, 'HERITAGE', FALSE, 'Udaipur, the City of Lakes, is known for its historic palaces and beautiful scenic lakes.', 'October to March', 'Humid subtropical', 24.5854, 73.7125, '', 'Udaipur Tour Packages | City of Lakes Rajasthan Holiday', 'Book Udaipur heritage tours. Romantic lake city holiday by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Jaisalmer', 'jaisalmer', raj_state, india_id, 'HERITAGE', FALSE, 'Jaisalmer, the Golden City, is famous for its sandstone fort, desert safaris, and camel treks.', 'October to March', 'Hot desert', 26.9157, 70.9083, '', 'Jaisalmer Tour Packages | Golden City Desert Safari', 'Experience Jaisalmer desert camping and fort tours. Book with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Yamunotri', 'yamunotri', uk_state, india_id, 'PILGRIMAGE', FALSE, 'Yamunotri is a sacred pilgrim town in Uttarakhand, the source of the Yamuna River.', 'May to June, September to October', 'Cold Alpine', 31.0100, 78.4500, '', 'Yamunotri Tour Packages | Char Dham Pilgrimage', 'Book Yamunotri temple pilgrimage tours with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Bikaner', 'bikaner', raj_state, india_id, 'HERITAGE', FALSE, 'Bikaner is a desert city in Rajasthan, famous for its Junagarh Fort, camel breeding, and sweets.', 'October to March', 'Hot desert', 28.0167, 73.3119, '', 'Bikaner Tour Packages | Rajasthan Desert Holiday', 'Visit Bikaner Junagarh Fort and camel farms. Book with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Dharamshala', 'dharamshala', hp_state, india_id, 'HILL_STATION', FALSE, 'Dharamshala is a scenic hill station in Himachal Pradesh, home to the Dalai Lama and Tibetan culture.', 'March to June, September to November', 'Humid subtropical highland', 32.2190, 76.3234, '', 'Dharamshala Tour Packages | Little Lhasa Tibetan Holiday', 'Book Dharamshala McLeod Ganj packages. Best Himalayan deals by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Chitrakoot', 'chitrakoot', up_state, india_id, 'PILGRIMAGE', FALSE, 'Chitrakoot is a sacred pilgrimage town in Uttar Pradesh, where Lord Rama spent his exile.', 'October to March', 'Humid subtropical', 25.1114, 80.8549, '', 'Chitrakoot Tour Packages | Holy Pilgrimage Tour', 'Visit Chitrakoot holy ghats and temples. Book with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Mandawa', 'mandawa', raj_state, india_id, 'HERITAGE', FALSE, 'Mandawa is a small town in Rajasthan, famous for its beautifully painted havelis and fort.', 'October to March', 'Hot desert', 28.0531, 75.1420, '', 'Mandawa Tour Packages | Painted Havelis Rajasthan', 'Explore Mandawa painted havelis. Best heritage tour packages by Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Neil Island', 'neil-island', andaman_state, india_id, 'ISLAND', FALSE, 'Neil Island (Shaheed Dweep) is a quiet island in Andamans, famous for coral reefs, white sand beaches, and peaceful vibes.', 'November to April', 'Tropical', 11.8340, 93.0515, '', 'Neil Island Tour Packages | Andaman Beach Holiday', 'Book Neil Island tour packages with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Katra', 'katra', jk_state, india_id, 'PILGRIMAGE', FALSE, 'Katra is a small town in Jammu and Kashmir, serving as the gateway to the holy shrine of Vaishno Devi.', 'Year round', 'Subtropical', 32.9917, 74.9317, '', 'Katra Tour Packages | Gateway to Vaishno Devi', 'Book Katra tour packages and Vaishno Devi yatra with Mother India Tour Travels.', NOW(), NOW()),
  (gen_random_uuid(), 'Vaishno Devi', 'vaishno-devi', jk_state, india_id, 'PILGRIMAGE', FALSE, 'Vaishno Devi is a holy cave temple dedicated to the Mother Goddess, located on the Trikuta Hills.', 'Year round', 'Subtropical cool', 33.0308, 74.9490, '', 'Vaishno Devi Tour Packages | Holy Cave Yatra', 'Book Vaishno Devi yatra tour packages with Mother India Tour Travels.', NOW(), NOW())
  ON CONFLICT ("slug") DO UPDATE SET "latitude"=EXCLUDED."latitude", "longitude"=EXCLUDED."longitude";


  -- Get new destination IDs
  SELECT "id" INTO chandigarh_dest FROM "Destination" WHERE "slug" = 'chandigarh';
  SELECT "id" INTO kedarnath_dest FROM "Destination" WHERE "slug" = 'kedarnath';
  SELECT "id" INTO badrinath_dest FROM "Destination" WHERE "slug" = 'badrinath';
  SELECT "id" INTO kullu_dest FROM "Destination" WHERE "slug" = 'kullu';
  SELECT "id" INTO dalhousie_dest FROM "Destination" WHERE "slug" = 'dalhousie';
  SELECT "id" INTO lumbini_dest FROM "Destination" WHERE "slug" = 'lumbini';
  SELECT "id" INTO jodhpur_dest FROM "Destination" WHERE "slug" = 'jodhpur';
  SELECT "id" INTO gangotri_dest FROM "Destination" WHERE "slug" = 'gangotri';
  SELECT "id" INTO amritsar_dest FROM "Destination" WHERE "slug" = 'amritsar';
  SELECT "id" INTO udaipur_dest FROM "Destination" WHERE "slug" = 'udaipur';
  SELECT "id" INTO jaisalmer_dest FROM "Destination" WHERE "slug" = 'jaisalmer';
  SELECT "id" INTO yamunotri_dest FROM "Destination" WHERE "slug" = 'yamunotri';
  SELECT "id" INTO bikaner_dest FROM "Destination" WHERE "slug" = 'bikaner';
  SELECT "id" INTO dharamshala_dest FROM "Destination" WHERE "slug" = 'dharamshala';
  SELECT "id" INTO chitrakoot_dest FROM "Destination" WHERE "slug" = 'chitrakoot';
  SELECT "id" INTO mandawa_dest FROM "Destination" WHERE "slug" = 'mandawa';
  SELECT "id" INTO neil_island_dest FROM "Destination" WHERE "slug" = 'neil-island';
  SELECT "id" INTO katra_dest FROM "Destination" WHERE "slug" = 'katra';
  SELECT "id" INTO vaishno_devi_dest FROM "Destination" WHERE "slug" = 'vaishno-devi';

  -- Get existing destination IDs
  SELECT "id" INTO delhi_dest FROM "Destination" WHERE "slug" = 'delhi';
  SELECT "id" INTO agra_dest FROM "Destination" WHERE "slug" = 'agra';
  SELECT "id" INTO varanasi_dest FROM "Destination" WHERE "slug" = 'varanasi';
  SELECT "id" INTO mathura_dest FROM "Destination" WHERE "slug" = 'mathura';
  SELECT "id" INTO ayodhya_dest FROM "Destination" WHERE "slug" = 'ayodhya';
  SELECT "id" INTO prayagraj_dest FROM "Destination" WHERE "slug" = 'prayagraj';
  SELECT "id" INTO khajuraho_dest FROM "Destination" WHERE "slug" = 'khajuraho';
  SELECT "id" INTO jaipur_dest FROM "Destination" WHERE "slug" = 'jaipur';
  SELECT "id" INTO pushkar_dest FROM "Destination" WHERE "slug" = 'pushkar';
  SELECT "id" INTO ranthambore_dest FROM "Destination" WHERE "slug" = 'ranthambore';
  SELECT "id" INTO shimla_dest FROM "Destination" WHERE "slug" = 'shimla';
  SELECT "id" INTO manali_dest FROM "Destination" WHERE "slug" = 'manali';
  SELECT "id" INTO rishikesh_dest FROM "Destination" WHERE "slug" = 'rishikesh';
  SELECT "id" INTO haridwar_dest FROM "Destination" WHERE "slug" = 'haridwar';
  SELECT "id" INTO mussoorie_dest FROM "Destination" WHERE "slug" = 'mussoorie';
  SELECT "id" INTO jim_corbett_dest FROM "Destination" WHERE "slug" = 'jim-corbett';
  SELECT "id" INTO nainital_dest FROM "Destination" WHERE "slug" = 'nainital';
  SELECT "id" INTO srinagar_dest FROM "Destination" WHERE "slug" = 'srinagar';
  SELECT "id" INTO gulmarg_dest FROM "Destination" WHERE "slug" = 'gulmarg';
  SELECT "id" INTO pahalgam_dest FROM "Destination" WHERE "slug" = 'pahalgam';
  SELECT "id" INTO leh_dest FROM "Destination" WHERE "slug" = 'leh';
  SELECT "id" INTO darjeeling_dest FROM "Destination" WHERE "slug" = 'darjeeling';
  SELECT "id" INTO gangtok_dest FROM "Destination" WHERE "slug" = 'gangtok';
  SELECT "id" INTO pelling_dest FROM "Destination" WHERE "slug" = 'pelling';
  SELECT "id" INTO cochin_dest FROM "Destination" WHERE "slug" = 'cochin';
  SELECT "id" INTO munnar_dest FROM "Destination" WHERE "slug" = 'munnar';
  SELECT "id" INTO alleppey_dest FROM "Destination" WHERE "slug" = 'alleppey';
  SELECT "id" INTO thekkady_dest FROM "Destination" WHERE "slug" = 'thekkady';
  SELECT "id" INTO goa_dest FROM "Destination" WHERE "slug" = 'goa';
  SELECT "id" INTO port_blair_dest FROM "Destination" WHERE "slug" = 'port-blair';
  SELECT "id" INTO havelock_island_dest FROM "Destination" WHERE "slug" = 'havelock-island';
  SELECT "id" INTO kathmandu_dest FROM "Destination" WHERE "slug" = 'kathmandu';
  SELECT "id" INTO pokhara_dest FROM "Destination" WHERE "slug" = 'pokhara';
  SELECT "id" INTO chitwan_dest FROM "Destination" WHERE "slug" = 'chitwan';
  SELECT "id" INTO bangkok_dest FROM "Destination" WHERE "slug" = 'bangkok';
  SELECT "id" INTO pattaya_dest FROM "Destination" WHERE "slug" = 'pattaya';
  SELECT "id" INTO phuket_dest FROM "Destination" WHERE "slug" = 'phuket';
  SELECT "id" INTO kuala_lumpur_dest FROM "Destination" WHERE "slug" = 'kuala-lumpur';
  SELECT "id" INTO genting_highlands_dest FROM "Destination" WHERE "slug" = 'genting-highlands';
  SELECT "id" INTO dubai_dest FROM "Destination" WHERE "slug" = 'dubai';


  -- ─────────────────────────────────────────────
  -- INSERT NEW ATTRACTIONS
  -- ─────────────────────────────────────────────
  INSERT INTO "Attraction" ("id","name","slug","destinationId","description","latitude","longitude","sortOrder") VALUES
  (gen_random_uuid(), 'Golden Temple', 'golden-temple', amritsar_dest, 'The holiest Gurdwara and the most sacred site of Sikhism, famous for its stunning golden facade and community kitchen.', 31.61998, 74.876485, 1),
  (gen_random_uuid(), 'Wagah Border', 'wagah-border', amritsar_dest, 'The international border post between India and Pakistan, famous for its daily military ceremony and patriotic crowds.', 31.60458, 74.57242, 2),
  (gen_random_uuid(), 'City Palace Udaipur', 'city-palace-udaipur', udaipur_dest, 'A magnificent palace complex built on the banks of Lake Pichola, showcasing Rajput and Mughal heritage.', 24.57639, 73.6835, 1),
  (gen_random_uuid(), 'Lake Pichola', 'lake-pichola', udaipur_dest, 'An artificial fresh water lake, created in the year 1362, famous for boat rides and scenic island palaces.', 24.5786, 73.6738, 2),
  (gen_random_uuid(), 'Jaisalmer Fort', 'jaisalmer-fort', jaisalmer_dest, 'One of the very few "living forts" in the world, built in 1156, standing majestic on the Trikuta Hill.', 26.9124, 70.9126, 1),
  (gen_random_uuid(), 'Mehrangarh Fort', 'mehrangarh-fort', jodhpur_dest, 'One of the largest forts in India, built in 1459, towering 122 meters above Jodhpur with museum exhibits.', 26.2435, 73.0189, 1),
  (gen_random_uuid(), 'Rock Garden', 'rock-garden-chandigarh', chandigarh_dest, 'A unique sculpture garden created by Nek Chand using recycled waste materials and industrial debris.', 30.7525, 76.8012, 1),
  (gen_random_uuid(), 'Sukhna Lake', 'sukhna-lake', chandigarh_dest, 'A reservoir at the foothills of the Himalayas, popular for boating, walking, and scenic sunset views.', 30.7423, 76.8152, 2),
  (gen_random_uuid(), 'Vaishno Devi Temple', 'vaishno-devi-temple', vaishno_devi_dest, 'A highly revered Hindu cave temple dedicated to the Mother Goddess, located on the Trikuta Mountains.', 33.0308, 74.9490, 1),
  (gen_random_uuid(), 'Junagarh Fort', 'junagarh-fort-bikaner', bikaner_dest, 'A massive fort complex built in the 16th century, showcasing ornate palaces, courtyards, and pavilions.', 28.0232, 73.3134, 1)
  ON CONFLICT ("slug") DO UPDATE SET "description"=EXCLUDED."description";


  -- ─────────────────────────────────────────────
  -- INSERT PACKAGES & VARIANTS
  -- ─────────────────────────────────────────────


  -- Package: Andaman relaxing tour
  pkg_id := 'andaman-relaxing-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'andaman-relaxing-tour', 'Andaman relaxing tour',
    'Explore the beautiful sights of Andaman. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Andaman relaxing tour for 06 Night 07 Days'],
    ARRAY['Accommodation on a double sharing basis at the above-mentioned hotels / similar in base category rooms.', 'Exclusive a/c vehicle sanitized every time before boarding for pick up and drop as per the itinerary (not at disposal).', 'Daily breakfast Only.', 'Airport pick up and drop by a/c vehicle.', 'similar in base category rooms.', 'Assistance at all arrival and departure points.'],
    ARRAY['Airfare / Ship''s fare.', 'All kinds of personal expenses such as tips, laundry, telephone bills and beverages.', 'It does not include any meals unless and otherwise specifically mentioned.', 'Guide, Jolly ride & snorkeling charges.', 'Optional, suggested or unspecified activities.', 'Guide at Cellular jail will cost extra.', 'Camera fee (still or movie)', 'Additional usage of vehicles.', 'Makruzz / Green Ocean Cruise / Sea Link / ITT Majestic (base category) for Neil & Havelock as per the availability.', 'Entry permits | Entry tickets | Parking charges | Boat/ferry tickets'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg',
    ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Andaman relaxing tour.',
    FALSE, TRUE,
    ARRAY['delhi'],
    india_id,
    delhi_state,
    'Andaman relaxing tour | Mother India Tour Travels',
    'Explore the beautiful sights of Andaman. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memora',
    ARRAY['delhi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'ARRIVAL', 'PORT BLAIR – CELLULAR JAIL – LIGHT & SOUND SHOW Arrival to Port Blair. Meet our representative, who will assist you to transfer you to the hotel. First half of the day is at leisure. Later in the afternoon visit Carbyn Cove Beach and Cellular jail followed by light and sound show. The Cellular Jail was the pilgrimage destination for freedom fighters. Many freedom fighters spent time here during the freedom struggle against the British Government. The day draws to a gentle close with the Sound and Light Show at the historic Cellular Jail which gives you a vivid experience of its strong association with the freedom fighters and their struggle. Come back to the hotel for overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'PORT BLAIR', 'NORTH BAY (CORAL ISLAND) – ROSS ISLAND Today after breakfast embark on a day-long three island cruise. One of the most sought after activities. It covers a panorama of seven harbors that include the North Bay and Ross island. It leaves a lasting impression. Ross Island. Was the administrative headquarters of the British. This island is now under the Indian Navy. You can also visit a museum named Smritika, it holds photographs and the other antiques of the Britishers relevant to these islands. The island is famous for friendly flocks of Deer and lush green walking trails. North Bay, the water lovers may enjoy snorkeling or take a glass bottom boat ride (Optional on direct payment) in its shallow waters with a chance to see corals up close. Return to the hotel. Dinner and stay overnight at the Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'PORT BLAIR', 'HAVELOCK Today after breakfast depart to Havelock by boat. Havelock is one of the famous Island in Andaman region. Its about 54 kilometers northeast of Port Blair, the Island is a hidden jewel. It is famous for the water sports activities. Arrive at Havelock Jetty, you are met and assisted by our representative. Board the waiting vehicles and drive to the hotel. Check in at the hotel. Dinner and stay overnight at the Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'HAVELOCK', 'RADHANAGAR BEACH (OR BEACH NO. 7) Today after breakfast, proceed for Radhanagar Beach (or Beach No. 7) is the jewel in the crown of Havelock Island. It is rated one of the top ranked beaches by many travelers. Located on the western side of the island, it stands away from the cluster. There is no mean of visiting Havelock Island without visiting Radha Nagar Beach. It provides scenic view to its visitors. Dinner and stay overnight at the Hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'HAVELOCK', 'Neil Island Day at Leisure for individual activities. OPTIONAL ELEPHANTA BEACH Proceed for snorkeling at Elephant beach. Elephant Beach is small can be reached by boat. The beach is also an extremely good place for snorkeling with an easily accessible house reef, which boasts of beautiful corals and other marine life. The beach has also emerged as Havelock’s favorite spot for scuba diving. It is tailor made to be a beginners dive site.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'Neil Island to Port Blair In the evening visit the Chidiyatapu,return back to your resort have Dinner and stay overnight at the Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Day 7 Sightseeing', 'DEPART FROM PORT BLAIR After breakfast at the hotel, transfer to the Port Blair airport to board the flight for onward destination.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Cochin Munnar Thekkady Alleppey
  pkg_id := 'cochin-munnar-thekkady-alleppey';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'cochin-munnar-thekkady-alleppey', 'Cochin Munnar Thekkady Alleppey',
    'Explore the beautiful sights of Cochin ! Munnar | Thekkady | Alleppey. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['04 Nights/05 Days - Cochin - Munnar - Thekkady - Alleppey'],
    ARRAY['A/C Pvt. vehicles as per the itinerary with experience driver', 'Accommodation', 'Meals: Breakfast & dinner', 'A/C Deluxe Houseboat with all meals ( A/C working time 9:30 pm to 6:30 am) - on demand', 'All transfers, Toll tax, Parkings, Sightseeing, fuel, Permit'],
    ARRAY['Monument fee / Sightseeing tickets or entry fee, Camera fee', 'Jeep ride, Elephant ride, Boat ride', 'Any personal nature of expenses', 'Anything which is not mentioned above', 'Cost incurred due to mishaps, strikes, political unrest etc.', 'Driver, guide, & porter tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg',
    ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Cochin Munnar Thekkady Alleppey.',
    FALSE, TRUE,
    ARRAY['cochin', 'munnar', 'thekkady', 'alleppey'],
    india_id,
    kerala_state,
    'Cochin Munnar Thekkady Alleppey | Mother India Tour Travels',
    'Explore the beautiful sights of Cochin ! Munnar | Thekkady | Alleppey. This package offers a comprehensive day-wise itinerary, comfortable stays, and ',
    ARRAY['cochin', 'munnar', 'thekkady', 'alleppey'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, cochin_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, munnar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, thekkady_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, alleppey_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mattupetty-dam')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Cochin to Munnar ( 140 kms 5 hrs. approx.) On arrival at Cochin, proceed for Munnar', 'India’s highest tea estate. On the way, you can enjoy the scenic beauty & the marvellous waterfalls, high mountains with the low flying clouds passing by. Check in at your hotel. Overnight at Munnar.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Munnar After breakfast, proceed for sightseeing in Munnar. Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Munnar to Thekkady ( 140 kms. 4 hrs. approx.)', 'After breakfast depart to Thekkady (Periyar Wild life Sanctuary). Check in your hotel. In the afternoon go for a boat ride (You have to take the ticket directly from the counter . It is subject to the availability) at Periyar Tiger reserve to view the wildlife in the sanctuary. The boat ride on the lake is a delightful way of spotting elephants and avifauna, for which the park is well known. Overnight at Thekkady.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Thekkady to Alleppey ( 140 kms ) A/C Deluxe Houseboat After breakfast depart to Alleppey . Check in your House boat .. The boat will take you to the virgin Kerala backwater villages… to see the real life of Keralities. Overnight at House boat.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Alleppey to Cochin ( 90 kms', '2 hrs. approx.) After breakfast, Proceed to Cochin & drop you at Cochin airport/ Rly. station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 2, FALSE, 'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, cochin_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, munnar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, thekkady_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, alleppey_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mattupetty-dam')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Cochin to Munnar (130 Kms', '05 hrs. approx.) Morning arrival & proceed Munnar, Munnar is 1800 mts above sea level and also the home of South India''s highest peak (anamudi-2695 mts). On the way to Munnar visit Valparai, Cheeyappara waterfalls and Tea Plantations. Upon arrival at Munnar & transfer to the Hotel. Check in at Hotel. Afternoon visit Rajamala (eravikulam National Park - open as per the directions by the forest authorities), the best place to see Nilgiri Tahr (hemitragus Hilarious)- the mountain goat of South India. You may visit the Tea Museum surrounded by Tea Gardens- the only Museum of its kind; which illustrates the timeworn method of Tea production. Evening have a short visit to Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Munnar After breakfast, proceed for sightseeing in Munnar. Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Munnar to Thekkady (100 kms', '03 hrs. approx.) Morning have breakfast at the resort, later check out the resort and drive to Thekkady. Thekkady is a world famous wildlife sanctuary and it is also called as Periyar. On arrival check in Hotel Afternoon proceed for a game viewing cruise on the Periyar Lake (direct payment basis). The rest of the day is at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Thekkady', 'After breakfast, Here you will be able to see a large variety of wildlife, ( Jeep safari direct payment basis) which include elephants, monkeys, deer, wild boar etc. In the evening you can take a Elephant ride at Periyar wildlife (direct payment basis)', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Thekkady to Alleppey (160 kms. 04 hrs. approx.)', 'check out from the hotel and transfer to a houseboat. Around 1200 hrs check in at the Houseboat and start your cruise through the rich and splendid backwater. Just relax at the deluxe houseboat. It will be a unique and exclusive experience in your lifetime. You will be cruising along the village sides and paddy fields witnessing the core life of the Kerala villages for the whole day. The house boat is fully furnished with bedrooms and a kitchen. Dinner and overnight at the houseboat. All Meals – Breakfast, Lunch & Dinner', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'Morning after breakfast transfer to Cochin, if will have time then local sightseeing includes like Lulu Mall, Cochin beach. And drop according to flight timing.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Cochin Munnar Cochin
  pkg_id := 'cochin-munnar-cochin';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'cochin-munnar-cochin', 'Cochin Munnar Cochin',
    'Explore the beautiful sights of Cochin | Munnar. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['02 Nights/03 Days - Cochin - Munnar - Cochin'],
    ARRAY['Accommodation', 'Meals', 'A/C Pvt. vehicles as per the itinerary', 'A/C Deluxe Houseboat with all meals ( A/C working time 9:30 pm to 6:30 am) - as per demand', 'Pvt. AC Pvt. vehicle', 'Guides Services'],
    ARRAY['Monument fee / Sightseeing tickets or entry fee, Camera fee', 'Jeep ride, Elephant ride, Boat ride', 'Any personal nature of expenses', 'Anything which is not mentioned above', 'Cost incurred due to mishaps, strikes, political unrest etc.', 'Driver, Guide & Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg',
    ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Cochin Munnar Cochin.',
    FALSE, TRUE,
    ARRAY['cochin', 'munnar'],
    india_id,
    kerala_state,
    'Cochin Munnar Cochin | Mother India Tour Travels',
    'Explore the beautiful sights of Cochin | Munnar. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for ',
    ARRAY['cochin', 'munnar'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 2n-3d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '2n-3d', '2 Nights / 3 Days', 2, 3, '2 Nights / 3 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '2n-3d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, cochin_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, munnar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mattupetty-dam')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Arrival at Cochin proceed to Munnar (130 Kms. 05 hrs. approx.)', 'Munnar is 1800 mts above sea level and also the home of South India''s highest peak (anamudi-2695 mts). On the way to Munnar visit Valparai, Cheeyappara waterfalls and Tea Plantations. Upon arrival at Munnar & transfer to the Hotel. Check in at Hotel. Afternoon visit Rajamala (eravikulam National Park - open as per the directions by the forest authorities), the best place to see Nilgiri Tahr (hemitragus Hilarious)- the mountain goat of South India. You may visit the Tea Museum surrounded by Tea Gardens- the only Museum of its kind; which illustrates the timeworn method of Tea production. Evening have a short visit to Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Munnar After breakfast, proceed for sightseeing in Munnar. Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Munnar to Cochin (130 kms. 5 hrs. approx.)', 'Morning after breakfast transfer to Cochin, and drop you at Cochin airport/railway station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Charming Kashmir Tour
  pkg_id := 'charming-kashmir-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'charming-kashmir-tour', 'Charming Kashmir Tour',
    'Explore the beautiful sights of Charming Kashmir Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['06 Nights/07 Days Charming Kashmir Tour'],
    ARRAY['Srinagar Airport Pickup Drop.', 'Welcome Drink on Arrival at the hotel.', '3 Night’s Accommodation in Srinagar', '1 Night Accommodation in Houseboat with Breakfast & dinner', '1 Night Accommodation in Pahalgam', '5 Breakfast', '1 Hour Shikara Ride.', 'All Tour by Pvt. Tempo Traveller', 'Toll Charges, Parking Charges, Driver Allowance.', '24/7 Customer Support.', 'Transportation with Driver'],
    ARRAY['Air Tickets, Trains, Ferries etc.', 'Personal Expenses like Laundry, Shopping, telephone bills, tips etc.', 'Entrance fee / Local Guide / at any place during the tour.', 'Meals not mentioned in the “Inclusions” section.', 'Anything not mentioned in the package includes section.', 'Cable Car / Pony Ride in Pahalgam / Gulmarg / Sonamarg.', 'Local sightseeing in vehicle in Pahalgam / Gulmarg / Sonmarg due to restrictions.', 'Adventure Activities like Safari, Rides, Surfing, and Paragliding etc.', 'Only Postpaid mobile connection of BSNL, Jio Airtel works in Jammu &amp; Kashmir.', 'Local sightseeing in vehicle in Pahalgam / Gulmarg / Sonmarg due to restrictions.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg',
    ARRAY['https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', 'https://images.pexels.com/photos/1435075/pexels-photo-1435075.jpeg', 'https://images.pexels.com/photos/3389531/pexels-photo-3389531.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of Charming Kashmir Tour.',
    FALSE, TRUE,
    ARRAY['srinagar', 'gulmarg', 'pahalgam'],
    india_id,
    jk_state,
    'Charming Kashmir Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Charming Kashmir Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfer',
    ARRAY['srinagar', 'gulmarg', 'pahalgam'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', ARRAY['https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', 'https://images.pexels.com/photos/1435075/pexels-photo-1435075.jpeg', 'https://images.pexels.com/photos/3389531/pexels-photo-3389531.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, srinagar_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, gulmarg_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pahalgam_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'dal-lake')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'khilanmarg')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Arrive Srinagar, Pickup and transfer to Houseboat', 'Rest of day Srinagar Sightseeing. Enjoy the site scene of the famous places Cheshma Shahi “Royal Spring” Shalimar “Garden of Love”Nishat Garden “Garden of Pleasure”On return visit a local Handicrafts Emporium for hand-knotted specialty silken carpets, shawls, jewelry ornaments. Overnight stay Houseboat.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'SRINAGAR TO GULMARG', '52 Kms – 2 Hrs approx: After breakfast you will proceed for a full day excursion to Gulmarg, Meadow of Flowers(66kms / 2 hr) situated at an altitude of 2730 meters, full day at leisure to take the leisurely walks on the lush green meadows of flowers with a backdrop of the snow capped mountains. Enjoy a pony ride or Gondola ride (rope way at your own cost) to Khilanmarg at your own cost- Overnight in the Gulmarg.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'GULMARG TO PAHALGAM (154 Kms', '4 Hrs.) Morning after breakfast you will be transferred by road to Pahalgam Valley of Shepherds, Arrive and proceed to your hotel, rest of the day at leisure to explore the countryside and enjoy leisurely walks through the pine forest along the river Lidder, stay at Pahalgam. En- route you will have a rare opportunity to visit the Saffron fields and Avantipur Temple.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'PAHALGAM After breakfast you Proceed to Pahalgam sight for Aru valley and Chandanwari by car (at your own cost). Aru is a small village, 11 kms upstream the Lidder River, is a beautiful locality. The route is picturesque with ample campsites. This village is the starting point for treks to the Kolahoi glacier. The most beautiful of these is the huge, undulating meadow of Baisaran,surrounded by thickly wooded forests of pine. Hajan and Beetab valley on the way to chandanwari.Overnight in the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'PAHALGAM TO SRINAGAR AND Enjoy Tulip Festival and other attractions After Breakfast drive Pahalgam to Srinagar and visit the amazing Tulip Festival. Once you reach the ethereal expanses, check-in to the houseboat. Once you relax, get ready to partake in the most charming Tulip Festival. Organized every year in April, Indira Gandhi Memorial Tulip Garden, situated in the foothills of the Zabarwan range in Srinagar, overlooking the Dal Lake, plays host to Asia & largest Tulip Flower Show. Also Visit to famous Mughal Gardens Chashma Shahi, Nishat, Shalimar & Shankaracharya Temple ..Overnight stay at Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'SRINAGAR TO SONAMARG (96 Kms', '3 Hrs. approx.) After breakfast drive to Sonamarg ,Excursion to Sonmarg . The mountains around Sonamarg(90 kms/ 3 hr) is covered with several glaciers, one of the most famous being the Thajiwas Glacier. This scenic river of ice is set amidst lush meadows and foliage and is a three-km walk or pony ride,back stay at Srinagar. Overnight in the Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Day 7 Sightseeing', 'SRINAGAR DEPARTURE After breakfast drop at Srinagar airport to catch the flight for your onward Destinationend the Tour with Sweet Memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . Delhi Agra Ayodhya Prayagraj Varanasi Tour
  pkg_id := 'delhi-agra-ayodhya-prayagraj-varanasi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-ayodhya-prayagraj-varanasi-tour', '. Delhi Agra Ayodhya Prayagraj Varanasi Tour',
    'Explore the beautiful sights of . Delhi Agra Ayodhya Prayagraj Varanasi Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['09Nt./10 Days Delhi Agra Ayodhya Prayagraj Varanasi Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC with driver', 'AC NOT OPERATE ON HILLY AREA'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . Delhi Agra Ayodhya Prayagraj Varanasi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'ayodhya', 'prayagraj', 'varanasi', 'mathura'],
    india_id,
    delhi_state,
    '. Delhi Agra Ayodhya Prayagraj Varanasi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of . Delhi Agra Ayodhya Prayagraj Varanasi Tour. This package offers a comprehensive day-wise itinerary, comfortable stay',
    ARRAY['delhi', 'agra', 'ayodhya', 'prayagraj', 'varanasi', 'mathura'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 9n-10d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '9n-10d', '9 Nights / 10 Days', 9, 10, '9 Nights / 10 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '9n-10d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ayodhya_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, prayagraj_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mathura_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Today after breakfast visit Old & New Delhi visit Jama Masjid, Red Fort, Rajghat(Gandhi Cremation place), India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra (250 KM. Approx. 3 Hrs.)', 'Today after breakfast, proceed to Agra En-Route to visit Mathura and Vrindavan. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Today, after breakfast, proceed to visit the Taj Mahal, Agra fort, Itimad aulah (Baby Taj). Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Agra to Ayodhya (500 Kms. 8 Hrs.)', 'Today after breakfast, proceed to Ayodhya & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Ayodhya Sightseeing', 'Today, after breakfast, proceed to visit the city of Lord Rama to see The Saryu River, Hanuman Garhi, Ram Janam Bhumi, Kanak Bhawan & Treta Ka Thakur. Check in at the hotel & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Ayodhya to Prayagraj (225 kMS. 5 Hrs.)', 'After breakfast proceed to Prayagraj & visit Holi Triveni Sangam, Hanuman Temple, Anand Bhawan & Alopi Devi Temple. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Prayagraj to Varanasi (120 Kms. 3 Hrs.)', 'Today after breakfast, proceed to Prayagraj & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Varanasi sightseeing', 'Early morning visit the popular ghat of Ganges through boat ride of Varanasi, peoples offering water to Sun God along with taking a holy dip in the Ganges river water, back to hotel & after breakfast proceed to visit Bharat Mata temple, Vishwanath Temple, Sankat Mochan (Hanuman Temple), Annapurna Temple, Banaras Hindu University (BHEU) & Manas Mandir & Sarnath. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Varanasi Departure Transfer', 'Today after breakfast, proceed to Varanasi airport/railway station & drop you with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Agra Delhi Tour
  pkg_id := 'delhi-agra-delhi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-delhi-tour', 'Delhi Agra Delhi Tour',
    'Explore the beautiful sights of Delhi | Agra | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Agra Delhi Tour Package for 02 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Chauffeur, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Guide Service Agra & Delhi'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide, Porter Tips'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Agra Delhi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra'],
    india_id,
    delhi_state,
    'Delhi Agra Delhi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfe',
    ARRAY['delhi', 'agra'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 1n-2d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '1n-2d', '1 Nights / 2 Days', 1, 2, '1 Nights / 2 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '1n-2d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Pick up from airport/hotels/ railway stn', 'and proceed to Agra it will take 3/4 Hrs. and a guided tour to visit The Taj Mahal, Agra fort and overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After breakfast proceed to Delhi and a guided tour to visit Lotus Temple, Qutun minar, India Gate, President house and drop you at the airport/ hotels/railway stn. with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Variant 2n-3d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '2n-3d', '2 Nights / 3 Days', 2, 3, '2 Nights / 3 Days', NULL, NULL, 2, FALSE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '2n-3d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport/Railway station company representative assist you & proceed to Agra. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Today, After breakfast a guided tour to visit Taj Mahal & Agra fort & after lunch proceed to Delhi. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'After breakfast, a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Humayun Tomb, Qutub Minar, & departure transfer to the airport/railway station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . Delhi Agra Jaipur Delhi Tour
  pkg_id := 'delhi-agra-jaipur-delhi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-jaipur-delhi-tour', '. Delhi Agra Jaipur Delhi Tour',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['04Nt./05 Days – Delhi Agra Jaipur Delhi Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Chauffeur, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide, Porter Tips'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . Delhi Agra Jaipur Delhi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur'],
    india_id,
    delhi_state,
    '. Delhi Agra Jaipur Delhi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and privat',
    ARRAY['delhi', 'agra', 'jaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Agra (250 Kms', '3 Hrs. Approx.) After check in & refresh a guided tour to visit The Taj Mahal, Agra Fort & Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra to Jaipur (260 Kms', '6 Hrs. Approx.) Today after breakfast we proceeded to Jaipur on the way to visit Fatehpur Sikri. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Jaipur Sightseeing', 'After breakfast guided tour to visit the ancient capital of Amber, Hawa Mahal (Window Palace), City Place and Observatory . Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur to Delhi (250 Kms', '5 Hrs. Approx.) Today after breakfast, proceed to Delhi and drop you at the Airport with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Agra Jaipur Khajuraho Tour package 06 Days
  pkg_id := 'delhi-agra-jaipur-khajuraho-tour-package-06-days';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-jaipur-khajuraho-tour-package-06-days', 'Delhi Agra Jaipur Khajuraho Tour package 06 Days',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Pushkar | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi-Agra-Jaipur-Khajuraho-Tour-package-for-06-Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Agra Jaipur Khajuraho Tour package 06 Days.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur', 'khajuraho', 'pushkar'],
    india_id,
    delhi_state,
    'Delhi Agra Jaipur Khajuraho Tour package 06 Days | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Pushkar | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, ',
    ARRAY['delhi', 'agra', 'jaipur', 'khajuraho', 'pushkar'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Agra (230 Kms. 3', '4 Hrs.): Today after breakfast proceed to Agra & a guided tour to visit Taj Mahal, Agra. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra to Jaipur (260 Kms. 6 Hrs. Approx.)', 'After breakfast drive to Jaipur En-Route visit Fatehpur Sikri . Overnight stay at the hotel Jaipur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast, a guided tour to visit the ancient capital of Amber and visit beautiful Amber fort & proceed to the pink city Jaipur we will visit Water Palace, Hawa Mahal (Window Palace), Rajasthani handicraft. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur to Pushkar (150 Kms. 3 Hrs.)', 'Today after breakfast, proceed to Pushkar, check in at the hotel & after refresh visit Brahma Temple, Pushkar Lake, City Walking tour & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Pushkar to Delhi (415 Kms. 7', '8 Hrs. Approx.): Today after breakfast proceed to Delhi & stop for lunch (direct payment basis). Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Day 7 Sightseeing', 'After breakfast, a guided tour to visit Red fort, Jama masjid, India Gate, Lotus temple, Qutub minar & drop you at the Airport/Railway Station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Agra Jaipur Khajuraho Varanasi Tour
  pkg_id := 'delhi-agra-jaipur-khajuraho-varanasi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-jaipur-khajuraho-varanasi-tour', 'Delhi Agra Jaipur Khajuraho Varanasi Tour',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Khajuraho | Varanasi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Agra Jaipur Khajuraho Varanasi Tour package for 08 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide, Porter Tips'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Agra Jaipur Khajuraho Varanasi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur', 'khajuraho', 'varanasi'],
    india_id,
    delhi_state,
    'Delhi Agra Jaipur Khajuraho Varanasi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Khajuraho | Varanasi |. This package offers a comprehensive day-wise itinerary, comfortable st',
    ARRAY['delhi', 'agra', 'jaipur', 'khajuraho', 'varanasi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 7n-8d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '7n-8d', '7 Nights / 8 Days', 7, 8, '7 Nights / 8 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '7n-8d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representatives assisted you, and a guided tour to visit Qutub minar, Lotus temple, India gate President house, & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Jaipur (260 Kms. approx. 6 Hrs.)', 'After breakfast, proceed to Jaipur. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), Rajasthani handicraft. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Jaipur to Agra (260 Kms. approx. 6 Hrs. approx.)', 'After breakfast, proceed to Agra, check in at the hotel, after refreshing a guided tour to visit Taj Mahal. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Agra to Khajuraho (400 KM. Approx. 6', '7 Hrs. Approx.): Today after breakfast, proceed to Khajuraho, En-Route visit Orchha & drive to Khajuraho & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'After breakfast proceed to visit Western temple, Jain temple & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Khajuraho to Varanasi (390 Kms. 7/8 Hrs. approx.)', 'After breakfast, proceed to Varanasi & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Day 8 Sightseeing', 'Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site.(River boating - direct payment basis) and back to hotel, After breakfast, proceed to visit Vishwanath temple, Sankat mochan temple, BHEU & drop you at Varanasi Airport/Railway station for your onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Variant 8n-9d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '8n-9d', '8 Nights / 9 Days', 8, 9, '8 Nights / 9 Days', NULL, NULL, 2, FALSE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '8n-9d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representatives assisted you, and proceed to hotel. overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After beakfast a guided tour to visit Red fort, Jama masjid, India gate, Qutub minar, Lotus temple, President house, & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Jaipur (260 Kms. approx. 6 Hrs.)', 'After breakfast, proceed to Jaipur. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous block printing & Rajasthani handicraft work being done for centuries in Jaipur. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur to Agra (260 Kms. approx. 6 Hrs. approx.)', 'After breakfast, proceed to Agra, check in at the hotel, after refreshing a guided tour to visit Taj Mahal. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Agra to Khajuraho (400 KM. Approx. 6', '7 Hrs. Approx.): Today after breakfast, proceed to Khajuraho, En-Route visit Orchha & drive to Khajuraho & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Day 7 Sightseeing', 'After breakfast proceed to visit Western temple, Jain temple & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Khajuraho to Varanasi (390 Kms. 7/8 Hrs. approx.)', 'After breakfast, proceed to Varanasi & overnight stay at the hotel. OR drop at Khajuraho airport & arrival at Varanasi airport. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Day 9 Sightseeing', 'Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site.(River boating - direct payment basis) and back to hotel, After breakfast, proceed to visit Vishwanath temple, Sankat mochan temple, BHEU & drop you at Varanasi Airport/Railway station for your onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Agra Jaipur Pushkar Delhi Tour
  pkg_id := 'delhi-agra-jaipur-pushkar-delhi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-jaipur-pushkar-delhi-tour', 'Delhi Agra Jaipur Pushkar Delhi Tour',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Pushkar | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Agra Jaipur Pushkar Delhi Tour package for 07 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Agra Jaipur Pushkar Delhi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur', 'pushkar'],
    india_id,
    delhi_state,
    'Delhi Agra Jaipur Pushkar Delhi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Pushkar | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, ',
    ARRAY['delhi', 'agra', 'jaipur', 'pushkar'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Agra (230 Kms. 3', '4 Hrs.): Today after breakfast proceed to Agra & a guided tour to visit Taj Mahal, Agra. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra to Jaipur (260 Kms. 6 Hrs. Approx.)', 'After breakfast drive to Jaipur En-Route visit Fatehpur Sikri . Overnight stay at the hotel Jaipur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast, a guided tour to visit the ancient capital of Amber and visit beautiful Amber fort & proceed to the pink city Jaipur we will visit Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) after visit famous block printing & James & Stone cutting factory work being done since centuries in Jaipur. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur to Pushkar (150 Kms. 3 Hrs.)', 'Today after breakfast, proceed to Pushkar, check in at the hotel & after refresh visit Brahma Temple , Pushkar Lake, City Walking tour & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Pushkar to Delhi (415 Kms. 7', '8 Hrs. Approx.): Today after breakfast proceed to Delhi & stop for lunch (direct payment basis). Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Day 7 Sightseeing', 'After breakfast, a guided tour to visit Red fort, Jama masjid, India Gate, Lotus temple, Qutub minar & drop you at the Airport/Railway Station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Agra Jaipur Golden Triangle Tour package
  pkg_id := 'delhi-agra-jaipur-golden-triangle-tour-package';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-jaipur-golden-triangle-tour-package', 'Delhi Agra Jaipur Golden Triangle Tour package',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Agra Jaipur Golden Triangle Tour for 06 Days package'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Agra Jaipur Golden Triangle Tour package.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur'],
    india_id,
    delhi_state,
    'Delhi Agra Jaipur Golden Triangle Tour package | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and privat',
    ARRAY['delhi', 'agra', 'jaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi sightseeing', 'Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Agra (250 KM. Approx. 3', '4 Hrs. approx.): Today after breakfast, proceed to Agra and Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Agra to Jaipur (260 Kms. approx. 6 Hrs.)', 'Today early morning a guided tour to visit Taj Mahal on Sun Rise, and back to the hotel. After breakfast, proceed to visit Agra Fort and drive to Jaipur on the way to visit Fatehpur Sikri . Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous block printing & Rajasthani handicraft work being done for centuries in Jaipur. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Jaipur', 'Delhi (280 KM. Approx. 5-6 Hrs.): Today after breakfast, proceed to Delhi and drop you at the Airport/Railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Agra Jaipur Tour
  pkg_id := 'delhi-agra-jaipur-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-jaipur-tour', 'Delhi Agra Jaipur Tour',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Agra Jaipur Tour package for 04 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur', 'Guide Service Delhi, Agra, Fatehpur Sikri, Jaipur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Agra Jaipur Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur'],
    india_id,
    delhi_state,
    'Delhi Agra Jaipur Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and privat',
    ARRAY['delhi', 'agra', 'jaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 3n-4d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '3n-4d', '3 Nights / 4 Days', 3, 4, '3 Nights / 4 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '3n-4d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi to Agra (250 Kms. 3', '4 Hrs. approx.): Early Arrival at Delhi Airport/railway station company representatives assisted you, and a guided tour to visit Qutub minar, Lotus temple, India gate & proceed to Agra & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Agra to Jaipur (250 KM. Approx. 3', '4 Hrs. approx.): Early morning Sun rise time a guided tour to visit Taj Mahal, after breakfast, check out from the hotel & proceed to Jaipur En-Route stop to visit Fatehpur Sikri, Lunch on the way (direct payment basis). Overnight stay at the hotel Jaipur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous block printing & Rajasthani handicraft work being done for centuries in Jaipur. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Jaipur to Delhi (280 KM. Approx. 5', '6 Hrs.): Today after breakfast, proceed to Delhi and drop you at the Airport/Railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 2, FALSE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representatives assisted you, and a guided tour to visit Qutub minar, Lotus temple, India gate President house, Humayun Tomb & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Agra (250 KM. Approx. 3', '4 Hrs. approx.): Today after breakfast, proceed to Agra, check in at the hotel and after refresh a guided tour to visit The Taj Mahal & Agra fort. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra to Jaipur (260 Kms. approx. 6 Hrs.)', 'After breakfast, proceed to Jaipur, En-Route stop to visit Fatehpur Sikri, Lunch on the way (direct payment basis). Overnight stay at the hotel Jaipur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous block printing & Rajasthani handicraft work being done for centuries in Jaipur. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur to Delhi (280 KM. Approx. 5', '6 Hrs.): Today after breakfast, proceed to Delhi and drop you at the Airport/Railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Agra Jaipur Udaipur Tour
  pkg_id := 'delhi-agra-jaipur-udaipur-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-jaipur-udaipur-tour', 'Delhi Agra Jaipur Udaipur Tour',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Udaipur |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Agra Jaipur Udaipur Tour package for 06 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Agra Jaipur Udaipur Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur', 'udaipur'],
    india_id,
    delhi_state,
    'Delhi Agra Jaipur Udaipur Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Udaipur |. This package offers a comprehensive day-wise itinerary, comfortable stays, and priv',
    ARRAY['delhi', 'agra', 'jaipur', 'udaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representatives assisted you, and a guided tour to visit Qutub minar, Lotus temple, India gate President house, Humayun Tomb & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Agra (250 KM. Approx. 3', '4 Hrs. approx.): Today after breakfast, proceed to Agra, check in at the hotel and after refresh a guided tour to visit The Taj Mahal & Agra fort. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra to Jaipur (260 Kms. approx. 6 Hrs.)', 'After breakfast, proceed to Jaipur, En-Route stop to visit Fatehpur Sikri, Lunch on the way (direct payment basis). Overnight stay at the hotel Jaipur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory Jantar Mantar Rajasthani handicraft work being done for centuries in Jaipur. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur to Udaipur (400 KM. Approx. 6', '7 Hrs. Approx.): Today after breakfast, proceed to Udaipur, En-Route visit Chittorgarh fort. Overnight stay at the hotel Udaipur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Udaipur sightseeing & dropping', 'After breakfast a guide tour to visit Jagdish temple, City palace, Princess garden and drop you at Udaipur airport/railway station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Agra Jaipur Tour Varanasi
  pkg_id := 'delhi-agra-jaipur-tour-varanasi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-jaipur-tour-varanasi', 'Delhi Agra Jaipur Tour Varanasi',
    'Explore the beautiful sights of Delhi | Jaipur | Agra | Khajuraho | Varanasi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Agra Jaipur Tour with Varanasi 10 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur', 'Guide services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide, Porter Tips'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Agra Jaipur Tour Varanasi.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur', 'varanasi', 'khajuraho'],
    india_id,
    delhi_state,
    'Delhi Agra Jaipur Tour Varanasi | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Jaipur | Agra | Khajuraho | Varanasi |. This package offers a comprehensive day-wise itinerary, comfortable st',
    ARRAY['delhi', 'agra', 'jaipur', 'varanasi', 'khajuraho'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 9n-10d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '9n-10d', '9 Nights / 10 Days', 9, 10, '9 Nights / 10 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '9n-10d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Jaipur(260 kms. 6 hrs. approx.)', 'Today, after breakfast, proceed to Jaipur. Lunch on the way and overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Jaipur sightseeing', 'Today after breakfast, a guided tour to visit Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), Rajasthani handicraft. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur to Agra (260 kms. 6 hrs. approx.)', 'Today after breakfast, proceed to Agra, a guided tour to visit the Tajmahal. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Agra to Khajuraho(400 kms. 9 hrs. approx.), Today after breakfast drive to Khajuraho En', 'Route visiting Orchha. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Khajuraho Sightseeing', 'After breakfast, proceed to visit the most famous Western Temple’s, Jain Temple, and city centre walk, Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Khajuraho to Varanasi (400 kms. 9', '10 hrs. approx.): After breakfast proceed to Varanasi & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Varanasi sightseeing', 'Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site. After breakfast, visit Vishwanath temple, Sankat mochan temple, BHEU & Sarnath. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Day 10 Sightseeing', 'Today after breakfast drop you at Varanasi Airport/Railway station for your onward journey .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . Tour: Delhi Agra Jaipur Udaipur Jodhpur Jaisalmer Bikaner Delhi
  pkg_id := 'tour-delhi-agra-jaipur-udaipur-jodhpur-jaisalmer-bikaner-delhi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'tour-delhi-agra-jaipur-udaipur-jodhpur-jaisalmer-bikaner-delhi', '. Tour: Delhi Agra Jaipur Udaipur Jodhpur Jaisalmer Bikaner Delhi',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Udaipur | Jodhpur | Jaisalmer | Bikaner | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['10Nt./11 Days Tour: Delhi Agra Jaipur Udaipur Jodhpur Jaisalmer Bikaner Delhi'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'Welcome Drink Non Alcoholic.', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State Taxes, Road Taxes, Permit', 'Comfortable vehicles', 'Guide Services', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide & Porter Tips'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . Tour: Delhi Agra Jaipur Udaipur Jodhpur Jaisalmer Bikaner Delhi.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur', 'udaipur', 'jodhpur', 'jaisalmer', 'bikaner'],
    india_id,
    delhi_state,
    '. Tour: Delhi Agra Jaipur Udaipur Jodhpur Jaisalmer Bikaner Delhi | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Udaipur | Jodhpur | Jaisalmer | Bikaner | Delhi |. This package offers a comprehensive day-wis',
    ARRAY['delhi', 'agra', 'jaipur', 'udaipur', 'jodhpur', 'jaisalmer', 'bikaner'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 10n-11d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '10n-11d', '10 Nights / 11 Days', 10, 11, '10 Nights / 11 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '10n-11d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jodhpur_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaisalmer_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, bikaner_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'jaisalmer-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. After breakfast proceed to visit Old Delhi & New Delhi. Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Agra (230 Kms. 3 Hrs.)', 'Today after breakfast proceed to Agra & visit Taj Mahal, Agra Fort and Itimad–Ud-Daulah (Baby Taj ). Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra to Jaipur (260 Kms. 6 Hrs. Approx.)', 'After breakfast drive to Jaipur En-Rout visit Fatehpur Sikri . Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Jaipur Sightseeing', 'After breakfast proceed to visit ancient capital of Amber. Visit beautiful Amber Fort after Amber Fort proceed to the pink city Jaipur we will visit Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) after visit famous block printing & James & Stone cutting factory work being done since centuries in Jaipur. Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur to Udaipur (400 Kms. 7 Hrs.)', 'Today after breakfast drive to go Udaipur En-Route visit Chittor Garh fort, Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'After breakfast visit Udaipur City palace, Jagdish temple, Sahelion ki bari(Princess garden) & boat ride at Lake Pichhola. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Udaipur to Jodhpur (250 Kms. 7 Hrs. Approx.)', 'Today after breakfast proceed to Jodhpur En-Route visit Ranakpur Jain Temple. overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Jodhpur to Jaisalmer (285 Kms. 6 Hrs. Approx.)', 'After breakfast check out & visit Jodhpur Fort, Jaswant Thada & drive to Jaisalmer. Overnight stay at the hotel. Day 09. Jaisalmer: After breakfast check out from the hotel & proceed to visit Jaisalmer fort, Jain Temple, Patwon-ki-haveli, Ludrwa Jain Temple & after lunch we proceed to sand dunes village resort & enjoy Camel ride, Traditional Rajasthani folk dance. stay at desert resort.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Jaisalmer to Bikaner (325 Kms. 6 Hrs. Approx.)', 'After breakfast check out & proceed to Bikaner visit Bikaner fort & check in at the hotel after refresh proceed to visit world famous Deshnok Temle (Ret Temple). Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Bikaner to Delhi (440 Kms. 8 Hrs. Approx.)', 'After breakfast check out & proceed to Delhi En-Route visit Old painted Havelis & drop you at Delhi airport/railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . 06D Delhi Agra Jaipur Mathura Tour
  pkg_id := '06d-delhi-agra-jaipur-mathura-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '06d-delhi-agra-jaipur-mathura-tour', '. 06D Delhi Agra Jaipur Mathura Tour',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Udaipur | Jodhpur | Jaisalmer | Bikaner | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['05Nt./06D Delhi Agra Jaipur with Mathura Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'Welcome Drink Non Alcoholic.', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State Taxes, Road Taxes, Permit', 'Comfortable vehicles', 'Guide Services', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide & Porter Tips'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . 06D Delhi Agra Jaipur Mathura Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur', 'mathura'],
    india_id,
    delhi_state,
    '. 06D Delhi Agra Jaipur Mathura Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Udaipur | Jodhpur | Jaisalmer | Bikaner | Delhi |. This package offers a comprehensive day-wis',
    ARRAY['delhi', 'agra', 'jaipur', 'mathura'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mathura_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi sightseeing', 'Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Lotus Temple, . Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Agra (250 KM. Approx. 3', '4 Hrs. approx.): Today after breakfast, proceed to Agra and En-Route visit Krishna Janmabhoomi Temple Mathura & Iskcon Temple, Prem mandir . Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Agra to Jaipur (260 Kms. approx. 6 Hrs.)', 'Today early morning a guided tour to visit Taj Mahal on Sun Rise, and back to the hotel. After breakfast, proceed to visit Agra Fort and drive to Jaipur on the way to visit Fatehpur Sikri . Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous block printing & Rajasthani handicraft work being done for centuries in Jaipur. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Jaipur', 'Delhi (280 KM. Approx. 5-6 Hrs.): Today after breakfast, proceed to Delhi and drop you at the Airport/Railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Agra Mathura Tour Package
  pkg_id := 'delhi-agra-mathura-tour-package';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-agra-mathura-tour-package', 'Delhi Agra Mathura Tour Package',
    'Explore the beautiful sights of Delhi | Mathura | Vrindavan | Agra |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Agra Mathura Tour Package for 03 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Chauffeur, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Guide Service Agra & Delhi'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Agra Mathura Tour Package.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'mathura'],
    india_id,
    delhi_state,
    'Delhi Agra Mathura Tour Package | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Mathura | Vrindavan | Agra |. This package offers a comprehensive day-wise itinerary, comfortable stays, and p',
    ARRAY['delhi', 'agra', 'mathura'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 2n-3d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '2n-3d', '2 Nights / 3 Days', 2, 3, '2 Nights / 3 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '2n-3d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mathura_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Arrival at Delhi Airport/Railway station company representative assist you & proceed to Agra, En', 'Route visit Krishna Janmabhoomi Temple at Mathura and visit Prem Mandir, ISKCON Temple at Vrindavan. Overnight stay at the hotel Agra.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Agra to Delhi (250 Kms. 3', '4 Hrs.): Today, After breakfast a guided tour to visit Taj Mahal & Agra fort & proceed to Delhi. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'After breakfast, a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Humayun Tomb, Qutub Minar, & departure transfer to the airport/railway station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Tour : Delhi Agra Pushkar Jaipur Delhi
  pkg_id := 'tour-delhi-agra-pushkar-jaipur-delhi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'tour-delhi-agra-pushkar-jaipur-delhi', 'Tour : Delhi Agra Pushkar Jaipur Delhi',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Pushkar | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['06 Nights 07 Days Tour : Delhi Agra Pushkar Jaipur Delhi'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'Welcome Drink Non Alcoholic.', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State Taxes, Road Taxes, Permit', 'Comfortable vehicles', 'Guide Services', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide & Porter Tips'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Tour : Delhi Agra Pushkar Jaipur Delhi.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'pushkar', 'jaipur'],
    india_id,
    delhi_state,
    'Tour : Delhi Agra Pushkar Jaipur Delhi | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Pushkar | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, ',
    ARRAY['delhi', 'agra', 'pushkar', 'jaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After brakfast, guided tour to visit Red fort, Jama masjid, India gate, Lotus tample, Qutub minar. Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra to Jaipur (260 Kms. 6 Hrs. Approx.)', 'After breakfast drive to Jaipur En-Rout visit Fatehpur Sikri . Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast, a guided tour to visit ancient capital of Amber. Visit beautiful Amber Fort after Amber Fort proceed to the pink city Jaipur we will visit Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), Rajsthani handicraft. Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur to Pushkar (150 Kms. 3 Hrs.)', 'Today after breakfast, check in at the hotel and after refreshment proceed to visit Pushkar town, Pushkar lake, walking tour to market. Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Pushkar to Delhi (415 Kms. 7 Hrs. Approx.)', 'Today after breakfast proceed to Delhi & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Day 7 Sightseeing', 'Today, after brakfast departure tranfer to Delhi airport/railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: A Royal Sojourn Through Rajasthan
  pkg_id := 'a-royal-sojourn-through-rajasthan';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'a-royal-sojourn-through-rajasthan', 'A Royal Sojourn Through Rajasthan',
    'Explore the beautiful sights of A Royal Sojourn Through Rajasthan. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['A Royal Sojourn Through Rajasthan'],
    ARRAY['Accommodation on double sharing basis', 'Breakfast at hotels', 'Sightseeing and transfers by private AC vehicle', 'All toll, parking and driver allowances'],
    ARRAY['Airfare / Train tickets', 'Monument entrance fees', 'Any meals not mentioned in inclusions', 'Personal expenses'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg',
    ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of A Royal Sojourn Through Rajasthan.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'ranthambore', 'udaipur', 'jodhpur', 'jaipur', 'shimla', 'kullu', 'manali', 'varanasi', 'ayodhya', 'goa'],
    india_id,
    delhi_state,
    'A Royal Sojourn Through Rajasthan | Mother India Tour Travels',
    'Explore the beautiful sights of A Royal Sojourn Through Rajasthan. This package offers a comprehensive day-wise itinerary, comfortable stays, and priv',
    ARRAY['delhi', 'agra', 'ranthambore', 'udaipur', 'jodhpur', 'jaipur', 'shimla', 'kullu', 'manali', 'varanasi', 'ayodhya', 'goa'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 11n-12d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '11n-12d', '11 Nights / 12 Days', 11, 12, '11 Nights / 12 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '11n-12d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jodhpur_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 10) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ayodhya_dest, 11) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, goa_dest, 12) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mehtab-bagh')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lake-pichola')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mehrangarh-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'New Delhi India Gate and Rashtrapati Bhavan Humayun''s Tomb (UNESCO World Heritage site) Qutub Minar complex Lotus Temple', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Old Delhi Chandni Chowk market exploration Rickshaw ride through bustling lanes Red Fort and Jama Masjid Local street food tasting 3 Agra – The City of Eternal Love A morning drive takes you to Agra, home to the most romantic monument in the world—the Taj Mahal. Experiences: Sunrise visit to the Taj Mahal Explore the magnificent Agra Fort Marble inlay craftsmanship demonstration Sunset view of Taj from Mehtab Bagh Local market exploration 4-5 Ranthambore – The Call of the Wild Journey to Ranthambore National Park, one of India''s premier tiger reserves, famous for its Bengal tigers.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Safari Adventure Arrival and check', 'in at wildlife resort Afternoon jungle safari Wildlife spotting (tigers, leopards, deer) Evening nature walk', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Fort and Forest Morning safari in the national park Visit Ranthambore Fort with panoramic views Explore ancient ruins within the forest Nature photography session 6-7 Udaipur – Venice of the East Travel to Udaipur, the city of lakes, known for its romantic ambiance and grand palaces.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'Lake Serenity Boat ride on Lake Pichola Visit Jag Mandir island palace Evening cultural dance show at Bagore Ki Haveli Dinner with lake view', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Day 7 Sightseeing', 'City Exploration City Palace complex visit Jagdish Temple architecture Saheliyon Ki Bari gardens Local market shopping for textiles 8-9 Jodhpur – The Blue Jewel Drive to Jodhpur, the Blue City of Rajasthan, nestled at the edge of the Thar Desert.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Day 8 Sightseeing', 'Fort Majesty Mehrangarh Fort exploration Panoramic views of the blue city Traditional Rajasthani lunch Evening walk in the old city', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Day 9 Sightseeing', 'Palatial Wonders Visit Umaid Bhawan Palace Jaswant Thada marble memorial Shopping at Sardar Market Clock Tower photography 10-12 Jaipur – The Pink City''s Grandeur Your final stop is Jaipur, Rajasthan''s vibrant capital, known as the Pink City.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Day 10 Sightseeing', 'Amber Majesty Elephant ride to Amber Fort Explore the hilltop fortress Evening market exploration Traditional puppet show', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Day 11 Sightseeing', 'Pink City Wonders City Palace complex Jantar Mantar observatory Hawa Mahal photography Gemstone and textile shopping', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 12, 'Day 12 Sightseeing', 'Farewell Rajasthan Albert Hall Museum visit Jal Mahal (Water Palace) views Traditional farewell dinner at Chokhi Dhani Cultural performances Royal Travel Tips Essential advice for your Rajasthan journey Best Time to Visit October to March is ideal for Rajasthan travel. Days are pleasant (15-25°C) and nights are cool. Avoid summer (April-June) when temperatures exceed 40°C. Monsoon (July-Sept) brings relief but can disrupt travel. What to Pack Light cotton clothing for daytime Warm layers for cool desert nights Comfortable walking shoes Sun protection: hat, sunglasses, sunscreen Modest clothing for religious sites Camera with extra batteries Cultural Etiquette Dress modestly, especially at religious sites Remove shoes before entering temples/homes Ask permission before photographing people Respect local customs and traditions Use right hand for giving/receiving Transportation Tips Private car with driver for inter-city travel Domestic flights to save time Auto-rickshaws for short city distances Jeep safaris in Ranthambore Boat rides in Udaipur Royal Journey Highlights Unforgettable moments from your Rajasthan adventure Sunrise at Taj Mahal Watching the first rays illuminate the world''s most beautiful monument. Tiger Spotting in Ranthambore The thrill of encountering a Bengal tiger in its natural habitat. Boat Ride on Lake Pichola Serene waters reflecting Udaipur''s palaces at sunset. Mehrangarh Fort Views Panoramic vistas of Jodhpur''s blue city from the fort walls. Elephant Ride at Amber Fort Ascending to Jaipur''s majestic fort in royal style. Farewell at Chokhi Dhani Traditional Rajasthani dinner with cultural performances. A Journey Through Royal India This 12-day journey through Delhi, Agra, and Rajasthan''s most iconic cities offers an unparalleled immersion into India''s regal heritage. From the Mughal splendor of Agra to the desert forts of Jodhpur, the lake palaces of Udaipur, and the vibrant markets of Jaipur, this itinerary captures the essence of royal India. Each destination tells a different story of valor, romance, and artistry, creating a journey that engages all your senses and leaves you with memories to last a lifetime. The land of kings awaits - are you ready for your royal sojourn? // Smooth scrolling for anchor links document.querySelectorAll(''a[href^="#"]'').forEach(anchor => { anchor.addEventListener(''click'', function (e) { e.preventDefault(); document.querySelector(this.getAttribute(''href'')).scrollIntoView({ behavior: ''smooth'' }); }); }); Chat with us! /* Entrance Animation */ @keyframes float-in { 0% { transform: translateY(100px) scale(0.8); opacity: 0; } 100% { transform: translateY(0) scale(1); opacity: 1; } } .whatsapp-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards; } /* Hover Animation */ .whatsapp-button:hover { transform: scale(1.1) rotate(5deg); } /* Click Animation */ .whatsapp-button:active { transform: scale(0.95); transition: transform 0.1s; } /* Mobile Responsive */ @media (max-width: 768px) { .whatsapp-button { width: 56px; height: 56px; } .whatsapp-tooltip { display: none; } } Message us! /* Shared Animation */ @keyframes float-in { 0% { transform: translateY(100px) scale(0.8); opacity: 0; } 100% { transform: translateY(0) scale(1); opacity: 1; } } /* Staggered Animations */ .whatsapp-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards; } .messenger-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.2s forwards; } /* Hover Effects */ .whatsapp-button:hover { transform: scale(1.1) rotate(5deg); } .messenger-button:hover { transform: scale(1.1) rotate(-5deg); } /* Mobile Responsive */ @media (max-width: 768px) { .whatsapp-container { bottom: 3%; right: 4; } .messenger-container { bottom: 12%; right: 4; } .whatsapp-button, .messenger-button { width: 56px; height: 56px; } } About Us Our Blogs FAQs Mon – Fri 9:00 AM to 8:00 PM Sat – Sun 9:00 AM to 8:00 PM USEFUL LINKS Delhi Agra Jaipur Tour Packages Shimla Kullu Manali Tour Kashmir Tour Packages Kerala Tour Packages Varanasi Ayodhya Tour Packages Goa Tour Packages Golden Triangle Tour Packages CONTACT US Address:- B63/B63A, New Jankipuri, Uttam nagar, New Delhi -110059 Phone:- +91 9810140121 / +91 99710 53881 Email:- tourtravelsmotherindia@gmail.com Social Media:- OUR NEWSLETTER Privacy Policy Terms of Service Subscribe Review Us on Google // Listen for form submission and display a thank-you message. document .getElementById("subscribeForm") .addEventListener("submit", function (e) { e.preventDefault(); const email = e.target.email.value; // You can replace this with an AJAX call to your server. document.getElementById("message").textContent = "Thank you for subscribing, " + email + "!"; e.target.reset(); }); 9001-2015 &copy; 2025 Your Company. All rights reserved. Designed & maintain by motherindiatourtravels', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Corbett National Tiger Century Tour
  pkg_id := 'delhi-corbett-national-tiger-century-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-corbett-national-tiger-century-tour', 'Delhi Corbett National Tiger Century Tour',
    'Explore the beautiful sights of Delhi Corbett National Tiger Century. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Corbett National Tiger Century 04 Nights 05 Days Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Wildlife', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Corbett National Tiger Century Tour.',
    FALSE, TRUE,
    ARRAY['delhi'],
    india_id,
    delhi_state,
    'Delhi Corbett National Tiger Century Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi Corbett National Tiger Century. This package offers a comprehensive day-wise itinerary, comfortable stays, and p',
    ARRAY['delhi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, wild_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival transfer at Delhi airport/railway station & proceed to hotel. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi sightseeing', 'After breakfast sightseeing Old and New Delhi . Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Corbett (250 Kms', '6 Hrs.); After breakfast proceed to Corbett National Park. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Corbett', 'Tiger safari tour (Own Arrangement) & back to hotel after proceed local sightseeing . Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Corbett to Delhi (250 Kms. 6 Hrs.)', 'After breakfast proceed to Delhi and drop you at the Airport/Railway Station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . Tour : Delhi Haridwar Rishikesh Agra Jaipur Delhi
  pkg_id := 'tour-delhi-haridwar-rishikesh-agra-jaipur-delhi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'tour-delhi-haridwar-rishikesh-agra-jaipur-delhi', '. Tour : Delhi Haridwar Rishikesh Agra Jaipur Delhi',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Ranthambore | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['06Nt./07 Days Tour : Delhi Haridwar/Rishikesh Agra Jaipur Delhi'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meal', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Guide Service', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide & Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . Tour : Delhi Haridwar Rishikesh Agra Jaipur Delhi.',
    FALSE, TRUE,
    ARRAY['delhi', 'haridwar', 'rishikesh', 'agra', 'jaipur'],
    india_id,
    delhi_state,
    '. Tour : Delhi Haridwar Rishikesh Agra Jaipur Delhi | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Ranthambore | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable sta',
    ARRAY['delhi', 'haridwar', 'rishikesh', 'agra', 'jaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, haridwar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, rishikesh_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'ram-jhula')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'triveni-ghat')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel & after refresh proceed to visit Red Fort, Rajghat, India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb, Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi', 'Haridawar (250 KM. Approx. 6 Hrs.) – Today after breakfast proceed to Haridwar check in & after refresh proceed to Afternoon visit Daksh Temple, Pawan Dham as well as Moti Bazar. Go To Har Ki Pauri for Ganga Aarti. Return to the hotel. Dinner and Night stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Rishikesh', 'After breakfast visit Mansa Devi Temple (By cable car). Transfer to Rishikesh. Go to Triveni Ghat, Bharat Mandir, Lakshman Temple, Lakshman Jhula as well as Ram Jhula. Evening visit Ganga Aarti at Parmarth Niketan. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Hridwar', 'Agra (410 KM. Approx. 7 Hrs.) – : After breakfast, drive to Agra and over night stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Agra', 'Fatehpur Sikri – Jaipur (250 KM. Approx. 6-7 Hrs.) – Today, After breakfast Morning guided tour to visit the Taj mahal and Agra fort and drive to Jaipur (Pink City) – En-route we make a stop for visit Fatehpur Sikri, And proceed to Jaipur . Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'Today, after breakfast guided to visit ancient capital of Amber. Visit beautiful Amber Fort & take a picture of Water Palace & Take a picture of beautiful Hawa Mahal (Window Palace), visit City Place and Observatory(Jantar Mantar), Rajasthani handicraft. Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Delhi', 'Jaipur (280 KM. Approx. 7 Hrs.) – After breakfast proceed to Delhi and drop you at the Airport with Sweet Memories. Please note: Taj Mahal Closed on every Friday Please note: We can arrange tailor-made tours Inclusions Accommodation', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Haridwar Rishikesh Agra Tour
  pkg_id := 'delhi-haridwar-rishikesh-agra-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-haridwar-rishikesh-agra-tour', 'Delhi Haridwar Rishikesh Agra Tour',
    'Explore the beautiful sights of Delhi | Haridwar/Rishikesh | Agra |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Haridwar Rishikesh Agra Tour package for 06 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Haridwar Rishikesh Agra Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'haridwar', 'rishikesh', 'agra'],
    india_id,
    delhi_state,
    'Delhi Haridwar Rishikesh Agra Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Haridwar/Rishikesh | Agra |. This package offers a comprehensive day-wise itinerary, comfortable stays, and pr',
    ARRAY['delhi', 'haridwar', 'rishikesh', 'agra'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, haridwar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, rishikesh_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'ram-jhula')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'triveni-ghat')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Haridwar (260 KM. 5', '6 Hrs. approx.): Today after breakfast, proceed to Haridwar, check in at the hotel, Evening Ganga Aarti at Har-Ki-Podi. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'After breakfast, proceed to Rishikesh & visit Lakshman jhula, Ram jhula, Triveni ghat & drive to Haridwar & vehicle drop/Pick you at Har-Ki-Podi for walking tour. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Haridwar to Agra (260 Kms. 7/8 Hrs. Approx.)', 'Today After breakfast, proceed to Agra & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Agra to Delhi (250 Kms. 3/4 Hrs. Approx.)', 'Today, after breakfast a guided tour to visit Taj Mahal & Agra fort & proceed to Delhi & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'After breakfast, proceed to visit Red fort, India gate, President house, Lotus temple, Qutub minar and drop you at the airport/railway station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . 04D Delhi Haridwar Rishikesh Delhi Tour
  pkg_id := '04d-delhi-haridwar-rishikesh-delhi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '04d-delhi-haridwar-rishikesh-delhi-tour', '. 04D Delhi Haridwar Rishikesh Delhi Tour',
    'Explore the beautiful sights of Delhi Haridwar Rishikesh Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['03Nt./04D Delhi Haridwar Rishikesh Delhi Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of . 04D Delhi Haridwar Rishikesh Delhi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'haridwar', 'rishikesh'],
    india_id,
    delhi_state,
    '. 04D Delhi Haridwar Rishikesh Delhi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi Haridwar Rishikesh Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private',
    ARRAY['delhi', 'haridwar', 'rishikesh'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 3n-4d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '3n-4d', '3 Nights / 4 Days', 3, 4, '3 Nights / 4 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '3n-4d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, haridwar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, rishikesh_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'laxman-jhula')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'ram-jhula')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival Delhi & drop you hotel & after breakfast proceed to sightseeing Old and New Delhi. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Haridwar (250 Kms. 6 Hrs.)', 'After breakfast proceed to . Haridwar check in at the hotel & after refresh proceed to go Har-Ki-Podi for evening Ganga AArti. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'After breakfast visit Laxman Jhula, Ram Jhula and Temples. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Haridwar to Delhi (250 Kms. 6 Hrs.)', 'After breakfast proceed to Delhi and drop you at the Airport/Railway Station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Jaipur Agra Khajuraho Varanasi Tour
  pkg_id := 'delhi-jaipur-agra-khajuraho-varanasi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-jaipur-agra-khajuraho-varanasi-tour', 'Delhi Jaipur Agra Khajuraho Varanasi Tour',
    'Explore the beautiful sights of Delhi | Jaipur | Agra | Khajuraho | Varanasi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Jaipur Agra Khajuraho Varanasi Tour For 12 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur', 'Guide services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide, Porter Tips'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Jaipur Agra Khajuraho Varanasi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'jaipur', 'agra', 'khajuraho', 'varanasi'],
    india_id,
    delhi_state,
    'Delhi Jaipur Agra Khajuraho Varanasi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Jaipur | Agra | Khajuraho | Varanasi |. This package offers a comprehensive day-wise itinerary, comfortable st',
    ARRAY['delhi', 'jaipur', 'agra', 'khajuraho', 'varanasi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 11n-12d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '11n-12d', '11 Nights / 12 Days', 11, 12, '11 Nights / 12 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '11n-12d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Humayun tomb. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Jaipur (260 kms. 6 hrs. approx.)', 'Today, after breakfast, proceed to Jaipur. Lunch on the way and overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Jaipur sightseeing', 'Today after breakfast, a guided tour to visit Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & James & Stone cutting factory work being done for centuries in Jaipur. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur', 'Agra VIA Fatehpur Sikri(260 kms. 6 hrs. approx.): Today after breakfast, proceed to Jaipur on the way to visit Fatehpur Sikri. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Agra sightseeing', 'Today, a guided tour to visit Taj Mahal, Agra Fort , and visiting famous fine marble inlay work which is still being done in Agra. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Agra to Khajuraho (400 kms. 8 hrs. approx.)', 'Today after breakfast, proceed to Khajuraho. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Khajuraho Sightseeing', 'After breakfast, proceed to visit the most famous Western Temple’s, Jain Temple, and city centre walk, Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Khajuraho to Varanasi (400 kms. 9 hrs. approx.)', 'After breakfast proceed to Varanasi & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Varanasi sightseeing', 'Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site. After breakfast, visit Vishwanath temple, Sankat mochan temple, BHEU & Sarnath. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Day 11 Sightseeing', 'Today after breakfast drop you at Varanasi Airport/Railway & pick up at Delhi airport/railway station and overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 12, 'Day 12 Sightseeing', 'After breakfast drop you at Delhi airport/railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Variant 10n-11d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '10n-11d', '10 Nights / 11 Days', 10, 11, '10 Nights / 11 Days', NULL, NULL, 2, FALSE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '10n-11d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Jaipur(260 kms. 6 hrs. approx.)', 'Today, after breakfast, proceed to Jaipur. Lunch on the way and overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Jaipur sightseeing', 'Today after breakfast, a guided tour to visit Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & James & Stone cutting factory work being done for centuries in Jaipur. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur', 'Agra VIA Fatehpur Sikri(260 kms. 6 hrs. approx.): Today after breakfast, proceed to Jaipur on the way to visit Fatehpur Sikri. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Agra sightseeing', 'Today, a guided tour to visit Taj Mahal, Agra Fort , and visiting famous fine marble inlay work which is still being done in Agra. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Agra to Khajuraho (400 kms. 8 hrs. approx.)', 'Today after breakfast, proceed to Khajuraho. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Khajuraho Sightseeing', 'After breakfast, proceed to visit the most famous Western Temple’s, Jain Temple, and city centre walk, Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Khajuraho to Varanasi (400 kms. 9 hrs. approx.)', 'After breakfast proceed to Varanasi & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Varanasi sightseeing', 'Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site. After breakfast, visit Vishwanath temple, Sankat mochan temple, BHEU & Sarnath. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Day 11 Sightseeing', 'Today after breakfast drop you at Varanasi Airport/Railway station for your onward journey .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Unveiling India's Rich Heritage
  pkg_id := 'unveiling-indias-rich-heritage';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'unveiling-indias-rich-heritage', 'Unveiling India''s Rich Heritage',
    'Explore the beautiful sights of Unveiling India''s Rich Heritage. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Unveiling India''s Rich Heritage'],
    ARRAY['Accommodation on double sharing basis', 'Breakfast at hotels', 'Sightseeing and transfers by private AC vehicle', 'All toll, parking and driver allowances'],
    ARRAY['Airfare / Train tickets', 'Monument entrance fees', 'Any meals not mentioned in inclusions', 'Personal expenses'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg',
    ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Unveiling India''s Rich Heritage.',
    FALSE, TRUE,
    ARRAY['jaipur', 'agra', 'khajuraho', 'varanasi', 'delhi', 'shimla', 'kullu', 'manali', 'ayodhya', 'goa'],
    india_id,
    raj_state,
    'Unveiling India''s Rich Heritage | Mother India Tour Travels',
    'Explore the beautiful sights of Unveiling India''s Rich Heritage. This package offers a comprehensive day-wise itinerary, comfortable stays, and privat',
    ARRAY['jaipur', 'agra', 'khajuraho', 'varanasi', 'delhi', 'shimla', 'kullu', 'manali', 'ayodhya', 'goa'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ayodhya_dest, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, goa_dest, 10) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mehtab-bagh')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'dashashwamedh-ghat')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kashi-vishwanath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'golden-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', ', drive or take a short flight to Jaipur, the capital of Rajasthan and a city painted in royal hues. Known as the Pink City for its distinctive terracotta-colored buildings, Jaipur offers a journey into India''s royal past. Must-See Experiences: Amber Fort with an optional elephant or jeep ride to the entrance City Palace complex with its museums and courtyards Jantar Mantar astronomical observatory (UNESCO site) Hawa Mahal (Palace of Winds) for iconic photo opportunities Cultural Experiences: Traditional Rajasthani dinner at Chokhi Dhani cultural village Block printing and textile workshops Gemstone and jewelry markets in Johari Bazaar Blue pottery demonstrations 5 Agra – The Eternal Symbol of Love On', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, ', head to Agra, home to one of the Seven Wonders of the World', 'the Taj Mahal. Built by Emperor Shah Jahan in memory of his beloved wife Mumtaz Mahal, the Taj is best viewed at sunrise or sunset when its white marble glows in soft golden light. Key Attractions: Taj Mahal at sunrise (closed on Fridays) Agra Fort, a UNESCO World Heritage site Mehtab Bagh gardens for sunset views of the Taj Tomb of Itimad-ud-Daulah (Baby Taj) Local Experiences: Marble inlay craftsmanship demonstrations Mughlai cuisine tasting - especially the famous Agra petha Kinari Bazaar for traditional shopping Kalakriti Cultural & Convention Center for live shows 6-7 Khajuraho – Marvel of Erotic Temples From Agra, take a short flight or train to Khajuraho, a small town in Madhya Pradesh famous for its stunning temples and intricate carvings. These temples, built between 950–1050 AD by the Chandela dynasty, are known for their aesthetic eroticism and artistic expression. Temple Exploration: Western Group of Temples (UNESCO site), particularly Kandariya Mahadev Eastern Group of Temples with Jain influences Southern Group including Chaturbhuj Temple Archaeological Museum near the temples Cultural Experiences: Khajuraho Sound and Light Show in the evening Traditional tribal dance performances Visit to Raneh Falls and Ken River Explore Panna National Park (optional safari) 8-10 Varanasi – The Spiritual Heart of India Fly or take a train to Varanasi, one of the world''s oldest continuously inhabited cities and a center of spirituality and Hinduism. This ancient city on the banks of the Ganges River offers profound spiritual experiences. Spiritual Experiences: Sunrise boat ride on the Ganges River Witness sacred rituals at Dashashwamedh Ghat and Assi Ghat Visit Kashi Vishwanath Temple (Golden Temple) Attend evening Ganga Aarti ceremony Day Trip to Sarnath: Dhamek Stupa where Buddha gave his first sermon Sarnath Archaeological Museum Mulagandha Kuti Vihara temple Chaukhandi Stupa Local Experiences: Explore narrow alleyways of the old city Silk weaving demonstrations and shopping Traditional Banarasi cuisine tasting Evening classical music performances Essential Travel Tips Making the most of your heritage journey through India Best Time to Visit October to March is the ideal time for this itinerary. The weather is pleasant with daytime temperatures ranging from 15°C to 25°C (59°F to 77°F). Avoid the summer months (April-June) when temperatures can exceed 40°C (104°F), and the monsoon season (July-September) when heavy rains may disrupt travel plans. What to Pack Light cotton clothing for daytime Warm layers for cooler evenings Comfortable walking shoes Modest clothing for temple visits Sunscreen, hat, and sunglasses Basic medical kit and prescriptions Cultural Etiquette Remove footwear before entering temples and homes Dress modestly, especially in religious sites Ask permission before photographing people Respect local customs and traditions Use your right hand for giving and receiving Transportation Tips Domestic flights between cities save time Hire private cars with drivers for flexibility Experience Indian railways with AC classes Use ride-sharing apps in major cities Auto-rickshaws for short distances Journey Highlights Moments you''ll treasure forever from this heritage journey Sunrise at the Taj Mahal Watching the first rays of sunlight illuminate the world''s most beautiful monument is an unforgettable experience. Ganga Aarti in Varanasi The evening fire ritual on the banks of the Ganges is a deeply spiritual and sensory experience. Elephant Ride at Amber Fort Ascending to the majestic fort on elephant back offers a royal perspective of Jaipur''s landscape. Khajuraho Temple Carvings Marveling at the intricate erotic sculptures that tell stories of life in medieval India. Chandni Chowk Food Walk Sampling Delhi''s famous street food in the bustling lanes of Old Delhi''s historic market. Dhamek Stupa in Sarnath Standing at the spot where Buddha delivered his first sermon connects you to 2,500 years of spiritual history. Journey Through Time This 10-day journey through India''s Golden Triangle, Khajuraho, and Varanasi offers an unparalleled immersion into the country''s rich heritage. From the Mughal splendor of Delhi and Agra to the Rajput grandeur of Jaipur, the erotic temple art of Khajuraho, and the spiritual intensity of Varanasi, this itinerary captures the essence of India''s diverse cultural tapestry. Each destination tells a different story, creating a journey that engages all your senses and leaves you with memories to last a lifetime. India''s heritage awaits - are you ready to explore? // Smooth scrolling for anchor links document.querySelectorAll(''a[href^="#"]'').forEach(anchor => { anchor.addEventListener(''click'', function (e) { e.preventDefault(); document.querySelector(this.getAttribute(''href'')).scrollIntoView({ behavior: ''smooth'' }); }); }); Chat with us! /* Entrance Animation */ @keyframes float-in { 0% { transform: translateY(100px) scale(0.8); opacity: 0; } 100% { transform: translateY(0) scale(1); opacity: 1; } } .whatsapp-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards; } /* Hover Animation */ .whatsapp-button:hover { transform: scale(1.1) rotate(5deg); } /* Click Animation */ .whatsapp-button:active { transform: scale(0.95); transition: transform 0.1s; } /* Mobile Responsive */ @media (max-width: 768px) { .whatsapp-button { width: 56px; height: 56px; } .whatsapp-tooltip { display: none; } } Message us! /* Shared Animation */ @keyframes float-in { 0% { transform: translateY(100px) scale(0.8); opacity: 0; } 100% { transform: translateY(0) scale(1); opacity: 1; } } /* Staggered Animations */ .whatsapp-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards; } .messenger-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.2s forwards; } /* Hover Effects */ .whatsapp-button:hover { transform: scale(1.1) rotate(5deg); } .messenger-button:hover { transform: scale(1.1) rotate(-5deg); } /* Mobile Responsive */ @media (max-width: 768px) { .whatsapp-container { bottom: 3%; right: 4; } .messenger-container { bottom: 12%; right: 4; } .whatsapp-button, .messenger-button { width: 56px; height: 56px; } } About Us Our Blogs FAQs Mon – Fri 9:00 AM to 8:00 PM Sat – Sun 9:00 AM to 8:00 PM USEFUL LINKS Delhi Agra Jaipur Tour Packages Shimla Kullu Manali Tour Kashmir Tour Packages Kerala Tour Packages Varanasi Ayodhya Tour Packages Goa Tour Packages Golden Triangle Tour Packages CONTACT US Address:- B63/B63A, New Jankipuri, Uttam nagar, New Delhi -110059 Phone:- +91 9810140121 / +91 99710 53881 Email:- tourtravelsmotherindia@gmail.com Social Media:- OUR NEWSLETTER Privacy Policy Terms of Service Subscribe Review Us on Google // Listen for form submission and display a thank-you message. document .getElementById("subscribeForm") .addEventListener("submit", function (e) { e.preventDefault(); const email = e.target.email.value; // You can replace this with an AJAX call to your server. document.getElementById("message").textContent = "Thank you for subscribing, " + email + "!"; e.target.reset(); }); 9001-2015 &copy; 2025 Your Company. All rights reserved. Designed & maintain by motherindiatourtravels', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . 10D Delhi Jaipur Agra Khajuraho Varanasi Tour
  pkg_id := '10d-delhi-jaipur-agra-khajuraho-varanasi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '10d-delhi-jaipur-agra-khajuraho-varanasi-tour', '. 10D Delhi Jaipur Agra Khajuraho Varanasi Tour',
    'Explore the beautiful sights of Delhi Jaipur Agra Khajuraho with Varanasi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['09Nt./10D – Delhi Jaipur Agra Khajuraho with Varanasi Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'Welcome Drink Non Alcoholic.', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State Taxes, Road Taxes, Permit', 'Comfortable vehicles', 'Guide Services', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide & Porter Tips'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . 10D Delhi Jaipur Agra Khajuraho Varanasi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'jaipur', 'agra', 'khajuraho', 'varanasi'],
    india_id,
    delhi_state,
    '. 10D Delhi Jaipur Agra Khajuraho Varanasi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi Jaipur Agra Khajuraho with Varanasi. This package offers a comprehensive day-wise itinerary, comfortable stays, ',
    ARRAY['delhi', 'jaipur', 'agra', 'khajuraho', 'varanasi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 9n-10d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '9n-10d', '9 Nights / 10 Days', 9, 10, '9 Nights / 10 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '9n-10d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival transfer at Delhi airport/railway station & a guided tour to proceed to visit Qutub minar, India gate, Red fort, Jama masjid. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Jaipur (260 Kms. 6 Hrs. approx.)', 'After breakfast proceed to Jaipur. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'Today, After breakfast, I took a guided tour to visit the magnificent Amber Fort, Water palace, City palace, Hawa mahal (Window palace). Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Jaipur to Agra (260 Kms. 7 Hrs.)', 'After breakfast proceed to Jaipur - En-Route stop to visit Fatehpur Sikri. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Today, After breakfast, a guided tour to visit The Taj Mahal, Agra fort, Marble inlay handicrafts. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Agra to Khajuraho (415 Kms. 8 Hrs. approx.)', 'After breakfast proceed to Khajuraho.En route visit Orchha. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Khajuraho Sightseeing', 'After breakfast proceed to visit of Western Temples, Jain Temples. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Khajuraho to Varanasi (400 Kms. 9/10 Hrs. approx.)', 'After breakfast proceed to Varanasi. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Day 9 Sightseeing', 'Early morning a guided tour proceeds by boat ride on Hindu Holy River Ganges, after refresh & breakfast proceed to visit Sankat mochan temple, Vishwanath temple, Bharat mata mandir. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Varanasi drop', 'After breakfast proceed to Varanasi airport/Railway Stn.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Tour : Delhi Jaipur Ranthambhore Agra Delhi
  pkg_id := 'tour-delhi-jaipur-ranthambhore-agra-delhi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'tour-delhi-jaipur-ranthambhore-agra-delhi', 'Tour : Delhi Jaipur Ranthambhore Agra Delhi',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Ranthambore | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['05 Night 06 Days Tour : Delhi Jaipur Ranthambhore Agra Delhi'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meal', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Guide Services', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide & Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Tour : Delhi Jaipur Ranthambhore Agra Delhi.',
    FALSE, TRUE,
    ARRAY['delhi', 'jaipur', 'agra', 'ranthambore'],
    india_id,
    delhi_state,
    'Tour : Delhi Jaipur Ranthambhore Agra Delhi | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Ranthambore | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable sta',
    ARRAY['delhi', 'jaipur', 'agra', 'ranthambore'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. After breakfast proceed to visit Old Delhi & New Delhi. Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Agra (230 Kms. 3 Hrs.)', 'Today, after breakfast proceed to Agra & check in the hotel & proceed to visit Taj Mahal, Agra Fort and Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra to Ranthambore (280 Kms. 7 Hrs. Approx.)', 'After breakfast drive to Ranthambore En-Rout visit Fatehpur Sikri . Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Ranthambore to Jaipur (180 Kms. 3 Hrs.)', 'Early morning start your Jungle safari tour (own cost) after breakfast drive to Jaipur & overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Ranthambore to Jaipur (180 Kms. 3 Hrs.)', 'Early morning start your Jangle safari tour (own cost) after breakfast drive to Jaipur &visit ancient capital of Amber. Visit beautiful Amber Fort after Amber Fort proceed to the pink city Jaipur we will visit Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) after visit famous block printing & James & Stone cutting factory work being done since centuries in Jaipur. Overnight stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Jaipur to Delhi ( 260 Kms. 6 Hrs. Approx.)', 'After breakfast proceed to Delhi & drop you at the airport/Railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . 06D Delhi Nainital Corbett National Park
  pkg_id := '06d-delhi-nainital-corbett-national-park';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '06d-delhi-nainital-corbett-national-park', '. 06D Delhi Nainital Corbett National Park',
    'Explore the beautiful sights of Delhi Nainital with Corbett National Park. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['05Nt./06D Delhi Nainital with Corbett National Park'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Wildlife', 12, 10, 'Premium Hotels',
    'Experience the best of . 06D Delhi Nainital Corbett National Park.',
    FALSE, TRUE,
    ARRAY['delhi', 'nainital'],
    india_id,
    delhi_state,
    '. 06D Delhi Nainital Corbett National Park | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi Nainital with Corbett National Park. This package offers a comprehensive day-wise itinerary, comfortable stays, ',
    ARRAY['delhi', 'nainital'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, wild_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, nainital_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival transfer & proceed to visit Old & New Delhi . Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Jim Corbett (250 Kms. 6 Hrs.)', 'After breakfast proceed to Jim Corbett National Park. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Corbett', 'Tiger century by Jeep safari tour & back to hotel. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Corbett to Nainital (75 Kms. 2 Hrs.)', 'After breakfast proceed to Nainital. Evening free for walking tour. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Nainital', 'After breakfast proceed to local sightseeing. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Nainital to Delhi (325 Kms. 7 Hrs.)', 'After breakfast proceed to Delhi and drop you at the Airport/Railway Station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Rajasthan Tour Agra & Khajuraho Varanasi Ex. Delhi
  pkg_id := 'rajasthan-tour-agra-khajuraho-varanasi-ex-delhi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'rajasthan-tour-agra-khajuraho-varanasi-ex-delhi', 'Rajasthan Tour Agra & Khajuraho Varanasi Ex. Delhi',
    'Explore the beautiful sights of Rajasthan Tour Agra & Khajuraho Varanasi Ex. Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Rajasthan Tour with Agra & Khajuraho Varanasi Ex. Delhi For 21 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide & porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Rajasthan Tour Agra & Khajuraho Varanasi Ex. Delhi.',
    FALSE, TRUE,
    ARRAY['agra', 'khajuraho', 'varanasi', 'delhi', 'mandawa', 'bikaner', 'jaisalmer', 'jodhpur', 'udaipur', 'pushkar', 'jaipur'],
    india_id,
    up_state,
    'Rajasthan Tour Agra & Khajuraho Varanasi Ex. Delhi | Mother India Tour Travels',
    'Explore the beautiful sights of Rajasthan Tour Agra & Khajuraho Varanasi Ex. Delhi. This package offers a comprehensive day-wise itinerary, comfortabl',
    ARRAY['agra', 'khajuraho', 'varanasi', 'delhi', 'mandawa', 'bikaner', 'jaisalmer', 'jodhpur', 'udaipur', 'pushkar', 'jaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 20n-21d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '20n-21d', '20 Nights / 21 Days', 20, 21, '20 Nights / 21 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '20n-21d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mandawa_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, bikaner_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaisalmer_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jodhpur_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 10) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 11) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'jaisalmer-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel.Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi sightseeing', 'Today after breakfast, a guided tour to visit Jama Masjid, Red Fort, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb, Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi', 'Mandawa (260 Kms. 6 Hrs. approx.): Today, after breakfast, drive to Mandawa & checked in at the hotel. Evening a guided walking tour to visit old painted houses (Havelis). Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Mandawa', 'Bikaner (200 kms. 4 hrs.): Today after breakfast, proceed to Bikaner and visit Bikaner Fort (JunaGarh Fort). After checking in the hotel Proceed to visit Deshnok Temple. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Bikaner', 'Jaisalmer(340 kms. 6 hrs. approx.): Today after breakfast proceed to Jaisalmer. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Today after breakfast check out from the hotel and visit Jaisalmer fort, Patwon', 'ki haveli and after lunch, proceed to Khuri/Sam (SanDunes Desert Village) and enjoy village and dunes sun set point by camel ride and back to desert camp, Rajasthani Folk Dance , Dinner. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, '; Khuri', 'Jodhpur (270 kms. 6 hrs. approx.): Today after breakfast proceed to Jodhpur. Visit Jodhpur Fort Mehrangarh and Jaswant Thada. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Jodhpur', 'Ranakpur (200 kms. 3 hrs. approx.): Today after breakfast, proceed to Ranakpur & visit Ranakpur Jain Temple. after lunch drive to Udaipur & Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Ranakpur', 'Udaipur (100 kms. 3 hrs. approx.): Today after breakfast proceed to Udaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Udaipur sightseeing', 'Today after breakfast, proceed to visit Jagdish Temple, City Palace, Princes Garden (Sahelio Ki Badi), and Boat Ride . Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Udaipur', 'Pushkar(280 kms. 6 hrs. approx.): Today after breakfast proceed to Pushkar Hindu holy city. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 12, 'Pushkar', 'Jaipur (150 kms. 3 hrs. approx.): Today after breakfast Visit Brahma Temple, Camel Fare Ground and proceed to Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 13, 'Jaipur sightseeing', 'Today after breakfast, a guided tour to visit the ancient capital of Amer. Visit the beautiful Amer Fort, Hawa Mahal(Window Palace), City Place and Observatory(Jantar Mantar), visiting famous block printing & James & Stone cutting factory work being done for centuries in Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 14, 'Jaipur', 'Agra VIA Fatehpur Sikri(260 kms. 6 hrs. approx.): Today after breakfast proceed to Jaipur on the way to Fatehpur Sikri.Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 15, 'Agra sightseeing', 'Today, a guided tour to visit Taj Mahal, Agra Fort , and visiting famous fine marble inlay work which is still being done in Agra. Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 16, 'Agra', 'Orchha(260 kms. 6 hrs. approx.): Today after breakfast proceed to Orchha and visit Orchcha fort & free for walking tour. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 17, 'Orchha', 'Khajuraho(180 kms. 4 hrs. approx.): Today after breakfast proceed to Khajuraho. Rest of the at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 18, 'Khajuraho sightseeing', 'Today after breakfast proceed to sightseeing and visit Western Temples and Jain Temples. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 19, 'Khajuraho', 'Varanasi(400 kms. 9 hrs. approx.): Today, after breakfast drive to Varanasi. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 20, 'Varanasi sightseeing', 'Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site. After breakfast, visit Vishwanath temple, Sankat mochan temple, BHEU & Sarnath. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 21, 'Day 21 Sightseeing', 'Today after breakfast drop you at Varanasi Airport/Railway station for your onward journey .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delhi Shimla Manali Agra Tour
  pkg_id := 'delhi-shimla-manali-agra-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-shimla-manali-agra-tour', 'Delhi Shimla Manali Agra Tour',
    'Explore the beautiful sights of Delhi | Agra | Shimla | Manali | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Delhi Shimla Manali Agra Tour package for 08 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .', 'Guide & Driver Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Delhi Shimla Manali Agra Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'shimla', 'manali', 'agra', 'kullu'],
    india_id,
    delhi_state,
    'Delhi Shimla Manali Agra Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Shimla | Manali | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, a',
    ARRAY['delhi', 'shimla', 'manali', 'agra', 'kullu'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 7n-8d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '7n-8d', '7 Nights / 8 Days', 7, 8, '7 Nights / 8 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '7n-8d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'solang-valley')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hadimba-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kufri')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'New Delhi to Shimla (360Kms 7/8 Hours Approx', '); Upon arrival Morning at the Airport/ Railways station and drive towards Shimla. Shimla, a very popular holiday-retreat, is well-known for its Victorian architecture, which is reflected in certain areas of the Mall and The Ridge. Upon arrival at Shimla, Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Shimla; After breakfast at the hotel, proceed for a half day excursion to Kufri (2500mts). Kufri is also renowned for other adventure activities such as skiing, tobogganing (sliding downhill on a sled), etc. Kufri has the oldest skiing slopes in Himachal Pradesh. You can also take a hike or a Pony up to Mashu Peak. Afternoon: Guests will be dropped at the Shimla elivetore & explore by themselves. Attractions of the mall road include Shimla Church, Scandal Point, Gaiety Theater, Town hall, Jaku Temple & shopping. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Shimla to Manali (272Kms 7/8 Hours Approx', ') ; After breakfast at the hotel, depart for Manali. Drive past Beas-Sutlej Link project, Pandoh Dam & En-Rout halt Kullu Valley (Boat ride direct payment basi) - Lunch shall be en-route on direct payment basis. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Manali', 'After Breakfast, Proceed for local sightseeing of Manali ( Day Trip ). Visit Solang Valley, You can opt for adventure sports like Paragliding, Zorbing, and Skiing (subject to snow & weather conditions) on a direct payment basis. Overnight at the hotel. (Optional tour costing Extra Atul Tunel, Sissu & Rohtang)', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Manali', 'Sightseeing; After Breakfast, Proceed for local sightseeing of Manali. Visit Vashishtha Kund & Hadimba Temple, Tibetan Monastery & Mall Road, Van vihar. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Manali to Delhi (550 Kms./ 12', '13 Hours Approx.) : After breakfast Proceed to Delhi & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Delhi to Agra (250 Kms./ 3', '4 Hours Approx.) ; After breakfast Proceed to Agra a guided tour to visit Taj Mahal & Agra fort. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Agra to Delhi (250 Kms./3', '4 Hours Approx.): After breakfast proceed to Delhi and a guided tour to visit India gate, President house, Lotus temple, Qutub minar & drop you at airport/railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Exotic Himachal Tour Amritsar
  pkg_id := 'exotic-himachal-tour-amritsar';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'exotic-himachal-tour-amritsar', 'Exotic Himachal Tour Amritsar',
    'Explore the beautiful sights of Delhi | Shimla | Manali | Dharamshala | Dalhousie | Amritsar | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Exotic Himachal Tour Package with Amritsar for 09 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of Exotic Himachal Tour Amritsar.',
    FALSE, TRUE,
    ARRAY['amritsar', 'delhi', 'shimla', 'chandigarh', 'manali', 'kullu', 'dharamshala', 'dalhousie'],
    india_id,
    delhi_state,
    'Exotic Himachal Tour Amritsar | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Shimla | Manali | Dharamshala | Dalhousie | Amritsar | Delhi. This package offers a comprehensive day-wise iti',
    ARRAY['amritsar', 'delhi', 'shimla', 'chandigarh', 'manali', 'kullu', 'dharamshala', 'dalhousie'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 8n-9d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '8n-9d', '8 Nights / 9 Days', 8, 9, '8 Nights / 9 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '8n-9d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, amritsar_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, chandigarh_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, dharamshala_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, dalhousie_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'dal-lake')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'solang-valley')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hadimba-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kufri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'golden-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'wagah-border')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi to Shimla(350 Kms. 7/8 Hrs.)', 'Chandigarh to Shimla(120 Kms. 4 Hrs. approx.): Upon arrival Morning at Delhi/Chandigarh Airport/ Railways station and drive towards Shimla. Shimla, a very popular holiday-retreat, is well-known for its Victorian architecture, which is reflected in certain areas of the Mall and The Ridge. Upon arrival at Shimla, Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After breakfast at the hotel, proceed for a half day excursion to Kufri (2500mts). Kufri is also renowned for other adventure activities such as skiing, tobogganing (sliding downhill on a sled), etc. You can also take a hike or a Pony up to Mashu Peak(own cost-direct payment basis). Afternoon: Guests will be dropped at the Shimla elevator & explore by themselves. Attractions of the mall road include Shimla Church, Scandal Point, Gaiety Theater, Town hall, Jaku Temple & shopping. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Shimla to Manali (240 Kms. 7/8 Hrs. approx.)', 'After breakfast at the hotel, depart for Manali. Drive past Beas-Sutlej Link project, Pandoh Dam & En-Rout halt Kullu Valley & river rafting (Own your cost), Lunch shall be en-route on direct payment basis. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast, proceed for Manali sightseeing and visit Hadimba Temple, Vashisht temple, Solang Valley, Mall Road. Overnight stay at the hotel. *Optional Tour with extra paid: Atul tunel, Sissu, Rohtang pas.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Manali To Dharamshala (225 Kms. 7 Hrs. approx.)', 'After breakfast, proceed to Dharamshala. On the way visit Baijnath Shiva Temple and Palampur Tea Garden & stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Dharamshala To Dalhousie(125 Kms. 4 Hrs. approx.)', 'After breakfast, Towards Dalhousie after doing the local sightseeing of Places which includes, His holiness Dalai lama residence & Tsugalkhang at Mcleodganj, St. john’s church in the wilderness (Built in 1853),War memorial, Bhagsunath temple and Dal Lake, Norbulingka, Gyuto Rameda Tantric Monastery. Reach Dalhousie in the evening. Stay at a hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Dalhousie has been named after the British Governor', 'General of the l9th century, Lord Dalhousie. Surrounded by varied vegetation – pines, dodders, oaks and flowering rhododendrons. Local sightseeing of Dalhousie includes visit to Panjipula, Subhash Baoli and excursion to Khajjiar 24 km from Dalhousie surrounded by thick Deodar forest. Drive from Dalhousie to Khajjiar is awesome. Stay at a hotel. Day 08. Dalhousie To Amritsar (200 Kms. 5/6 Hrs. approx.): After breakfast, drive to Amritsar & visit the evening retreat border ceremony at wagah border & visit Golden temple. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Amritsar To Delhi (550 Kms. 10 Hrs. approx.)', 'Amritsar to Chandigarh (250 Kms. 5/6 Hrs. approx.): After breakfast, proceed to After breakfast, drive to Delhi/Chandigarh & Drop you at the airport/railway Station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Golden Triangle Tour Khajuraho Varanasi
  pkg_id := 'golden-triangle-tour-khajuraho-varanasi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'golden-triangle-tour-khajuraho-varanasi', 'Golden Triangle Tour Khajuraho Varanasi',
    'Explore the beautiful sights of Delhi | Jaipur | Agra | Khajuraho | Varanasi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Golden Triangle Tour with Khajuraho Varanasi 10 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide & porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Golden Triangle Tour Khajuraho Varanasi.',
    FALSE, TRUE,
    ARRAY['khajuraho', 'varanasi', 'delhi', 'jaipur', 'agra'],
    india_id,
    mp_state,
    'Golden Triangle Tour Khajuraho Varanasi | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Jaipur | Agra | Khajuraho | Varanasi |. This package offers a comprehensive day-wise itinerary, comfortable st',
    ARRAY['khajuraho', 'varanasi', 'delhi', 'jaipur', 'agra'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 9n-10d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '9n-10d', '9 Nights / 10 Days', 9, 10, '9 Nights / 10 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '9n-10d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Jaipur(260 kms. 6 hrs. approx.)', 'Today, after breakfast, proceed to Jaipur. Lunch on the way and overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Jaipur sightseeing', 'Today after breakfast, a guided tour to visit Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & James & Stone cutting factory work being done for centuries in Jaipur. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur', 'Agra VIA Fatehpur Sikri(260 kms. 6 hrs. approx.): Today after breakfast, proceed to Jaipur on the way to visit Fatehpur Sikri. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Agra to Khajuraho(400 kms. 9 hrs. approx.)', 'Early morning a guided tour to visit Taj Mahal sunRise, after breakfast visiting famous fine marble inlay work which is still being done in Agra and drive to Khajuraho En-Route visiting Orchha. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Khajuraho Sightseeing', 'After breakfast, proceed to visit the most famous Western Temple’s, Jain Temple, and city centre walk, Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Khajuraho to Varanasi (400 kms. 9 hrs. approx.)', 'After breakfast proceed to Varanasi & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Varanasi sightseeing', 'Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site. After breakfast, visit Vishwanath temple, Sankat mochan temple, BHEU & Sarnath. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Day 10 Sightseeing', 'Today after breakfast drop you at Varanasi Airport/Railway station for your onward journey .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . 06D Golden Triangle Tour Delhi Agra Jaipur Delhi
  pkg_id := '06d-golden-triangle-tour-delhi-agra-jaipur-delhi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '06d-golden-triangle-tour-delhi-agra-jaipur-delhi', '. 06D Golden Triangle Tour Delhi Agra Jaipur Delhi',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['05Nt./06D – Golden Triangle Tour Delhi Agra Jaipur Delhi'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meal', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Guide Services', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, Guide & Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . 06D Golden Triangle Tour Delhi Agra Jaipur Delhi.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur'],
    india_id,
    delhi_state,
    '. 06D Golden Triangle Tour Delhi Agra Jaipur Delhi | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and privat',
    ARRAY['delhi', 'agra', 'jaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi sightseeing', 'Today, after breakfast, we took a guided tour to visit Jama Masjid, Red Fort, India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Agra (250 KM. Approx. 3', '4 Hrs. approx.): Today after breakfast, proceed to Agra and Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Agra to Jaipur (260 Kms. approx. 6 Hrs.)', 'Today early morning a guided tour to visit Taj Mahal on Sun Rise, and back to the hotel. After breakfast, proceed to visit Agra Fort and drive to Jaipur on the way to visit Fatehpur Sikri . Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Jaipur Sightseeing; Today after breakfast, a guided to the ancient capital of Amber, visiting beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous block printing & Rajasthani handicraft work being done for centuries in Jaipur. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Jaipur', 'Delhi (280 KM. Approx. 5-6 Hrs.): Today after breakfast, proceed to Delhi and drop you at the Airport/Railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Grand Himachal Tour Amritsar .
  pkg_id := 'grand-himachal-tour-amritsar';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'grand-himachal-tour-amritsar', 'Grand Himachal Tour Amritsar .',
    'Explore the beautiful sights of Delhi | Shimla | Manali | Dharamshala | Dalhousie | Amritsar | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Grand Himachal Tour Package with Amritsar for 10 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of Grand Himachal Tour Amritsar ..',
    FALSE, TRUE,
    ARRAY['amritsar', 'delhi', 'shimla', 'chandigarh', 'manali', 'kullu', 'dharamshala', 'dalhousie'],
    india_id,
    delhi_state,
    'Grand Himachal Tour Amritsar . | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Shimla | Manali | Dharamshala | Dalhousie | Amritsar | Delhi. This package offers a comprehensive day-wise iti',
    ARRAY['amritsar', 'delhi', 'shimla', 'chandigarh', 'manali', 'kullu', 'dharamshala', 'dalhousie'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 9n-10d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '9n-10d', '9 Nights / 10 Days', 9, 10, '9 Nights / 10 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '9n-10d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, amritsar_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, chandigarh_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, dharamshala_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, dalhousie_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'dal-lake')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'solang-valley')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hadimba-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kufri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'golden-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'wagah-border')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi to Shimla(350 Kms. 7/8 Hrs.)', 'Chandigarh to Shimla(120 Kms. 4 Hrs. approx.): Upon arrival Morning at Delhi/Chandigarh Airport/ Railways station and drive towards Shimla. Shimla, a very popular holiday-retreat, is well-known for its Victorian architecture, which is reflected in certain areas of the Mall and The Ridge. Upon arrival at Shimla, Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After breakfast at the hotel, proceed for a half day excursion to Kufri (2500mts). Kufri is also renowned for other adventure activities such as skiing, tobogganing (sliding downhill on a sled), etc. You can also take a hike or a Pony up to Mashu Peak(own cost-direct payment basis). Afternoon: Guests will be dropped at the Shimla elevator & explore by themselves. Attractions of the mall road include Shimla Church, Scandal Point, Gaiety Theater, Town hall, Jaku Temple & shopping. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Shimla to Manali (240 Kms. 7/8 Hrs. approx.)', 'After breakfast at the hotel, depart for Manali. Drive past Beas-Sutlej Link project, Pandoh Dam & En-Rout halt Kullu Valley & river rafting (Own your cost), Lunch shall be en-route on direct payment basis. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast, proceed for Manali sightseeing and visit Hadimba Temple, Vashisht temple, Solang Valley, Mall Road. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'After breakfast, proceed for day trip to Solang valley, (Activities own direct payment basis)', '*Optional Tour with extra paid: Atul tunel, Sissu, Rohtang pas*', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Manali To Dharamshala (225 Kms. 7 Hrs. approx.)', 'After breakfast, proceed to Dharamshala. On the way visit Baijnath Shiva Temple and Palampur Tea Garden & stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Dharamshala To Dalhousie(125 Kms. 4 Hrs. approx.)', 'After breakfast, Towards Dalhousie after doing the local sightseeing of Places which includes, His holiness Dalai lama residence & Tsugalkhang at Mcleodganj, St. john’s church in the wilderness (Built in 1853),War memorial, Bhagsunath temple and Dal Lake, Norbulingka, Gyuto Rameda Tantric Monastery. Reach Dalhousie in the evening. Stay at a hotel. Day 08. Dalhousie has been named after the British Governor – General of the l9th century, Lord Dalhousie. Surrounded by varied vegetation – pines, dodders, oaks and flowering rhododendrons. Local sightseeing of Dalhousie includes visit to Panjipula, Subhash Baoli and excursion to Khajjiar 24 km from Dalhousie surrounded by thick Deodar forest. Drive from Dalhousie to Khajjiar is awesome. Stay at a hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Dalhousie To Amritsar (200 Kms. 5/6 Hrs. approx.)', 'After breakfast, drive to Amritsar & visit the evening retreat border ceremony at wagah border & visit Golden temple. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Amritsar To Delhi (550 Kms. 10 Hrs. approx.)', 'Amritsar to Chandigarh (250 Kms. 5/6 Hrs. approx.): After breakfast, proceed to After breakfast, drive to Delhi/Chandigarh & Drop you at the airport/railway Station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Himalayan Panorama Tour
  pkg_id := 'himalayan-panorama-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'himalayan-panorama-tour', 'Himalayan Panorama Tour',
    'Explore the beautiful sights of Himalayan Panorama Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Himalayan Panorama Tour Package for 05 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur', 'Guide Service'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc', 'Monument entrances, camera Fee, etc', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis)', 'Driver, Guide & Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg',
    ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Himalayan Panorama Tour.',
    FALSE, FALSE,
    ARRAY['kathmandu'],
    nepal_id,
    NULL,
    'Himalayan Panorama Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Himalayan Panorama Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transf',
    ARRAY['kathmandu'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, int_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kathmandu_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'pashupatinath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'boudhanath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'swayambhunath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kathmandu-durbar-square')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Welcome to Nepal', 'Upon arrival at Tribhuvan International airport our representative will be waiting for you, and will take you to a pre- booked hotel. In the evening tour, Pasupatinatha and Boudhanatha Stupa. You can also join for sandhya arati. Back to hotel and Overnight in Kathmandu.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After breakfast, drive to Kathmandu Durbar square and Swayambhunath stupa for half day guided sightseeing tour, PM: visiting Boudhanath and Pashupatinath temple, Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'Transfer to Nagarkot for Himalayan panorama tour, visit historical Newari town Bhaktapur on the way, which is as typical as early days O/N Resort.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After the magnificent trip to Nagarkot, drive back to Kathmandu, rest of the day free for shopping and personal activities, O/N Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Everest Mountain flight (optional) in the morning and transfer to the airport for your final departure or join our other program.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Volvo Coach Package 5N 6D Delhi Manali Delhi Tour Honeymoon Package
  pkg_id := 'volvo-coach-package-5n-6d-delhi-manali-delhi-tour-honeymoon-package';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'volvo-coach-package-5n-6d-delhi-manali-delhi-tour-honeymoon-package', 'Volvo Coach Package 5N 6D Delhi Manali Delhi Tour Honeymoon Package',
    'Explore the beautiful sights of Volvo Coach Package 5N 6D Delhi Manali Delhi Tour Honeymoon Package. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Volvo Coach Package 5N/6D – Delhi Manali Delhi Tour/ Honeymoon Package'],
    ARRAY['Accommodation .', 'Welcome Drink Non Alcoholic.', 'Breakfast/Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Pvt. Vehicle with driver at Manali', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, Camera fee etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, guide, porter tip', 'Room Heater'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Volvo Coach Package 5N 6D Delhi Manali Delhi Tour Honeymoon Package.',
    FALSE, TRUE,
    ARRAY['delhi', 'manali', 'kullu'],
    india_id,
    delhi_state,
    'Volvo Coach Package 5N 6D Delhi Manali Delhi Tour Honeymoon Package | Mother India Tour Travels',
    'Explore the beautiful sights of Volvo Coach Package 5N 6D Delhi Manali Delhi Tour Honeymoon Package. This package offers a comprehensive day-wise itin',
    ARRAY['delhi', 'manali', 'kullu'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'solang-valley')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hadimba-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Manali: Pick up Volvo Coach from proceed Delhi to Manali in the evening .Overnight in the Bus.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Manali Arrival(Half day local sightseeing', 'Arrive Manali in the morning , Check in to the hotel and after Breakfast & proceed to visit Hadimba Temple, Vashist Temple, Club House, Mall Road & Stay at hotel .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day trip to Rohtang, Solang Valley/Snow Point', 'Enjoy the morning breakfast at the hotel and later get ready for an excursion to visit Solang Valley.Solang Valley is outstandingly beautiful and is an ideal spot to view the majestic snow covered Himalayas, serene natural surrounding, pristine lake and fairy white snow round the year. After cover the sightseeing back to hotel. Stay in hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Day trip to visit Manikaran Gurudwara, Kullu valley enjoy boat ride & back to hotel & stay. Day 05. Manali To Delhi Departure: Morning after breakfast, Check-out from hotel evening catch the Volvo from Manali to proceed Delhi. Overnight Journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Delhi', 'Arrival at Delhi Bus stand Rama Krishna Ashram Metro Station . proceed for your onward destination….', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: 06N 07D Delhi Agra Ranthambhore Jaipur Mandawa Delhi Tour
  pkg_id := '06n-07d-delhi-agra-ranthambhore-jaipur-mandawa-delhi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '06n-07d-delhi-agra-ranthambhore-jaipur-mandawa-delhi-tour', '06N 07D Delhi Agra Ranthambhore Jaipur Mandawa Delhi Tour',
    'Explore the beautiful sights of 06N 07D Delhi Agra Ranthambhore Jaipur Mandawa Delhi Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['06N/07D Delhi Agra Ranthambhore Jaipur Mandawa Delhi Tour'],
    ARRAY['Accommodation .', 'Welcome Drink Non Alcoholic.', 'Breakfast/Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Comfortable vehicle with experienced driver', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, Camera fee etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, guide, porter tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of 06N 07D Delhi Agra Ranthambhore Jaipur Mandawa Delhi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur', 'mandawa', 'ranthambore'],
    india_id,
    delhi_state,
    '06N 07D Delhi Agra Ranthambhore Jaipur Mandawa Delhi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of 06N 07D Delhi Agra Ranthambhore Jaipur Mandawa Delhi Tour. This package offers a comprehensive day-wise itinerary, com',
    ARRAY['delhi', 'agra', 'jaipur', 'mandawa', 'ranthambore'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mandawa_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi', 'Agra, (250 KM. Approx 3 Hrs.) Today after breakfast visit Old & New Delhi visit Jama Masjid, Rajghat (Gandhi Cremation place), India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb, & After proceed to Agra. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra', 'Ranthambore VIA Fatehpur Sikri (300 KM. Approx 6 Hrs.) : Today, after breakfast check out from hotel & proceed to visit memory of Love The Taj Mahal & after visit Agra Fort and proceed to Ranthambore En-Rout visit Fatehpur Sikri. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Ranthambore', 'Jaipur (160 KM. Approx 4 Hrs.) : Today, Early morning proceed to Jungle Safari Tiger Century (Own Arrangement) & after come back to hotel & after breakfast proceed to Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur Sightseeing', 'Today, after breakfast proceed to visit ancient capital of Amber. Visit beautiful Amber Fort after Amber Fort proceed to the pink city Jaipur we will visit Hawa Mahal(Window Palace), City Place and Observatory (Jantar Mantar) after visit famous block printing & James & Stone cutting factory work being done since centuries in Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Jaipur', 'Mandawa (200 KM. Approx 4 Hrs.): Today, after breakfast proceed to Mandawa after check in walk around Mandawa it’s a small village in Shekhawati Region & visit beautiful painted old houses (Haveli’s) . Rest of the day at leisure. Day 07. Mandawa – Delhi (260 KM. Approx 6-7 Hrs.): Today, after breakfast proceed to Delhi & drop you at Delhi Airport/Railway Station for your onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: : Delhi Mussoorie Corbett Nainital Tour
  pkg_id := 'delhi-mussoorie-corbett-nainital-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-mussoorie-corbett-nainital-tour', ': Delhi Mussoorie Corbett Nainital Tour',
    'Explore the beautiful sights of Delhi | Mussoorie | Corbett | Nainital | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['05 Nights 06 Days: Delhi ! Mussoorie ! Corbett ! Nainital ! Tour'],
    ARRAY['Accommodation .', 'Welcome Drink Non Alcoholic.', 'Breakfast/Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Comfortable vehicle with experienced driver', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, Camera fee etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, guide, porter tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Wildlife', 12, 10, 'Premium Hotels',
    'Experience the best of : Delhi Mussoorie Corbett Nainital Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'mussoorie', 'nainital'],
    india_id,
    delhi_state,
    ': Delhi Mussoorie Corbett Nainital Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Mussoorie | Corbett | Nainital | Delhi. This package offers a comprehensive day-wise itinerary, comfortable st',
    ARRAY['delhi', 'mussoorie', 'nainital'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, wild_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mussoorie_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, nainital_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Mussoorie (270 Kms. Approx. 7 hours): Welcome to Delhi airport/station and proceed to Mussoorie. On arrival check in to your hotel. Remainder of the evening at leisure. Overnight in Mussoorie.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Mussoorie', 'Sightseeing: After breakfast, explore local sightseeing and tour in Mussoorie. See the famous plunging Kempty Falls, Gun hillside factor offering breathtaking views of the Himalayas ranges and also the doon valley. You can appreciate shopping at Shopping center road. Evening is free for pastime.Overnight in Mussoorie.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Mussoorie', 'Corbett (250 kms. Approx. 6 hrs): Today after the morning meal proceed to your journey to the jungles of Corbett. On arrival check in to your hotel. You might pick to enjoy the evening safari on your own at an additional cost. Jim Corbett National Park is known for pets like tigers, elephants, sambar, chitals, nilgai and 600 different species of birds. Overnight in Corbett.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Corbett', 'Nainital (150 kms; Approximate 6 hrs) After breakfast, look into and proceed to early morning safari. After that proceed to Nainital. On arrival check in to your hotel. You have the rest of the day at leisure.Overnight in Nainital.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Nainital Sightseeing', 'Today after breakfast, proceed to check out Naina Devi Temple, Hanuman Garhi, Naina Height where one can delight in the breathtaking views of snow-capped Mountain range & Nainital Valley. Evening visit the local market at the Shopping centaur roadway where one can shop for different kinds of candles. Overnight in Nainital.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Nainital', 'Delhi (Approx. 9 hrs): Today after breakfast, transfer to Delhi Airport terminal/ Railway Station to board your flight/train to your next destination or hometown. Please note: Honeymoon Package arrange on demand Please note: We can arrange tailor-made tours Inclusions Accommodation .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . 12D Tour: Delhi Agra Ranthambore Jaipur Pushkar Jaisalmer Bikaner Mandawa Delhi:
  pkg_id := '12d-tour-delhi-agra-ranthambore-jaipur-pushkar-jaisalmer-bikaner-mandawa-delhi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '12d-tour-delhi-agra-ranthambore-jaipur-pushkar-jaisalmer-bikaner-mandawa-delhi', '. 12D Tour: Delhi Agra Ranthambore Jaipur Pushkar Jaisalmer Bikaner Mandawa Delhi:',
    'Explore the beautiful sights of Delhi | Agra | Ranthambore | Jaipur | Pushkar | Jaisalmer | Bikaner | Mandawa | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['11Nt./12D Tour: Delhi, Agra, Ranthambore, Jaipur, Pushkar, Jaisalmer, Bikaner, Mandawa, Delhi:'],
    ARRAY['Accommodation .', 'Welcome Drink Non Alcoholic.', 'Breakfast/Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Comfortable vehicle with experienced driver', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, Camera fee etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, guide, porter tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . 12D Tour: Delhi Agra Ranthambore Jaipur Pushkar Jaisalmer Bikaner Mandawa Delhi:.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'ranthambore', 'jaipur', 'pushkar', 'jaisalmer', 'bikaner', 'mandawa'],
    india_id,
    delhi_state,
    '. 12D Tour: Delhi Agra Ranthambore Jaipur Pushkar Jaisalmer Bikaner Mandawa Delhi: | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Ranthambore | Jaipur | Pushkar | Jaisalmer | Bikaner | Mandawa | Delhi |. This package offers a compreh',
    ARRAY['delhi', 'agra', 'ranthambore', 'jaipur', 'pushkar', 'jaisalmer', 'bikaner', 'mandawa'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 11n-12d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '11n-12d', '11 Nights / 12 Days', 11, 12, '11 Nights / 12 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '11n-12d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaisalmer_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, bikaner_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mandawa_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'jaisalmer-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel.Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi', 'Today after breakfast visit Old & New Delhi visit Jama Masjid, Red Fort, Rajghat (Gandhi Cremation place),India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb,Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra', 'Today after breakfast proceed to Agra and Visit Memory of Love Taj Mahal (First wonder of the world) After visit Agra Fort. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Agra', 'Ranthambore (Tiger Century ), Today after breakfast proceed to Ranthambore. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Ranthambore', 'Jaipur, Today early morning proceed to Jungle Safari(Own Arrangement) . After breakfast proceed to Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Jaipur', 'Today after breakfast proceed to visit ancient capital of Amber. Visit beautiful Amber Fort after Amber Fort proceed to the pink city Jaipur we will visit Hawa Mahal(Window Palace), City Place and Observatory(Jantar Mantar) after visit famous block printing & James & Stone cutting factory work being done since centuries in Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Jaipur', 'Pushkar, Today after breakfast proceed to Pushkar Hindu Holly City after check in at hotel visit Brahma Temple, Camel Fare Ground . Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Pushkar', 'Jaisalmer, Today after breakfast proceed to Jaisalmer. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Jaisalmer', 'Today after breakfast check out from hotel and visit Jaisalmer Fort, Ludarwa Jain Temple after lunch proceed to Khuri(Desert Village) and enjoy village & sand dunes sun set point by camel ride & back to desert camp, enjoy Rajasthani Folk Dance,Dinner. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Jaisalmer', 'Bikaner, Today after breakfast proceed to Bikaner after check in at hotel evening proceed to world famous Deshnok Temple. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Bikaner', 'Mandawa, Today after breakfast visit Bikaner Fort(Junagarh Fort) & after proceed to Mandawa. Evening free for walking tour to visit old painted Houses (Havelis). Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 12, 'Mandawa', 'Delhi, Today proceed to Delhi and drop you at the Airport.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . 6D Delhi Agra Jaipur Golden Triangle Tour
  pkg_id := '6d-delhi-agra-jaipur-golden-triangle-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '6d-delhi-agra-jaipur-golden-triangle-tour', '. 6D Delhi Agra Jaipur Golden Triangle Tour',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['05 Nt./6D – Delhi Agra Jaipur Golden Triangle Tour'],
    ARRAY['Accommodation .', 'Welcome Drink Non Alcoholic.', 'Breakfast/Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Comfortable vehicle with experienced driver', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, Camera fee etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, guide, porter tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . 6D Delhi Agra Jaipur Golden Triangle Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur'],
    india_id,
    delhi_state,
    '. 6D Delhi Agra Jaipur Golden Triangle Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and privat',
    ARRAY['delhi', 'agra', 'jaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Today after breakfast visit Old & New Delhi visit Jama Masjid, Red Fort, Rajghat (Gandhi Cremation place),India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra', 'Today after breakfast, proceed to Agra and Visit Memory of Love Taj Mahal (First wonder of the world)After visiting Agra Fort. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Agra To Jaipur ,Today after breakfast proceed to Jaipur on the way to visit Fatehpur Sikri. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Jaipur, Today after breakfast, I will proceed to visit the ancient capital of Amber. Visit beautiful Amber Fort. After Amber Fort proceeds to the pink city Jaipur we will visit Hawa Mahal(Window Palace), City Place and Observatory (Jantar Mantar) after visiting famous block printing & James & Stone cutting factory work being done for centuries in Jaipur. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'Jaipur to Delhi, Today after breakfast, proceed to Delhi and drop you at the Airport with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . 15D Tour: Delhi Agra Ranthambore Jaipur Pushkar Mandawa Bikaner Jaisalmer Jodhpur Udaipur Drop.
  pkg_id := '15d-tour-delhi-agra-ranthambore-jaipur-pushkar-mandawa-bikaner-jaisalmer-jodhpur-udaipur-drop';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '15d-tour-delhi-agra-ranthambore-jaipur-pushkar-mandawa-bikaner-jaisalmer-jodhpur-udaipur-drop', '. 15D Tour: Delhi Agra Ranthambore Jaipur Pushkar Mandawa Bikaner Jaisalmer Jodhpur Udaipur Drop.',
    'Explore the beautiful sights of Delhi | Agra | Ranthambore | Jaipur | Pushkar | Mandawa | Bikaner | Jaisalmer | Jodhpur | Udaipur |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['14Nt./15D Tour: Delhi, Agra, Ranthambore, Jaipur, Pushkar, Mandawa, Bikaner, Jaisalmer, Jodhpur, Udaipur Drop.'],
    ARRAY['Accommodation .', 'Welcome Drink Non Alcoholic.', 'Breakfast/Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Comfortable vehicle with experienced driver', 'City tour guide English guide: Delhi, Agra, Jaipur, Jaisalmer, mandawa', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, Camera fee etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, guide, porter tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . 15D Tour: Delhi Agra Ranthambore Jaipur Pushkar Mandawa Bikaner Jaisalmer Jodhpur Udaipur Drop..',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'ranthambore', 'jaipur', 'pushkar', 'mandawa', 'bikaner', 'jaisalmer', 'jodhpur', 'udaipur'],
    india_id,
    delhi_state,
    '. 15D Tour: Delhi Agra Ranthambore Jaipur Pushkar Mandawa Bikaner Jaisalmer Jodhpur Udaipur Drop. | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Ranthambore | Jaipur | Pushkar | Mandawa | Bikaner | Jaisalmer | Jodhpur | Udaipur |. This package offe',
    ARRAY['delhi', 'agra', 'ranthambore', 'jaipur', 'pushkar', 'mandawa', 'bikaner', 'jaisalmer', 'jodhpur', 'udaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 14n-15d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '14n-15d', '14 Nights / 15 Days', 14, 15, '14 Nights / 15 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '14n-15d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mandawa_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, bikaner_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaisalmer_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jodhpur_dest, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 10) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'jaisalmer-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mehrangarh-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel.Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi', 'Today after breakfast visit Old & New Delhi visit Jama Masjid, Red Fort, Rajghat(Gandhi Cremation place),India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb,Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi', 'Agra, Today after breakfast proceed to Agra and Visit Memory of Love Taj Mahal (First wonder of the world)After visit Agra Fort. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Agra', 'Ranthambore (Tiger Century ), Today after breakfast proceed to Ranthambore. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Ranthambore', 'Jaipur, Today early morning proceed to Jungle Safari(Own Arrangement) . After breakfast proceed to Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'Jaipur, Today after breakfast proceed to visit ancient capital of Amer. Visit beautiful Amber Fort after Amber Fort proceed to the pink city Jaipur we will visit Hawa Mahal(Window Palace), City Place and Observatory(Jantar Mantar) after visit famous block printing & James & Stone cutting factory work being done since centuries in Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Jaipur', 'Pushkar, Today after breakfast proceed to Pushkar Hindu’s Holy City after check in at hotel visit Brama Temple, Camel Fare Ground . Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Pushkar', 'Mandawa, Today after breakfast proceed to Mandawa. Evening free walking tour to visit old painted Houses (Havelis). Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Manadawa', 'Bikaner, Today after breakfast proceed to Bikaner visit Bikaner Fort (Junagarh Fort) proceed to hotel. Evening proceed to world famous Deshnok Temple. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Bikaner', 'Jaisalmer, Today after breakfast proceed to Jaisalmer. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Jaisalmer', 'Today after breakfast check out from hotel and visit Jaisalmer Fort, Ludarwa Jain Temple after lunch proceed to Khuri(Desert Village) and enjoy village & sand dunes sun set point by camel ride & back to desert camp, enjoy Rajasthani Folk Dance,Dinner. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 12, 'Khuri', 'Jodhpur, Today after breakfast proceed to Jodhpur visit Jodhpur Fort (Mehrangarh Fort), Jaswant Thada. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 13, 'Jodhpur', 'Udaipur VIA Ranakpur Jain Temple, Today after breakfast proceed to Udaipur on the way visit magnificent Ranakpur Jain Temple and proceed to Udaipur . Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 14, 'Udaipur', 'Today after breakfast proceed to visit Jagdish Temple, City Palace, Princes Garden(Sahelio Ki Badi) & Boat Ride. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 15, 'Udaipur Drop.', 'Today after breakfast proceed to the Airport & drop you for your onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: 09N 10D Delhi Agra Ranthambore Udaipur Pushkar Jaipur Delhi Tour
  pkg_id := '09n-10d-delhi-agra-ranthambore-udaipur-pushkar-jaipur-delhi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '09n-10d-delhi-agra-ranthambore-udaipur-pushkar-jaipur-delhi-tour', '09N 10D Delhi Agra Ranthambore Udaipur Pushkar Jaipur Delhi Tour',
    'Explore the beautiful sights of 09N 10D Delhi Agra Ranthambore Udaipur Pushkar Jaipur Delhi Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['09N/10D – Delhi Agra Ranthambore Udaipur Pushkar Jaipur Delhi Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Comfortable vehicle with experienced driver', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, Camera fee etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, guide, porter tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg',
    ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of 09N 10D Delhi Agra Ranthambore Udaipur Pushkar Jaipur Delhi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'ranthambore', 'udaipur', 'pushkar', 'jaipur', 'varanasi', 'khajuraho', 'haridwar', 'rishikesh', 'nainital', 'mussoorie', 'goa'],
    india_id,
    delhi_state,
    '09N 10D Delhi Agra Ranthambore Udaipur Pushkar Jaipur Delhi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of 09N 10D Delhi Agra Ranthambore Udaipur Pushkar Jaipur Delhi Tour. This package offers a comprehensive day-wise itinera',
    ARRAY['delhi', 'agra', 'ranthambore', 'udaipur', 'pushkar', 'jaipur', 'varanasi', 'khajuraho', 'haridwar', 'rishikesh', 'nainital', 'mussoorie', 'goa'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 9n-10d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '9n-10d', '9 Nights / 10 Days', 9, 10, '9 Nights / 10 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '9n-10d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, haridwar_dest, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, rishikesh_dest, 10) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, nainital_dest, 11) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mussoorie_dest, 12) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, goa_dest, 13) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi', 'Agra, (250 KM. Approx 3 Hrs.) Today after breakfast visit Old & New Delhi visit Jama Masjid, Rajghat (Gandhi Cremation place), India Gate, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb, & After proceed to Agra. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra', 'Ranthambhore VIA Fatehpur Sikri (300 KM. Approx 6 Hrs.) : Today, after breakfast check out from hotel & proceed to visit memory of Love The Taj Mahal & after visit Agra Fort and proceed to Ranthambhore En-Rout visit Fatehpur Sikri. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Ranthambhore', 'Udaipur (415 KM. Approx 8 Hrs.) : Today, Early morning proceed to Jungle Safari (Tiger Century) & after come back to hotel & after breakfast proceed to Udaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Udaipur Sightseeing', 'Today, after breakfast proceed to visit Jagdish Temple, City Palace, Princess Garden (Sahelion Ki Badi) & Boat Ride (Own Cost). Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Udaipur', 'Pushkar (280 KM. Approx 5 Hrs.) : Today, after breakfast proceed to Pushkar Hindu’s Holy City After check in at hotel visit Brahma Temple, Camel Ride (Own Cost). Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Pushkar', 'Jaipur (150 KM. Approx 3 Hrs.) : Today, after breakfast proceed to Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Jaipur Sightseeing', 'Today, after breakfast proceed to visit ancient capital of Amber. Visit beautiful Amber Fort after Amber Fort proceed to the pink city Jaipur we will visit Hawa Mahal(Window Palace), City Place and Observatory (Jantar Mantar) after visit famous block printing & James & Stone cutting factory work being done since centuries in Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Jaipur', 'Delhi (280 KM. Approx 5-6 Hrs.) : Today, after breakfast proceed to Delhi. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Day 10 Sightseeing', 'Today, after breakfast proceed to Delhi Airport/Railway Station for your onward journey with sweet memory. Our more Packages : Delhi Agra Jaipur Rajasthan With Varanasi Tour ! Delhi Jaipur Agra Khajuraho Varanasi Tour ! Delhi Haridwar Rishikesh Delhi Tour Packages ! Delhi Jim Corbett Nainital Delhi Tour ! Delhi Agra Haridwar Rishikesh Delhi Tour ! Delhi Mussoorie Delhi Tour ! Kerala Tour Packages ! Goa Tour Packages ! India Golden Triangle Tour Packages & more .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: : Delhi Haridwar Rishikesh Tour
  pkg_id := 'delhi-haridwar-rishikesh-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-haridwar-rishikesh-tour', ': Delhi Haridwar Rishikesh Tour',
    'Explore the beautiful sights of Delhi | Haridwar | Rishikesh | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['02 Nights 03 Days: Delhi ! Haridwar ! Rishikesh Tour'],
    ARRAY['Accommodation .', 'Welcome Drink Non Alcoholic.', 'Breakfast/Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Comfortable vehicle with experienced driver', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, Camera fee etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, guide, porter tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of : Delhi Haridwar Rishikesh Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'haridwar', 'rishikesh'],
    india_id,
    delhi_state,
    ': Delhi Haridwar Rishikesh Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Haridwar | Rishikesh | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and p',
    ARRAY['delhi', 'haridwar', 'rishikesh'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 2n-3d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '2n-3d', '2 Nights / 3 Days', 2, 3, '2 Nights / 3 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '2n-3d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, haridwar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, rishikesh_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'ram-jhula')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'triveni-ghat')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Delhi to Haridwar, Today, Morning meet our driver at your Home | Hotel | Airport | Railway Station and transfer to Haridwar. Check in to the hotel at Arrival in Haridwar/Rishikesh. Afternoon visit Daksh Temple, Pawan Dham as well as Moti Bazar. Go To Har Ki Pauri for Ganga Aarti. Return to the hotel. Dinner and Night stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Sightseeing with Rishikesh', 'Morning you can take a divine dip in the river Ganga. Later on, returne to hotel. After breakfast visit Mansa Devi Temple (By cable car). Transfer to Rishikesh. Go to Triveni Ghat, Bharat Mandir, Lakshman Temple, Lakshman Jhula as well as Ram Jhula. Evening visit Ganga Aarti at Parmarth Niketan. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Haridwar To Delhi', 'Morning after breakfast, check out from the hotel. Go to Chandi Devi Temple (by cable car). Transfer to Delhi. Dropping at Delhi home/ hotel/ airport/ railway station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: 05N 06D Delhi Shimla Manali Tour
  pkg_id := '05n-06d-delhi-shimla-manali-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, '05n-06d-delhi-shimla-manali-tour', '05N 06D Delhi Shimla Manali Tour',
    'Explore the beautiful sights of Delhi | Shimla | Manali | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['05N/06D – Delhi Shimla Manali Tour Packages'],
    ARRAY['Accommodation .', 'Welcome Drink Non Alcoholic.', 'Breakfast/Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Comfortable vehicle with experienced driver', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, Camera fee etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver, guide, porter tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of 05N 06D Delhi Shimla Manali Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'shimla', 'manali', 'kullu'],
    india_id,
    delhi_state,
    '05N 06D Delhi Shimla Manali Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Shimla | Manali | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and privat',
    ARRAY['delhi', 'shimla', 'manali', 'kullu'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'solang-valley')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kufri')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Shimla: Arrival at Delhi Airport/Railway Station company representative assist you and proceed to Shimla & Stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Shimla Kufri & local sightseeing', 'Today after breakfast proceed to Kufri Valley, located 16 KM from Shimla- it commands a panoramic view of the majestic Himalaya. Back to Shimla visit Jakhu Temple ( Either by walk or through Horse at personal cost) Temple dedicated to Hanuman, from where you enjoy an excellent view of Shimla. Back to the hotel, evening free . Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Shimla', 'Manali: Today after breakfast proceed to Manali on the way to visit Kullu. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Manali', 'Today after breakfast, proceed to visit Hidimba Temple, Vashisth Temple, Club House and go back to the hotel in the evening for a walking tour. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day trip to Solang Valley snow point. Rest of the day at leisure . Day 06. Manali To Delhi', 'Today after breakfast proceed to Delhi and drop you at the Airport/Railway Station .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Island Tour
  pkg_id := 'island-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'island-tour', 'Island Tour',
    'Explore the beautiful sights of Island Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Island Tour for 05 Night 06 Days'],
    ARRAY['Accommodation on a double sharing basis at the above-mentioned hotels / similar in base category rooms.', 'Exclusive a/c vehicle sanitized every time before boarding for pick up and drop as per the itinerary (not at disposal).', 'Daily breakfast Only.', 'Airport pick up and drop by a/c vehicle.', 'similar in base category rooms.', 'Assistance at all arrival and departure points.'],
    ARRAY['Airfare / Ship''s fare.', 'All kinds of personal expenses such as tips, laundry, telephone bills and beverages.', 'It does not include any meals unless and otherwise specifically mentioned.', 'Guide, Jolly ride & snorkeling charges.', 'Optional, suggested or unspecified activities.', 'Guide at Cellular jail will cost extra.', 'Camera fee (still or movie)', 'Additional usage of vehicles.', 'Makruzz / Green Ocean Cruise / Sea Link / ITT Majestic (base category) for Neil & Havelock as per the availability.', 'Entry permits | Entry tickets | Parking charges | Boat/ferry tickets'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg',
    ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Island Tour.',
    FALSE, TRUE,
    ARRAY['delhi'],
    india_id,
    delhi_state,
    'Island Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Island Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a me',
    ARRAY['delhi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Port Blair', 'Arriving at Andaman’s at Port Blair Airport, Our representative will receive and escort you to the hotel. Check in to make yourself comfortable, After freshen Up proceed to the very first beach, the Corbyn’s Cove Beach for swimming and beach activity which is 10 km away from Port Blair City , Later proceed for In the evening, we go for light and sound show at Cellular Jail. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Havelock', 'The second day of your Andaman tour will start with a sumptuous breakfast in hotel’s main restaurant. After some leisure time, you will be transferred to Havelock Island in a cruise ferry. Upon reaching, you can have lunch and check-in to your hotel. After a while, you will be driven to your first stop in Havelock – Radhanagar Beach. This beach is so beautiful and serene that it was named ‘The best beach in Asia’ by Time in 2004. Enjoy your visit while exploring the beach. In the evening, you will be dropped back to your hotel for a nice night meal and comfortable stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Havelock', 'At Havelock Island – Lovely Elephanta Beach after breakfast in the hotel in the morning vehicle will pick you by 9:00 am to Havelock jetty for a boat ride to Elephanta beach Elephant beach is amazing and lovely beach rather long, the water is crystal clear water you can see fishes and other sea creatures while swimming, this place is famous for its beach sporting activities like…. *Scuba diving (extra charge) * Snorkeling,(included) . * Glass bottom – under water Coral (extra charge). Over all you will get a lovely experience in this beach. In the noon we reach back to the hotel where you can refresh and have your lunch In the evening you can have a walk to market or if you are staying in a beach property you can have a walk in the shore… Night stay @ Havelock.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Neil Island', 'Start your day with a delicious breakfast in the hotel. After enjoying the food, it will be time for you to head to Neil Island. Extremely beautiful and tranquil, Neil will be welcomed treat for you with its chatter free environment and blue expanses of water. Enjoy a couple of hours resting or exploring the hotel after check-in. Post lunch, the Beach Safari will start with a trip to two of the most famous beaches of Andaman – Bharatpur Beach, Natural Bridge and Laxmanpur Beach. The peaceful atmosphere at Sitapur Beach, known for its Red Sand, would leave you spellbound. You will be driven back to the hotel in the evening. Have your dinner and spend a memorable night in Neil.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Port Blair', 'After a healthy breakfast in Neil, you will be transferred back to Port Blair.Towards afternoon, start for Chidiya Tapu which is south of Port Blair. Chidiya Tapu is one of the best places to watch the sunset in Port Blair.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Departure', 'Airport drop time will vary as per your flight timings. After enjoying the beauty of exotic islands, mesmerizing beaches, unexploited nature and knowing our culture its now time for us to tell you good bye. We will be thankful for giving us the opportunity to serve you and will expect to serve you many more times in the future. Our representative will receive you from the Hotel and drop you at the Airport.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Srinagar Pahalgam Gulmarg
  pkg_id := 'srinagar-pahalgam-gulmarg';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'srinagar-pahalgam-gulmarg', 'Srinagar Pahalgam Gulmarg',
    'Explore the beautiful sights of Srinagar Pahalgam Gulmarg. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['03 Nights/04 Days - Srinagar - Pahalgam - Gulmarg'],
    ARRAY['Srinagar Airport Pickup Drop.', 'Welcome Drink on Arrival at the hotel.', '3 Night’s Accommodation in Srinagar', '1 Night Accommodation in Houseboat with Breakfast & dinner', '1 Night Accommodation in Pahalgam', '5 Breakfast', '1 Hour Shikara Ride.', 'All Tour by Pvt. Comfortable Vehicle', 'Toll Charges, Parking Charges, Driver Allowance.', '24/7 Customer Support.', 'Private Vehicle'],
    ARRAY['Air Tickets, Trains, Ferries etc.', 'Personal Expenses like Laundry, Shopping, telephone bills, tips etc.', 'Entrance fee / Local Guide / at any place during the tour.', 'Meals not mentioned in the “Inclusions” section.', 'Anything not mentioned in the package includes section.', 'Cable Car / Pony Ride in Pahalgam / Gulmarg / Sonamarg.', 'Local sightseeing in vehicle in Pahalgam / Gulmarg / Sonmarg due to restrictions.', 'Adventure Activities like Safari, Rides, Surfing, and Paragliding etc.', 'Only Postpaid mobile connection of BSNL, Jio Airtel works in Jammu &amp; Kashmir.', 'Local sightseeing in vehicle in Pahalgam / Gulmarg / Sonmarg due to restrictions.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg',
    ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Srinagar Pahalgam Gulmarg.',
    FALSE, TRUE,
    ARRAY['srinagar', 'pahalgam', 'gulmarg'],
    india_id,
    jk_state,
    'Srinagar Pahalgam Gulmarg | Mother India Tour Travels',
    'Explore the beautiful sights of Srinagar Pahalgam Gulmarg. This package offers a comprehensive day-wise itinerary, comfortable stays, and private tran',
    ARRAY['srinagar', 'pahalgam', 'gulmarg'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 2n-3d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '2n-3d', '2 Nights / 3 Days', 2, 3, '2 Nights / 3 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '2n-3d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, srinagar_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pahalgam_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, gulmarg_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Arrive Srinagar | Srinagar Local Sightseeing', 'Welcome to Srinagar, the Lake City. On arrival at Srinagar Airport, begin your Kashmir Tour. You will be transferred to the Hotel. Proceed on a city tour visiting the Shankar Acharya temple situated on the highest hill of Srinagar, the famous Mughal Gardens – Chashmashahi, Nishat & Shalimar. These gardens were Mughal Emperor concepts of Paradise and today these are popular picnic spots. Visit Hazratbal Dargah Also. Overnight stay in a hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Srinagar', 'Pahalgam – Srinagar After breakfast drive to Pahalgam (The valley of shepherds). Which is about 96 kms from Srinagar, which will be covered in the app. 3 hours. You Can visit the saffron fields of pampore, Awantipura Ruins (1100 years old temple of Lord Vishnu built by the King Awantivarman), Mattan Temple, on En-route. Drive through the pine forests. Arrive at Pahalgam and You can go for Pony ride, visit Kashmir Valley, Dabyan, Baisaran/ mini-Switzerland, Denow Valley Waterfall (At your own cost). visit Aru, betaab valley and chandanwari(at Own cost). Evening return dinner and Overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Srinagar', 'Gulmarg– Srinagar, After breakfast check out from the hotel in Srinagar drive to Gulmarg (2440 Meters above Sea level). It is one of the most beautiful hill stations and also called “Meadows of Flower”. It has the world’s highest golf course and Gulmarg is also famous for winter sports like skiing. On arrival and after refreshment one can visit Jai Jai Shiv Shankar Temple and also enjoy a Gondola ride (Cable car, own cost) from Gulmarg to Kongdori and affarwat. Evening return dinner and overnight stay Srinagar. Day 04: Return Home with Happy Memories: After breakfast transfer to Srinagar Airport to board your flight with Sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Kerala Tour: Nature Culture & Serenity
  pkg_id := 'kerala-tour-nature-culture-serenity';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'kerala-tour-nature-culture-serenity', 'Kerala Tour: Nature Culture & Serenity',
    'Explore the beautiful sights of Kerala Tour: Nature Culture & Serenity. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Kerala Tour: Nature Culture & Serenity'],
    ARRAY['Accommodation on double sharing basis', 'Breakfast at hotels', 'Sightseeing and transfers by private AC vehicle', 'All toll, parking and driver allowances'],
    ARRAY['Airfare / Train tickets', 'Monument entrance fees', 'Any meals not mentioned in inclusions', 'Personal expenses'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg',
    ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Kerala Tour: Nature Culture & Serenity.',
    FALSE, TRUE,
    ARRAY['cochin', 'munnar', 'thekkady', 'alleppey', 'delhi', 'agra', 'jaipur', 'shimla', 'kullu', 'manali', 'varanasi', 'ayodhya', 'goa'],
    india_id,
    kerala_state,
    'Kerala Tour: Nature Culture & Serenity | Mother India Tour Travels',
    'Explore the beautiful sights of Kerala Tour: Nature Culture & Serenity. This package offers a comprehensive day-wise itinerary, comfortable stays, and',
    ARRAY['cochin', 'munnar', 'thekkady', 'alleppey', 'delhi', 'agra', 'jaipur', 'shimla', 'kullu', 'manali', 'varanasi', 'ayodhya', 'goa'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, cochin_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, munnar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, thekkady_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, alleppey_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 10) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 11) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ayodhya_dest, 12) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, goa_dest, 13) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mattupetty-dam')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Cochin', 'Gateway to Kerala Your journey begins in Cochin (Kochi), a historic port city where colonial heritage blends seamlessly with local traditions. Explore Fort Kochi, known for its charming lanes and colonial-era architecture. Highlights: See the iconic Chinese fishing nets Visit St. Francis Church and Mattancherry Palace Stroll through Jew Town and Paradesi Synagogue Evening Kathakali dance performance Experience the cultural mosaic that makes Cochin a fascinating introduction to Kerala''s heritage. 2-3', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, '3', 'Munnar – Tea Gardens & Mountain Charm Drive up winding roads to Munnar, a hill station blanketed with tea plantations, spice gardens, and misty peaks. Take in the fresh mountain air and panoramic views. Experiences: Explore Eravikulam National Park and Anamudi Peak Visit the Tea Museum and tea estates Discover Mattupetty Dam and Echo Point Enjoy the cool climate and green landscapes The misty hills and endless tea gardens make Munnar an unforgettable experience. 4', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Thekkady', 'Spice & Wildlife From Munnar, head to Thekkady, known for its spice plantations and the Periyar Wildlife Sanctuary. Experience the rich biodiversity and aromatic treasures of Kerala. Adventures: Boat cruise on Periyar Lake for wildlife spotting Visit spice plantations to learn about cardamom and pepper Bamboo rafting and nature walks Evening Kalaripayattu martial arts performance Thekkady offers a perfect blend of wildlife adventures and cultural experiences. 5', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Alleppey', 'Backwater Bliss Travel to Alleppey (Alappuzha), the heart of Kerala''s backwaters. Board a traditional houseboat for a journey through palm-lined canals, passing by paddy fields and villages. Experiences: Overnight cruise on a traditional Kerala houseboat Enjoy freshly cooked Kerala cuisine on board Witness village life along the waterways Relax to the gentle rocking of the boat The peaceful backwaters create an experience that feels worlds away from city life. 6-7', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, '7', 'Kovalam – Beachside Relaxation Head to Kovalam, a coastal paradise famous for its crescent-shaped beaches and golden sands. Relax and rejuvenate as your Kerala journey comes to a peaceful close. Highlights: Relax on Lighthouse Beach and Hawah Beach Swim in the warm Arabian Sea waters Ayurvedic spa treatments for rejuvenation Enjoy fresh seafood at beachside cafes Visit Padmanabhaswamy Temple in Trivandrum End your journey watching spectacular sunsets and soaking in the laid-back charm of Kerala''s coast. Essential Travel Tips Making the most of your Kerala journey Best Time to Visit October to March is ideal for Kerala tours. The weather is pleasant with daytime temperatures ranging from 23°C to 32°C, perfect for sightseeing and beach activities. Avoid monsoon season (June to September) when heavy rains can disrupt travel plans. Packing Essentials Light cotton clothing for warm weather Light sweater for cool evenings in hills Comfortable walking shoes Swimwear for backwaters and beaches Sunscreen, hat, and sunglasses Insect repellent for backwaters Cultural Considerations Dress modestly, especially at religious sites Remove footwear before entering temples Ask permission before photographing people Respect local customs and traditions Transportation Private AC vehicles with experienced drivers Traditional houseboats for backwaters Domestic flights for longer distances Local ferries for short water transfers Journey Highlights Unforgettable moments from your Kerala adventure Chinese Fishing Nets at Sunset Iconic silhouettes against Cochin''s golden sunset. Tea Gardens of Munnar Endless green plantations in the misty hills. Boat Safari in Periyar Spotting wildlife along forested shorelines. Houseboat in Alleppey Cruising Kerala''s tranquil backwaters. Beach Relaxation in Kovalam Golden sands and Arabian Sea waves. Kathakali Dance Performance Kerala''s classical storytelling tradition. Experience God''s Own Country This 7-day Kerala tour captures the very essence of the state—from cultural heritage in Cochin to Munnar''s green hills, Thekkady''s wildlife adventures, Alleppey''s backwater tranquility, and Kovalam''s beachside bliss. Each destination offers its own unique charm, yet together they form a harmonious journey filled with natural beauty, rich traditions, and unforgettable moments. Whether you''re sipping tea in a misty plantation, gliding through peaceful backwaters, spotting elephants in the wild, or basking under the tropical sun, Kerala promises to touch your heart and soothe your soul. Come experience the magic of God''s Own Country. Book Your Kerala Journey © 2023 Kerala Nature Tours. All rights reserved. // Smooth scrolling for anchor links document.querySelectorAll(''a[href^="#"]'').forEach(anchor => { anchor.addEventListener(''click'', function (e) { e.preventDefault(); document.querySelector(this.getAttribute(''href'')).scrollIntoView({ behavior: ''smooth'' }); }); }); // Simple animation for destination cards document.querySelectorAll(''.destination-card'').forEach((card, index) => { card.style.opacity = ''0''; card.style.transform = ''translateY(20px)''; setTimeout(() => { card.style.transition = ''opacity 0.5s ease, transform 0.5s ease''; card.style.opacity = ''1''; card.style.transform = ''translateY(0)''; }, 300 + (index * 150)); }); Chat with us! /* Entrance Animation */ @keyframes float-in { 0% { transform: translateY(100px) scale(0.8); opacity: 0; } 100% { transform: translateY(0) scale(1); opacity: 1; } } .whatsapp-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards; } /* Hover Animation */ .whatsapp-button:hover { transform: scale(1.1) rotate(5deg); } /* Click Animation */ .whatsapp-button:active { transform: scale(0.95); transition: transform 0.1s; } /* Mobile Responsive */ @media (max-width: 768px) { .whatsapp-button { width: 56px; height: 56px; } .whatsapp-tooltip { display: none; } } Message us! /* Shared Animation */ @keyframes float-in { 0% { transform: translateY(100px) scale(0.8); opacity: 0; } 100% { transform: translateY(0) scale(1); opacity: 1; } } /* Staggered Animations */ .whatsapp-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards; } .messenger-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.2s forwards; } /* Hover Effects */ .whatsapp-button:hover { transform: scale(1.1) rotate(5deg); } .messenger-button:hover { transform: scale(1.1) rotate(-5deg); } /* Mobile Responsive */ @media (max-width: 768px) { .whatsapp-container { bottom: 3%; right: 4; } .messenger-container { bottom: 12%; right: 4; } .whatsapp-button, .messenger-button { width: 56px; height: 56px; } } About Us Our Blogs FAQs Mon – Fri 9:00 AM to 8:00 PM Sat – Sun 9:00 AM to 8:00 PM USEFUL LINKS Delhi Agra Jaipur Tour Packages Shimla Kullu Manali Tour Kashmir Tour Packages Kerala Tour Packages Varanasi Ayodhya Tour Packages Goa Tour Packages Golden Triangle Tour Packages CONTACT US Address:- B63/B63A, New Jankipuri, Uttam nagar, New Delhi -110059 Phone:- +91 9810140121 / +91 99710 53881 Email:- tourtravelsmotherindia@gmail.com Social Media:- OUR NEWSLETTER Privacy Policy Terms of Service Subscribe Review Us on Google // Listen for form submission and display a thank-you message. document .getElementById("subscribeForm") .addEventListener("submit", function (e) { e.preventDefault(); const email = e.target.email.value; // You can replace this with an AJAX call to your server. document.getElementById("message").textContent = "Thank you for subscribing, " + email + "!"; e.target.reset(); }); 9001-2015 &copy; 2025 Your Company. All rights reserved. Designed & maintain by motherindiatourtravels', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Memorable Beaches Tour
  pkg_id := 'memorable-beaches-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'memorable-beaches-tour', 'Memorable Beaches Tour',
    'Explore the beautiful sights of Beaches. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Memorable Beaches Tour for 07Night/ 08 Days'],
    ARRAY['Accommodation on a double sharing basis at the above-mentioned hotels / similar in base category rooms.', 'Exclusive a/c vehicle sanitized every time before boarding for pick up and drop as per the itinerary (not at disposal).', 'Daily breakfast Only.', 'Airport pick up and drop by a/c vehicle.', 'similar in base category rooms.', 'Assistance at all arrival and departure points.'],
    ARRAY['Airfare / Ship''s fare.', 'All kinds of personal expenses such as tips, laundry, telephone bills and beverages.', 'It does not include any meals unless and otherwise specifically mentioned.', 'Guide, Jolly ride & snorkeling charges.', 'Optional, suggested or unspecified activities.', 'Guide at Cellular jail will cost extra.', 'Camera fee (still or movie)', 'Additional usage of vehicles.', 'Makruzz / Green Ocean Cruise / Sea Link / ITT Majestic (base category) for Neil & Havelock as per the availability.', 'Entry permits | Entry tickets | Parking charges | Boat/ferry tickets'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg',
    ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Memorable Beaches Tour.',
    FALSE, TRUE,
    ARRAY['delhi'],
    india_id,
    delhi_state,
    'Memorable Beaches Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Beaches. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memora',
    ARRAY['delhi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 7n-8d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '7n-8d', '7 Nights / 8 Days', 7, 8, '7 Nights / 8 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '7n-8d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'ARRIVAL', 'PORT BLAIR – CELLULAR JAIL – LIGHT & SOUND SHOW Arrival to Port Blair. Meet our representative, who will assist you to transfer you to the hotel. First half of the day is at leisure. Later in the afternoon visit Carbyn Cove Beach and Cellular jail followed by light and sound show. The Cellular Jail was the pilgrimage destination for freedom fighters. Many freedom fighters spent the time here during the freedom struggle against the British Government.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'PORT BLAIR', 'NORTH BAY (CORAL ISLAND) – ROSS ISLAND Today after breakfast embark on a day long three island cruise. One of the most sought after activities. It covers a panorama of seven harbors that include the North Bay and Ross island. It leaves a lasting impression. Ross Island. Was the administrative headquarters of the British. This island is now under the Indian Navy. You can also visit a museum named Smritika, it holds photographs and the other antiques of the Britishers relevant to these islands. The island is famous for friendly flocks of Deer and lush green walking trails. North Bay, the water lovers may enjoy snorkeling or take a glass bottom boat ride (Optional on direct payment) in its shallow waters with a chance to see corals up close. Return to the hotel. Dinner and stay overnight at the Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'PORT BLAIR', 'HAVELOCK Today after breakfast depart to Havelock by boat. Havelock is one of the famous Island in Andaman region. Its about 54 kilometers northeast of Port Blair, the Island is a hidden jewel. It is famous for the water sports activities. Arrive at Havelock Jetty, you are met and assisted by our representative. Board the waiting vehicles and drive to the hotel. Check in at the hotel. Dinner and stay overnight at the Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'HAVELOCK', 'RADHANAGAR BEACH (OR BEACH NO. 7) Today after breakfast, proceed to Radhanagar Beach (or Beach No. 7) which is the jewel in the crown of Havelock Island. It is rated one of the top ranked beaches by many travelers. Located on the western side of the island, it stands away from the cluster. There is no means of visiting Havelock Island without visiting Radha Nagar Beach. It provides scenic view to its visitors. Dinner and stay overnight at the Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'HAVELOCK', 'Neil Island Day at Leisure for individual activities. OPTIONAL ELEPHANTA BEACH Proceed for snorkeling at Elephant beach. Elephant Beach is a small can be reached by boat. The beach is also an extremely good place for snorkeling with an easily accessible house reef, which boasts of beautiful corals and other marine life. The beach has also emerged as Havelock’s favorite spot for scuba diving. It is tailor made to be a beginners dive site. Afternoon drive to Havelock Jetty. on board Cruise. Neil Island hotel checking and evening Howrah bridge Bharatpur beach after back to the hotel. Dinner and stay overnight at the Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'Neil Island to Port Blair In the evening visit the Chidiyatapu,return back to your resort, have Dinner and stay overnight at the Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Baratang Island In the morning by3', '40am hours start for a full day tour by road & boat to visit Baratang Island Limestone cave.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Day 8 Sightseeing', 'DEPART FROM PORT BLAIR After breakfast at the hotel, transfer to the Port Blair airport to board the flight for onward destination.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Nepal Tour
  pkg_id := 'nepal-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'nepal-tour', 'Nepal Tour',
    'Explore the beautiful sights of Nepal Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Nepal Tour Package for 04 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur', 'Guide Service'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc', 'Monument entrances, camera Fee, etc', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis)', 'Driver, Guide & Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg',
    ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Nepal Tour.',
    FALSE, FALSE,
    ARRAY['kathmandu'],
    nepal_id,
    NULL,
    'Nepal Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Nepal Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a mem',
    ARRAY['kathmandu'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, int_cat) ON CONFLICT DO NOTHING;

  -- Variant 3n-4d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '3n-4d', '3 Nights / 4 Days', 3, 4, '3 Nights / 4 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '3n-4d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kathmandu_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'pashupatinath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'boudhanath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'swayambhunath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kathmandu-durbar-square')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Arrival in Kathmandu', 'Upon arrival at Tribhuvan International Airport, you will receive a warm welcome and be transferred to your hotel in Kathmandu. After check-in, take some time to relax. In the In the evening, explore the vibrant streets of Thamel at your leisure. Overnight stay in Kathmandu.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Kathmandu Sightseeing Immerse yourself in Kathmandu’s rich cultural heritage with a full', 'day sightseeing tour. Start your day with visits to Pashupatinath Temple and Guheshwori Temple. Continue to Boudhanath Stupa, one of the largest stupas in the world. In the afternoon, explore Swayambhunath Stupa, also known as the Monkey Temple, before concluding the day at Kathmandu Durbar Square, a historic palace complex showcasing traditional Nepalese architecture. Overnight stay in Kathmandu.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Nagarkot', 'Bhaktapur – Kathmandu Early Morning: Drive to Nagarkot, a hill station known for its breathtaking sunrise views over the Himalayas. On a clear day, you may even see Mount Everest. Morning: After breakfast, travel to Bhaktapur, an ancient city rich in history, culture, and traditional Newari heritage. Midday: Explore Bhaktapur Durbar Square, a UNESCO-listed heritage site renowned for its intricate architecture. Visit Nyatapola Temple, Bhairavnath Temple, and other historic landmarks adorned with exquisite wood and stone craftsmanship. Afternoon: Enjoy a traditional Nepali lunch at a local restaurant. Later, visit pottery and woodcraft workshops to witness skilled artisans preserving centuries-old techniques. Evening: Spend some leisure time strolling through Bhaktapur’s lively streets and shopping for souvenirs before returning to Kathmandu. Overnight stay in Kathmandu.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Departure from Kathmandu After breakfast at your hotel, you will be transferred to Tribhuvan International Airport for your departure, carrying unforgettable memories of Nepal’s stunning landscapes, spiritual landmarks, and vibrant culture.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: EXPLORE PELLING DARJEELING GANGTOK ’s
  pkg_id := 'explore-pelling-darjeeling-gangtok-s';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'explore-pelling-darjeeling-gangtok-s', 'EXPLORE PELLING DARJEELING GANGTOK ’s',
    'Explore the beautiful sights of PELLING | DARJEELING | GANGTOK. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['EXPLORE PELLING/DARJEELING/GANGTOK (06 Night 07 Day’s)'],
    ARRAY['Accommodation in well-appointed rooms for 03 nights', 'Meals', 'Welcome drink at hotel', 'All transfers & sightseeing as per itinerary using Private Vehicle with driver (Vehicle will not be on disposal)', 'Driver’s allowance', 'Toll tax. Parking, State tax. permit'],
    ARRAY['Route Diversion cost Due to Natural calamities (Land Slide / Road Blockage) / Political Disturbance.', 'Anything not mentioned in “cost includes” section.', 'Extras of personal nature such as personal tips, laundry charges, additional tour charges.', 'Does not include any Lunch, Evening Tea/snacks', 'Insurance, Medical & Emergency rescue costs.', 'Does not include Hard drinks, liquor, mineral water in Hotel, or soft drinks/juices.', 'Does not include Entrance Fees at Monasteries / Monuments / Museums /Flight Ticket/ Train Ticket / Entry Fees / Ropeway charges / Toy Train Tickets / River Rafting charges / Paragliding charges etc.', 'Does not include specialised Guide'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Wildlife', 12, 10, 'Premium Hotels',
    'Experience the best of EXPLORE PELLING DARJEELING GANGTOK ’s.',
    FALSE, TRUE,
    ARRAY['pelling', 'darjeeling', 'gangtok'],
    india_id,
    sikkim_state,
    'EXPLORE PELLING DARJEELING GANGTOK ’s | Mother India Tour Travels',
    'Explore the beautiful sights of PELLING | DARJEELING | GANGTOK. This package offers a comprehensive day-wise itinerary, comfortable stays, and private',
    ARRAY['pelling', 'darjeeling', 'gangtok'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, wild_cat) ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pelling_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, darjeeling_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, gangtok_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'tiger-hill')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'batasia-loop')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'tsomgo-lake')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Bagdogra/NJP', 'Arrive NJP Railway Station/Bagdogra Airport – our representative will meet you and we shall head for PELLING (115 KM Max.5 Hrs. Journey). Check in hotel and get fresh. This evening is free. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Pelling', 'This morning after breakfast we shall head for a half day sightseeing to the worth seen places in and around Pelling such as Khecheopalri Lake, Kanchanjunga Falls, Rimbi Falls, Rock Garden, Pemayangtsey, Rabdentcy Ruins, etc. Return to hotel and enjoy the evening with your friends and family. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Pelling', 'Gangtok- This morning after breakfast we shall head to Gangtok (130 KM Max. 5 Hrs. Journey). Check in hotel and get fresh. The evening is free at your own. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Gangtok', 'Tsomgo Lake & Baba Mandir (EAST SIKKIM)- This morning after breakfast we shall head for a full day excursion to three prominent sites – Tsomgo Lake, Nathula Pass and Baba Mandir. We start driving up above Gangtok through intricate winding road along the mystical environs and reach an enchanting Tsomgo lake after about one and half hours. A lake is nestled amidst high peaks at an altitude of 12,400 ft. On winters, you will be able to witness the lake in a frozen state. Spend some time enjoying the beauty nature; you can also enjoy a yak ride, take pictures. After spending about half an hour here, we drive back to a fabled Baba Mandir. This is basically a temple of an army Captain Harbajan Singh who mysteriously vanished from the army camp but later is believed to have turned invisible but absolutely present who still continues his duty as an army officer and protects the border army from any unanticipated events. After this visit we drive back to Gangtok. Check into the hotel refresh and relax. The rest of the day is free to relax for you. You will enjoy this place a lot because of its scenic beauty…and mostly, as you will having your personal car…instead of a sharing basis! You can stop at any point for a photo session!! Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Gangtok', 'Darjeeling- After breakfast, you will be transferred to Darjeeling. Enjoy the beautiful sceneries on the way! Check into your hotel, refresh and relax. This evening is free to walk around the mall road. Check out the mall in Darjeeling. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Darjeeling Sightseeing & Tiger Hill', 'Wake up early this morning, and you will be transferred to TIGER HILL to see the most beautiful sunrise (at 4am approx)! After that, visit Batasia Loope, Ghoom Monastery and return to the hotel! After breakfast, we will take you for a full day sightseeing to Himalayan Zoological Park, Mountaineering Institute, Tenzing & Gombu Rock, Tea Estate, etc. The evening is free for you and is at leisure!', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'DARJEELING', 'TRANSFER TO BAGDOGRA/NJP- This morning after breakfast, we shall check out of the hotel and transfer to NJP/Bagdogra. Return Home with Happy memories…and regret as you have to leave from these places!', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Port Blair Havelock Island Tour
  pkg_id := 'port-blair-havelock-island-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'port-blair-havelock-island-tour', 'Port Blair Havelock Island Tour',
    'Explore the beautiful sights of Port Blair | Havelock Island. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Port Blair, Havelock Island 03 night 04 days Tour'],
    ARRAY['Accommodation on a double sharing basis at the above-mentioned hotels / similar in base category rooms.', 'Exclusive a/c vehicle sanitized every time before boarding for pick up and drop as per the itinerary (not at disposal).', 'Daily breakfast Only.', 'Airport pick up and drop by a/c vehicle.', 'similar in base category rooms.', 'Assistance at all arrival and departure points.'],
    ARRAY['Airfare / Ship''s fare.', 'All kinds of personal expenses such as tips, laundry, telephone bills and beverages.', 'It does not include any meals unless and otherwise specifically mentioned.', 'Guide, Jolly ride & snorkeling charges.', 'Optional, suggested or unspecified activities.', 'Guide at Cellular jail will cost extra.', 'Camera fee (still or movie)', 'Additional usage of vehicles.', 'Makruzz / Green Ocean Cruise / Sea Link / ITT Majestic (base category) for Neil & Havelock as per the availability.', 'Entry permits | Entry tickets | Parking charges | Boat/ferry tickets'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg',
    ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Port Blair Havelock Island Tour.',
    FALSE, TRUE,
    ARRAY['port-blair'],
    india_id,
    andaman_state,
    'Port Blair Havelock Island Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Port Blair | Havelock Island. This package offers a comprehensive day-wise itinerary, comfortable stays, and private t',
    ARRAY['port-blair'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 3n-4d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '3n-4d', '3 Nights / 4 Days', 3, 4, '3 Nights / 4 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '3n-4d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, port_blair_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival Port Blair Half Day Local Arriving at Andaman’s at Port Blair Airport, Our representative will receive and escort you to the hotel. Check in make yourself comfortable, After freshen Up proceed to the very first beach the Corbyn’s Cove Beach for swimming and beach activity which is 10 km away from Port Blair City , Later proceed for visit Chatham Saw Mill, Samudrika, Anthropological Museum, In the evening, we go for light and sound show at Cellular Jail. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Port Blair To Havelock Island At 0530 in the morning, we proceed to Havelock Island by Boat', '54 Kms from Port Blair by Sea . The journey takes 2 ½ hrs one way , After check in at hotel proceed for visiting world famous Radha Nagar beach , Return to hotel in the late evening. O/n stay at a hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Havelock Island To Port Blair Leisure At Havelock', 'Sightseeing to Elephanta Beach,. Experience a trilogy of yourself, sun , sand the sea like never before. Later You’ll explore one another beach, Leave Havelock Island at 2PM / 4 PM forPortblair by Boat. Arrive in the evening at 430 /630 PM and rest of the evening at leisure. Overnight stay at Portblair.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Departure from Port Blair Morning free for packing & personal activities. In time Check out from the hotel and transfer to Jetty or Airport. – Tour Ends .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Rajasthan Tour
  pkg_id := 'rajasthan-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'rajasthan-tour', 'Rajasthan Tour',
    'Explore the beautiful sights of Rajasthan Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Rajasthan Tour Packages for 10 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Comfortable vehicle with experienced driver', 'City tour guide English guide: Delhi, Agra, Jaipur, Udaipur,'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Tour Invoice. ( If you need, pay extra GST BY GOVT. SLAB).'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Rajasthan Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'ranthambore', 'udaipur', 'jodhpur', 'jaipur', 'pushkar'],
    india_id,
    delhi_state,
    'Rajasthan Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Rajasthan Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a',
    ARRAY['delhi', 'agra', 'ranthambore', 'udaipur', 'jodhpur', 'jaipur', 'pushkar'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 9n-10d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '9n-10d', '9 Nights / 10 Days', 9, 10, '9 Nights / 10 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '9n-10d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jodhpur_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lake-pichola')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After breakfast, proceed to visit Jama Masjid, Red Fort, India Gate, President House, Humayun Temple, Lotus Temple, Qutub Minar. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Agra (240 Kms. 3 Hrs.)', 'After breakfast drive to Agra & visit Taj Mahal, Agra Fort & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Agra to Ranthambore (305 kms. 6/7 Hrs.)', 'After breakfast, proceed to Ranthambore, En-Route visit Fatehpur sikri. Overnight stay at the hotel Ranthambore.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Ranthambore to Udaipur (405 kms. 7/8 Hrs. approx.)', 'Today after breakfast, proceed to Udaipur, En-Route visit ChittorGarh fort, Overnight stay at the hotel Udaipur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 08', 'Today after breakfast, proceed to Jagdish Temple, City palace, Saheliyo ki Baadi (Princess garden), boat ride at Lake pichola (Own Cost) and overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Udaipur to Jodhpur (260 Kms. 5/6 Hrs. approx)', 'Today after breakfast, proceed to Jodhpur & visit Jodhpur fort, Jaswant thada. Overnight stay at the hotel Jodhpur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Jodhpur to Jaipur (350 kms. 6/7 hrs. approx.)', 'Today, after breakfast, proceed to Jaipur, En-Route visit Pushkar and after lunch proceed to Jaipur & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Day 9 Sightseeing', 'Today after breakfast, a guided tour to visit the ancient capital of Amber, visited beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & Rajasthani handicraft. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Jaipur to Delhi (260 Kms. 5/6 Hrs. approx.)', 'Today after breakfast, proceed to Delhi & drop you at Delhi airport/railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Variant 11n-12d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '11n-12d', '11 Nights / 12 Days', 11, 12, '11 Nights / 12 Days', NULL, NULL, 2, FALSE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '11n-12d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jodhpur_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lake-pichola')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'jaisalmer-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After breakfast, proceed to visit Jama Masjid, Red Fort, India Gate, President House, Humayun Temple, Lotus Temple, Qutub Minar. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Agra (240 Kms. 3 Hrs.)', 'After breakfast drive to Agra & visit Taj Mahal, Agra Fort & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Agra to Jaipur (260 KM. Approx. 6 Hrs.)', 'Today after breakfast, proceed to Jaipur, En-Route visit Fatehpur Sikri, Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Today after breakfast, a guided tour to visit the ancient capital of Amber, visited beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & Rajasthani handicraft. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Jaipur to Udaipur (400 Kms. 6/7 Hrs. approx.)', 'Today after breakfast, proceed to Udaipur on the way to visit Chittogarh fort. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Day 7 Sightseeing', 'Today after breakfast, proceed to Jagdish Temple, City palace, Saheliyo ki Baadi (Princess garden), boat ride at Lake pichola (Own Cost) and overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Udaipur to Jodhpur (260 Kms. 5/6 Hrs. approx)', 'Today after breakfast, proceed to Jodhpur & En-Route visit Ranakpur Jain temple. Overnight stay at the hotel Jodhpur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Jodhpur to Jaisalmer (280 kms. 5/6 hrs. approx.)', 'Today, after breakfast, proceed to visit Jodhpur fort, Jaswant thada & proceed to Jaisalmer & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'After breakfast check out from the hotel & proceed to visit Jaisalmer fort, Jain Temple, Patwon', 'ki-haveli & after lunch we proceed to sand dunes village resort & enjoy Camel ride, Traditional Rajasthani folk dance. stay at a desert resort.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Jaisalmer to Bikaner (330 kms. 5/6 Hrs. approx)', 'After breakfast, proceed to Bikaner and visit Bikaner fort & stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 12, 'Bikaner to Delhi (450 kms. 8/9 Hrs. approx.)', 'After breakfast, proceed to Delhi & drop you at Airport/Railway station for onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Variant 13n-14d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '13n-14d', '13 Nights / 14 Days', 13, 14, '13 Nights / 14 Days', NULL, NULL, 3, FALSE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '13n-14d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jodhpur_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lake-pichola')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'jaisalmer-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After breakfast, proceed to visit Jama Masjid, Red Fort, India Gate, President House, Humayun Temple, Lotus Temple, Qutub Minar. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi to Agra (240 Kms. 3 Hrs.)', 'After breakfast drive to Agra & visit Taj Mahal, Agra Fort & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Agra to Jaipur (260 KM. Approx. 6 Hrs.)', 'Today after breakfast, proceed to Jaipur, En-Route visit Fatehpur Sikri, Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Today after breakfast, a guided tour to visit the ancient capital of Amber, visited beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), famous block printing & Rajasthani handicraft. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Jaipur to Pushkar (150 Kms. 3 Hrs. approx.)', 'Today after breakfast, proceed to Pushkar check in at the hotel & after refreshment proceed to visit Brahma temple, Pushkar lake, and evening aarti for sun set. Overnight Stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Pushkar to Udaipur (300 Kms. 5/6 Hrs. approx.)', 'Today after breakfast, proceed to Udaipur on the way to visit Chittogarh fort. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Day 8 Sightseeing', 'Today after breakfast, proceed to Jagdish Temple, City palace, Saheliyo ki Baadi (Princess garden), boat ride at Lake pichola (Own Cost) and overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Udaipur to Jodhpur (260 Kms. 5/6 Hrs.)', 'Today after breakfast, proceed to Jodhpur & En-Route visit Ranakpur Jain temple. Overnight stay at the hotel Jodhpur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Day 10 Sightseeing', 'Today, after breakfast, proceed to visit Jodhpur fort & Jaswant thada, proceed to Jaisalmer & stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'After breakfast check out from the hotel & proceed to visit Jaisalmer fort, Jain Temple, Patwon', 'ki-haveli & after lunch we proceed to sand dunes village resort & enjoy Camel ride, Traditional Rajasthani folk dance. stay at a desert resort.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 12, 'Jaisalmer to Bikaner (330 kms. 5/6 Hrs. approx)', 'After breakfast, proceed to Bikaner and visit Bikaner fort & stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 13, 'Bikaner to Mandawa (200 kms. 3/4 Hrs. approx.)', 'After breakfast, proceed to Mandawa, check in at the hotel & visit old painted havelis and walkin tour. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 14, 'Mandawa to Delhi (250 kms. 5/6 Hrs. approx.)', 'After breakfast, proceed to Delhi & drop you at Airport/Railway station for onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Variant 14n-15d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '14n-15d', '14 Nights / 15 Days', 14, 15, '14 Nights / 15 Days', NULL, NULL, 4, FALSE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '14n-15d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jodhpur_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lake-pichola')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'jaisalmer-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. After breakfast a guided tour to visit Red fort, Jama masjid, India gate, President house, Lotus temple, overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Agra (230 Kms. 3 Hrs. approx.)', 'Today after breakfast proceed to Agra, check in at the hotel & after refreshment a guided tour to visit Taj Mahal, Agra Fort. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'After breakfast, proceed to visit Taj Mahal 7 famous marble factory/Handicraft . Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Agra to Jaipur (260 Kms. 6 Hrs. approx.)', 'After breakfast drive to Jaipur and stop for a guided tour to visit Fatehpur Sikri. Overnight stay at the hote', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'After breakfast a guided tour to visit Amber Fort', 'After Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and after visit famous Rajasthani handicraft. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Jaipur to Pushkar ( 150 Kms. 3 Hrs. approx.)', 'After breakfast proceed to Pushkar & after check in at the hotel and after refresh proceed to visit Brahma Temple, Pushkar lake, Pushkar fair ground & walking tour. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Udaipur (250 Kms. 6 Hrs. approx.)', 'Today after breakfast, drive to Udaipur, En-Route visit ChittorGarh fort,. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Day 8 Sightseeing', 'After breakfast visit Udaipur City palace, Jagdish temple, Sahelion ki bari(Princess garden) & boat ride at Lake Pichola. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Udaipur to Jodhpur (250 Kms. 7 Hrs. approx.)', 'Today after breakfast proceed to Jodhpur En-Route visit Ranakpur Jain Temple. overnight stay at the hotel Jodhpur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Day 10 Sightseeing', 'After breakfast proceed to visit Jodhpur Fort, Jaswant Thada & Old city walking tour. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Jodhpur to Jaisalmer (285 Kms. 6 Hrs. Approx.)', 'After breakfast check out from the hotel and proceed to Jaisalmer (Golden city). Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 12, 'Jaisalmer', 'After breakfast check out from the hotel & proceed to visit Jaisalmer fort, Jain Temple, Patwon-ki-haveli & after lunch we proceed to sand dunes village resort & enjoy Camel ride, Traditional Rajasthani folk dance. stay at a desert resort.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 13, 'Jaisalmer to Bikaner (325 Kms. 6 Hrs. approx.)', 'After breakfast check out & proceed to Bikaner visit Bikaner fort & check in at the hotel after refresh proceed to visit world famous Deshnok Temple (Ret Temple). Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 14, 'Bikaner to Mandawa (200 Kms. 3 Hrs. approx.)) After breakfast, proceed to Mandawa En', 'Route to visit Old painted havelis, check in hotel & evening walking tour to visit the Old painted havelis. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 15, 'Mandawa', 'Delhi (280 Kms. 6/7 Hrs. approx.): After breakfast check out & proceed to Delhi En-Route visit Old painted Havelis & drop you at Delhi airport/railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Rajasthan Tour Tour
  pkg_id := 'rajasthan-tour-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'rajasthan-tour-tour', 'Rajasthan Tour Tour',
    'Explore the beautiful sights of Rajasthan Tour Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Rajasthan Tour Packages for 11 Days Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Comfortable vehicle with experienced driver', 'City tour guide English guide: Delhi, Agra, Jaipur, Udaipur,'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Tour Invoice. ( If you need, pay extra GST BY GOVT. SLAB).'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Rajasthan Tour Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'jaipur', 'udaipur', 'jodhpur', 'jaisalmer', 'bikaner'],
    india_id,
    delhi_state,
    'Rajasthan Tour Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Rajasthan Tour Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers ',
    ARRAY['delhi', 'agra', 'jaipur', 'udaipur', 'jodhpur', 'jaisalmer', 'bikaner'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 10n-11d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '10n-11d', '10 Nights / 11 Days', 10, 11, '10 Nights / 11 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '10n-11d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jodhpur_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaisalmer_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, bikaner_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lake-pichola')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'jaisalmer-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel. After refreshment a guided tour to visit Red fort, Jama Masjid, India gate, Qutub minar. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Agra (230 Kms. 3', '4 Hrs. approx.): Today after breakfast proceed to Agra & a guide tour to visit Taj Mahal, Agra Fort, Marble handicrafts. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra to Jaipur (260 Kms. 6 Hrs. Approx.)', 'After breakfast drive to Jaipur & En-Route visit Fatehpur Sikri . Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast, a guided tour to visit Amber fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar) and famous Rajasthani handicraft. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Jaipur to Udaipur (400 Kms. 7/8 Hrs.)', 'Today after breakfast, proceed to Udaipur & En-Route visit ChittorGarh fort, Overnight stay at hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'After breakfast, a guided tour to visit City palace, Jagdish temple, Sahelion ki bari (Princess garden) & boat ride at Lake Pichola (direct payment basis). Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Udaipur to Jodhpur (250 Kms. 6/7 Hrs. approx.)', 'Today after breakfast proceed to Jodhpur & En-Route visit Ranakpur Jain Temple. Overnight stay at the hotel Jodhpur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Jodhpur to Jaisalmer (285 Kms. 5/6 Hrs. approx.)', 'After breakfast check out from the hotel & visit Jodhpur Fort, Jaswant Thada & drive to Jaisalmer. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'After breakfast check out from the hotel & proceed to visit Jaisalmer fort, Jain Temple, Patwon', 'ki-haveli & after lunch proceed to sand dunes village resort & enjoy Camel ride, Traditional Rajasthani folk dance. stay at a desert resort.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Jaisalmer to Bikaner (325 Kms. 6/7 Hrs. approx.)', 'After breakfast check out & proceed to Bikaner visit Bikaner fort. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Bikaner to Delhi (440 Kms. 8/9 Hrs. approx.)', 'After breakfast check out & proceed to Delhi En-Route visit Old painted Havelis & drop you at Delhi airport/railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Rajasthan Tour Delhi Agra Khajuraho Varanasi Tour
  pkg_id := 'rajasthan-tour-delhi-agra-khajuraho-varanasi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'rajasthan-tour-delhi-agra-khajuraho-varanasi-tour', 'Rajasthan Tour Delhi Agra Khajuraho Varanasi Tour',
    'Explore the beautiful sights of Delhi | Mandawa | Bikaner | Jaisalmer | Jodhpur | Ranakpur | Udaipur | Pushkar | Jaipur | Agra | Orcha | Khajuraho | Varanasi|. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Rajasthan Tour with Delhi Agra Khajuraho Varanasi Tour 20 Nights 21 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur', 'Guide services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .', 'Tour Invoice. ( If you need, pay extra GST BY GOVT. SLAB).', 'Driver, Guide, Porter Tips'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Rajasthan Tour Delhi Agra Khajuraho Varanasi Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'khajuraho', 'varanasi', 'mandawa', 'bikaner', 'jaisalmer', 'jodhpur', 'udaipur', 'pushkar', 'jaipur'],
    india_id,
    delhi_state,
    'Rajasthan Tour Delhi Agra Khajuraho Varanasi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Mandawa | Bikaner | Jaisalmer | Jodhpur | Ranakpur | Udaipur | Pushkar | Jaipur | Agra | Orcha | Khajuraho | V',
    ARRAY['delhi', 'agra', 'khajuraho', 'varanasi', 'mandawa', 'bikaner', 'jaisalmer', 'jodhpur', 'udaipur', 'pushkar', 'jaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 20n-21d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '20n-21d', '20 Nights / 21 Days', 20, 21, '20 Nights / 21 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '20n-21d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mandawa_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, bikaner_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaisalmer_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jodhpur_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pushkar_dest, 10) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 11) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'jaisalmer-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at Delhi Airport company representative assist you and transfer to the hotel.Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi sightseeing', 'Today after breakfast, a guided tour to visit Jama Masjid, Red Fort, President House, Parliament, Qutub Minar, Lotus Temple, Humayun’s Tomb, Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Delhi', 'Mandawa (260 Kms. 6 Hrs. approx.): Today, after breakfast, drive to Mandawa & checked in at the hotel. Evening a guided walking tour to visit old painted houses (Havelis). Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Mandawa', 'Bikaner (200 kms. 4 hrs.): Today after breakfast, proceed to Bikaner and visit Bikaner Fort (JunaGarh Fort). After checking in the hotel Proceed to visit Deshnok Temple. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Bikaner', 'Jaisalmer(340 kms. 6 hrs. approx.): Today after breakfast proceed to Jaisalmer. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Today after breakfast check out from the hotel and visit Jaisalmer fort, Patwon', 'ki haveli and after lunch, proceed to Khuri/Sam (SanDunes Desert Village) and enjoy village and dunes sun set point by camel ride and back to desert camp, Rajasthani Folk Dance , Dinner. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Khuri', 'Jodhpur (270 kms. 6 hrs. approx.): Today after breakfast proceed to Jodhpur. Visit Jodhpur Fort Mehrangarh and Jaswant Thada. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Jodhpur', 'Ranakpur (200 kms. 3 hrs. approx.): Today after breakfast, proceed to Ranakpur & visit Ranakpur Jain Temple. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Ranakpur', 'Udaipur (100 kms. 3 hrs. approx.): Today after breakfast proceed to Udaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Udaipur sightseeing', 'Today after breakfast, proceed to visit Jagdish Temple, City Palace, Princes Garden (Sahelio Ki Badi), and Boat Ride . Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Udaipur', 'Pushkar(280 kms. 6 hrs. approx.): Today after breakfast proceed to Pushkar Hindu holy city. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 12, 'Pushkar', 'Jaipur (150 kms. 3 hrs. approx.): Today after breakfast Visit Brahma Temple, Camel Fare Ground and proceed to Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 13, 'Jaipur sightseeing', 'Today after breakfast, a guided tour to visit the ancient capital of Amer. Visit the beautiful Amer Fort, Hawa Mahal(Window Palace), City Place and Observatory(Jantar Mantar), visiting famous block printing & James & Stone cutting factory work being done for centuries in Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 14, 'Jaipur', 'Agra VIA Fatehpur Sikri(260 kms. 6 hrs. approx.): Today after breakfast proceed to Jaipur on the way to Fatehpur Sikri.Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 15, 'Agra sightseeing', 'Today, a guided tour to visit Taj Mahal, Agra Fort , and visiting famous fine marble inlay work which is still being done in Agra. Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 16, 'Agra', 'Orchha(260 kms. 6 hrs. approx.): Today after breakfast proceed to Orchha and visit Orchcha fort & free for walking tour. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 17, 'Orchha', 'Khajuraho(180 kms. 4 hrs. approx.): Today after breakfast proceed to Khajuraho. Checkin at the hotel and after refresh visit Western temple and Jain temple. Rest of the at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 18, 'Khajuraho', 'Varanasi(400 kms. 9 hrs. approx.): Today, after breakfast drive to Varanasi. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 19, 'Varanasi sightseeing', 'Today early morning boat ride on the holy river Ganges to see the famous bathing Ghats site. After breakfast, visit Vishwanath temple, Sankat mochan temple, BHEU & Sarnath. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 20, 'Day 20 Sightseeing', 'Today after breakfast drop you at Varanasi Airport/Railway station and pickup at Delhi rest of the day leisure for your onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 21, 'Day 21 Sightseeing', 'After breakfast departure transfer to Delhi Airport/Railway station with sweet meomeries.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Rajasthan Tour Khajuraho & Varanasi
  pkg_id := 'rajasthan-tour-khajuraho-varanasi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'rajasthan-tour-khajuraho-varanasi', 'Rajasthan Tour Khajuraho & Varanasi',
    'Explore the beautiful sights of Rajasthan Tour Khajuraho & Varanasi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Rajasthan Tour with Khajuraho & Varanasi for 10 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel, State taxes', 'Comfortable vehicle with experienced driver', 'City tour guide English guide: Delhi, Agra, Jaipur, Udaipur,'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Tour Invoice. ( If you need, pay extra GST BY GOVT. SLAB).'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Rajasthan Tour Khajuraho & Varanasi.',
    FALSE, TRUE,
    ARRAY['khajuraho', 'varanasi', 'delhi', 'jaipur', 'agra'],
    india_id,
    mp_state,
    'Rajasthan Tour Khajuraho & Varanasi | Mother India Tour Travels',
    'Explore the beautiful sights of Rajasthan Tour Khajuraho & Varanasi. This package offers a comprehensive day-wise itinerary, comfortable stays, and pr',
    ARRAY['khajuraho', 'varanasi', 'delhi', 'jaipur', 'agra'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 9n-10d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '9n-10d', '9 Nights / 10 Days', 9, 10, '9 Nights / 10 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '9n-10d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, khajuraho_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'red-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representatives assist you and transfer to the hotel after refresh proceed a guided tour to visit Red fort, Jama masjid, India gate, President house, Lotus temple, overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Jaipur ( 260 Kms. 6 Hrs. approx.)', 'After breakfast proceed to Pink city Jaipur. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'Today after breakfast, a guided tour to visit Amer Fort, Jal Mahal ( water palace), Hawa Mahal (Window Palace), City Place and Observatory(Jantar Mantar). Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Jaipur to Agra (260 Kms. 6 Hrs. approx.)', 'VIA Fatehpur Sikri, Today after breakfast proceed to Agra and stop for visiting Fatehpur Sikri. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Today after breakfast, a guided tour to visit The Taj Mahal, Agra Fort. Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Agra', 'Khajuraho (410 Kms. 6/7 Hrs. approx.): Today after breakfast proceed to Khajuraho En-Route to visit Orchha (Temple Town ). Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Day 7 Sightseeing', 'Today after breakfast, proceed to sightseeing and visit Western Temples and Jain Temples. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Khajuraho', 'Varanasi (400 Kms. 8/9 Hrs. approx.), Today after breakfast proceed to Varanasi. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Day 9 Sightseeing', 'Today early morning boat ride excursion on the holly river Ganges to see the famous bathing Ghats and cremation site, back to hotel and after breakfast, a guided tour to visit Vishweshwar temple, Bharat Mata Temple and Sarnath & Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Day 10 Sightseeing', 'Today after breakfast in the morning, proceed to drop you at Varanasi Airport/Railway station to board a flight for your onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Ranthambore Tour Delhi Agra Jaipur
  pkg_id := 'ranthambore-tour-delhi-agra-jaipur';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'ranthambore-tour-delhi-agra-jaipur', 'Ranthambore Tour Delhi Agra Jaipur',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Ranthambore | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Ranthambore Tour with Delhi Agra Jaipur for 07 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur', 'Guide Services'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg',
    ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Ranthambore Tour Delhi Agra Jaipur.',
    FALSE, TRUE,
    ARRAY['ranthambore', 'delhi', 'agra', 'jaipur'],
    india_id,
    raj_state,
    'Ranthambore Tour Delhi Agra Jaipur | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Jaipur | Ranthambore | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable sta',
    ARRAY['ranthambore', 'delhi', 'agra', 'jaipur'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', ARRAY['https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg', 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/739987/pexels-photo-739987.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fatehpur-sikri')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Arrival at Delhi Airport company representative assist you and a guide tour to visit Qutub minar, Lotus temple, India gate, President house. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Delhi to Agra (230 Kms. 3 Hrs.)', 'Today, after breakfast, proceed to Agra. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'After breakfast, a guided tour to visit Taj Mahal, Agra Fort and famous marble handicraft factory. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Agra to Ranthambore (280 Kms. 7 Hrs. Approx.)', 'After breakfast drive to Ranthambore. En-route we make a stop and visit Fatehpur Sikri, Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Ranthambore to Jaipur (200 Kms. 4 Hrs. approx.)', 'Early morning start your Jungle safari tour (own cost) after breakfast drive to Jaipur & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Jaipur Sightseeing', 'After breakfast, a guided tour to visit the beautiful Amber Fort, Water Palace, Hawa Mahal (Window Palace), City Place and Observatory (Jantar Mantar), Rajasthani handicraft. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Jaipur to Delhi (260 Kms. 6 Hrs. approx.)', 'Today after breakfast proceed to Delhi & drop you at the airport/railway station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Same Day Agra Tour Delhi
  pkg_id := 'same-day-agra-tour-delhi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'same-day-agra-tour-delhi', 'Same Day Agra Tour Delhi',
    'Explore the beautiful sights of Delhi | Agra | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Same Day Agra Tour from Delhi'],
    ARRAY['Pick Up and Drop', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Chauffeur, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Guide Srvice in Agra'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Driver and Guide Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Same Day Agra Tour Delhi.',
    FALSE, TRUE,
    ARRAY['agra', 'delhi'],
    india_id,
    up_state,
    'Same Day Agra Tour Delhi | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Agra | Delhi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfe',
    ARRAY['agra', 'delhi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 0n-1d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '0n-1d', '0 Nights / 1 Days', 0, 1, '0 Nights / 1 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '0n-1d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Same Day Sightseeing & Return', 'Today, we will proceed early in the morning from Delhi to Agra (240 Kms. approx. 3 Hrs. approx. one side) and a guide tour to visit The Taj Mahal & After Agra Fort and after lunch back to Delhi and drop you at the hotel/Airport/Railway Stn.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Shimla Kullu Manali Tour
  pkg_id := 'shimla-kullu-manali-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'shimla-kullu-manali-tour', 'Shimla Kullu Manali Tour',
    'Explore the beautiful sights of Delhi/Chandigarh | Shimla | Manali | Delhi/Chandigarh !. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Shimla Kullu Manali Tour Package 06 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of Shimla Kullu Manali Tour.',
    FALSE, TRUE,
    ARRAY['shimla', 'kullu', 'manali', 'delhi', 'chandigarh'],
    india_id,
    hp_state,
    'Shimla Kullu Manali Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi/Chandigarh | Shimla | Manali | Delhi/Chandigarh !. This package offers a comprehensive day-wise itinerary, comfo',
    ARRAY['shimla', 'kullu', 'manali', 'delhi', 'chandigarh'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, chandigarh_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'solang-valley')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hadimba-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kufri')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi/Chandigarh', 'Shimla (350 Kms. 8 Hrs. approx.)(Chandigarh to Shimla 120 Kms 4 Hrs. approx.): Arrival at Delhi/Chandigarh Airport/Railway Station company representative assist you and proceed to Shimla & Stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After breakfast at the hotel, proceed for a half day excursion to Kufri (2500mts). Kufri is also renowned for other adventure activities such as skiing, tobogganing (sliding downhill on a sled), etc. Kufri has the oldest skiing slopes in Himachal Pradesh. You can also take a hike or a Pony up to Mashu Peak(own cost direct payment basis). Afternoon: Guests will be dropped at the Shimla elevator & explore by themselves. Attractions of the mall road include Shimla Church, Scandal Point, Gaiety Theater, Town hall, Jaku Temple & shopping. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Shimla', 'Manali (240 Kms. 8 Hrs. approx.):After breakfast at the hotel, depart for Manali. Drive past Beas-Sutlej Link project, Pandoh Dam & En-Rout halt Kullu Valley (Boat ride-Direct payment basis) . Lunch shall be en-route on direct payment basis. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast go for a full day excursion to Solang valley day tour, Solang Valley with its rolling meadows, ski slopes and paragliding activities ( Own cost-Direct payment basis), Overnight stay at the hotel. *Optional Tour with extra paid: Atul tunel, Sissu, Rohtang pas', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'After Breakfast, Proceed for local sightseeing of Manali. visit Vashishtha Kund & Hadimba Temple, Van Vihar, Tibetan Monastery & Mall Road. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Manali to Delhi/Chandigarh (550 Kms./ 12', '13 Hours approx.) - Manali to Chandigarh (270 Kms. 6/7 Hrs. approx.): After breakfast Proceed to Chandigarh/Delhi & drop you at airport/railway station .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Shimla Manali Chandigarh Tour
  pkg_id := 'shimla-manali-chandigarh-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'shimla-manali-chandigarh-tour', 'Shimla Manali Chandigarh Tour',
    'Explore the beautiful sights of Delhi/Chandigarh | Shimla | Manali | Chandigarh |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Shimla Manali Chandigarh Tour Packages 07 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of Shimla Manali Chandigarh Tour.',
    FALSE, TRUE,
    ARRAY['shimla', 'manali', 'chandigarh', 'delhi', 'kullu'],
    india_id,
    hp_state,
    'Shimla Manali Chandigarh Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi/Chandigarh | Shimla | Manali | Chandigarh |. This package offers a comprehensive day-wise itinerary, comfortable',
    ARRAY['shimla', 'manali', 'chandigarh', 'delhi', 'kullu'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, chandigarh_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'solang-valley')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hadimba-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kufri')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi/Chandigarh', 'Shimla (350 Kms. 8 Hrs. approx.)(Chandigarh to Shimla 120 Kms 4 Hrs. approx.): Arrival at Delhi/Chandigarh Airport/Railway Station company representative assist you and proceed to Shimla & Stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'After breakfast at the hotel, proceed for a half day excursion to Kufri (2500mts). Kufri is also renowned for other adventure activities such as skiing, tobogganing (sliding downhill on a sled), etc. Kufri has the oldest skiing slopes in Himachal Pradesh. You can also take a hike or a Pony up to Mashu Peak(own cost direct payment basis). Afternoon: Guests will be dropped at the Shimla elevator & explore by themselves. Attractions of the mall road include Shimla Church, Scandal Point, Gaiety Theater, Town hall, Jaku Temple & shopping. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Shimla', 'Manali (240 Kms. 8 Hrs. approx.):After breakfast at the hotel, depart for Manali. Drive past Beas-Sutlej Link project, Pandoh Dam & En-Rout halt Kullu Valley (Boat ride-Direct payment basis) . Lunch shall be en-route on direct payment basis. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast go for a full day excursion to Solang valley day tour, Solang Valley with its rolling meadows, ski slopes and paragliding activities ( Own cost-Direct payment basis), Overnight stay at the hotel. * Optional Tour with extra paid: Atul tunel, Sissu, Rohtang pas', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'After Breakfast, Proceed for local sightseeing of Manali. visit Vashishtha Kund & Hadimba Temple, Van Vihar, Tibetan Monastery & Mall Road. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Manali to Chandigarh (270 Kms', '7/8 Hrs. approx.); After breakfast Proceed to Chandigarh & visit Pinjore garden. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Chandigarh to Delhi (250 Kms', '5/6 Hrs. approx.); After breakfast, proceed to visit Rose garden, Rock garden and proceed to Delhi & drop you at airport/railway station .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Shimla Manali Tour
  pkg_id := 'shimla-manali-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'shimla-manali-tour', 'Shimla Manali Tour',
    'Explore the beautiful sights of Delhi | Shimla | Manali | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Shimla Manali Tour Package for 05 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of Shimla Manali Tour.',
    FALSE, TRUE,
    ARRAY['shimla', 'manali', 'delhi', 'kullu', 'chandigarh'],
    india_id,
    hp_state,
    'Shimla Manali Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Shimla | Manali | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and privat',
    ARRAY['shimla', 'manali', 'delhi', 'kullu', 'chandigarh'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, chandigarh_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'solang-valley')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hadimba-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kufri')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi to Shimla (350 Kms. 7/8 Hrs. approx.)', 'Arrival at Delhi Airport/railway station company representative assist you and proceed to Shimla & Stay at hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Shimla Kufri & local sightseeing', 'After breakfast, . Kufri is also renowned for other adventure activities such as skiing, tobogganing (sliding downhill on a sled), etc. Kufri has the oldest skiing slopes in Himachal Pradesh. You can also take a hike or a Pony up to Mashu Peak(Direct payment basis), Afternoon: Guests will be dropped at the Shimla elevator & explore by themselves. Attractions of the mall road include Shimla Church, Scandal Point, Gaiety Theater, Town hall, Jaku Temple & shopping. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Shimla to Manali (240 Kms. 8 Hrs. approx.)', 'Today after breakfast proceed to Manali on the way to the Kullu valley, Enjoy river rafting(direct payment basis). Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Today after breakfast, proceed to visit Solang Valley, Hadimba Temple, Vashisht Temple, Monastery, Mall road, Van vihar. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Manali to Delhi (550 Kms./ 12', '13 Hours approx.) And Manali to Chandigarh (9 Hrs. approx.): After breakfast Proceed to Chandigarh/Delhi & drop you at airport/railway station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Sikkim Darjeeling Gangtok Tour
  pkg_id := 'sikkim-darjeeling-gangtok-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'sikkim-darjeeling-gangtok-tour', 'Sikkim Darjeeling Gangtok Tour',
    'Explore the beautiful sights of Sikkim | Darjeeling | Gangtok. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Sikkim Darjeeling Gangtok Tour 5 Days'],
    ARRAY['Accommodation in well-appointed rooms for 03 nights', 'Meals', 'Welcome drink at hotel', 'All transfers & sightseeing as per itinerary using Private Vehicle with driver (Vehicle will not be on disposal)', 'Driver’s allowance', 'Toll tax. Parking, State tax. permit'],
    ARRAY['Route Diversion cost Due to Natural calamities (Land Slide / Road Blockage) / Political Disturbance.', 'Anything not mentioned in “cost includes” section.', 'Extras of personal nature such as personal tips, laundry charges, additional tour charges.', 'Does not include any Lunch, Evening Tea/snacks', 'Insurance, Medical & Emergency rescue costs.', 'Does not include Hard drinks, liquor, mineral water in Hotel, or soft drinks/juices.', 'Does not include Entrance Fees at Monasteries / Monuments / Museums /Flight Ticket/ Train Ticket / Entry Fees / Ropeway charges / Toy Train Tickets / River Rafting charges / Paragliding charges etc.', 'Does not include specialised Guide'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Wildlife', 12, 10, 'Premium Hotels',
    'Experience the best of Sikkim Darjeeling Gangtok Tour.',
    FALSE, TRUE,
    ARRAY['darjeeling', 'gangtok'],
    india_id,
    wb_state,
    'Sikkim Darjeeling Gangtok Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Sikkim | Darjeeling | Gangtok. This package offers a comprehensive day-wise itinerary, comfortable stays, and private ',
    ARRAY['darjeeling', 'gangtok'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, wild_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, darjeeling_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, gangtok_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'tiger-hill')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'batasia-loop')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'tsomgo-lake')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'IXB to Gangtok (120 kms. 4,5 hrs. approx.)', 'Upon your arrival at Bagdogra Airport, you will have an assisted transfer to Gangtok. Complete the check-in formalities at the hotel. The rest of the day is free at leisure. Overnight at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Gangtok sightseeing', 'After breakfast, proceed for a day trip to Tsomgo Lake. Also known as Changu Lake, this glacial lake is a popular tourist attraction and is located on the road towards the Nathu La pass. The next visit is to Baba Mandir. This shrine is built in the memory of a brave Indian soldier, Harbhajan Singh, who died during the war near the Nathu La Pass. Return to Gangtok. The evening is free for shopping activities. Overnight stay at the hotel. Optional tour to Nathula Pass (Alt 14000 Ft.) on China Border can also be arranged (Except Mon, Tue) for Indian Nationals only at an additional cost.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Gangtok to Darjeeling (115 kms. 4 hrs. approx.)', 'After breakfast, proceed for a half-day sightseeing tour of Gangtok covering Banjhakri Falls, Cottage Industry and Handicraft Center, Flower show, Dro-dul Chorten & Institute of Tibetology. Afternoon drive to Darjeeling (7,100 ft.). On arrival, check in to your hotel. Overnight stay at Darjeeling.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Darjeeling sightseeing', 'Early morning, leave to view the sunrise at Tiger Hill. This is a major attraction amongst the tourists. After breakfast, visit Padmaja Naidu Zoological Park (Closed on Thursday), Himalayan Mountaineering Institute (Closed on Thursday), and Tea garden in the undulating valleys to view the scenic landscape of tea plucking and processing. Visit Ghoom Monastery & Batasia Loop. Also, visit the Japanese Temple dedicated to Lord Buddha and constructed in 1972. Don’t forget to visit the Tibetan Refugee Self Help Center. Afternoon enjoys shopping on your own at the local market like Ghoom Monastery Market, Batasia Loop Market, and Chowk Bazaar. Enjoy an overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Darjeeling to IXB Airport (80 kms. 3 hrs. approx.)', 'After breakfast, check out from the hotel and transfer to Airport to connect the flight to the onward destination.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Delightful Darjeeling Sikkim Darjeeling
  pkg_id := 'delightful-darjeeling-sikkim-darjeeling';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delightful-darjeeling-sikkim-darjeeling', 'Delightful Darjeeling Sikkim Darjeeling',
    'Explore the beautiful sights of Darjeeling. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['03 Nights/04 Days Delightful Darjeeling - Sikkim Darjeeling'],
    ARRAY['Accommodation in well-appointed rooms for 03 nights', 'Meals', 'Welcome drink at hotel', 'All transfers & sightseeing as per itinerary using Private Vehicle with driver (Vehicle will not be on disposal)', 'Driver’s allowance', 'Toll tax. Parking, State tax. permit'],
    ARRAY['Route Diversion cost Due to Natural calamities (Land Slide / Road Blockage) / Political Disturbance.', 'Anything not mentioned in “cost includes” section.', 'Extras of personal nature such as personal tips, laundry charges, additional tour charges.', 'Does not include any Lunch, Evening Tea/snacks', 'Insurance, Medical & Emergency rescue costs.', 'Does not include Hard drinks, liquor, mineral water in Hotel, or soft drinks/juices.', 'Does not include Entrance Fees at Monasteries / Monuments / Museums /Flight Ticket/ Train Ticket / Entry Fees / Ropeway charges / Toy Train Tickets / River Rafting charges / Paragliding charges etc.', 'Does not include specialised Guide'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg',
    ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'],
    'Wildlife', 12, 10, 'Premium Hotels',
    'Experience the best of Delightful Darjeeling Sikkim Darjeeling.',
    FALSE, TRUE,
    ARRAY['darjeeling'],
    india_id,
    wb_state,
    'Delightful Darjeeling Sikkim Darjeeling | Mother India Tour Travels',
    'Explore the beautiful sights of Darjeeling. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a mem',
    ARRAY['darjeeling'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, wild_cat) ON CONFLICT DO NOTHING;

  -- Variant 3n-4d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '3n-4d', '3 Nights / 4 Days', 3, 4, '3 Nights / 4 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '3n-4d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, darjeeling_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'tiger-hill')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'batasia-loop')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Arrival at Darjeeling Welcome to north', 'east India as part of your 3 nights 4 days Darjeeling tour package.Arrive NJP Rly Station / Bagdogra airport, Transfer to Darjeeling & over Night stay at Darjeeling.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Tiger Hill Sunrise & Darjeeling City TourWake up Early morning tour to Tiger Hills (8364 Ft / 2550 Mts at around 4 AM) to View sunrise over Mt. Kanchendzonga, on the way back, visited Ghoom Monastery and Batasia Loop. After breakfast, sightseeing of Japanese Temple, Peace pagoda, Padmaja Naidu Himalayan ZoologicalPark (Closed on Thursday), Himalayan Mountaineering Institute (Closed on Thursday), TibetanRefugee Center (Closed on Sunday) Natural History museum, Ropeway and Tenzing Rock.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Mirik Day Excursion', '50kms 3 hrs; Enjoy a mesmerizing excursion to Mirik on your penultimate day in Darjeeling India. After breakfast, drive to Mirik (4,900 ft.), via Indo-Nepal Border (Extra vehicle charges will be applicable for Nepal Border to Pashupati Market). The drive is through scenic roads with occasional stops for photography. Mirik is known for man-made Sumendu Lake in center surrounded by pine trees and its landscaped tea gardens and orange orchards. Return to Darjeeling in the evening and overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Darjeeling to IXB/NJP/Siliguri, Proceed from Darjeeling to Bagdogra Airport (IXB)/NJP (Railway Station)/Siliguri (for onward journey (73 KM drive/3 Hours approx).', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Sikkim Darjeeling Tour
  pkg_id := 'sikkim-darjeeling-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'sikkim-darjeeling-tour', 'Sikkim Darjeeling Tour',
    'Explore the beautiful sights of Sikkim | Darjeeling. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Sikkim Darjeeling Tour 04 Night 05 Days'],
    ARRAY['Accommodation in well-appointed rooms for 03 nights', 'Meals', 'Welcome drink at hotel', 'All transfers & sightseeing as per itinerary using Private Vehicle with driver (Vehicle will not be on disposal)', 'Driver’s allowance', 'Toll tax. Parking, State tax. permit'],
    ARRAY['Route Diversion cost Due to Natural calamities (Land Slide / Road Blockage) / Political Disturbance.', 'Anything not mentioned in “cost includes” section.', 'Extras of personal nature such as personal tips, laundry charges, additional tour charges.', 'Does not include any Lunch, Evening Tea/snacks', 'Insurance, Medical & Emergency rescue costs.', 'Does not include Hard drinks, liquor, mineral water in Hotel, or soft drinks/juices.', 'Does not include Entrance Fees at Monasteries / Monuments / Museums /Flight Ticket/ Train Ticket / Entry Fees / Ropeway charges / Toy Train Tickets / River Rafting charges / Paragliding charges etc.', 'Does not include specialised Guide'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Sikkim Darjeeling Tour.',
    FALSE, TRUE,
    ARRAY['darjeeling', 'gangtok', 'pelling'],
    india_id,
    wb_state,
    'Sikkim Darjeeling Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Sikkim | Darjeeling. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers ',
    ARRAY['darjeeling', 'gangtok', 'pelling'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, darjeeling_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, gangtok_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pelling_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrive NJP Railway Station/Bagdogra Airport To Gangtok. Meet and greet on arrival & transfer to Gangtok(5500 FT.) the capital of Sikkim – The land of the Pristine and un-spoilt natural beauty with alpine landscapes and thick luxuriant forests,River and peaceful lakes. Evening free for own activities. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'After breakfast excursion to Tsomogo Lake(Departure at 9;00 to 9;30 AM)', 'Situated at a height of 3,780 Mts. with an average depth of 50 Ft. and Baba Mandir – The shrine maid in memory of sepoy Harbahajan Singh,Back to Gangtok. Evening free . Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'After breakfast start for half day sightseeing covering Jhakri Water Falls, Ranka Monastery, Research of Tibetology(Close on Sunday and Government Holidays). Do-Drul Chorten, Directorate of Handloom(Close on Sunday and Govt. Holidays), Flower Show. Afternoon transfer to Pelling. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast sightseeing includes Rimbi Waterfalls, Rock Garden,Khecheopalri Lake and Darap Village, Kanchenjunga Water Falls, Pemayangtse Monestery, Rabdentse Ruins. New Helipad and Kanchenjunga View Tower. Rest of the day at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'After breakfast Pelling Bagdogra Airport/NJP Railway Station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Sikkim Darjeeling Tour ’s ’s
  pkg_id := 'sikkim-darjeeling-tour-s-s';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'sikkim-darjeeling-tour-s-s', 'Sikkim Darjeeling Tour ’s ’s',
    'Explore the beautiful sights of Sikkim Darjeeling Tour ’s ’s. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Sikkim Darjeeling Tour 08 Night’s 09 Day’s'],
    ARRAY['Accommodation in well-appointed rooms for 03 nights', 'Meals', 'Welcome drink at hotel', 'All transfers & sightseeing as per itinerary using Private Vehicle with driver (Vehicle will not be on disposal)', 'Driver’s allowance', 'Toll tax. Parking, State tax. permit'],
    ARRAY['Route Diversion cost Due to Natural calamities (Land Slide / Road Blockage) / Political Disturbance.', 'Anything not mentioned in “cost includes” section.', 'Extras of personal nature such as personal tips, laundry charges, additional tour charges.', 'Does not include any Lunch, Evening Tea/snacks', 'Insurance, Medical & Emergency rescue costs.', 'Does not include Hard drinks, liquor, mineral water in Hotel, or soft drinks/juices.', 'Does not include Entrance Fees at Monasteries / Monuments / Museums /Flight Ticket/ Train Ticket / Entry Fees / Ropeway charges / Toy Train Tickets / River Rafting charges / Paragliding charges etc.', 'Does not include specialised Guide'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Sikkim Darjeeling Tour ’s ’s.',
    FALSE, TRUE,
    ARRAY['darjeeling', 'gangtok'],
    india_id,
    wb_state,
    'Sikkim Darjeeling Tour ’s ’s | Mother India Tour Travels',
    'Explore the beautiful sights of Sikkim Darjeeling Tour ’s ’s. This package offers a comprehensive day-wise itinerary, comfortable stays, and private t',
    ARRAY['darjeeling', 'gangtok'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 8n-9d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '8n-9d', '8 Nights / 9 Days', 8, 9, '8 Nights / 9 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '8n-9d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, darjeeling_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, gangtok_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'tiger-hill')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'batasia-loop')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'tsomgo-lake')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'rumtek-monastery')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Bagdogra/NJP', 'Kalimpong:- Arrive NJP Railway Station/Bagdogra Airport – our representative will meet you and we shall head for KALIMPONG. On the way enjoy the beautiful scenic beauty. Check into your hotel, refresh and relax. This evening is free to enjoy the marketing for relics and hand made goods.Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Kalimpong', 'Sightseeing – Gangtok:– This morning after breakfast we shall head for a half day sightseeing to the worth seen places in and around Kalimpong like Dello Hills, Dr. Graham’s Home, Durpin dara Hills, Nature Interpretation Centre, Jang-dong-Palriffo-Brang & Flower Nurseries etc. Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Kalimpong', 'Gangtok:– After breakfast, you will be transferred to Gangtok. Enjoy the beautiful sceneries on the way! Check into your hotel, refresh and relax. This evening is free to walk around the mall road. Check out the mall in Gangtok. Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Sightseeing (East Sikkim);', 'This morning after breakfast we shall head for a full day sightseeing to the worth seen places in and around Gangtok like Rumtek Monastery, Research Institure of Tibetology, Droul Chorthen, Flower show, etc.!! The evening is free at your own. Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Gangtok', 'Tsomgo Lake & Baba Mandir (East Sikkim):- This morning after breakfast we shall head for a half day excursion to three prominent sites – Tsomgo Lake and Baba Mandir. We start driving up above Gangtok through intricate winding road along the mystical environs and reach an enchanting Tsomgo lake after about one and half hours. A lake is nestled amidst high peaks at an altitude of 12,400 ft. On winters, you will be able to witness the lake in a frozen state. After spending about half an hour here, we drive back to a fabled Baba Mandir. This is basically a temple of an army Captain Harbajan Singh who mysteriously vanished from the army camp but later is believed to have turned invisible but absolutely present who still continues his duty as an army officer and protects the border army from any unanticipated events. After this visit we drive back to Gangtok. Check into the hotel refresh and relax. The rest of the day is free to relax for you. You will enjoy this place a lot because of its scenic beauty…and mostly, as you will having your personal car…instead of a sharing basis! You can stop at any point for a photo session!!. Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Gangtok', 'Darjeeling:- After breakfast, you will be transferred to Darjeeling. Enjoy the beautiful sceneries on the way! Check into your hotel, refresh and relax. This evening is free to walk around the mall road. Check out the mall in Darjeeling… Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Darjeeling Sightseeing & Tiger Hill', '- Wake up early this morning, and you will be transferred to TIGER HILL to see the most beautiful sunrise (at 4am approx)! After that, visit Batasia Loope, Ghoom Monastery and return to the hotel! After breakfast, we will take you for a full day sightseeing to Himalayan Zoological Park, Mountaineering Institute, Tenzing & Gombu Rock, Tea Estate, etc.The evening is free for you and is at leisure!.Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Darjeeling Sightseeing', '- After breakfast, you will be transferred to mirik lake and pashupati phatak. The evening is free for you and make yourself ease at leisure!. Rest of the day at leisure .', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Darjeeling', 'Transfer To Bagdogra/NJP:- This morning after breakfast, we shall check out of the hotel and transfer to NJP/Bagdogra. Return Home with Happy memories…and regret as you have to leave from these places!', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Spiritual Tour Kathmandu Lumbini
  pkg_id := 'spiritual-tour-kathmandu-lumbini';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'spiritual-tour-kathmandu-lumbini', 'Spiritual Tour Kathmandu Lumbini',
    'Explore the beautiful sights of Spiritual Tour Kathmandu Lumbini. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Spiritual Tour Package Kathmandu, Lumbini, for 06 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur', 'Guide Service'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc', 'Monument entrances, camera Fee, etc', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis)', 'Driver, Guide & Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg',
    ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Spiritual Tour Kathmandu Lumbini.',
    FALSE, FALSE,
    ARRAY['kathmandu', 'lumbini', 'pokhara'],
    nepal_id,
    NULL,
    'Spiritual Tour Kathmandu Lumbini | Mother India Tour Travels',
    'Explore the beautiful sights of Spiritual Tour Kathmandu Lumbini. This package offers a comprehensive day-wise itinerary, comfortable stays, and priva',
    ARRAY['kathmandu', 'lumbini', 'pokhara'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, int_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kathmandu_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, lumbini_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pokhara_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'pashupatinath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'boudhanath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'swayambhunath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kathmandu-durbar-square')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival in Kathmandu After arrival at Tribhuvan International Airport, you’ll be warmly welcomed and transferred to your hotel in Kathmandu. After check-in, you can relax. In the evening, explore the lively Thamel area at your leisure time. Overnight stay in Kathmandu.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Kathmandu Sightseeing Today, engage yourself in Kathmandu’s rich cultural heritage with a full', 'day sightseeing tour. Begin with a visit to Pashupatinath Temple and Gujeshowri Temple. Continue to Boudhanath Stupa, one of the largest stupas in the world and a UNESCO World Heritage Site. In the afternoon, explore Swayambhunath Stupa, also known as the Monkey Temple, and finish the day at Kathmandu Durbar Square, a historic palace square that showcases traditional Nepalese architecture.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'Early Morning Trip to Nagarkot and Drive to Pokhara via Manakamana Early in the morning, drive to Nagarkot to witness a breathtaking sunrise over the Himalayas. After enjoying the stunning views, return to your hotel in Kathmandu for breakfast. Following breakfast, embark on a scenic drive to Manakamana Temple, accessible by a cable car ride that offers spectacular views of the surrounding landscape. After visiting the temple, continue your journey to Pokhara. Upon arrival, check into your hotel and take the evening to relax or explore the lakeside area. Overnight stay in Pokhara.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Explore Pokhara Begin exploring Pokhara’s highlights, with a boat ride on Phewa Lake to watch the stunning mountain reflections. Visit Tal Barahi Temple on an island in the lake, and head to Davis Falls and Gupteshwor Mahadev Cave. Wrap up the day with a visit to the Peace Pagoda, which offers panoramic views of the Annapurna range and Pokhara Valley.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Return to Kathmandu After breakfast, the journey back to Kathmandu will begin by road. Upon arrival, check into your hotel and spend the remainder of the day at your leisure. You can use this time for some last-minute shopping in Thamel or visit the Garden of Dreams, a beautiful, peaceful garden in the city & heart. Stay in Kathmandu.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'Departure from Kathmandu On your final day, enjoy breakfast at your hotel before being transferred to Tribhuvan International Airport for your departure. Depart with memories of Nepal’s diverse landscapes, spiritual sites, and rich culture.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: : Delhi Mussoorie Corbett Nainital Tour Uttarakhand Tours Package
  pkg_id := 'delhi-mussoorie-corbett-nainital-tour-uttarakhand-tours-package';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-mussoorie-corbett-nainital-tour-uttarakhand-tours-package', ': Delhi Mussoorie Corbett Nainital Tour Uttarakhand Tours Package',
    'Explore the beautiful sights of Delhi | Mussoorie | Corbett | Nainital | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['05 Nights 06 Days: Delhi ! Mussoorie ! Corbett ! Nainital ! Tour (Uttarakhand Tours Package)'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC with driver', 'AC NOT OPERATE ON HILLY AREA'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg',
    ARRAY['https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', 'https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg', 'https://images.pexels.com/photos/2356045/pexels-photo-2356045.jpeg'],
    'Wildlife', 12, 10, 'Premium Hotels',
    'Experience the best of : Delhi Mussoorie Corbett Nainital Tour Uttarakhand Tours Package.',
    FALSE, TRUE,
    ARRAY['delhi', 'mussoorie', 'nainital'],
    india_id,
    delhi_state,
    ': Delhi Mussoorie Corbett Nainital Tour Uttarakhand Tours Package | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Mussoorie | Corbett | Nainital | Delhi. This package offers a comprehensive day-wise itinerary, comfortable st',
    ARRAY['delhi', 'mussoorie', 'nainital'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, wild_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', ARRAY['https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', 'https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg', 'https://images.pexels.com/photos/2356045/pexels-photo-2356045.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mussoorie_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, nainital_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Delhi', 'Mussoorie (270 Kms. Approx. 7 hours): Welcome to Delhi airport/station and proceed to Mussoorie. On arrival check in to your hotel. Remainder of the evening at leisure. Overnight in Mussoorie.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Mussoorie', 'Sightseeing: After breakfast, explore local sightseeing and tour in Mussoorie. See the famous plunging Kempty Falls, Gun hillside factor offering breathtaking views of the Himalayas ranges and also the doon valley. You can appreciate shopping at Shopping center road. Evening is free for pastime.Overnight in Mussoorie', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Mussoorie', 'Corbett (250 kms. Approx. 6 hrs): Today after the morning meal proceed to your journey to the jungles of Corbett. On arrival check in to your hotel. You might pick to enjoy the evening safari on your own at an additional cost. Jim Corbett National Park is known for pets like tigers, elephants, sambar, chitals, nilgai and 600 different species of birds. Overnight in Corbett.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Corbett', 'Nainital (150 kms; Approximate 6 hrs) After breakfast, look into and proceed to early morning safari. After that proceed to Nainital. On arrival check in to your hotel. You have the rest of the day at leisure.Overnight in Nainital', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Nainital Sightseeing', 'Today after breakfast, proceed to check out Naina Devi Temple, Hanuman Garhi, Naina Height where one can delight in the breathtaking views of snow-capped Mountain range & Nainital Valley. Evening visit the local market at the Shopping center roadway where one can shop for different kinds of candles. Overnight in Nainital.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Nainital', 'Delhi (Approx. 9 hrs): Today after breakfast, transfer to Delhi Airport terminal/ Railway Station to board your flight/train to your next destination or hometown.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: : Delhi Haridwar Rishikesh Mussoorie Tour Uttarakhand Tours Package
  pkg_id := 'delhi-haridwar-rishikesh-mussoorie-tour-uttarakhand-tours-package';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-haridwar-rishikesh-mussoorie-tour-uttarakhand-tours-package', ': Delhi Haridwar Rishikesh Mussoorie Tour Uttarakhand Tours Package',
    'Explore the beautiful sights of Delhi | Haridwar | Mussoorie | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['04 Nights 05 Days: Delhi ! Haridwar ! Rishikesh ! Mussoorie ! Tour (Uttarakhand Tours Package)'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC with driver', 'AC NOT OPERATE ON HILLY AREA'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg',
    ARRAY['https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', 'https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg', 'https://images.pexels.com/photos/2356045/pexels-photo-2356045.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of : Delhi Haridwar Rishikesh Mussoorie Tour Uttarakhand Tours Package.',
    FALSE, TRUE,
    ARRAY['delhi', 'haridwar', 'rishikesh', 'mussoorie'],
    india_id,
    delhi_state,
    ': Delhi Haridwar Rishikesh Mussoorie Tour Uttarakhand Tours Package | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Haridwar | Mussoorie | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and p',
    ARRAY['delhi', 'haridwar', 'rishikesh', 'mussoorie'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', ARRAY['https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', 'https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg', 'https://images.pexels.com/photos/2356045/pexels-photo-2356045.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, haridwar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, rishikesh_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, mussoorie_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'laxman-jhula')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'ram-jhula')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival At Delhi, Our Representative Will Meet You. Proceed To Haridwar (210 Kilometers); The Drive From Delhi To Haridwar Takes Around 5 Hours. The Holy City of Haridwar Also Famous As Gateway to God Attracts Tourist from All over India. Haridwar Is Regarded As One Of The Famous Holiest Places For Hindus Worldwide. Evening, Perform Aarti At Har Ki Pauri Ghat. Dinner And Overnight Stay Will Be At The Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Haridwar', 'Mussoorie: Morning Breakfast at the Hotel. Proceed Towards Mussoorie, Located At A Distance Of 100 Kms Via Rishikesh. Enroute Visit the Famous Ram Jhula, Laxman Jhula and Other Old Temples in This Heritage City. Mussoorie Is An Enchanting Hill Station Which Serves As A Perfect Retreat For Tourist In The Himalayan Ranges. This Magnificent Hill Station Of Mussoorie Is A Gem Located In The Foothills Of The Himalayas. Have A Glimpse Of Amazing DoonValley And Shiwalik Ranges. Dinner Will Be Served At The Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Mussoorie', 'Breakfast at the Hotel. Visit The Local Sightseeing Attractions Of Mussoorie Like Kempty Falls, Mussoorie Lake, Lal Bahadur Shastri National Academy Of Administration. Dinner And stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After Breakfast, Proceed For An Excursion Trip To Dhanaulti And Mata Surkanda Devi Temple. Dhanaulti Is A Scenic Hill Station Located At A Distance 24 Kms From Mussoorie. This Jewel In The Garwal Hills Is A Misty Mountain Retreat For The Tourist. The Scenic Beauty Of Dhanaulti Is Admired By People Looking For Peaceful Hill Resort Away From Busy Daily Life. In Evening Return Back toMussoorie. Dinner And Overnight Stay Will Be At The Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Morning breakfast at the hotel, Proceed to Delhi (290 kms/7 hours) for your return journey & drop at Delhi Airport/Railway Station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: : Delhi Char Dham Delhi Tour Uttarakhand Tours Package
  pkg_id := 'delhi-char-dham-delhi-tour-uttarakhand-tours-package';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-char-dham-delhi-tour-uttarakhand-tours-package', ': Delhi Char Dham Delhi Tour Uttarakhand Tours Package',
    'Explore the beautiful sights of Delhi | Haridwar | Yamunotri | Gangotri | Kedarnath | Badrinath |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['10 Nights 11 Days: Delhi ! Char Dham ! Delhi ! Tour (Uttarakhand Tours Package)'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC with driver', 'AC NOT OPERATE ON HILLY AREA'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg',
    ARRAY['https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', 'https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg', 'https://images.pexels.com/photos/2356045/pexels-photo-2356045.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of : Delhi Char Dham Delhi Tour Uttarakhand Tours Package.',
    FALSE, TRUE,
    ARRAY['delhi', 'haridwar', 'yamunotri', 'gangotri', 'kedarnath', 'badrinath'],
    india_id,
    delhi_state,
    ': Delhi Char Dham Delhi Tour Uttarakhand Tours Package | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Haridwar | Yamunotri | Gangotri | Kedarnath | Badrinath |. This package offers a comprehensive day-wise itiner',
    ARRAY['delhi', 'haridwar', 'yamunotri', 'gangotri', 'kedarnath', 'badrinath'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 10n-11d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '10n-11d', '10 Nights / 11 Days', 10, 11, '10 Nights / 11 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', ARRAY['https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', 'https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg', 'https://images.pexels.com/photos/2356045/pexels-photo-2356045.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '10n-11d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, haridwar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, yamunotri_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, gangotri_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kedarnath_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, badrinath_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'DELHI TO HARIDWAR Day', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'HARIDWAR TO PHOOLCHATTI, VIA BARKOT', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'PHOOLCHATTI TO YAMUNOTRI', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'PHOOLCHATTI TO HARSHL DAY', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'HARSIL TO GANGOTRI AND UTTARKASHI', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'UTTARKASHI TO GUPTKASHI, VIA CHAMBA/NEW TEHRI', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'GUPTKASHI TO KEDARNATH, VIA GAURIKUND', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Day 7 Sightseeing', 'KEDARNATH, GAURIKUND/RAMPUR TO TILWARA', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Day 8 Sightseeing', 'TILWARA, JOSHIMATH, BADRINATH', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Day 9 Sightseeing', 'BADRINATH, JOSHIMATH, KALESHWAR', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Day 10 Sightseeing', 'KALESHWAR, KAUDIYALA, HARIDWAR', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Day 11 Sightseeing', 'HARIDWAR TO DELHI', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: : Delhi Haridwar Rishikesh Tour Uttarakhand Tours Package
  pkg_id := 'delhi-haridwar-rishikesh-tour-uttarakhand-tours-package';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'delhi-haridwar-rishikesh-tour-uttarakhand-tours-package', ': Delhi Haridwar Rishikesh Tour Uttarakhand Tours Package',
    'Explore the beautiful sights of : Delhi Haridwar Rishikesh Tour Uttarakhand Tours Package. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['02 Nights 03 Days: Delhi ! Haridwar ! Rishikesh ! Tour (Uttarakhand Tours Package)'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC with driver', 'AC NOT OPERATE ON HILLY AREA'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg',
    ARRAY['https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', 'https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg', 'https://images.pexels.com/photos/2356045/pexels-photo-2356045.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of : Delhi Haridwar Rishikesh Tour Uttarakhand Tours Package.',
    FALSE, TRUE,
    ARRAY['delhi', 'haridwar', 'rishikesh'],
    india_id,
    delhi_state,
    ': Delhi Haridwar Rishikesh Tour Uttarakhand Tours Package | Mother India Tour Travels',
    'Explore the beautiful sights of : Delhi Haridwar Rishikesh Tour Uttarakhand Tours Package. This package offers a comprehensive day-wise itinerary, com',
    ARRAY['delhi', 'haridwar', 'rishikesh'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 2n-3d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '2n-3d', '2 Nights / 3 Days', 2, 3, '2 Nights / 3 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', ARRAY['https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg', 'https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg', 'https://images.pexels.com/photos/2356045/pexels-photo-2356045.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '2n-3d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, haridwar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, rishikesh_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'ram-jhula')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'triveni-ghat')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Morning meet our driver at your Home | Hotel | Airport | Railway Station and transfer to Haridwar. Check in to the hotel at Arrival in Haridwar/Rishikesh. Afternoon visit Daksh Temple, Pawan Dham as well as Moti Bazar. Go To Har Ki Pauri for Ganga Aarti. Return to the hotel. Dinner and Night stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Morning you can take a divine dip in the river Ganga. Later on, returne to hotel. After breakfast visit Mansa Devi Temple (By cable car). Transfer to Rishikesh. Go to Triveni Ghat, Bharat Mandir, Lakshman Temple, Lakshman Jhula as well as Ram Jhula. Evening visit Ganga Aarti at Parmarth Niketan. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Morning after breakfast, check out from the hotel', 'Go to Chandi Devi Temple (by cable car). Transfer to Delhi. Dropping at Delhi home/ hotel/ airport/ railway station.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . Tour: Varanasi Prayagraj Ayodhya Tour
  pkg_id := 'tour-varanasi-prayagraj-ayodhya-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'tour-varanasi-prayagraj-ayodhya-tour', '. Tour: Varanasi Prayagraj Ayodhya Tour',
    'Explore the beautiful sights of Varanasi | Ayodhya | Prayagraj |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['05Nt./06 Days Tour: Varanasi Prayagraj Ayodhya Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . Tour: Varanasi Prayagraj Ayodhya Tour.',
    FALSE, TRUE,
    ARRAY['varanasi', 'prayagraj', 'ayodhya'],
    india_id,
    up_state,
    '. Tour: Varanasi Prayagraj Ayodhya Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Varanasi | Ayodhya | Prayagraj |. This package offers a comprehensive day-wise itinerary, comfortable stays, and priva',
    ARRAY['varanasi', 'prayagraj', 'ayodhya'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, prayagraj_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ayodhya_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Varanasi', 'Arrival at Varanasi Airport/Railway station company representative assist you and transfer to the hotel & refresh drive to visit Sarnath which is known as the place where Lord Budda delivered his first sermon to his disciples. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Varanasi sightseeing', 'Early morning visit the popular ghat of Ganges through boat ride of Varanasi, peoples offering water to Sun God along with taking a holy dip in the Ganges river water, back to hotel & after breakfast proceed to visit Bharat Mata temple, Vishwanath Temple, Sankat Mochan (Hanuman Temple), Annapurna Temple, Banaras Hindu University (BHEU) & Manas Mandir. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Varanasi to Prayagraj (210 Kms. 3 Hrs.)', 'Today after breakfast, proceed to Prayagraj & visit Holi Triveni Sangam, Hanuman Temple, Anand Bhawan & Alopi Devi Temple. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Prayagraj to Ayodhya (185 Kms. 5 Hrs.)', 'After breakfast proceed to Ayodhya City Of Lord Rama. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Ayodhya', 'Today, after breakfast, proceed to visit the city of Lord Rama to see The Saryu River, Hanuman Garhi, Ram Janam Bhumi, Kanak Bhawan & Treta Ka Thakur. Check in at the hotel & overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Ayodhya to Varanasi (225 kMS', '5 Hrs.); Today, After breakfast, drive to Ayodhya or Varanasi Railway station/airport and drop you with sweet memories. > Please note: We can arrange tailor-made tours Inclusions Accommodation', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 2, FALSE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, prayagraj_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ayodhya_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Varanasi', 'Arrival at Varanasi Airport/Railway station company representative assist you and transfer to the hotel & refresh drive to visit Sarnath which is known as the place where Lord Budda delivered his first sermon to his disciples. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Varanasi sightseeing', 'Early morning visit the popular ghat of Ganges through boat ride of Varanasi, peoples offering water to Sun God along with taking a holy dip in the Ganges river water, back to hotel & after breakfast proceed to visit Bharat Mata temple, Vishwanath Temple, Sankat Mochan (Hanuman Temple), Annapurna Temple, Banaras Hindu University (BHEU) & Manas Mandir. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Varanasi to Ayodhya (225 Kms. 5 Hrs.)', 'After breakfast proceed to Ayodhya City Of Lord Rama. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Ayodhya', 'Today, after breakfast, proceed to visit the city of Lord Rama to see The Saryu River, Hanuman Garhi, Ram Janam Bhumi, Kanak Bhawan & Treta Ka Thakur. Check in at the hotel & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Ayodhya to Prayagraj (225 kMS. 5 Hrs.)', 'After breakfast proceed to Prayagraj & visit Holi Triveni Sangam, Hanuman Temple, Anand Bhawan & Alopi Devi Temple. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Prayagraj to Chitrakoot (140 Kms. 3 Hrs.)', 'Today, After breakfast, drive to Chitrakoot & visit hole day visit chitrakoot Parvat Mala includes Kamad Giri, Hanuman Dhara, Janki Kund, Lakshman pahari, and Devangana famous Religious mountains and later return back to hotel and night stay in Chitrakoot.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Chitrakoot to Prayagraj (140 Kms.3 Hrs.)', 'After breakfast, proceed to Prayagraj & drop you at the airport/railway station or with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Varanasi Prayagraj Tour
  pkg_id := 'varanasi-prayagraj-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'varanasi-prayagraj-tour', 'Varanasi Prayagraj Tour',
    'Explore the beautiful sights of Varanasi | Prayagraj |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['04 Night / 05 Days Varanasi Prayagraj Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Varanasi Prayagraj Tour.',
    FALSE, TRUE,
    ARRAY['varanasi', 'prayagraj'],
    india_id,
    up_state,
    'Varanasi Prayagraj Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Varanasi | Prayagraj |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfe',
    ARRAY['varanasi', 'prayagraj'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, prayagraj_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Varanasi', 'Arrival at Varanasi Airport/Railway station company representative assist you and transfer to the hotel & refresh drive to visit Sarnath which is known as the place where Lord Budda delivered his first sermon to his disciples. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Varanasi sightseeing', 'Early morning visit the popular ghat of Ganges through boat ride of Varanasi, peoples offering water to Sun God along with taking a holy dip in the Ganges river water, back to hotel & after breakfast proceed to visit Bharat Mata temple, Vishwanath Temple, Sankat Mochan (Hanuman Temple), Annapurna Temple, Banaras Hindu University (BHEU) & Manas Mandir. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Varanasi to Prayagraj (120 Kms. 3 Hrs.)', 'Today after breakfast, proceed to Prayagraj & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Prayagraj sightseeing', 'After breakfast, drive to visit Holi Triveni Sangam, Hanuman Temple, Anand Bhawan & Alopi Devi Temple. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Prayagraj departure transfer', 'After breakfast checkout from the hotel & drop you at airport/railway station with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: . Varanasi Tour
  pkg_id := 'varanasi-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'varanasi-tour', '. Varanasi Tour',
    'Explore the beautiful sights of Varanasi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['02Nt./03 Days Varanasi Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'Chauffeur'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of . Varanasi Tour.',
    FALSE, TRUE,
    ARRAY['varanasi', 'prayagraj'],
    india_id,
    up_state,
    '. Varanasi Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Varanasi |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a mem',
    ARRAY['varanasi', 'prayagraj'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 2n-3d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '2n-3d', '2 Nights / 3 Days', 2, 3, '2 Nights / 3 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '2n-3d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, prayagraj_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'sarnath')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Varanasi', 'Arrival at Varanasi Airport/Railway station company representative assist you and transfer to the hotel & refresh drive to visit Sarnath which is known as the place where Lord Budda delivered his first sermon to his disciples. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Varanasi sightseeing', 'Early morning visit the popular ghat of Ganges through boat ride of Varanasi, peoples offering water to Sun God along with taking a holy dip in the Ganges river water, back to hotel & after breakfast proceed to visit Bharat Mata temple, Vishwanath Temple, Sankat Mochan (Hanuman Temple), Annapurna Temple, Banaras Hindu University (BHEU) & Manas Mandir. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Varanasi to Prayagraj (210 Kms. 3 Hrs.)', 'Today after breakfast, proceed to Varanasi airport/railway station & drop you with sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Volvo Tour Delhi Manali Delhi
  pkg_id := 'volvo-tour-delhi-manali-delhi';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'volvo-tour-delhi-manali-delhi', 'Volvo Tour Delhi Manali Delhi',
    'Explore the beautiful sights of Delhi | Kullu | Manali | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Volvo Tour Packages Delhi Manali Delhi'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Volvo tickets up & down Local transport in Manali'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Room heater ( On direct payment basis) .'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Volvo Tour Delhi Manali Delhi.',
    FALSE, TRUE,
    ARRAY['delhi', 'manali', 'kullu'],
    india_id,
    delhi_state,
    'Volvo Tour Delhi Manali Delhi | Mother India Tour Travels',
    'Explore the beautiful sights of Delhi | Kullu | Manali | Delhi. This package offers a comprehensive day-wise itinerary, comfortable stays, and private',
    ARRAY['delhi', 'manali', 'kullu'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'solang-valley')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hadimba-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Delhi to Manali by A/C Volvo Bus, Overnight journey', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Pick up from Manali Bus stand & proceed to hotel after refreshments proceed to a half day city tour visiting Hadimba Temple, Manu Temple, Vashisht Temple and Tibetan Monastery. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Solang Valley day trip', 'After breakfast go for a full day excursion to Solang valley visit Solang Valley with its rolling meadows, ski slopes and paragliding activities ( Own cost), Overnight stay at the hotel. * Optional Tour with extra paid: Atul tunel, Sissu, Rohtang pas', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Kullu', 'Manikaran day trip: After early breakfast, a full day excursion visiting Manikaran ( Hot water springs) en-route Kas0l and Kullu – Shamshi (A Famous industry for Kullu Shawl), boat ride (own cost). Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Return to Delhi by A/C Volvo Bus', 'Check out from hotel and overnight journey to Delhi by AC deluxe Volvo.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Paradise Kashmir Tour
  pkg_id := 'paradise-kashmir-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'paradise-kashmir-tour', 'Paradise Kashmir Tour',
    'Explore the beautiful sights of Paradise Kashmir Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['04 Night/05 Days Paradise Kashmir Tour'],
    ARRAY['Srinagar Airport Pickup Drop.', 'Welcome Drink on Arrival at the hotel.', '3 Night’s Accommodation in Srinagar', '1 Night Accommodation in Houseboat with Breakfast & dinner', '1 Night Accommodation in Pahalgam', '5 Breakfast', '1 Hour Shikara Ride.', 'All Tour by Pvt. Comfortable Vehicle', 'Toll Charges, Parking Charges, Driver Allowance.', '24/7 Customer Support.', 'Transportation with Driver'],
    ARRAY['Air Tickets, Trains, Ferries etc.', 'Personal Expenses like Laundry, Shopping, telephone bills, tips etc.', 'Entrance fee / Local Guide / at any place during the tour.', 'Meals not mentioned in the “Inclusions” section.', 'Anything not mentioned in the package includes section.', 'Cable Car / Pony Ride in Pahalgam / Gulmarg / Sonamarg.', 'Local sightseeing in vehicle in Pahalgam / Gulmarg / Sonmarg due to restrictions.', 'Adventure Activities like Safari, Rides, Surfing, and Paragliding etc.', 'Only Postpaid mobile connection of BSNL, Jio Airtel works in Jammu &amp; Kashmir.', 'Local sightseeing in vehicle in Pahalgam / Gulmarg / Sonmarg due to restrictions.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg',
    ARRAY['https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', 'https://images.pexels.com/photos/1435075/pexels-photo-1435075.jpeg', 'https://images.pexels.com/photos/3389531/pexels-photo-3389531.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Paradise Kashmir Tour.',
    FALSE, TRUE,
    ARRAY['srinagar', 'pahalgam', 'gulmarg'],
    india_id,
    jk_state,
    'Paradise Kashmir Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Paradise Kashmir Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfer',
    ARRAY['srinagar', 'pahalgam', 'gulmarg'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', ARRAY['https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', 'https://images.pexels.com/photos/1435075/pexels-photo-1435075.jpeg', 'https://images.pexels.com/photos/3389531/pexels-photo-3389531.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, srinagar_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pahalgam_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, gulmarg_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Arrive Srinagar | Srinagar Local Sightseeing', 'Welcome to Srinagar, the Lake City. On arrival at Srinagar Airport, begin your Kashmir Tour. You will be transferred to the Hotel. Proceed on a city tour visiting the Shankar Acharya temple situated on the highest hill of Srinagar, the famous Mughal Gardens-Chashmashahi, Nishat Shalimar. These gardens were Mughal Emperor&#39;s concept of Paradise and today these are popular picnic spots. Visit Hazratbal Dargah Also. Overnight stay in a hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Srinagar', 'Sonamarg – Srinagar: Today you embark on a full day excursion to the picturesque meadow of gold’ Sonamarg. Sonamarg is the last stop of Kashmir district. From here starts the territory of ladakh. Situated at an altitude of 2743 mt above sea level. The fast-flowing Sindh River makes it popular for trout and masher fishing in summer. You can opt for a pony ride (Own cost) to one of the Thajiwas glaciers for some fun in snow and ice (by your own payment). You can also visit Zero Point/Zojila Pass (by your own cost) . Return to the Hotel in Srinagar in the evening and enjoy a comfortable overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Srinagar', 'Pahalgam – Srinagar. After breakfast drive to Pahalgam (The valley of shepherds). Which is about 96 kms from Srinagar, which will be covered in the app. 3 hours. You Can visit the saffron fields of pampore, Awantipura Ruins (1100 years old temple of Lord Vishnu built by the King Awantivarman), Mattan Temple on En-route. Drive through the pine forests. Arrive at Pahalgam and enjoy Lidder stream. After You can hire a union car (at your own cost) visit Aru, betaab valley and chandanwari &amp; You can go for Pony ride and also visit Kashmir Valley, Dabyan, Baisaran, Snow Valley, Waterfall, Kanimarag(at your own cost). Evening return dinner and Overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Srinagar', 'Gulmarg - Srinagar : After breakfast check out from the hotel in Srinagar drive to Gulmarg (2440 Meters above Sea level). It is one of the most beautiful hill stations and also called “Meadows of Flower”. It has the world’s highest golf course and Gulmarg is also famous for winter sports like skiing. On arrival and after refreshment one can visit Jai Jai Shiv Shankar Temple and also enjoy a Gondola ride (Cable car, own cost) from Gulmarg to Kongdori and affarwat. Evening return dinner and overnight stay Srinagar.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Today, After breakfast transfer to Srinagar Airport to board your flight with Sweet memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: goa tour package four nights five days
  pkg_id := 'goa-tour-package-four-nights-five-days';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'goa-tour-package-four-nights-five-days', 'goa tour package four nights five days',
    'Explore the beautiful sights of goa tour package four nights five days. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['04 Nights 05 Days Tour'],
    ARRAY['Welcome Drink on Arrival at the hotel.', '4 Night’s Accommodation in Goa', '4 Breakfast', 'Sightseeing with a group/pvt.', 'Comfortable Vehicle', 'Toll Charges, Parking Charges, Driver Allowance.', '24/7 Customer Support.'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance.', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg',
    ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of goa tour package four nights five days.',
    FALSE, TRUE,
    ARRAY['goa'],
    india_id,
    goa_state,
    'goa tour package four nights five days | Mother India Tour Travels',
    'Explore the beautiful sights of goa tour package four nights five days. This package offers a comprehensive day-wise itinerary, comfortable stays, and',
    ARRAY['goa'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, goa_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fort-aguada')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Upon your arrival at Goa airport/ railway station, our tour representative assists you in smooth transfer to the hotel for a pre-booked stay.The first day of your Goa trip will acquaint you with the rich Portuguese culture and heritage of this tiny Indian state. There are several remnants in Old Goa in the form of century old cathedrals such as Basilica of Bom Jesus and Chapel of St. Francis Xavier.Goa is also known for its massive forts which were built by Indian rulers and Portuguese colonies which settled in Goa in the 15th century. Besides, you can visit the famous ‘Fort Aguada’ whose major portions have been converted into a luxury hotel. Post sightseeing, return to the hotel for dinner and night stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Tour to Goa is dedicated to the exploration of North Goa beaches. The charm of Goa beaches lies in its beautiful beaches lined on the seashore and attracts a huge crowd of Indian and international tourists. Some popular beaches that you can visit include Anjuna, Baga and Calangute. These beaches will allow you to indulge in water sports such as Parasailing, scuba diving and water skiing.Besides, you can visit the local markets at Anjuna where you can purchase traditional jewellery, handicrafts and souvenirs.The 2nd day of your Goa Trip will make you experience the nightlife of Goa. Proceed towards the Tito’s bar, one of the most happening party places in Goa to enjoy the vibrant nightlife. Besides, you can also visit the Ingo’s Saturday Night Bazaar famous for shopping. Overnight stay in Goa.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'On the 3rd day of your Goa Trip, you will head straight towards South Goa. Colva is a popular beach in South Goa. The beach is home to shacks, resort complexes, tourist cottages, discos and eateries. Overnight stay in Goa.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast proceed to visit Dudh Sagra day trip. Overnight stay at the hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'transfer to the Goa Airport/Railway station to board flight/train for onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Goa Tour Tour
  pkg_id := 'goa-tour-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'goa-tour-tour', 'Goa Tour Tour',
    'Explore the beautiful sights of Goa Tour Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Goa Tour Packages 03 Nights 4 Days Tour'],
    ARRAY['Welcome Drink on Arrival at the hotel.', '3 Night’s Accommodation in Goa', '3 Breakfast', 'Sightseeing with a group/pvt.', 'Comfortable Vehicle', 'Toll Charges, Parking Charges, Driver Allowance.', '24/7 Customer Support.'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance.', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg',
    ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Goa Tour Tour.',
    FALSE, TRUE,
    ARRAY['goa'],
    india_id,
    goa_state,
    'Goa Tour Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Goa Tour Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a ',
    ARRAY['goa'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 3n-4d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '3n-4d', '3 Nights / 4 Days', 3, 4, '3 Nights / 4 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '3n-4d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, goa_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'fort-aguada')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Upon your arrival at Goa airport/ railway station, our tour representative assists you in smooth transfer to the hotel for a pre-booked stay.The first day of your Goa trip will acquaint you with the rich Portuguese culture and heritage of this tiny Indian state. There are several remnants in Old Goa in the form of century old cathedrals such as Basilica of Bom Jesus and Chapel of St. Francis Xavier.Goa is also known for its massive forts which were built by Indian rulers and Portuguese colonies which settled in Goa in the 15th century. Besides, you can visit the famous ‘Fort Aguada’ whose major portions have been converted into a luxury hotel. Post sightseeing, return to the hotel for dinner and night stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Tour to Goa is dedicated to the exploration of North Goa beaches. The charm of Goa beaches lies in its beautiful beaches lined on the seashore and attracts a huge crowd of Indian and international tourists. Some popular beaches that you can visit include Anjuna, Baga and Calangute. These beaches will allow you to indulge in water sports such as Parasailing, scuba diving and water skiing.Besides, you can visit the local markets at Anjuna where you can purchase traditional jewellery, handicrafts and souvenirs.The 2nd day of your Goa Trip will make you experience the nightlife of Goa. Proceed towards the Tito’s bar, one of the most happening party places in Goa to enjoy the vibrant nightlife. Besides, you can also visit the Ingo’s Saturday Night Bazaar famous for shopping. Overnight stay in Goa.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'On the 3rd day of your Goa Trip, you will head straight towards South Goa. Colva is a popular beach in South Goa. The beach is home to shacks, resort complexes, tourist cottages, discos and eateries. Overnight stay in Goa.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After breakfast transfer to the Goa Airport/Railway station to board flight/train for onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Book This Package
  pkg_id := 'book-this-package';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'book-this-package', 'Book This Package',
    'Explore the beautiful sights of Book This Package. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Book This Package 02 Nights 3 Days'],
    ARRAY['Welcome Drink on Arrival at the hotel.', '3 Night’s Accommodation in Goa', '3 Breakfast', 'Sightseeing with a group/pvt.', 'Comfortable Vehicle', 'Toll Charges, Parking Charges, Driver Allowance.', '24/7 Customer Support.'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc.', 'Monument entrances, camera Fee, etc.', 'Any activity not mentioned in the inclusions', 'Travel Insurance.', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.', 'Chauffeur, Guide, Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg',
    ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Book This Package.',
    FALSE, TRUE,
    ARRAY['goa'],
    india_id,
    goa_state,
    'Book This Package | Mother India Tour Travels',
    'Explore the beautiful sights of Book This Package. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers fo',
    ARRAY['goa'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 2n-3d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '2n-3d', '2 Nights / 3 Days', 2, 3, '2 Nights / 3 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', ARRAY['https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg', 'https://images.pexels.com/photos/1483053/pexels-photo-1483053.jpeg', 'https://images.pexels.com/photos/240526/pexels-photo-240526.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '2n-3d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, goa_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival in the Morning & Full Day North Goa Sightseeing. visit include Anjuna, Baga and Calangute. These beaches will allow you to indulge in water sports such as Parasailing, scuba diving and water skiing.Besides, you can visit the local markets at Anjuna where you can purchase traditional jewellery, handicrafts and souvenirs. Overnight stay in Goa.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Full Day South Goa Sightseeing', 'Today after breakfast you will head straight towards South Goa. Colva is a popular beach in South Goa. The beach is home to shacks, resort complexes, tourist cottages, discos and eateries.The 2nd day of your Goa Trip will make you experience the nightlife of Goa. Proceed towards the Tito’s bar, one of the most happening party places in Goa to enjoy the vibrant nightlife. Besides, you can also visit the Ingo’s Saturday Night Bazaar famous for shopping.Overnight stay in Goa.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'After breakfast transfer to the Goa Airport/Railway station to board flight/train for onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Mata Vaishno Devi Yatra
  pkg_id := 'mata-vaishno-devi-yatra';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'mata-vaishno-devi-yatra', 'Mata Vaishno Devi Yatra',
    'Explore the beautiful sights of Mata Vaishno Devi Yatra. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['02 Nights/03 Days Mata Vaishno Devi Yatra'],
    ARRAY['Jammu/Karta pick up & drop', 'Welcome Drink on Arrival at the hotel.', '02 Nights Accommodation in Karta/Jammu', '2 Breakfast', 'All Tour by Pvt. Comfortable Vehicle', 'Toll Charges, Parking Charges.', '24/7 Customer Support.', 'Private Vehicle'],
    ARRAY['Air Tickets, Trains, Ferries etc.', 'Personal Expenses like Laundry, Shopping, telephone bills, tips etc.', 'Entrance fee / Local Guide / at any place during the tour.', 'Meals not mentioned in the “Inclusions” section.', 'Anything not mentioned in the package includes section.', 'Cable Car / Pony Ride in Pahalgam / Gulmarg / Sonamarg.', 'Local sightseeing in vehicle in Pahalgam / Gulmarg / Sonmarg due to restrictions.', 'Adventure Activities like Safari, Rides, Surfing, and Paragliding etc.', 'Only Postpaid mobile connection of BSNL, Jio Airtel works in Jammu &amp; Kashmir.', 'Local sightseeing in vehicle in Pahalgam / Gulmarg / Sonmarg due to restrictions.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg',
    ARRAY['https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', 'https://images.pexels.com/photos/1435075/pexels-photo-1435075.jpeg', 'https://images.pexels.com/photos/3389531/pexels-photo-3389531.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of Mata Vaishno Devi Yatra.',
    FALSE, TRUE,
    ARRAY['delhi'],
    india_id,
    delhi_state,
    'Mata Vaishno Devi Yatra | Mother India Tour Travels',
    'Explore the beautiful sights of Mata Vaishno Devi Yatra. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transf',
    ARRAY['delhi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 2n-3d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '2n-3d', '2 Nights / 3 Days', 2, 3, '2 Nights / 3 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', ARRAY['https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', 'https://images.pexels.com/photos/1435075/pexels-photo-1435075.jpeg', 'https://images.pexels.com/photos/3389531/pexels-photo-3389531.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '2n-3d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival Jammu meet our assistance Pick up from Jammu Railway Station / Airport to Drive Katra (50.kms 02: hrs) arrival Katra check in Hotel rest of the day Dinner overnight stay in hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Morning breakfast by trek up / horse ride Katra to Mata Vaishnodevi Darshan (15.kms one way) back Katra Dinner overnight stay in hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'Morning breakfast check out Katra Hotel & Drive for Jammu Railway Station/Airport Drop (50.kms 02.hrs) our tour ends with Sweet Memories.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Kerala Lovers Tour
  pkg_id := 'kerala-lovers-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'kerala-lovers-tour', 'Kerala Lovers Tour',
    'Explore the beautiful sights of Munnar | Thekkady | Alleppey | Kovalam | Trivandrum |. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['06 Nights 07 Days Kerala Lovers Tour Packages'],
    ARRAY['A/C Pvt. vehicles as per the itinerary with experience driver', 'Accommodation', 'Meals: Breakfast & dinner', 'A/C Deluxe Houseboat with all meals ( A/C working time 9:30 pm to 6:30 am) - on demand', 'All transfers, Toll tax, Parkings, Sightseeing, fuel, Permit'],
    ARRAY['Monument fee / Sightseeing tickets or entry fee, Camera fee', 'Jeep ride, Elephant ride, Boat ride', 'Any personal nature of expenses', 'Anything which is not mentioned above', 'Cost incurred due to mishaps, strikes, political unrest etc.', 'Driver, guide, porter tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg',
    ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Kerala Lovers Tour.',
    FALSE, TRUE,
    ARRAY['cochin', 'munnar', 'thekkady'],
    india_id,
    kerala_state,
    'Kerala Lovers Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Munnar | Thekkady | Alleppey | Kovalam | Trivandrum |. This package offers a comprehensive day-wise itinerary, comfort',
    ARRAY['cochin', 'munnar', 'thekkady'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 6n-7d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '6n-7d', '6 Nights / 7 Days', 6, 7, '6 Nights / 7 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '6n-7d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, cochin_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, munnar_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, thekkady_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mattupetty-dam')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Cochin to Munnar (130 Kms. 05 hrs. approx.)', 'Morning arrival & proceed Munnar, Munnar is 1800 mts above sea level and also the home of South India''s highest peak (anamudi-2695 mts). On the way to Munnar visit Valparai, Cheeyappara waterfalls and Tea Plantations. Upon arrival at Munnar & transfer to the Hotel. Check in at Hotel. Afternoon visit Rajamala (eravikulam National Park - open as per the directions by the forest authorities), the best place to see Nilgiri Tahr (hemitragus Hilarious)- the mountain goat of South India. You may visit the Tea Museum surrounded by Tea Gardens- the only Museum of its kind; which illustrates the timeworn method of Tea production. Evening have a short visit to Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Munnar After breakfast, proceed for sightseeing in Munnar. Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Munnar to Thekkady (100 kms', '03 hrs. approx.) Morning have breakfast at the resort, later check out the resort and drive to Thekkady. Thekkady is a world famous wildlife sanctuary and it is also called as Periyar. On arrival check in Hotel Afternoon proceed for a game viewing cruise on the Periyar Lake (direct payment basis). The rest of the day is at leisure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Thekkady', 'After breakfast, Here you will be able to see a large variety of wildlife, ( Jeep safari direct payment basis) which include elephants, monkeys, deer, wild boar etc. In the evening you can take a Elephant ride at Periyar wildlife (direct payment basis). Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Thekkady to Kovalam (220kms/6 hrs. approx.)', 'After having breakfast, check out the houseboat and drive to your beach resort at Kovalam; The international beach destination of Kerala. Check in to the beach resort and enjoy the beach till the sun sets in the Arabian Sea. Overnight stay at Kovalam.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Kovalam', 'Trivandrum-Kovalam : sightseeing – After having breakfast, Proceed to visit the iconic spots of Old Travancore Kingdom’s capital Trivandrum which includes Napier Museum, Sri Chitra Art Gallery, Zoo, Padmanabhapuram Temple etc . And enjoy the beach till the sun sets in the Arabian Sea. Overnight stay at Kovalam.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Kovalam', 'Trivandrum(12 km/30 min.) approx.: Transfer to Trivandrum, drop at Airport/Railway Station with sweet journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Munnar Alleppey
  pkg_id := 'munnar-alleppey';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'munnar-alleppey', 'Munnar Alleppey',
    'Explore the beautiful sights of Munnar | Alleppey. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['03 Nights/04 Days - Munnar - Alleppey'],
    ARRAY['A/C Pvt. vehicles as per the itinerary with experience driver', 'Accommodation', 'Meals: Breakfast & dinner', 'A/C Deluxe Houseboat with all meals ( A/C working time 9:30 pm to 6:30 am)', 'All transfers, Toll tax, Parkings, Sightseeing, fuel, Drivers bata'],
    ARRAY['Monument fee / Sightseeing tickets or entry fee, Camera fee', 'Jeep ride, Elephant ride, Boat ride', 'Any personal nature of expenses', 'Anything which is not mentioned above', 'Cost incurred due to mishaps, strikes, political unrest etc.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg',
    ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Munnar Alleppey.',
    FALSE, TRUE,
    ARRAY['munnar', 'alleppey', 'cochin'],
    india_id,
    kerala_state,
    'Munnar Alleppey | Mother India Tour Travels',
    'Explore the beautiful sights of Munnar | Alleppey. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers fo',
    ARRAY['munnar', 'alleppey', 'cochin'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 3n-4d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '3n-4d', '3 Nights / 4 Days', 3, 4, '3 Nights / 4 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '3n-4d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, munnar_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, alleppey_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, cochin_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mattupetty-dam')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Arrival at Cochin proceed to Munnar (130 Kms. 05 hrs. approx.)', 'Munnar is 1800 mts above sea level and also the home of South India''s highest peak (anamudi-2695 mts). On the way to Munnar visit Valparai, Cheeyappara waterfalls and Tea Plantations. Upon arrival at Munnar & transfer to the Hotel. Check in at Hotel. Afternoon visit Rajamala (eravikulam National Park - open as per the directions by the forest authorities), the best place to see Nilgiri Tahr (hemitragus Hilarious)- the mountain goat of South India. You may visit the Tea Museum surrounded by Tea Gardens- the only Museum of its kind; which illustrates the timeworn method of Tea production. Evening have a short visit to Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Munnar After breakfast, proceed for sightseeing in Munnar. Mattupetty dam, Echo Point, Kundala Dam, Pothamedu View Point, Blossom Park etc are some of the highlights of the sightseeing. Shopping & overnight stay at Munnar.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Cochin to Alleppey (65 kms. 02 hrs. approx.)', 'check out from the hotel and transfer to a houseboat. Around 1200 hrs check in at the Houseboat and start your cruise through the rich and splendid backwater. Just relax at the deluxe houseboat. It will be a unique and exclusive experience in your lifetime. You will be cruising along the village sides and paddy fields witnessing the core life of the Kerala villages for the whole day. The house boat is fully furnished with bedrooms and a kitchen. Dinner and overnight at the houseboat. All Meals – Breakfast, Lunch & Dinner', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Alleppey to Cochin (65 kms. 2 hrs. approx.)', 'Morning after breakfast transfer to Cochin, if will have time then local sightseeing includes like Lulu Mall, Cochin beach. And drop according to flight timing.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Tour Itinerary: ’s Himalayan Panorama Tour
  pkg_id := 'tour-itinerary-s-himalayan-panorama-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'tour-itinerary-s-himalayan-panorama-tour', 'Tour Itinerary: ’s Himalayan Panorama Tour',
    'Explore the beautiful sights of Himalayan Panorama Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Tour Itinerary:- 04 Night 05 Day’s Himalayan Panorama Tour'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur', 'Guide Service'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc', 'Monument entrances, camera Fee, etc', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis)', 'Driver, Guide & Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg',
    ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'],
    'Pilgrimage', 12, 10, 'Premium Hotels',
    'Experience the best of Tour Itinerary: ’s Himalayan Panorama Tour.',
    FALSE, FALSE,
    ARRAY['kathmandu'],
    nepal_id,
    NULL,
    'Tour Itinerary: ’s Himalayan Panorama Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Himalayan Panorama Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transf',
    ARRAY['kathmandu'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, int_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, spirit_cat) ON CONFLICT DO NOTHING;

  -- Variant 4n-5d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '4n-5d', '4 Nights / 5 Days', 4, 5, '4 Nights / 5 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '4n-5d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kathmandu_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'pashupatinath')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'kathmandu-durbar-square')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at TIA airport Kathmandu, Received and transfer to Hotel, short briefing about the program, O/N at Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'AM', 'wake up, Breakfast and drive to Kathmandu Durbar square and Swyambhunath stupa for half day guided sightseeing tour, PM: visiting Bouddhanath and Pashupatinath temple, O/N Hotel', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'Transfer to Nagarkot for Himalayan panorama tour, visit historical Newari town Bhaktapur on the way, which is as typical as early days O/N Resort.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'After the magnificent trip to Nagarkot, drive back to Kathmandu, rest of the day free for shopping and personal activities, O/N Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Everest Mountain flight (optional) in the morning and transfer to airport for your final departure or join our other program.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Nepal mountain Venture tour &
  pkg_id := 'nepal-mountain-venture-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'nepal-mountain-venture-tour', 'Nepal mountain Venture tour &',
    'Explore the beautiful sights of Nepal mountain Venture tour &. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Nepal mountain Venture tour for 9 nights & 10 days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur', 'Guide Service'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc', 'Monument entrances, camera Fee, etc', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis)', 'Driver, Guide & Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg',
    ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'],
    'Wildlife', 12, 10, 'Premium Hotels',
    'Experience the best of Nepal mountain Venture tour &.',
    FALSE, FALSE,
    ARRAY['kathmandu', 'chitwan', 'pokhara'],
    nepal_id,
    NULL,
    'Nepal mountain Venture tour & | Mother India Tour Travels',
    'Explore the beautiful sights of Nepal mountain Venture tour &. This package offers a comprehensive day-wise itinerary, comfortable stays, and private ',
    ARRAY['kathmandu', 'chitwan', 'pokhara'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, int_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, wild_cat) ON CONFLICT DO NOTHING;

  -- Variant 9n-10d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '9n-10d', '9 Nights / 10 Days', 9, 10, '9 Nights / 10 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '9n-10d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kathmandu_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, chitwan_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pokhara_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Arrival at TIA airport Kathmandu, Received and transfer to Hotel, short briefing about the program, O/N at Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'A full day guided sightseeing tour in Kathmandu, including Durbar Square, Swyambhu Nath, Bouddha Nath and Pashupati Nath, O/N at Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'Half day guided sightseeing tour to fine art city of Patan and surrounding area, O/N at Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Early morning drive to Chitwan Safari park by tourist coach, arrival transfer to Resort, and Tharu village walk, O/N at Resort.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Day 5 Sightseeing', 'Full day Jungle activities in and out side of the national park like, Elephant back safari, canoeing, visit elephant breeding center with a nature guide and Tharu cultural show in the evening, O/N Resort.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Day 6 Sightseeing', 'Wake up breakfast and drive to next panoramic destination Pokhara, arrival and transfer to Hotel, rest of the time free personal activities, O/N at Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'AM', 'transfer to Sarangkot a hilltop station best for Annapurna range of Himalayan view and Sunrise. PM: visit Bindya Bashini temple and Mahendra cave O/N Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Day 8 Sightseeing', 'Half day trip to David fall and Peace stupa and boating on Phewa Lake, O/N at Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Day 9 Sightseeing', 'Early morning drive back to Kathmandu, arrival and transfer to Hotel, rest of time free for shopping, traditional Nepali dinner with cultural show in the evening, O/N Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Day 10 Sightseeing', 'Everest Mountain flight (optional) in the morning, transfer to Airport for your final departure or join our next program.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Short Trekking In Nepal Royal Trek ’s ’s
  pkg_id := 'short-trekking-in-nepal-royal-trek-s-s';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'short-trekking-in-nepal-royal-trek-s-s', 'Short Trekking In Nepal Royal Trek ’s ’s',
    'Explore the beautiful sights of Short Trekking In Nepal Royal Trek ’s ’s. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Short Trekking In Nepal/Royal Trek – 03 Night’s 04 Day’s'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic', 'Breakfast & Dinner', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Driver Allowance, Toll Taxes, Parkings, Fuel', 'State Taxes, Green Taxes, Road Taxes', 'Comfortable vehicles AC', 'AC NOT OPERATE ON HILLY AREA', 'Chauffeur', 'Guide Service'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry, mineral water etc', 'Monument entrances, camera Fee, etc', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc', 'Room heater ( On direct payment basis)', 'Driver, Guide & Porter Tip'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg',
    ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'],
    'Adventure', 12, 10, 'Premium Hotels',
    'Experience the best of Short Trekking In Nepal Royal Trek ’s ’s.',
    FALSE, FALSE,
    ARRAY['pokhara'],
    nepal_id,
    NULL,
    'Short Trekking In Nepal Royal Trek ’s ’s | Mother India Tour Travels',
    'Explore the beautiful sights of Short Trekking In Nepal Royal Trek ’s ’s. This package offers a comprehensive day-wise itinerary, comfortable stays, a',
    ARRAY['pokhara'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, int_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, adv_cat) ON CONFLICT DO NOTHING;

  -- Variant 3n-4d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '3n-4d', '3 Nights / 4 Days', 3, 4, '3 Nights / 4 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', ARRAY['https://images.pexels.com/photos/2083210/pexels-photo-2083210.jpeg', 'https://images.pexels.com/photos/1451040/pexels-photo-1451040.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '3n-4d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pokhara_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Drive to trailhead Bijaypur and trek to Kalikasthan (1370m)', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Day 2 Sightseeing', 'Kalikasthan to Shaklung (1730m)', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Day 3 Sightseeing', 'Shaklung to Chisopani', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Day 4 Sightseeing', 'Chisopani to Begnas Lake & drive back to Pokhara', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Rajasthan Heritage & Wildlife Tour
  pkg_id := 'rajasthan-heritage-wildlife-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'rajasthan-heritage-wildlife-tour', 'Rajasthan Heritage & Wildlife Tour',
    'Explore the beautiful sights of Rajasthan Heritage & Wildlife Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Rajasthan Heritage & Wildlife Tour'],
    ARRAY['Accommodation on double sharing basis', 'Breakfast at hotels', 'Sightseeing and transfers by private AC vehicle', 'All toll, parking and driver allowances'],
    ARRAY['Airfare / Train tickets', 'Monument entrance fees', 'Any meals not mentioned in inclusions', 'Personal expenses'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg',
    ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Rajasthan Heritage & Wildlife Tour.',
    FALSE, TRUE,
    ARRAY['delhi', 'agra', 'ranthambore', 'udaipur', 'jaipur', 'shimla', 'kullu', 'manali', 'varanasi', 'ayodhya', 'goa'],
    india_id,
    delhi_state,
    'Rajasthan Heritage & Wildlife Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Rajasthan Heritage & Wildlife Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and pri',
    ARRAY['delhi', 'agra', 'ranthambore', 'udaipur', 'jaipur', 'shimla', 'kullu', 'manali', 'varanasi', 'ayodhya', 'goa'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 7n-8d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '7n-8d', '7 Nights / 8 Days', 7, 8, '7 Nights / 8 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', ARRAY['https://images.pexels.com/photos/962464/pexels-photo-962464.jpeg', 'https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg', 'https://images.pexels.com/photos/415708/pexels-photo-415708.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '7n-8d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, agra_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ranthambore_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, udaipur_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, jaipur_dest, 5) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, shimla_dest, 6) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, kullu_dest, 7) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, manali_dest, 8) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, varanasi_dest, 9) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, ayodhya_dest, 10) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, goa_dest, 11) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'qutub-minar')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'india-gate')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lotus-temple')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'taj-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'agra-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'mehtab-bagh')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'amber-fort')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'hawa-mahal')) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'lake-pichola')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, '2', 'Delhi – Gateway to India''s Heritage Your tour begins in Delhi, a city that blends Mughal grandeur with colonial charm and modern vibrancy. Spend your first day exploring New Delhi with its wide boulevards and historical landmarks. Highlights: India Gate, Rashtrapati Bhavan, and Parliament House Timeless beauty of Humayun''s Tomb and Qutub Minar Explore Chandni Chowk and visit Jama Masjid Experience the spiritual calm at Lotus Temple Delhi offers a perfect introduction to India''s diverse heritage—setting the stage for your royal Rajasthan adventure. 3', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Agra', 'The City of Love Drive to Agra, home to the world''s most famous monument of love—the Taj Mahal. Admire its ivory-white beauty, best viewed during sunrise or sunset when it glows in warm hues. Mughal Heritage: Visit the UNESCO-listed Agra Fort, a red sandstone masterpiece Explore Mehtab Bagh for enchanting views of the Taj Discover marble inlay craftsmanship at local workshops Experience Agra''s rich Mughal heritage Agra''s romantic legacy makes it a place that stays with you long after you leave. 4-5', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, '5', 'Ranthambore – Into the Wild Head to Ranthambore National Park, one of India''s most celebrated wildlife reserves, famous for its population of Bengal tigers. Wildlife Adventures: Enjoy morning and afternoon jeep safaris through the park Spot tigers, leopards, sloth bears, and diverse bird species Visit the historic Ranthambore Fort, a UNESCO site Experience the thrill of wildlife photography The thrill of spotting a tiger in its natural habitat is an experience you''ll never forget. 6-7', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, '7', 'Udaipur – The City of Lakes Travel to Udaipur, often called the "Venice of the East," renowned for its romantic lakes and opulent palaces. Romantic Experiences: Serene boat ride on Lake Pichola, passing by Jag Mandir Explore the magnificent City Palace Complex Visit Jagdish Temple and Saheliyon Ki Bari Wander through colorful markets for textiles and crafts Cultural Evening: End your Udaipur experience with a cultural dance performance at Bagore Ki Haveli, showcasing Rajasthan''s vibrant folk traditions. 8-9', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, '9', 'Jaipur – The Pink City''s Royal Grandeur Your final destination is Jaipur, Rajasthan''s vibrant capital. Experience the royal grandeur of the Pink City. Royal Experiences: Visit the hilltop Amber Fort with an elephant or jeep ride Explore the City Palace and Jantar Mantar observatory Admire the beautiful façade of Hawa Mahal Shop in bustling bazaars for gemstones and handicrafts Farewell Celebration: Conclude your journey with a farewell Rajasthani dinner at Chokhi Dhani, where folk dances, music, and traditional food bring your adventure to a grand close. Essential Travel Tips Making the most of your royal Rajasthan adventure Best Time to Visit October to March is ideal for Rajasthan tours. The weather is pleasant with daytime temperatures ranging from 15°C to 25°C, perfect for sightseeing and safaris. Avoid summer (April-June) when temperatures can soar above 45°C, making outdoor activities challenging. Packing Essentials Light cotton clothing for daytime Warm layers for cool desert evenings Comfortable walking shoes for forts Neutral colors for wildlife safaris Sunscreen, hat, and sunglasses Camera with zoom lens for wildlife Cultural Considerations Dress modestly, especially at religious sites Remove footwear before entering temples Ask permission before photographing people Respect local customs and traditions Learn basic Hindi greetings Transportation Private AC vehicles with experienced drivers Domestic flights for longer distances Open-top jeeps for wildlife safaris Traditional modes like camel carts for desert experiences Journey Highlights Unforgettable moments from your Rajasthan adventure Sunrise at the Taj Mahal Watching the first rays illuminate this eternal symbol of love. Tiger Spotting in Ranthambore The thrill of seeing a Bengal tiger in its natural habitat. Boat Ride on Lake Pichola Serene sunset cruise with views of Udaipur''s palaces. Elephant Ride to Amber Fort Ascend to Jaipur''s majestic fort in royal style. Hawa Mahal at Golden Hour The Palace of Winds glowing in the late afternoon sun. Cultural Evening at Chokhi Dhani Traditional Rajasthani folk performances and cuisine. A Journey Through Royal India This 09-day Rajasthan tour offers an unparalleled experience of India''s royal heritage and natural wonders. From the majestic forts and palaces of Jaipur to the tiger-filled jungles of Ranthambore, from the romantic lakes of Udaipur to the eternal symbol of love in Agra—you''ll witness the many facets of this incredible region. The vibrant energy of Delhi, the wild adventures of Ranthambore, the romantic charm of Udaipur, and the royal elegance of Jaipur create a perfect harmony of experiences. It''s a journey that engages all your senses and leaves you with memories to last a lifetime. Rajasthan''s royal heritage awaits—are you ready to explore? Book Your Royal Adventure © 2023 Rajasthan Heritage Tours. All rights reserved. // Smooth scrolling for anchor links document.querySelectorAll(''a[href^="#"]'').forEach(anchor => { anchor.addEventListener(''click'', function (e) { e.preventDefault(); document.querySelector(this.getAttribute(''href'')).scrollIntoView({ behavior: ''smooth'' }); }); }); // Simple animation for destination cards document.querySelectorAll(''.destination-card'').forEach((card, index) => { card.style.opacity = ''0''; card.style.transform = ''translateY(20px)''; setTimeout(() => { card.style.transition = ''opacity 0.5s ease, transform 0.5s ease''; card.style.opacity = ''1''; card.style.transform = ''translateY(0)''; }, 300 + (index * 150)); }); Chat with us! /* Entrance Animation */ @keyframes float-in { 0% { transform: translateY(100px) scale(0.8); opacity: 0; } 100% { transform: translateY(0) scale(1); opacity: 1; } } .whatsapp-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards; } /* Hover Animation */ .whatsapp-button:hover { transform: scale(1.1) rotate(5deg); } /* Click Animation */ .whatsapp-button:active { transform: scale(0.95); transition: transform 0.1s; } /* Mobile Responsive */ @media (max-width: 768px) { .whatsapp-button { width: 56px; height: 56px; } .whatsapp-tooltip { display: none; } } Message us! /* Shared Animation */ @keyframes float-in { 0% { transform: translateY(100px) scale(0.8); opacity: 0; } 100% { transform: translateY(0) scale(1); opacity: 1; } } /* Staggered Animations */ .whatsapp-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards; } .messenger-container { animation: float-in 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94) 0.2s forwards; } /* Hover Effects */ .whatsapp-button:hover { transform: scale(1.1) rotate(5deg); } .messenger-button:hover { transform: scale(1.1) rotate(-5deg); } /* Mobile Responsive */ @media (max-width: 768px) { .whatsapp-container { bottom: 3%; right: 4; } .messenger-container { bottom: 12%; right: 4; } .whatsapp-button, .messenger-button { width: 56px; height: 56px; } } About Us Our Blogs FAQs Mon – Fri 9:00 AM to 8:00 PM Sat – Sun 9:00 AM to 8:00 PM USEFUL LINKS Delhi Agra Jaipur Tour Packages Shimla Kullu Manali Tour Kashmir Tour Packages Kerala Tour Packages Varanasi Ayodhya Tour Packages Goa Tour Packages Golden Triangle Tour Packages CONTACT US Address:- B63/B63A, New Jankipuri, Uttam nagar, New Delhi -110059 Phone:- +91 9810140121 / +91 99710 53881 Email:- tourtravelsmotherindia@gmail.com Social Media:- OUR NEWSLETTER Privacy Policy Terms of Service Subscribe Review Us on Google // Listen for form submission and display a thank-you message. document .getElementById("subscribeForm") .addEventListener("submit", function (e) { e.preventDefault(); const email = e.target.email.value; // You can replace this with an AJAX call to your server. document.getElementById("message").textContent = "Thank you for subscribing, " + email + "!"; e.target.reset(); }); 9001-2015 &copy; 2025 Your Company. All rights reserved. Designed & maintain by motherindiatourtravels', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Hill Station of South India Tour Duration:
  pkg_id := 'hill-station-of-south-india-tour-duration';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'hill-station-of-south-india-tour-duration', 'Hill Station of South India Tour Duration:',
    'Explore the beautiful sights of Hill Station of South India Tour Duration:. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Hill Station of South India Tour Duration: 06 Days / 05 Nights'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Welcome drink at hotel', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Road Taxes', 'Guide services', 'Pvt. AC vehicle with driver'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry.', 'Monuments Entrance fee, Camera fee, Boat ride, horse ride, Jeep Safari', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Hill Station of South India Tour Duration:.',
    FALSE, TRUE,
    ARRAY['delhi'],
    india_id,
    delhi_state,
    'Hill Station of South India Tour Duration: | Mother India Tour Travels',
    'Explore the beautiful sights of Hill Station of South India Tour Duration:. This package offers a comprehensive day-wise itinerary, comfortable stays,',
    ARRAY['delhi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Bangalore to Coorg', 'After arriving in Bangalore, you are escorted to be moved to Coorg. Once you reach there, you check- in at the hotel and spend the rest of the day at leisure, in the comfort of the hotel and later retire for the night.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Coorg Sightseeing', 'Your day has been planned out for the sightseeing tour in Coorg for half day, directly after breakfast you leave. You visit the coffee plantations, and the orchards; there is a Fort on top of a hill that overlooks the town. There is a temple of Lord Omkareswara, the design in the temple is appealing. Later in the evening you return to the hotel for an overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Coorg to Mysore', 'Post breakfast, you check out of the hotel at Coorg and reach Mysore by car. In Mysore, you check – in at the hotel and leave to visit the famous Mysore Palace. The palace is magnificent and praise worthy, later go on to visit the temple on the Chamundi Hill. You return to the Hotel after that for a Goodnight stay', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Mysore to Wayanad', 'You drive to Wayanad after breakfast and check out of the hotel. After reaching Wayanad, you check in at the hotel and spend the rest of the day at leisure and later, sleep over for the night.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Wayanad sightseeing', 'Post breakfast, you go out for a sightseeing trip in Wayanad. You visit the Glass house at Kottamuda, Chembra Peak, Edakkal Caves, Banasurasagar Dam, Pazhassi tomb and more. Later, you return to the hotel for an overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Departure', 'After breakfast, you are returned to the Calicut airport or railway station for your further journey.the trip ends here.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: The magical south India tours
  pkg_id := 'the-magical-south-india-tours';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'the-magical-south-india-tours', 'The magical south India tours',
    'Explore the beautiful sights of The magical south India tours. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['14 Days – The magical south India tours'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Welcome drink at hotel', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Road Taxes', 'Guide services', 'Pvt. AC vehicle with driver', 'House Boat with all meal on demand'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry.', 'Monuments Entrance fee, Camera fee, Boat ride, horse ride, Jeep Safari', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of The magical south India tours.',
    FALSE, TRUE,
    ARRAY['thekkady', 'cochin'],
    india_id,
    kerala_state,
    'The magical south India tours | Mother India Tour Travels',
    'Explore the beautiful sights of The magical south India tours. This package offers a comprehensive day-wise itinerary, comfortable stays, and private ',
    ARRAY['thekkady', 'cochin'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, south_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;

  -- Variant 13n-14d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '13n-14d', '13 Nights / 14 Days', 13, 14, '13 Nights / 14 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '13n-14d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, thekkady_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, cochin_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Day 1 Sightseeing', 'Chennai welcome on arrival at int’l airport in chennai. transfer to a hotel. overnight stay at hotel in chennai', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Chennai sightseeing', 'After breakfast, Proceed for a city tour visiting Sri parthasarathy temple, kapaleeshwar temple, fort st.george, government museum,marina beach. Evening free at leisure. Dinner & overnight stay at a hotel in Chennai.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Chennai', 'kanchipuram – mahabalipuram: After breakfast, drive to mahabalipuram. Via sightseeing of kanchipuram (kamakshi amman temple, kailasanathar temple, ekambareshwar temple). On arrival check-in at the hotel. Afternoon proceed for sightseeing and visit the sea shore temple, the five rathas. Dinner & overnight stay at a hotel in mahabalipuram.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Mahabalipuram', 'Pondichery* Breakfast at hotel. Drive to pondicherry. On arrival check-in at hotel.proceed for city tour visiting aurobindo ashram and pondicherry museum day free at leisure. Enjoy the beautiful beaches. dinner & overnight stay at a hotel in pondicherry.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Pondicherry', 'Tirchy – Thanjavur* Breakfast at hotel. Drive to thanjavur enroute visiting the rock fort temple in trichy. Upon arrival check in at the hotel. Afternoon proceed for a tour round tanjore city visiting the various temples, outstanding among them is the brihadeswara temple. Dinner & overnight stay at hotel in thanjavur.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Thanjavur', 'Madurai Breakfast at hotel. Drive to madurai. On arrival check-in at the hotel. Afternoon sightseeing of famous meenakshi temple, a splendid example of dravidian architecture, thirumalai nayak mahal and gandhi museum. Dinner & overnight stay at a hotel in madurai.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Thanjavur', 'Madurai Breakfast at hotel. Drive to madurai. On arrival check-in at the hotel. Afternoon sightseeing of famous meenakshi temple, a splendid example of dravidian architecture, thirumalai nayak mahal and gandhi museum. Dinner & overnight stay at a hotel in madurai.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 7, 'Madurai', 'Thekkady Breakfast at hotel. drive to thekkady. On arrival check into the hotel. In the afternoon visit periyar-one of the finest wildlife reserves in the world and enjoy boat cruises on periyar lake. Dinner & overnight stay at hotel in thekkady', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 8, 'Thekkady', 'Kumarkom – Alappuzha* Breakfast at hotel. Drive to kumarakom. On arrival check-in to the house boat. Full day enjoy back water cruise. Dinner & overnight on a houseboat.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 9, 'Alappuzha', 'Cochin Breakfast at houseboat. Straight drive to Cochin. On arrival check-in at the hotel. After some rest proceed for city tour visiting dutch palace, jewish synagogue, st.francis church, dutch cemetery, chinese fishing nets at the entrance of cochin harbour & willingdon island. Day free at leisure. Dinner & overnight stay at a hotel in Cochin.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 10, 'Cochin', 'Ooty Breakfast at hotel. Drive to Ooty. On arrival check-in at the hotel. Day free at leisure. Dinner & overnight stay at a hotel in Ooty.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 11, 'Ooty', 'Mysore Breakfast at hotel proceeds for sightseeing, visiting botanical garden, Ooty lake, Doddabetta (highest point in ooty). Afternoon drive to mysore. On arrival check-in at the hotel. Dinner & overnight stay at a hotel in Mysore.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 12, 'Mysore Breakfast at hotel', 'Proceed for a city tour visiting mysore palace (the residence of the royal family), Chamundi hills (temple of goddess chamundeshwari.) lunch at the hotel. Evening visit vrindavan garden (one of the best in south india.). Dinner & overnight stay at hotel in mysore', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 13, 'Mysore', 'Bangalore Breakfast at hotel. Drive to Bangalore via Srirangapatna (fort & temples) & Somnathpur (famous for its 13th century hoysala temple). On arrival check-in at the hotel. Day free at leisure. Dinner & overnight stay at a hotel in Bangalore.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 14, 'Bangalore', 'Chennai Breakfast at hotel. Proceed for a city tour visiting Vidhana Soudha (houses the state legislative assembly of karnataka), tipu’s palace (summer palace of tipu sultan -1781-1791 ad. ), lal bagh botanical garden. Timely transfer to airport to board on flight for onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Mesmerizing Western Ghats Mysore DURATION:
  pkg_id := 'mesmerizing-western-ghats-mysore-duration';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'mesmerizing-western-ghats-mysore-duration', 'Mesmerizing Western Ghats Mysore DURATION:',
    'Explore the beautiful sights of Mesmerizing Western Ghats Mysore DURATION:. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Mesmerizing Western Ghats with Mysore DURATION: 6 DAYS / 5 NIGHTS'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Welcome drink at hotel', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Road Taxes', 'Guide services', 'Pvt. AC vehicle with driver'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry.', 'Monuments Entrance fee, Camera fee, Boat ride, horse ride, Jeep Safari', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Mesmerizing Western Ghats Mysore DURATION:.',
    FALSE, TRUE,
    ARRAY['delhi'],
    india_id,
    delhi_state,
    'Mesmerizing Western Ghats Mysore DURATION: | Mother India Tour Travels',
    'Explore the beautiful sights of Mesmerizing Western Ghats Mysore DURATION:. This package offers a comprehensive day-wise itinerary, comfortable stays,',
    ARRAY['delhi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Bangalore to Mysore', 'You first arrive at the Bangalore airport, where you will be received by the representative. Then, you head towards Mysore, it takes about 3 hours to drive there. Once you are there, you check- in at the hotel. Later, you visit the beautiful Brindavan Garden and return back to the hotel for dinner and an overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Mysore to Ooty', 'You check – out of the hotel in the morning, after your breakfast. You go out for a sightseeing tour in Mysore; visit the Chamundi Hills and the Bull Temple. Lastly, you visit the Mysore Palace and proceed to Ooty. On the way you stop to see the Pykara Lake, which offers a great view. Once you reach Ooty, you check- in at the hotel, enjoy your dinner, and later retire for the night.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Ooty sightseeing', 'Your day is planned out for Ooty sightseeing, so to do that you leave right away after breakfast. You visit Doddabetta Peak, Botanical Garden and later visit Charing Cross, You can indulge in shopping and a nice lunch in the town. Next, you visit the Tea Museum and the Ooty lake where you can enjoy the boat ride. Later, in the evening, you return to the hotel for an overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'Ooty to Kodaikanal', 'You check out of the hotel in the morning after breakfast and head towards Coonoor. There is also a toy train ride that takes you to Coonoor, you can opt for that. After the exciting train journey, you visit the Sim’s park, dolphin’s nose and lamb’s rock. You further drive to Kodaikanal, and on reaching there you check in at the hotel where dinner will be served and you can retire for the night.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'Kodaikanal sightseeing', 'After breakfast, you go out for kodaikanal sightseeing, the place is covered in greenery and the view it offers is spectacular. Visit the Pillar Rock and the Coakers Walk. Later you can enjoy boating at the Kodai lake and then, return to the hotel. Have dinner and stay overnight.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'Kodaikanal to Coimbatore', 'The trip comes to an end with your return to the airport for your journey later.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Wayanad Tour
  pkg_id := 'wayanad-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'wayanad-tour', 'Wayanad Tour',
    'Explore the beautiful sights of Wayanad Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['Wayanad Tour Packages 02 Night / 03 Days'],
    ARRAY['Accommodation', 'Welcome Drink Non Alcoholic.', 'Welcome drink at hotel', 'Meals', 'All Transfers, All sightseeing as per Tour Itinerary', 'All long distance Travels', 'Toll Taxes, Parkings, Fuel', 'State Taxes, Road Taxes', 'Guide services', 'Pvt. AC vehicle with driver'],
    ARRAY['Meals other than those specified above', 'Personal expenses like portages, tips, laundry.', 'Monuments Entrance fee, Camera fee, Boat ride, horse ride, Jeep Safari', 'Any activity not mentioned in the inclusions', 'Travel Insurance', 'Additional cost due to flight cancellation/ roadblocks, Political unrest etc.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg',
    ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'],
    'Beach', 12, 10, 'Premium Hotels',
    'Experience the best of Wayanad Tour.',
    FALSE, TRUE,
    ARRAY['delhi'],
    india_id,
    delhi_state,
    'Wayanad Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Wayanad Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a m',
    ARRAY['delhi'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, beach_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 2n-3d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '2n-3d', '2 Nights / 3 Days', 2, 3, '2 Nights / 3 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', ARRAY['https://images.pexels.com/photos/3889987/pexels-photo-3889987.jpeg', 'https://images.pexels.com/photos/574324/pexels-photo-574324.jpeg', 'https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '2n-3d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, delhi_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'Kozhikode to Wayanad', 'On arriving at the Kozhikode railway station/ airport, meet our representative. He helps you with an assisted transfer to Wayanad, by road, which takes around 3 hours. Upon reaching the well-known Vythiri Resort, one of the most popular treehouse resorts in Wayanad, which is positioned above the thick canopies of the rainforest. Check into your treehouse. Vythiri resort is an eco-friendly resort that has treehouses and cottages, which are built using local materials along with solar energy. Natural spring water that guests down from the surrounding hills looks beautiful. Offering memorable holiday experiences to honeymooners and family vacationers, this wonderful retreat is a delight. Complete the check-in and later embark on a hiking tour to the Chembra Peak. Admire the superb views and the peaceful surroundings. En-route, you also come across a heart-shaped lake. Overnight stay in Wayanad.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'Wayanad sightseeing', 'After breakfast, get ready for a city tour of Wayand. You visit the placid Lake Pookot- a freshwater lake where the visitors can enjoy boat riding, amid fresh air and green ambiance. Next, you visit the three-tiered Soojipara waterfalls that are also known as Sentinel Rock Waterfalls. Thereafter, your next visit is to the largest dam of India, Bansura Sagar dam, which is also the second largest earth dam in Asia. The surroundings of the dam are tranquil and breathtaking. Continuing the city tour, visit the very popular Edakkal Caves- these are 2 natural caves known to be 7000 years old. It is believed that these caves are one of the earliest centers of human habitation. Continue your sightseeing with a visit to the Edakkal Caves- two natural caves that are probably 7000 years old. These caves are known to be one of the earliest centers of human habitation. Later on, you visit Pakshipathalam- a place that is popular amid ornithologists, adventure tourists, and nature-lovers. The last visit of the day is to the three-tiered Meenmutty waterfalls gushing down from a height of 300 m. Stay overnight.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'Wayanad to Kozhikode', 'On the last day of your tour, get an assisted transfer to the railway station / airport in Kozhikode to board a train / flight for your onward journey.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

  -- Package: Sweet Kashmir Tour
  pkg_id := 'sweet-kashmir-tour';
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    pkg_id, 'sweet-kashmir-tour', 'Sweet Kashmir Tour',
    'Explore the beautiful sights of Sweet Kashmir Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers for a memorable vacation.',
    ARRAY['05 Nights/06 Days Sweet Kashmir Tour'],
    ARRAY['Srinagar Airport Pickup Drop.', 'Welcome Drink on Arrival at the hotel.', '3 Night’s Accommodation in Srinagar', '1 Night Accommodation in Houseboat with Breakfast & dinner', '1 Night Accommodation in Pahalgam', '5 Breakfast', '1 Hour Shikara Ride.', 'All Tour by Pvt. Tempo Traveller', 'Toll Charges, Parking Charges, Driver Allowance.', '24/7 Customer Support.', 'Transportation with Driver'],
    ARRAY['Air Tickets, Trains, Ferries etc.', 'Personal Expenses like Laundry, Shopping, telephone bills, tips etc.', 'Entrance fee / Local Guide / at any place during the tour.', 'Meals not mentioned in the “Inclusions” section.', 'Anything not mentioned in the package includes section.', 'Cable Car / Pony Ride in Pahalgam / Gulmarg / Sonamarg.', 'Local sightseeing in vehicle in Pahalgam / Gulmarg / Sonmarg due to restrictions.', 'Adventure Activities like Safari, Rides, Surfing, and Paragliding etc.', 'Only Postpaid mobile connection of BSNL, Jio Airtel works in Jammu &amp; Kashmir.', 'Local sightseeing in vehicle in Pahalgam / Gulmarg / Sonmarg due to restrictions.'],
    ARRAY['Customizable on request'],
    'https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg',
    ARRAY['https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', 'https://images.pexels.com/photos/1435075/pexels-photo-1435075.jpeg', 'https://images.pexels.com/photos/3389531/pexels-photo-3389531.jpeg'],
    'Heritage', 12, 10, 'Premium Hotels',
    'Experience the best of Sweet Kashmir Tour.',
    FALSE, TRUE,
    ARRAY['srinagar', 'leh', 'gulmarg', 'pahalgam'],
    india_id,
    jk_state,
    'Sweet Kashmir Tour | Mother India Tour Travels',
    'Explore the beautiful sights of Sweet Kashmir Tour. This package offers a comprehensive day-wise itinerary, comfortable stays, and private transfers f',
    ARRAY['srinagar', 'leh', 'gulmarg', 'pahalgam'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name", "overview" = EXCLUDED."overview", "heroImage" = EXCLUDED."heroImage";

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, raj_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, dom_cat) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES (pkg_id, north_cat) ON CONFLICT DO NOTHING;

  -- Variant 5n-6d
  var_id := gen_random_uuid();
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault", "heroImage", "galleryImages") VALUES
    (var_id, pkg_id, '5n-6d', '5 Nights / 6 Days', 5, 6, '5 Nights / 6 Days', NULL, NULL, 1, TRUE, 'https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', ARRAY['https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg', 'https://images.pexels.com/photos/1435075/pexels-photo-1435075.jpeg', 'https://images.pexels.com/photos/3389531/pexels-photo-3389531.jpeg'])
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "heroImage" = EXCLUDED."heroImage";
    
  SELECT "id" INTO var_id FROM "PackageVariant" WHERE "packageId" = pkg_id AND "slug" = '5n-6d';

  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, srinagar_dest, 1) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, leh_dest, 2) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, gulmarg_dest, 3) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageDestination" ("variantId", "destinationId", "sortOrder") VALUES (var_id, pahalgam_dest, 4) ON CONFLICT DO NOTHING;
  INSERT INTO "PackageAttraction" ("variantId", "attractionId") VALUES (var_id, (SELECT "id" FROM "Attraction" WHERE "slug" = 'dal-lake')) ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 1, 'ARRIVAL SRINAGAR', 'LOCAL SIGHTSEEING: Welcome to Srinagar, the Lake City. On arrival at Srinagar Airport, begin your Kashmir Tour. You will be transferred to the Hotel. Proceed on a city tour visiting the Shankar Acharya temple situated on the highest hill of Srinagar, the famous Mughal Gardens-Chashmashahi, Nishat Shalimar. These gardens were Mughal Emperor concepts of Paradise and today these are popular picnic spots. Visit Hazratbal Dargah Also. Overnight stay in a hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 2, 'IN SRINAGAR | DAY EXCURSION TO SONMARG', 'After breakfast leave for Sonmarg “Meadow of Gold”. is a trekkers heaven, a starting point for many treks. Spectacular skies, snowy mountains, huge lakes, strewn with the loveliest alpine flowers at an altitude of 2667 meters and 84 km from Srinagar, it lies in the heart of a beautiful valley by the sindh. Full day at Sonmarg to explore on your own.” Visit the famous Thajiwas Glacier on a pony or trek in Sonmarg or You can go to Zero point/Zojila Pass (Own cost). Sonmarg is the starting point of many famous treks and also the gateway to Leh. Evening return to Srinagar. Overnight stay at the hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 3, 'IN SRINAGAR | SRINAGAR TO GULMARG', 'Early morning proceeds to Gulmarg driving past willow trees, fast flowing streams and lush green meadows. Gulmarg – the meadow of flowers is an apt term for this idyllic flower-laden meadow offering a spectacular view of towering snow-capped peaks covered with dense forests of tall conifers and gigantic fir and pine trees. Stroll leisurely or take pony rides (by your own payment) across the green meadow to one of the world&#39;s highest Golf Courses. A must is a fun-filled ride in the newly introduced Gondola lift (by your own payment). In the evening, go back to the hotel and enjoy a comfortable overnight stay in Gulmarg Hotel.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 4, 'ON TO PAHALGAM | GULMARG', 'PAHALGAM. Checkout from hotel &amp; then early in the morning leave for Pahalgam the valley of shepherds which is situated at the confluence of the streams flowing from river Ladder and Sheshnag lake. En route visit the Awantipura ruins, an 1100-year-old temple dedicated to Lord Vishnu and built by King Awantivarman. On arrival into Pahalgam enjoy the surrounding beauty or walk to Baisaren, which is about 2 km from Pahalgam. A small village set in pine and fir forest is pleasing and offers a good view. Overnight stay at Hotel in Pahalgam.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 5, 'PAHALGAM', 'SRINAGAR. After Breakfast, you are free to relax and absorb the serene beauty of Pahalgam. Stroll along the Lidder River, surrounded by snow capped mountains. Or you can visit Baisaran on your own. If it is the snow that beckons you then you can alternatively opt to visit Aru or Chandanwari (16 kms) where you can find snow even in summer. Overnights at Pahalgam Full Day enjoyment in Pahalgam. Like Chandanwari/ Aru alley/ Betaab valley (at your own cost) after noon check out hotel drive to Srinagar join Hotel/Houseboat. After fresh enjoy Shikara ride on Dal Lake at your own cost back to Hotel/ Houseboat for overnight stay.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), var_id, 6, 'RETURN HOME WITH HAPPY MEMORIES', 'After breakfast transfer to Srinagar Airport to board your flight with memorable experiences of us. (Honeymoon Tour available on demand) Please note: We can arrange tailor-made tours Houseboat Stay on Demand Inclusions Srinagar Airport Pickup Drop.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

END $$;
