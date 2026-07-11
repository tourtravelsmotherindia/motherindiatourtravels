// Hero domain types — v2.0 (HeroConfig with SLIDES|VIDEO mode)

export type HeroMode = "SLIDES" | "VIDEO";

export interface HeroSlide {
  id: string;
  image: string;
  tag: string;
  title: string;
  description: string;
  sortOrder: number;
}

export interface HeroConfigData {
  id: number;
  mode: HeroMode;
  videoUrl: string;
  slides: HeroSlide[];
}
