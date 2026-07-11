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
INSERT INTO "SiteSection" ("id","key","tagline","subtitle") VALUES
(gen_random_uuid(), 'faq', 'Have Questions?', 'We''ve got answers to the most common travel questions from our customers.'),
(gen_random_uuid(), 'gallery', 'Our Travel Gallery', 'Catch a glimpse of the mesmerizing landscapes, historical monuments, and soulful cultures captured during our curated trips.'),
(gen_random_uuid(), 'why-choose-us', 'Why Choose Us', 'Two decades of trust, expertise, and unforgettable journeys across India and the world.'),
(gen_random_uuid(), 'testimonials', 'What Our Travelers Say', 'Thousands of happy travelers have explored India with us. Here''s what they say about their experience.'),
(gen_random_uuid(), 'destinations', 'Explore Destinations', 'From the snow-capped Himalayas to tropical beaches, discover India''s incredible diversity with our handpicked destinations.')
ON CONFLICT ("key") DO UPDATE SET
  "tagline" = EXCLUDED."tagline", "subtitle" = EXCLUDED."subtitle";

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
DO $$
DECLARE
  india_id TEXT; nepal_id TEXT; uae_id TEXT;
  delhi_state TEXT; jk_state TEXT; kerala_state TEXT;
  delhi_dest TEXT; agra_dest TEXT; jaipur_dest TEXT;
  srinagar_dest TEXT; gulmarg_dest TEXT; pahalgam_dest TEXT;
  munnar_dest TEXT; alleppey_dest TEXT; cochin_dest TEXT;
  kathmandu_dest TEXT; pokhara_dest TEXT; dubai_dest TEXT;
  dom_cat TEXT; int_cat TEXT; north_cat TEXT; south_cat TEXT;
  honey_cat TEXT; fam_cat TEXT; spirit_cat TEXT; adv_cat TEXT; beach_cat TEXT; hill_cat TEXT;

  gt_pkg_id TEXT := 'golden-triangle-tour';
  kash_pkg_id TEXT := 'kashmir-tour';
  ker_pkg_id TEXT := 'kerala-tour';
  nep_pkg_id TEXT := 'nepal-tour';
  dxb_pkg_id TEXT := 'dubai-tour';

  gt_v1 TEXT := gen_random_uuid();
  gt_v2 TEXT := gen_random_uuid();
  kash_v1 TEXT := gen_random_uuid();
  ker_v1 TEXT := gen_random_uuid();
  nep_v1 TEXT := gen_random_uuid();
  dxb_v1 TEXT := gen_random_uuid();
