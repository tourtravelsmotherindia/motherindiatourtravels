import {
  handleAdminBookingsGet,
  handleAdminBookingsUpdateStatus,
  handleAdminContactsGet,
  handleAdminContactsUpdateStatus,
  handleDeploy,
  handleDeployStatus,
} from "./handlers/admin";
import {
  handleAdminCrudCreate,
  handleAdminCrudDelete,
  handleAdminCrudGet,
  handleAdminCrudUpdate,
} from "./handlers/admin-crud";
import { handleLogin, handleSignup, handleCheckInit, handleRefresh } from "./handlers/auth-handler";
import {
  handleBlogsCreate,
  handleBlogsDelete,
  handleBlogsGet,
  handleBlogsUpdate,
} from "./handlers/blogs";
import { handleBooking } from "./handlers/booking";
import { handleCompanyGet, handleCompanyUpdate } from "./handlers/company";
import { handleContact } from "./handlers/contact";
import {
  handleDestinationsCreate,
  handleDestinationsDelete,
  handleDestinationsGet,
  handleDestinationsUpdate,
} from "./handlers/destinations";
import {
  handleFaqsCreate,
  handleFaqsDelete,
  handleFaqsGet,
  handleFaqsUpdate,
} from "./handlers/faqs";
import {
  handleGalleryCreate,
  handleGalleryDelete,
  handleGalleryGet,
  handleGalleryUpdate,
} from "./handlers/gallery";
import { handleHeroGet, handleHeroUpdate } from "./handlers/hero";
import { handleNewsletter } from "./handlers/newsletter";
import { handleSiteSectionsGet, handleSiteSectionsUpdate } from "./handlers/site-sections";
import {
  handleTestimonialsCreate,
  handleTestimonialsDelete,
  handleTestimonialsGet,
  handleTestimonialsUpdate,
} from "./handlers/testimonials";
import {
  handleToursCreate,
  handleToursDelete,
  handleToursGet,
  handleToursUpdate,
} from "./handlers/tours";
import { handleUpload } from "./handlers/upload";
import { handleOptions, withCors } from "./middleware/cors";
import type { Env } from "./types";
import {
  handleCronPing,
  handleCronPingRequest,
  handleAdminSystemStatusPing,
} from "./handlers/cron-ping";

export default {
  async fetch(request: Request, env: Env, ctx: ExecutionContext): Promise<Response> {
    const url = new URL(request.url);
    const origin = request.headers.get("origin");

    // Handle CORS preflight
    const preflight = handleOptions(request, env.ALLOWED_ORIGIN, env.ENVIRONMENT);
    if (preflight) return preflight;

    let response: Response;

    try {
      response = await route(request, url, env, ctx);
    } catch (err) {
      console.error("Unhandled error:", err);
      response = Response.json({ error: "Internal server error" }, { status: 500 });
    }

    return withCors(response, env.ALLOWED_ORIGIN, origin, env.ENVIRONMENT);
  },

  async scheduled(controller: ScheduledController, env: Env, ctx: ExecutionContext): Promise<void> {
    ctx.waitUntil(handleCronPing(env));
  },
} satisfies ExportedHandler<Env>;

