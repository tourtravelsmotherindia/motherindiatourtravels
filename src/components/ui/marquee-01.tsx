import Image from "next/image";

import { Card, CardContent } from "@/components/ui/card";
import { Marquee } from "@/components/ui/marquee-01-utils/marquee";

const reviews = [
  {
    name: "Salahuddin Shakib",
    username: "@shakib",
    body: "I am a traveler and Mother India Travels helps me a lot in finding interesting tourist destinations and of course the price offered is very worth it.",
    profile:
      "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&h=150&q=80",
  },
  {
    name: "Sarah Johnson",
    username: "@sarah_j",
    body: "The view from Tiger Nest in Ladakh was absolutely breathtaking! A life-changing journey organized flawlessly.",
    profile:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&h=150&q=80",
  },
  {
    name: "Michael Chen",
    username: "@mchen_travels",
    body: "Kerala houseboats are a dream! Every evening was magical, and the food was outstanding. Highly recommend them!",
    profile:
      "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&h=150&q=80",
  },
  {
    name: "Emma Wilson",
    username: "@emma_wild",
    body: "Sleeping under the Jaisalmer desert stars was an experience of a lifetime. The staff was incredibly friendly.",
    profile:
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=150&h=150&q=80",
  },
  {
    name: "Rajesh Patel",
    username: "@rajesh_p",
    body: "Exceptional service! The Kashmir package was well planned, hotels were great, and our driver was very professional.",
    profile:
      "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=150&h=150&q=80",
  },
  {
    name: "Ananya Sharma",
    username: "@ananya_sharma",
    body: "Highly recommend Mother India Travels for solo female travelers. I felt safe throughout my entire solo trip to Himachal.",
    profile:
      "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&h=150&q=80",
  },
  {
    name: "David Warner",
    username: "@david_w",
    body: "Flawless organization. The Taj Mahal and Rajasthan tour was stunning. We didn't have to worry about a single detail.",
    profile:
      "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=150&h=150&q=80",
  },
  {
    name: "Priya Nair",
    username: "@priya_nair",
    body: "The tour of Kerala backwaters was serene. Great itinerary, friendly local guides, and seamless transfers.",
    profile:
      "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=150&h=150&q=80",
  },
];

const firstRow = reviews.slice(0, reviews.length / 2);
const secondRow = reviews.slice(reviews.length / 2);

const ReviewCard = ({
  profile,
  name,
  username,
  body,
}: {
  profile: string;
  name: string;
  username: string;
  body: string;
}) => {
  return (
    <Card className="relative h-full w-64 cursor-pointer overflow-hidden border-border-light bg-card shadow-none p-4 hover:bg-neutral-50 transition-colors duration-200">
      <CardContent className="p-0 flex flex-col gap-2">
        <div className="flex flex-row items-center gap-2">
          <Image
            className="rounded-full object-cover"
            width={32}
            height={32}
            alt=""
            src={profile}
          />
          <div className="flex flex-col">
            <p className="text-sm font-medium text-foreground">{name}</p>
            <p className="text-xs font-medium text-muted-foreground">{username}</p>
          </div>
        </div>
        <p className="text-sm line-clamp-2 text-foreground">{body}</p>
      </CardContent>
    </Card>
  );
};

export default function TestimonialMarqueeDemo() {
  return (
    <div className="relative flex w-full flex-col items-center justify-center overflow-hidden py-4">
      <Marquee pauseOnHover className="[--duration:25s]">
        {firstRow.map((review) => (
          <ReviewCard key={review.username} {...review} />
        ))}
      </Marquee>
      <Marquee reverse pauseOnHover className="[--duration:25s]">
        {secondRow.map((review) => (
          <ReviewCard key={review.username} {...review} />
        ))}
      </Marquee>
      <div className="from-background pointer-events-none absolute inset-y-0 left-0 w-1/4 bg-gradient-to-r"></div>
      <div className="from-background pointer-events-none absolute inset-y-0 right-0 w-1/4 bg-gradient-to-l"></div>
    </div>
  );
}