BEGIN
  -- Get Geography IDs
  SELECT "id" INTO india_id FROM "Country" WHERE "slug" = 'india';
  SELECT "id" INTO nepal_id FROM "Country" WHERE "slug" = 'nepal';
  SELECT "id" INTO uae_id FROM "Country" WHERE "slug" = 'uae';

  SELECT "id" INTO delhi_state FROM "State" WHERE "slug" = 'delhi';
  SELECT "id" INTO jk_state FROM "State" WHERE "slug" = 'jammu-kashmir';
  SELECT "id" INTO kerala_state FROM "State" WHERE "slug" = 'kerala';

  SELECT "id" INTO delhi_dest FROM "Destination" WHERE "slug" = 'delhi';
  SELECT "id" INTO agra_dest FROM "Destination" WHERE "slug" = 'agra';
  SELECT "id" INTO jaipur_dest FROM "Destination" WHERE "slug" = 'jaipur';
  SELECT "id" INTO srinagar_dest FROM "Destination" WHERE "slug" = 'srinagar';
  SELECT "id" INTO gulmarg_dest FROM "Destination" WHERE "slug" = 'gulmarg';
  SELECT "id" INTO pahalgam_dest FROM "Destination" WHERE "slug" = 'pahalgam';
  SELECT "id" INTO munnar_dest FROM "Destination" WHERE "slug" = 'munnar';
  SELECT "id" INTO alleppey_dest FROM "Destination" WHERE "slug" = 'alleppey';
  SELECT "id" INTO cochin_dest FROM "Destination" WHERE "slug" = 'cochin';
  SELECT "id" INTO kathmandu_dest FROM "Destination" WHERE "slug" = 'kathmandu';
  SELECT "id" INTO pokhara_dest FROM "Destination" WHERE "slug" = 'pokhara';
  SELECT "id" INTO dubai_dest FROM "Destination" WHERE "slug" = 'dubai';

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

  -- 1. GOLDEN TRIANGLE TOUR
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    gt_pkg_id, 'golden-triangle-tour', 'Golden Triangle Tour',
    'Experience the cultural heart of India through the famous Golden Triangle Tour. Explore the bustling streets of Delhi, the symbol of eternal love - the Taj Mahal in Agra, and the royal heritage palaces of Jaipur.',
    ARRAY['Sunrise visit to the magnificent Taj Mahal', 'Chauffeur-driven AC vehicle for entire trip', 'Guided tours of historic Amber Fort & Hawa Mahal', 'Explore Old Delhi & Rickshaw rides in Chandni Chowk'],
    ARRAY['Accommodation in 4-Star hotels with breakfast', 'All transfers & sightseeing by private AC Sedan/SUV', 'Local guides at Delhi, Agra, & Jaipur', 'Toll taxes, parking, fuel, and driver allowances'],
    ARRAY['Airfare/Train tickets', 'Lunch and Dinner unless specified', 'Monument entrance tickets', 'Tips to driver/guides'],
    ARRAY['Taj Mahal is closed on Fridays.', 'Customizations available on request.'],
    'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=800&q=80',
    ARRAY['https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=800&q=80', 'https://images.unsplash.com/photo-1585135497273-1a86b09fe707?auto=format&fit=crop&w=800&q=80'],
    'Heritage', 12, 10, 'Premium 4-Star Hotels',
    'India''s classic introduction: history, culture and breathtaking monuments.',
    TRUE, TRUE, ARRAY['delhi', 'agra', 'jaipur', 'golden-triangle'], india_id, delhi_state,
    'Golden Triangle Tour | Delhi Agra Jaipur Package | Mother India',
    'Book the classic Golden Triangle Tour. Explore Delhi, Agra, and Jaipur in comfort. Best prices, expert drivers, and guides.',
    ARRAY['golden triangle', 'delhi agra jaipur tour', 'taj mahal tour'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name";

  -- Joins for Golden Triangle
  INSERT INTO "PackageDestination" ("packageId", "destinationId", "sortOrder") VALUES
    (gt_pkg_id, delhi_dest, 1),
    (gt_pkg_id, agra_dest, 2),
    (gt_pkg_id, jaipur_dest, 3)
    ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES
    (gt_pkg_id, dom_cat),
    (gt_pkg_id, north_cat),
    (gt_pkg_id, fam_cat)
    ON CONFLICT DO NOTHING;

  -- Variants for Golden Triangle
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault") VALUES
    (gt_v1, gt_pkg_id, '3n-4d', '3 Nights / 4 Days Classic', 3, 4, '3 Nights / 4 Days', 14999, 12999, 1, TRUE),
    (gt_v2, gt_pkg_id, '5n-6d', '5 Nights / 6 Days Extended', 5, 6, '5 Nights / 6 Days', 19999, 17999, 2, FALSE)
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "basePrice" = EXCLUDED."basePrice";

  -- Itinerary Days for Golden Triangle v1 (3N/4D)
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), gt_v1, 1, 'Delhi Arrival & Local Sightseeing', 'Welcome to Delhi. Transfer to hotel. Afternoon visit Qutub Minar, India Gate, and driving past Parliament House.', ARRAY[]::text[]),
    (gen_random_uuid(), gt_v1, 2, 'Delhi to Agra via Yamuna Expressway', 'Morning drive to Agra. Visit the magnificent Agra Fort and watch the sunset from Mehtab Bagh overlooking the Taj Mahal.', ARRAY[]::text[]),
    (gen_random_uuid(), gt_v1, 3, 'Agra to Jaipur via Fatehpur Sikri', 'Sunrise visit to Taj Mahal. After breakfast, drive to Jaipur, visiting the ghost city of Fatehpur Sikri enroute.', ARRAY[]::text[]),
    (gen_random_uuid(), gt_v1, 4, 'Jaipur Sightseeing & Return to Delhi', 'Explore Amber Fort, Jal Mahal, Hawa Mahal and City Palace. Afternoon drive back to Delhi for departure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;


  -- 2. KASHMIR PARADISE TOUR
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    kash_pkg_id, 'kashmir-tour', 'Charming Kashmir Paradise',
    'Surrender to the beauty of Jammu & Kashmir. Live in a traditional luxury houseboat on Dal Lake, ride shikaras, slide down Gulmarg snow slopes and trek the pristine meadows of Pahalgam.',
    ARRAY['Stay in a luxury wooden Houseboat on Dal Lake', 'Gulmarg Gondola cable car ride to Kungdoor', 'Sightseeing of Mughal Gardens Nishat & Shalimar', 'Scenic drives through saffron fields and pine forests'],
    ARRAY['Houseboat & Hotel stay with Breakfast & Dinner', 'Private AC vehicle for transfers and sightseeing', 'Shikara ride on Dal Lake (1 Hour)', 'Driver allowance, toll taxes, and local sightseeing'],
    ARRAY['Gulmarg Gondola tickets (pre-booking advised)', 'Pony rides or local union cabs in Pahalgam/Gulmarg', 'Flights or train tickets'],
    ARRAY['Carry warm clothes even in summer.', 'Pre-book Gondola online.'],
    'https://images.unsplash.com/photo-1585136917119-2b25c1f6e0d3?auto=format&fit=crop&w=800&q=80',
    ARRAY['https://images.unsplash.com/photo-1585136917119-2b25c1f6e0d3?auto=format&fit=crop&w=800&q=80'],
    'Classic', 10, 8, 'Houseboat & Stays',
    'Experience the magical valleys, lakes and snow peak vistas of Kashmir.',
    TRUE, TRUE, ARRAY['kashmir', 'srinagar', 'gulmarg', 'pahalgam'], india_id, jk_state,
    'Kashmir Tour Packages | Houseboat & Gulmarg Deals | Mother India',
    'Book Kashmir tour packages with Mother India Tour Travels. Srinagar, Gulmarg, Pahalgam, houseboats, shikara rides.',
    ARRAY['kashmir tour', 'srinagar houseboat', 'gulmarg package'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name";

  -- Joins for Kashmir
  INSERT INTO "PackageDestination" ("packageId", "destinationId", "sortOrder") VALUES
    (kash_pkg_id, srinagar_dest, 1),
    (kash_pkg_id, gulmarg_dest, 2),
    (kash_pkg_id, pahalgam_dest, 3)
    ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES
    (kash_pkg_id, dom_cat),
    (kash_pkg_id, honey_cat),
    (kash_pkg_id, hill_cat)
    ON CONFLICT DO NOTHING;

  -- Variants for Kashmir
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault") VALUES
    (kash_v1, kash_pkg_id, '5n-6d', '5 Nights / 6 Days Paradise', 5, 6, '5 Nights / 6 Days', 22999, 19999, 1, TRUE)
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "basePrice" = EXCLUDED."basePrice";

  -- Itinerary for Kashmir v1
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), kash_v1, 1, 'Arrival Srinagar & Houseboat Check-in', 'Arrive at Srinagar airport. Transfer to premium Dal Lake Houseboat. Evening Shikara ride around floating gardens.', ARRAY[]::text[]),
    (gen_random_uuid(), kash_v1, 2, 'Srinagar Sightseeing: Mughal Gardens', 'Visit Shalimar Bagh, Nishat Bagh, and Hazratbal Shrine. Overnight in Srinagar hotel.', ARRAY[]::text[]),
    (gen_random_uuid(), kash_v1, 3, 'Day Trip to Gulmarg Snow Hills', 'Full day excursion to Gulmarg. Ride the famous Gulmarg Gondola. Play in the snow and return to Srinagar.', ARRAY[]::text[]),
    (gen_random_uuid(), kash_v1, 4, 'Srinagar to Pahalgam Valleys', 'Drive to Pahalgam. Enroute visit saffron fields and Avantipura ruins. Check into Pahalgam hotel.', ARRAY[]::text[]),
    (gen_random_uuid(), kash_v1, 5, 'Explore Pahalgam Valley & Lidder River', 'Explore Betaab Valley, Aru Valley and Chandanwari. Leisure walk along Lidder River.', ARRAY[]::text[]),
    (gen_random_uuid(), kash_v1, 6, 'Pahalgam to Srinagar & Departure', 'After breakfast, check out and drive back to Srinagar airport for departure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;


  -- 3. KERALA BACKWATERS TOUR
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    ker_pkg_id, 'kerala-tour', 'Gods Own Country Highlights',
    'Unwind in tropical paradise. Explore the Dutch Palace in Cochin, wander through misty tea plantations in Munnar, visit spice plantations in Thekkady, and cruise the silent backwaters of Alleppey.',
    ARRAY['Overnight luxury Houseboat cruise in Alleppey backwaters', 'Explore rolling tea garden hills of Munnar', 'Spice plantation tour in Thekkady', 'Watch Kathakali dance performance'],
    ARRAY['Stays in tea resorts and houseboat on full board', 'All sightseeing by private AC vehicle', 'Alleppey houseboat cruise with meals'],
    ARRAY['National park entrance fees', 'Ayurvedic massage charges', 'Tips and personal expenditures'],
    ARRAY['Carry light cotton clothes.', 'Houseboats check-in at 12 PM, checkout at 9 AM.'],
    'https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80',
    ARRAY['https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80'],
    'Beach', 12, 10, 'Tea Resorts & Houseboat',
    'A lush tropical getaway through mist-covered hills and placid canals.',
    TRUE, TRUE, ARRAY['kerala', 'munnar', 'alleppey', 'cochin'], india_id, kerala_state,
    'Kerala Tour Packages | Alleppey Houseboat & Munnar Deals | Mother India',
    'Book Kerala holiday packages. Cochin, Munnar tea hills, Alleppey backwaters. Premium hotel stays and houseboats.',
    ARRAY['kerala tour', 'alleppey houseboat', 'munnar tea hills'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name";

  -- Joins for Kerala
  INSERT INTO "PackageDestination" ("packageId", "destinationId", "sortOrder") VALUES
    (ker_pkg_id, cochin_dest, 1),
    (ker_pkg_id, munnar_dest, 2),
    (ker_pkg_id, alleppey_dest, 3)
    ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES
    (ker_pkg_id, dom_cat),
    (ker_pkg_id, south_cat),
    (ker_pkg_id, beach_cat)
    ON CONFLICT DO NOTHING;

  -- Variants for Kerala
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault") VALUES
    (ker_v1, ker_pkg_id, '5n-6d', '5 Nights / 6 Days Kerala', 5, 6, '5 Nights / 6 Days', 20999, 18499, 1, TRUE)
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "basePrice" = EXCLUDED."basePrice";

  -- Itinerary for Kerala
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), ker_v1, 1, 'Arrival Cochin & local Sightseeing', 'Arrive at Cochin. Visit Fort Kochi, Chinese fishing nets and Jewish Synagogue. Overnight in Cochin.', ARRAY[]::text[]),
    (gen_random_uuid(), ker_v1, 2, 'Cochin to Munnar Tea Hills', 'Drive to Munnar, passing beautiful waterfalls and luxury tea hills. Check in at tea estate resort.', ARRAY[]::text[]),
    (gen_random_uuid(), ker_v1, 3, 'Full Day Munnar Sightseeing', 'Visit Eravikulam National Park to spot Nilgiri Tahr, Mattupetty Dam, and Echo Point. Evening walks in tea plantations.', ARRAY[]::text[]),
    (gen_random_uuid(), ker_v1, 4, 'Munnar to Alleppey Houseboat', 'Drive to Alleppey. Board traditional wooden houseboat. Cruise the backwater canals. All meals on board.', ARRAY[]::text[]),
    (gen_random_uuid(), ker_v1, 5, 'Alleppey to Cochin & Departure', 'Morning breakfast on houseboat. Check out and drive to Cochin airport for departure.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;


  -- 4. NEPAL HIMALAYAN TOUR
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    nep_pkg_id, 'nepal-tour', 'Scenic Nepal Himalayan Escape',
    'Explore the spiritual and natural majesty of Nepal. Visit ancient temples in Kathmandu, paraglide over Phewa Lake in Pokhara, and watch sunrises over the Annapurna Himalayan range.',
    ARRAY['Sunrise views of Mount Annapurna from Sarangkot', 'Visit Pashupatinath & Swayambhunath temples', 'Boating on the serene Phewa Lake in Pokhara', 'Guided UNESCO heritage walk in Kathmandu Durbar Square'],
    ARRAY['Premium hotel stay with breakfast', 'All intercity transfers by private vehicle', 'Sightseeing with local guides'],
    ARRAY['Nepal Visa fee (Free/Arrival for Indians, passport required)', 'Adventure sports charges', 'Lunch and dinners'],
    ARRAY['Valid Passport or Voter Card required for Indians.', 'Carry light winter wear.'],
    'https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=800&q=80',
    ARRAY['https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=800&q=80'],
    'Adventure', 10, 8, 'Himalayan View Stays',
    'Explore ancient shrines and towering mountain panoramas in the land of Everest.',
    TRUE, FALSE, ARRAY['nepal', 'kathmandu', 'pokhara', 'himalaya'], nepal_id, NULL,
    'Nepal Tour Packages | Kathmandu Pokhara Deals | Mother India',
    'Best Nepal tour packages from India. Visit Kathmandu, Pokhara, Phewa Lake, Sarangkot sunrise with Mother India.',
    ARRAY['nepal tour', 'kathmandu pilgrimage', 'pokhara trek'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name";

  -- Joins for Nepal
  INSERT INTO "PackageDestination" ("packageId", "destinationId", "sortOrder") VALUES
    (nep_pkg_id, kathmandu_dest, 1),
    (nep_pkg_id, pokhara_dest, 2)
    ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES
    (nep_pkg_id, int_cat),
    (nep_pkg_id, spirit_cat),
    (nep_pkg_id, adv_cat)
    ON CONFLICT DO NOTHING;

  -- Variants for Nepal
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault") VALUES
    (nep_v1, nep_pkg_id, '4n-5d', '4 Nights / 5 Days Highlights', 4, 5, '4 Nights / 5 Days', 24999, 21999, 1, TRUE)
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "basePrice" = EXCLUDED."basePrice";

  -- Itinerary for Nepal
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), nep_v1, 1, 'Kathmandu Arrival & Pashupatinath Visit', 'Arrive at Kathmandu. Transfer to hotel. Afternoon visit sacred Pashupatinath Temple on Bagmati river.', ARRAY[]::text[]),
    (gen_random_uuid(), nep_v1, 2, 'Kathmandu Sightseeing & Drive to Pokhara', 'Visit Boudhanath Stupa and Swayambhunath. Drive to Pokhara through scenic Trisuli river valleys.', ARRAY[]::text[]),
    (gen_random_uuid(), nep_v1, 3, 'Sarangkot Sunrise & Pokhara Sightseeing', 'Early drive to Sarangkot for sunrise over Annapurna. Afternoon visit Davis Falls, Gupteshwor Cave, and boat on Phewa Lake.', ARRAY[]::text[]),
    (gen_random_uuid(), nep_v1, 4, 'Pokhara to Kathmandu Drive', 'Drive back to Kathmandu. Rest of the day free for shopping and visiting local casinos or restaurants.', ARRAY[]::text[]),
    (gen_random_uuid(), nep_v1, 5, 'Kathmandu Departure', 'After breakfast, transfer to airport for departure flights.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;


  -- 5. DUBAI LUXURY TOUR
  INSERT INTO "Package" (
    "id", "slug", "name", "overview", "highlights", "inclusions", "exclusions", "notes",
    "heroImage", "galleryImages", "tourStyle", "groupSizeMax", "groupSizeAvg", "stayType",
    "marketingPitch", "isPopular", "isDomestic", "tags", "countryId", "stateId",
    "seoTitle", "seoDescription", "seoKeywords", "publishedAt", "createdAt", "updatedAt"
  ) VALUES (
    dxb_pkg_id, 'dubai-tour', 'Dubai Glitz & Desert Safari',
    'Experience the future city of gold. Visit the observation deck at Burj Khalifa, cruise the Dubai Marina on a traditional Dhow, and head deep into the Arabian deserts for sandboarding and BBQ under the stars.',
    ARRAY['Visit Burj Khalifa 124th Floor observation deck', 'Thrilling Desert Safari with Dune Bashing & BBQ dinner', 'Marina Dhow Cruise with buffet dinners', 'Full day city tour including Palm Jumeirah & Gold Souks'],
    ARRAY['Luxury 4-Star Hotel stays with daily breakfast', 'All transfers on private/sharing premium cabs', 'Marina cruise and desert safari tickets'],
    ARRAY['Dubai tourist visa fee (assistance provided)', 'Tourism Dirham fee (payable directly at hotel)', 'Lunch and personal shopping'],
    ARRAY['Visa process takes 3-4 working days.', 'Dune bashing not advised for pregnant women/infants.'],
    'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?auto=format&fit=crop&w=800&q=80',
    ARRAY['https://images.unsplash.com/photo-1512453979798-5ea266f8880c?auto=format&fit=crop&w=800&q=80'],
    'Classic', 12, 10, 'Luxury City Hotels',
    'Dazzling malls, modern architecture, and desert adventures in the Middle East.',
    TRUE, FALSE, ARRAY['dubai', 'uae', 'desert-safari', 'burj-khalifa'], uae_id, NULL,
    'Dubai Tour Packages | Burj Khalifa & Desert Safari Deals | Mother India',
    'Book Dubai tour packages with Mother India. Burj Khalifa 124th floor, Desert Safari, Dhow cruise, city tours.',
    ARRAY['dubai tour', 'desert safari dubai', 'burj khalifa package'],
    NOW(), NOW(), NOW()
  ) ON CONFLICT ("id") DO UPDATE SET "name" = EXCLUDED."name";

  -- Joins for Dubai
  INSERT INTO "PackageDestination" ("packageId", "destinationId", "sortOrder") VALUES
    (dxb_pkg_id, dubai_dest, 1)
    ON CONFLICT DO NOTHING;

  INSERT INTO "PackageCategory" ("packageId", "categoryId") VALUES
    (dxb_pkg_id, int_cat),
    (dxb_pkg_id, fam_cat)
    ON CONFLICT DO NOTHING;

  -- Variants for Dubai
  INSERT INTO "PackageVariant" ("id", "packageId", "slug", "label", "nights", "days", "durationText", "basePrice", "discountedPrice", "sortOrder", "isDefault") VALUES
    (dxb_v1, dxb_pkg_id, '4n-5d', '4 Nights / 5 Days City Wonders', 4, 5, '4 Nights / 5 Days', 45999, 41999, 1, TRUE)
    ON CONFLICT ("packageId", "slug") DO UPDATE SET "basePrice" = EXCLUDED."basePrice";

  -- Itinerary for Dubai
  INSERT INTO "ItineraryDay" ("id", "variantId", "day", "title", "description", "images") VALUES
    (gen_random_uuid(), dxb_v1, 1, 'Arrival Dubai & Marina Dhow Cruise', 'Arrive at Dubai International Airport. Transfer to hotel. Evening pickup for Dubai Marina Dhow Cruise with buffet dinner.', ARRAY[]::text[]),
    (gen_random_uuid(), dxb_v1, 2, 'Dubai Half Day City Tour & Burj Khalifa', 'Morning guided city tour (Gold Souk, Jumeirah Mosque, Palm Jumeirah photo op). Afternoon visit Burj Khalifa 124th Floor.', ARRAY[]::text[]),
    (gen_random_uuid(), dxb_v1, 3, 'Desert Safari with BBQ Dinner', 'Morning free for shopping at Dubai Mall. Afternoon 4x4 pickup for Desert Safari. Enjoy dune bashing, camel riding, Tanoura dance, and BBQ dinner.', ARRAY[]::text[]),
    (gen_random_uuid(), dxb_v1, 4, 'Day Free for Shopping or Theme Parks', 'Full day free to explore Dubai on your own, or visit Miracle Garden, Global Village, or Atlantis Aquaventure Waterpark.', ARRAY[]::text[]),
    (gen_random_uuid(), dxb_v1, 5, 'Departure from Dubai', 'Morning free. Check out at 12 PM. Private transfer to airport for return flights.', ARRAY[]::text[])
    ON CONFLICT DO NOTHING;

END $$;