async function route(
  request: Request,
  url: URL,
  env: Env,
  ctx: ExecutionContext,
): Promise<Response> {
  const method = request.method.toUpperCase();
  // Segments: ['', 'resource', 'id', ...]
  const parts = url.pathname.split("/");
  const resource = parts[1]; // e.g. 'booking', 'tours', 'admin'
  const sub = parts[2]; // e.g. id or sub-resource
  const subsub = parts[3]; // e.g. 'status'

  // Health / Status
  if ((!resource || resource === "health") && method === "GET") {
    return Response.json({
      status: "healthy",
      worker: "api-worker",
      environment: env.ENVIRONMENT || "production",
      timestamp: Date.now(),
    });
  }

  // Keep Alive / Health Cron
  if (resource === "cron-ping" && (method === "GET" || method === "POST")) {
    return handleCronPingRequest(request, env);
  }

  // Auth
  if (resource === "auth") {
    if (sub === "login" && method === "POST") {
      return handleLogin(request, env);
    }
    if (sub === "signup" && method === "POST") {
      return handleSignup(request, env);
    }
    if (sub === "check-init" && method === "GET") {
      return handleCheckInit(request, env);
    }
    if (sub === "refresh" && method === "POST") {
      return handleRefresh(request, env);
    }
  }

  // Public form endpoints
  if (resource === "booking" && method === "POST") return handleBooking(request, env, ctx);
  if (resource === "contact" && method === "POST") return handleContact(request, env, ctx);
  if (resource === "newsletter" && method === "POST") return handleNewsletter(request, env);

  // Upload (admin)
  if (resource === "upload" && method === "POST") return handleUpload(request, env);

  // Deploy (admin)
  if (resource === "deploy") {
    if (method === "POST") return handleDeploy(request, env);
    if (method === "GET") return handleDeployStatus(request, env);
  }

  // Tours (Package)
  if (resource === "tours") {
    if (method === "GET") return handleToursGet(url, env);
    if (method === "POST") return handleToursCreate(request, env);
    if (method === "PATCH") return handleToursUpdate(request, url, env);
    if (method === "DELETE") return handleToursDelete(request, url, env);
  }

  // Gallery
  if (resource === "gallery") {
    if (method === "GET") return handleGalleryGet(url, env);
    if (method === "POST") return handleGalleryCreate(request, env);
    if (method === "PATCH") return handleGalleryUpdate(request, url, env);
    if (method === "DELETE") return handleGalleryDelete(request, url, env);
  }

  // Destinations
  if (resource === "destinations") {
    if (method === "GET") return handleDestinationsGet(url, env);
    if (method === "POST") return handleDestinationsCreate(request, env);
    if (method === "PATCH") return handleDestinationsUpdate(request, url, env);
    if (method === "DELETE") return handleDestinationsDelete(request, url, env);
  }

  // FAQs
  if (resource === "faqs") {
    if (method === "GET") return handleFaqsGet(env);
    if (method === "POST") return handleFaqsCreate(request, env);
    if (method === "PATCH") return handleFaqsUpdate(request, url, env);
    if (method === "DELETE") return handleFaqsDelete(request, url, env);
  }

  // Blogs
  if (resource === "blogs") {
    if (method === "GET") return handleBlogsGet(url, env);
    if (method === "POST") return handleBlogsCreate(request, env);
    if (method === "PATCH") return handleBlogsUpdate(request, url, env);
    if (method === "DELETE") return handleBlogsDelete(request, url, env);
  }

  // Testimonials
  if (resource === "testimonials") {
    if (method === "GET") return handleTestimonialsGet(url, env);
    if (method === "POST") return handleTestimonialsCreate(request, env);
    if (method === "PATCH") return handleTestimonialsUpdate(request, url, env);
    if (method === "DELETE") return handleTestimonialsDelete(request, url, env);
  }

  // Site Sections
  if (resource === "site-sections") {
    if (method === "GET") return handleSiteSectionsGet(url, env);
    if (method === "PATCH") return handleSiteSectionsUpdate(request, url, env);
  }

  // Hero
  if (resource === "hero") {
    if (method === "GET") return handleHeroGet(env);
    if (method === "PATCH") return handleHeroUpdate(request, env);
  }

  // Company
  if (resource === "company") {
    if (method === "GET") return handleCompanyGet(env);
    if (method === "PATCH") return handleCompanyUpdate(request, env);
  }

  // Admin
  if (resource === "admin") {
    if (sub === "bookings") {
      if (method === "GET" && !subsub) return handleAdminBookingsGet(request, env);
      if (method === "PATCH" && subsub === "status")
        return handleAdminBookingsUpdateStatus(request, url, env);
    }
    if (sub === "contacts") {
      if (method === "GET" && !subsub) return handleAdminContactsGet(request, env);
      if (method === "PATCH" && subsub === "status")
        return handleAdminContactsUpdateStatus(request, url, env);
    }
    if (sub === "crud") {
      if (method === "GET") return handleAdminCrudGet(request, url, env);
      if (method === "POST") return handleAdminCrudCreate(request, url, env);
      if (method === "PATCH") return handleAdminCrudUpdate(request, url, env);
      if (method === "DELETE") return handleAdminCrudDelete(request, url, env);
    }
    if (sub === "system-status" && subsub === "ping" && method === "POST") {
      return handleAdminSystemStatusPing(request, env);
    }
  }

  return Response.json({ error: "Not found" }, { status: 404 });
}
