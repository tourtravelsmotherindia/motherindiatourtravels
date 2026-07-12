import { requireAdmin } from "../middleware/auth";
import type { Env } from "../types";

/** POST /upload — admin only, puts file to R2 Object Storage */
export async function handleUpload(request: Request, env: Env): Promise<Response> {
  try {
    await requireAdmin(request, env);
  } catch (authResponse) {
    return authResponse as Response;
  }

  let formData: FormData;
  try {
    formData = await request.formData();
  } catch {
    return Response.json({ error: "Expected multipart/form-data" }, { status: 400 });
  }

  const file = formData.get("file");
  if (!file || !(file instanceof Blob)) {
    return Response.json({ error: "file field is required" }, { status: 400 });
  }

  const folder = (formData.get("folder") as string) || "mother-india";
  const name = (file as any).name || "upload";
  const cleanName = name.replace(/[^a-zA-Z0-9.-]/g, "_");
  const uniqueId = Math.random().toString(36).substring(2, 10);
  const key = `${folder}/${Date.now()}_${uniqueId}_${cleanName}`;

  try {
    await env.BUCKET.put(key, file.stream(), {
      httpMetadata: {
        contentType: file.type || "application/octet-stream",
        cacheControl: "public, max-age=2592000", // 30 days cache
      },
    });
  } catch (err) {
    console.error("R2 upload failed:", err);
    return Response.json({ error: "Upload to R2 Object Storage failed" }, { status: 500 });
  }

  const imagesBase = "https://images.motherindiatourtravels.com";
  const publicUrl = `${imagesBase}/${key}`;

  return Response.json({
    public_id: key,
    url: publicUrl,
    bytes: file.size,
  });
}
