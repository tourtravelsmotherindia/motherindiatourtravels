# Stage 1: Install dependencies
FROM node:22-alpine AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

# Install dependencies based on the preferred package manager
COPY package.json package-lock.json ./
RUN --mount=type=cache,target=/root/.npm npm ci

# Stage 2: Rebuild the source code only when needed
FROM node:22-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Enable Prisma client generation and production build
ENV NODE_ENV=production

# Expose build-time arguments (essential for Next.js static data fetching at build time)
ARG DATABASE_URL
ARG DIRECT_URL
ARG NEXT_PUBLIC_MAPTILER_KEY

ENV DATABASE_URL=$DATABASE_URL
ENV DIRECT_URL=$DIRECT_URL
ENV NEXT_PUBLIC_MAPTILER_KEY=$NEXT_PUBLIC_MAPTILER_KEY

# Build the application
# We mount Next.js build cache to speed up subsequent builds
RUN --mount=type=cache,target=/app/.next/cache npm run build

# Stage 3: Runner stage using Nginx (Non-root for security)
FROM nginx:stable-alpine

# Update Nginx config to run on port 8080 as non-root
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy static assets from builder stage
COPY --from=builder /app/out /usr/share/nginx/html

# Adjust permissions for non-root execution
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /var/cache/nginx /var/log/nginx /usr/share/nginx/html

USER nginx

EXPOSE 8080

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
