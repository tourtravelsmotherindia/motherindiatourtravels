import Image from "next/image";
import React from "react";

import { Card, CardContent } from "@/components/ui/card";
import { Marquee } from "@/components/ui/marquee-01-utils/marquee";
import { type ReviewItem } from "@/types/review";

const fallbackReviews: ReviewItem[] = [
  {
    id: "f1",
    reviewer: "Salahuddin Shakib",
    review:
      "I am a traveler and Mother India Travels helps me a lot in finding interesting tourist destinations and of course the price offered is very worth it.",
    rating: 5,
    packageName: "",
    source: "Google",
    avatar:
      "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&h=150&q=80",
    reviewLink: "https://search.google.com/local/reviews?placeid=ChIJkVVTkFz9DDkR6lv4BYn7fK0",
    isApproved: true,
    isFeatured: true,
    createdAt: new Date(),
  },
  {
    id: "f2",
    reviewer: "Sarah Johnson",
    review:
      "The view from Tiger Nest in Ladakh was absolutely breathtaking! A life-changing journey organized flawlessly.",
    rating: 5,
    packageName: "",
    source: "Google",
    avatar:
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&h=150&q=80",
    reviewLink: "https://search.google.com/local/reviews?placeid=ChIJkVVTkFz9DDkR6lv4BYn7fK0",
    isApproved: true,
    isFeatured: true,
    createdAt: new Date(),
  },
  {
    id: "f3",
    reviewer: "Michael Chen",
    review:
      "Kerala houseboats are a dream! Every evening was magical, and the food was outstanding. Highly recommend them!",
    rating: 5,
    packageName: "",
    source: "Google",
    avatar:
      "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&h=150&q=80",
    reviewLink: "https://search.google.com/local/reviews?placeid=ChIJkVVTkFz9DDkR6lv4BYn7fK0",
    isApproved: true,
    isFeatured: true,
    createdAt: new Date(),
  },
  {
    id: "f4",
    reviewer: "Emma Wilson",
    review:
      "Sleeping under the Jaisalmer desert stars was an experience of a lifetime. The staff was incredibly friendly.",
    rating: 5,
    packageName: "",
    source: "Google",
    avatar:
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=150&h=150&q=80",
    reviewLink: "https://search.google.com/local/reviews?placeid=ChIJkVVTkFz9DDkR6lv4BYn7fK0",
    isApproved: true,
    isFeatured: true,
    createdAt: new Date(),
  },
  {
    id: "f5",
    reviewer: "Rajesh Patel",
    review:
      "Exceptional service! The Kashmir package was well planned, hotels were great, and our driver was very professional.",
    rating: 5,
    packageName: "",
    source: "Google",
    avatar:
      "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=150&h=150&q=80",
    reviewLink: "https://search.google.com/local/reviews?placeid=ChIJkVVTkFz9DDkR6lv4BYn7fK0",
    isApproved: true,
    isFeatured: true,
    createdAt: new Date(),
  },
  {
    id: "f6",
    reviewer: "Ananya Sharma",
    review:
      "Highly recommend Mother India Travels for solo female travelers. I felt safe throughout my entire solo trip to Himachal.",
    rating: 5,
    packageName: "",
    source: "Google",
    avatar:
      "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&h=150&q=80",
    reviewLink: "https://search.google.com/local/reviews?placeid=ChIJkVVTkFz9DDkR6lv4BYn7fK0",
    isApproved: true,
    isFeatured: true,
    createdAt: new Date(),
  },
];

const ReviewCard = ({
  reviewer,
  review,
  avatar,
  reviewLink,
}: {
  reviewer: string;
  review: string;
  avatar: string;
  reviewLink: string;
}) => {
  const profileImg =
    avatar && avatar.startsWith("http")
      ? avatar
      : "https://lh3.googleusercontent.com/a/default-user=s64-c";

  const card = (
    <Card className="relative h-full w-64 cursor-pointer overflow-hidden border-border-light bg-card shadow-none p-4 hover:bg-neutral-50 transition-colors duration-200">
      <CardContent className="p-0 flex flex-col gap-2">
        <div className="flex flex-row items-center gap-2">
          <Image
            className="rounded-full object-cover shrink-0"
            width={32}
            height={32}
            alt=""
            src={profileImg}
          />
          <div className="flex flex-col min-w-0">
            <p className="text-sm font-medium text-foreground truncate">{reviewer}</p>
          </div>
        </div>
        <p
          className="text-xs line-clamp-3 text-foreground font-normal leading-relaxed whitespace-pre-wrap"
          dangerouslySetInnerHTML={{ __html: review }}
        />
      </CardContent>
    </Card>
  );

  if (reviewLink) {
    return (
      <a
        href={reviewLink}
        target="_blank"
        rel="noopener noreferrer"
        className="block h-full no-underline outline-none relative z-20 pointer-events-auto cursor-pointer"
      >
        {card}
      </a>
    );
  }

  return card;
};

export default function TestimonialMarquee({ testimonials = [] }: { testimonials?: ReviewItem[] }) {
  const activeReviews = testimonials && testimonials.length > 0 ? testimonials : fallbackReviews;

  // Divide the raw activeReviews list first: 1 to 55 for the first row, 56 to rest for the second row
  const firstRowAll = activeReviews.slice(0, 55);
  const secondRowAll = activeReviews.slice(55);

  // Then filter each row for reviews that have non-empty text
  const firstRow = firstRowAll.filter((t) => t.review && t.review.trim() !== "");
  const secondRow = secondRowAll.filter((t) => t.review && t.review.trim() !== "");

  if (firstRow.length === 0 && secondRow.length === 0) return null;

  return (
    <div className="relative flex w-full flex-col items-center justify-center overflow-hidden py-4 select-none">
      <Marquee
        pauseOnHover
        className="[--duration:90s]"
        style={{ "--duration": "90s" } as React.CSSProperties}
      >
        {firstRow.map((review) => (
          <ReviewCard
            key={review.id}
            reviewer={review.reviewer}
            review={review.review}
            avatar={review.avatar}
            reviewLink={review.reviewLink}
          />
        ))}
      </Marquee>
      <Marquee
        reverse
        pauseOnHover
        className="[--duration:90s]"
        style={{ "--duration": "90s" } as React.CSSProperties}
      >
        {secondRow.map((review) => (
          <ReviewCard
            key={review.id}
            reviewer={review.reviewer}
            review={review.review}
            avatar={review.avatar}
            reviewLink={review.reviewLink}
          />
        ))}
      </Marquee>
      <div className="from-background pointer-events-none absolute inset-y-0 left-0 w-1/4 bg-gradient-to-r"></div>
      <div className="from-background pointer-events-none absolute inset-y-0 right-0 w-1/4 bg-gradient-to-l"></div>
    </div>
  );
}
