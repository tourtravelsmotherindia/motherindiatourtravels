import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        red: "#DB4444",
        green: "#D2EF9A",
        yellow: "#ECB018",
        pink: "#F4407D",
        purple: "#8684D4",
        success: "#3DAB25",
        black: "#1F1F1F",
        secondary: "#696C70",
        "secondary2": "#A0A0A0",
        surface: "#F7F7F7",
        "surface2": "rgba(255, 255, 255, 0.2)",
        line: "#E9E9E9",
        outline: "rgba(0, 0, 0, 0.15)",
        yellowlight: "#FFFAE9",
        "light-yellow": "#FFFCDE",
        "light-red": "#FFF5EE",
        "light-green": "#E4FDE4",
        selected: "#FFCE8C",
        "custom-primary": "#6EB85F",
        "blue-t": "#023e8a",
        "bluelight-t": "#caf0f8",
        "bluedark-t": "#03045e",
        "pinklight-t": "#ffeedd",
      },
      backgroundImage: {
        "linear-main":
          "linear-gradient(238deg, #FAF8F1, #F6F3EF 99.66%)",
        "gradient-card":
          "linear-gradient(135deg, #6A9C89, #FF885B, #FCDE70)",
        "gradient-card-2":
          "linear-gradient(135deg, #727D73, #4C585B, #4B5945)",
      },
      fontFamily: {
        sans: ["Instrument Sans", "Arial", "sans-serif"],
        script: ["Dancing Script", "cursive"],
      },
      keyframes: {
        shimmer: {
          "0%": { backgroundPosition: "200% 0" },
          "100%": { backgroundPosition: "-200% 0" },
        },
        loaderProgress: {
          "0%": { width: "0" },
          "100%": { width: "100%" },
        },
        "gradient-x": {
          "0%, 100%": { backgroundPosition: "0% 50%" },
          "50%": { backgroundPosition: "100% 50%" },
        },
        "bounce-x": {
          "0%, 100%": { transform: "translateX(0)" },
          "50%": { transform: "translateX(4px)" },
        },
        fadeInUp: {
          "0%": { opacity: "0", transform: "translateY(10px)" },
          "100%": { opacity: "1", transform: "translateY(0)" },
        },
        slide: {
          "0%": { transform: "translateX(0)" },
          "100%": { transform: "translateX(-50%)" },
        },
        shine: {
          "0%": { backgroundPosition: "0% 50%" },
          "50%": { backgroundPosition: "100% 50%" },
          "100%": { backgroundPosition: "0% 50%" },
        },
        glow: {
          "0%, 100%": {
            filter:
              "drop-shadow(0 0 4px #88C273) drop-shadow(0 0 8px #FFC145)",
          },
          "50%": {
            filter:
              "drop-shadow(0 0 8px #88C273) drop-shadow(0 0 16px #FFC145)",
          },
        },
        scrollOffer: {
          "0%": { transform: "translateX(0)" },
          "100%": { transform: "translateX(-50%)" },
        },
      },
      animation: {
        shimmer: "shimmer 2s infinite",
        loaderProgress: "loaderProgress 1.5s ease-out forwards",
        "gradient-x": "gradient-x 5s ease infinite",
        "bounce-x": "bounce-x 1s infinite",
        fadeInUp: "fadeInUp 0.5s ease-out",
        slide: "slide 20s linear infinite",
        shine: "shine 3s infinite",
        glow: "glow 2s ease-in-out infinite",
        "scroll-offer": "scrollOffer 15s linear infinite",
      },
    },
  },
  plugins: [],
};

export default config;
