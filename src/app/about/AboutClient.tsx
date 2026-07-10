"use client";

import { motion } from "framer-motion";
import { ArrowUpRight, Check, Play } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import type { AboutData } from "@/lib/db/repositories/companyRepo";

interface AboutClientProps {
  companyData: {
    name: string;
    tagline: string;
    website: string;
    phone: string[];
    email: string;
    address: string;
    about: AboutData;
  };
}

export default function AboutClient({ companyData }: AboutClientProps) {
  const { about } = companyData;

  // Fallback checks just in case the JSON data is structured differently or empty
  const header = about?.header || {
    badge: "MOTHER INDIA • DISCOVER • EXPLORE • EXPERIENCE",
    title: "Crafting Unforgettable Journeys Together",
    description: "At Mother India Tour Travels, we believe in the magic of exploration and the power of personalized travel. With a dedicated team of tourism experts and a deep commitment to excellence, we work hand-in-hand with our clients to bring their travel ideas to life. Together, we create journeys and memories that stand the test of time.",
    image: "https://motherindiatourtravels.com/assests/about.jpeg",
    introText: "We have vast experience in the Tour and Travel Industry. With a corporate vision and mission reflected in our goals, we have developed a respected position by delivering customized solutions for the specific travel needs of our clients. We successfully serve individuals, families, schools, colleges, educational institutes, and corporate groups, ensuring unforgettable experiences across the country and the world.",
    stats: [
      { value: "20+", label: "Years Experience" },
      { value: "10k+", label: "Happy Travelers" },
      { value: "500+", label: "Corporate Groups" },
      { value: "50+", label: "Destinations" }
    ]
  };

  const mission = about?.mission || {
    title: "Our Mission",
    description: "We are committed to establishing a brand quality that is trusted. We provide reliable and quality travel solutions to meet all implied needs of our clients and achieve client satisfaction through highly motivated workforce involvement and a quality management system. We strive to provide services that not only satisfy our clients but also encourage them to repeat their tours and travels in India. We also strive to provide authentic experiences for visitors by developing and expanding the diversity and quality of our services.",
    items: ["Trusted Brand Quality", "Exceeding Client Expectations", "Authentic Experiences", "Workforce Welfare"],
    images: [
      "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&w=800&q=80",
      "https://images.unsplash.com/photo-1501555088652-021faa106b9b?auto=format&fit=crop&w=600&q=80"
    ]
  };

  const vision = about?.vision || {
    title: "Our Vision",
    description: "We seek a client-oriented organization that demonstrates care, anticipation of client needs, attention to detail, distinctive excellence, and client support with care and clarity. We aim to design and deliver services that enable us to exceed client expectations, providing enriching holidays of the highest standard. We strive for sustainable tourism that enhances the quality of life of local communities in India.",
    items: ["Anticipating Traveler Needs", "Eco-friendly Tourism", "Empowering Local Communities", "Modern Travel Tech"],
    images: [
      "https://images.unsplash.com/photo-1593693397690-362cb9666fc2?auto=format&fit=crop&w=800&q=80",
      "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?auto=format&fit=crop&w=600&q=80"
    ]
  };

  const history = about?.history || {
    title: "Our Strength & Team",
    description: "Supported by a dedicated team of experts—including tourism experts, quality controllers, R&D personnel, tour planners, ticketing agents, travel guides, and drivers—we maintain excellent services. We strive hard to maintain friendly relations by providing an unforgettable and happy experience. We offer a wide choice of customized packages with competitive prices and absolutely no hidden charges.",
    items: ["Competitive Prices", "No Hidden Charges", "Experienced Planners", "24/7 Dedicated Care"],
    images: [
      "https://images.unsplash.com/photo-1605649487212-47bdab064df7?auto=format&fit=crop&w=800&q=80",
      "https://images.unsplash.com/photo-1506461883276-594a12b11db3?auto=format&fit=crop&w=600&q=80"
    ]
  };

  const howWeWork = about?.howWeWork || {
    title: "How We Do Work",
    subtitle: "Being a quality-oriented organization, we provide a wide array of high-standard services following the guidelines of the travel industry. Excellence, quality, and comfort are our topmost priorities.",
    videoImage: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1200&q=80",
    videoUrl: "https://www.youtube.com/watch?v=BbrdQLqGUp0"
  };

  // Animation variants
  const fadeIn = {
    hidden: { opacity: 0, y: 30 },
    visible: { opacity: 1, y: 0, transition: { duration: 0.6, ease: "easeOut" as const } }
  };

  return (
    <div className="bg-white">
      {/* 1. Header Section */}
      <section className="pt-8 pb-16 md:pb-24 layout-container bg-white">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center mb-12 md:mb-16">
          {/* Left Column: Breadcrumb, Title, Description */}
          <motion.div 
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true }}
            variants={fadeIn}
            className="lg:col-span-7 flex flex-col items-start text-left"
          >
            {/* Breadcrumb */}
            <div className="text-xs font-semibold text-neutral-400 mb-6 tracking-wider">
              [<Link href="/" className="hover:text-brand transition-colors duration-200">Home</Link>
              <span className="mx-1 text-neutral-300">/</span>
              <span className="text-brand">About</span>]
            </div>

            <h1 className="text-4xl md:text-6xl font-bold font-display text-foreground tracking-tight leading-[1.08] mb-8">
              {header.title}
            </h1>
            
            <p className="text-sm md:text-base text-muted font-normal leading-relaxed max-w-xl">
              {header.description}
            </p>
          </motion.div>

          {/* Right Column: Main Image & Rotating Badge */}
          <motion.div 
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true }}
            variants={fadeIn}
            className="lg:col-span-5 relative flex items-center justify-center w-full pb-8 lg:pb-0"
          >
            {/* Main Image Container */}
            <div className="relative w-full aspect-[4/5] md:aspect-[3/4] lg:h-[480px] rounded-[1.75rem] md:rounded-[2.5rem] overflow-hidden shadow-card hover:shadow-premium transition-all duration-300">
              <Image
                src={header.image}
                alt="Crafting Unforgettable Journeys Together"
                fill
                priority
                sizes="(max-width: 1024px) 100vw, 450px"
                className="object-cover rounded-[1.75rem] md:rounded-[2.5rem]"
              />
            </div>

            {/* Overlapping Rotating Badge Wrapper */}
            <div className="absolute -bottom-8 -left-4 w-28 h-28 md:-bottom-16 md:-left-12 md:w-40 md:h-40 z-10 block">
              {/* Circular Notch Mask (same background as page, rounded corners) */}
              <div className="absolute inset-0 bg-white rounded-full" />
              
              {/* Rotating Badge Content (inset to create a perfect even gap) */}
              <div className="absolute inset-2.5 md:inset-3.5 bg-white rounded-full shadow-premium flex items-center justify-center border border-neutral-100/60">
                {/* Rotating Circle Text */}
                <motion.div
                  animate={{ rotate: 360 }}
                  transition={{ repeat: Infinity, duration: 22, ease: "linear" }}
                  className="absolute inset-0 w-full h-full p-1.5"
                >
                  <svg viewBox="0 0 100 100" className="w-full h-full">
                    <path
                      id="headerCirclePath"
                      d="M 50, 50 m -35, 0 a 35,35 0 1,1 70,0 a 35,35 0 1,1 -70,0"
                      fill="none"
                    />
                    <text className="font-display font-bold uppercase fill-neutral-800 text-[6.2px] tracking-[0.09em]">
                      <textPath href="#headerCirclePath" startOffset="0%">
                        {header.badge}
                      </textPath>
                    </text>
                  </svg>
                </motion.div>
                {/* Center Circle using Website Orange bg-brand CTA color with white arrow */}
                <div className="w-10 h-10 md:w-12 md:h-12 bg-brand rounded-full flex items-center justify-center shadow-md select-none">
                  <ArrowUpRight className="w-5.5 h-5.5 text-white stroke-[2.5]" />
                </div>
              </div>
            </div>
          </motion.div>
        </div>

        {/* Center Tagline */}
        <motion.div
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true }}
          variants={fadeIn}
          className="pt-12 md:pt-16 pb-8 md:pb-12 mt-8 md:mt-12 text-center"
        >
          <p className="text-lg md:text-2xl lg:text-3xl max-w-5xl mx-auto leading-relaxed font-semibold font-sans tracking-tight text-neutral-900">
            At {companyData.name} we are committed to delivering reliable, high-quality travel solutions. With over two decades of experience, we combine local expertise, premium stays,{" "}
            <span className="text-neutral-400 font-normal">
              and customer-centric planning to bring your travel dreams to life.
            </span>
          </p>
        </motion.div>

        {/* Stats Grid */}
        <motion.div 
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true }}
          variants={fadeIn}
          className="grid grid-cols-2 md:grid-cols-4 gap-8 md:gap-12 justify-center max-w-4xl mx-auto pt-6 text-center"
        >
          {header.stats.map((stat, idx) => (
            <div key={idx} className="flex flex-col items-center">
              <span className="text-3xl md:text-5xl lg:text-6xl font-bold font-display text-foreground tracking-tight">
                {stat.value}
              </span>
              <span className="text-[10px] md:text-xs font-semibold text-neutral-400 uppercase tracking-widest mt-2">
                {stat.label}
              </span>
            </div>
          ))}
        </motion.div>
      </section>

      {/* 2. Our Mission Section */}
      <section className="py-16 md:py-24 bg-white">
        <div className="layout-container grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-24 items-center">
          {/* Collage Images (Left) */}
          <div className="lg:col-span-6 relative h-[320px] sm:h-[420px] md:h-[500px] w-full flex items-center">
            {/* Main Background Image */}
            <div className="relative w-[78%] h-[88%] rounded-[1.75rem] md:rounded-[2.5rem] overflow-hidden shadow-card hover:shadow-premium transition-all duration-300">
              <Image
                src={mission.images[0]}
                alt="Our Mission Background"
                fill
                sizes="(max-width: 1024px) 100vw, 500px"
                className="object-cover rounded-[1.75rem] md:rounded-[2.5rem]"
              />
            </div>
            {/* Overlapping Overlay Image with Notch Mask Wrapper */}
            <div className="absolute bottom-0 right-0 w-[52%] h-[60%] z-10 block">
              {/* Circular Notch Mask (same background as page, rounded corners) */}
              <div className="absolute inset-0 bg-white rounded-[1.75rem] md:rounded-[2.5rem]" />
              
              {/* Foreground Image Container (inset to create a perfect even gap) */}
              <div className="absolute inset-2 md:inset-3 rounded-[1.25rem] md:rounded-[2rem] overflow-hidden border-4 border-white shadow-premium hover:scale-102 transition-transform duration-300">
                <Image
                  src={mission.images[1]}
                  alt="Our Mission Foreground"
                  fill
                  sizes="(max-width: 1024px) 50vw, 250px"
                  className="object-cover rounded-[1.25rem] md:rounded-[2rem]"
                />
              </div>
            </div>
          </div>

          {/* Text Content (Right) */}
          <motion.div 
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true }}
            variants={fadeIn}
            className="lg:col-span-6 flex flex-col gap-6"
          >
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-foreground tracking-tight leading-[1.1] font-display">
              {mission.title}
            </h2>
            <p className="text-sm md:text-base text-muted font-normal leading-relaxed">
              {mission.description}
            </p>

            <ul className="flex flex-col gap-3.5 mt-2">
              {mission.items.map((item, idx) => (
                <li key={idx} className="flex items-center gap-3">
                  <Check className="w-4 h-4 text-emerald-500 stroke-[3] shrink-0" />
                  <span className="text-sm md:text-base text-foreground font-semibold tracking-tight">{item}</span>
                </li>
              ))}
            </ul>
          </motion.div>
        </div>
      </section>

      {/* 3. Our Vision Section */}
      <section className="py-16 md:py-24 bg-white">
        <div className="layout-container grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-24 items-center">
          {/* Text Content (Left) */}
          <motion.div 
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true }}
            variants={fadeIn}
            className="lg:col-span-6 lg:order-1 flex flex-col gap-6"
          >
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-foreground tracking-tight leading-[1.1] font-display">
              {vision.title}
            </h2>
            <p className="text-sm md:text-base text-muted font-normal leading-relaxed">
              {vision.description}
            </p>

            <ul className="flex flex-col gap-3.5 mt-2">
              {vision.items.map((item, idx) => (
                <li key={idx} className="flex items-center gap-3">
                  <Check className="w-4 h-4 text-emerald-500 stroke-[3] shrink-0" />
                  <span className="text-sm md:text-base text-foreground font-semibold tracking-tight">{item}</span>
                </li>
              ))}
            </ul>
          </motion.div>

          {/* Collage Images (Right) */}
          <div className="lg:col-span-6 lg:order-2 relative h-[320px] sm:h-[420px] md:h-[500px] w-full flex items-center justify-end">
            {/* Main Background Image */}
            <div className="relative w-[78%] h-[88%] rounded-[1.75rem] md:rounded-[2.5rem] overflow-hidden shadow-card hover:shadow-premium transition-all duration-300">
              <Image
                src={vision.images[0]}
                alt="Our Vision Background"
                fill
                sizes="(max-width: 1024px) 100vw, 500px"
                className="object-cover rounded-[1.75rem] md:rounded-[2.5rem]"
              />
            </div>
            {/* Overlapping Overlay Image with Notch Mask Wrapper */}
            <div className="absolute bottom-0 left-0 w-[52%] h-[60%] z-10 block">
              {/* Circular Notch Mask (same background as page, rounded corners) */}
              <div className="absolute inset-0 bg-white rounded-[1.75rem] md:rounded-[2.5rem]" />
              
              {/* Foreground Image Container (inset to create a perfect even gap) */}
              <div className="absolute inset-2 md:inset-3 rounded-[1.25rem] md:rounded-[2rem] overflow-hidden border-4 border-white shadow-premium hover:scale-102 transition-transform duration-300">
                <Image
                  src={vision.images[1]}
                  alt="Our Vision Foreground"
                  fill
                  sizes="(max-width: 1024px) 50vw, 250px"
                  className="object-cover rounded-[1.25rem] md:rounded-[2rem]"
                />
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* 4. Our Strength & History Section */}
      <section className="py-16 md:py-24 bg-white">
        <div className="layout-container grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-24 items-center">
          {/* Collage Images (Left) */}
          <div className="lg:col-span-6 relative h-[320px] sm:h-[420px] md:h-[500px] w-full flex items-center">
            {/* Main Background Image */}
            <div className="relative w-[78%] h-[88%] rounded-[1.75rem] md:rounded-[2.5rem] overflow-hidden shadow-card hover:shadow-premium transition-all duration-300">
              <Image
                src={history.images[0]}
                alt="Our Strength Background"
                fill
                sizes="(max-width: 1024px) 100vw, 500px"
                className="object-cover rounded-[1.75rem] md:rounded-[2.5rem]"
              />
            </div>
            {/* Overlapping Overlay Image with Notch Mask Wrapper */}
            <div className="absolute bottom-0 right-0 w-[52%] h-[60%] z-10 block">
              {/* Circular Notch Mask (same background as page, rounded corners) */}
              <div className="absolute inset-0 bg-white rounded-[1.75rem] md:rounded-[2.5rem]" />
              
              {/* Foreground Image Container (inset to create a perfect even gap) */}
              <div className="absolute inset-2 md:inset-3 rounded-[1.25rem] md:rounded-[2rem] overflow-hidden border-4 border-white shadow-premium hover:scale-102 transition-transform duration-300">
                <Image
                  src={history.images[1]}
                  alt="Our Strength Foreground"
                  fill
                  sizes="(max-width: 1024px) 50vw, 250px"
                  className="object-cover rounded-[1.25rem] md:rounded-[2rem]"
                />
              </div>
            </div>
          </div>

          {/* Text Content (Right) */}
          <motion.div 
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true }}
            variants={fadeIn}
            className="lg:col-span-6 flex flex-col gap-6"
          >
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-bold text-foreground tracking-tight leading-[1.1] font-display">
              {history.title}
            </h2>
            <p className="text-sm md:text-base text-muted font-normal leading-relaxed">
              {history.description}
            </p>

            <ul className="flex flex-col gap-3.5 mt-2">
              {history.items.map((item, idx) => (
                <li key={idx} className="flex items-center gap-3">
                  <Check className="w-4 h-4 text-emerald-500 stroke-[3] shrink-0" />
                  <span className="text-sm md:text-base text-foreground font-semibold tracking-tight">{item}</span>
                </li>
              ))}
            </ul>
          </motion.div>
        </div>
      </section>

      {/* 5. How We Do Work Section */}
      <section className="py-16 md:py-24 bg-white layout-container">
        <motion.div 
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true }}
          variants={fadeIn}
          className="flex flex-col items-center text-center max-w-3xl mx-auto mb-12 md:mb-16 gap-4"
        >
          <h2 className="text-3xl md:text-5xl font-bold text-foreground tracking-tight leading-[1.1] font-display">
            {howWeWork.title}
          </h2>
          <p className="text-sm md:text-base text-muted font-normal leading-relaxed max-w-xl">
            {howWeWork.subtitle}
          </p>
        </motion.div>

        {/* Video Player Image Container */}
        <div className="relative w-full h-[240px] sm:h-[400px] md:h-[500px] lg:h-[580px] rounded-[2rem] md:rounded-[3rem] overflow-hidden shadow-premium group">
          <Image
            src={howWeWork.videoImage}
            alt="How We Work Video Background"
            fill
            sizes="100vw"
            className="object-cover transition-transform duration-700 group-hover:scale-101"
          />
          {/* Overlay gradient */}
          <div className="absolute inset-0 bg-black/20 transition-opacity duration-300 group-hover:bg-black/25" />

          {/* Interactive Play Button (Matched to Brand Orange CTA UI with hover state) */}
          <a
            href={howWeWork.videoUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="absolute inset-0 flex items-center justify-center cursor-pointer group-hover:scale-105 transition-transform duration-300"
            aria-label="Play video"
          >
            <div className="relative w-16 h-16 md:w-24 md:h-24 bg-brand hover:bg-brand-hover rounded-full flex items-center justify-center text-white shadow-premium transition-all duration-300">
              <Play className="w-6 h-6 md:w-8 md:h-8 fill-white text-white ml-1" />
            </div>
          </a>
        </div>
      </section>
    </div>
  );
}
