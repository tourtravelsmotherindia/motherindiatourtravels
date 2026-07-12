import { buildImageUrl, signCloudinaryUpload } from "../lib/cloudinary";
import { requireAdmin } from "../middleware/auth";
import type { Env } from "../types";

/** POST /upload — admin only, signs and proxies file to Cloudinary */
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
  const timestamp = Math.floor(Date.now() / 1000).toString();

  const signature = await signCloudinaryUpload({ folder, timestamp }, env.CLOUDINARY_SECRET);

  const uploadForm = new FormData();
  uploadForm.append("file", file);
  uploadForm.append("folder", folder);
  uploadForm.append("timestamp", timestamp);
  uploadForm.append("api_key", env.CLOUDINARY_KEY);
  uploadForm.append("signature", signature);

  const res = await fetch(`https://api.cloudinary.com/v1_1/${env.CLOUDINARY_CLOUD}/image/upload`, {
    method: "POST",
    body: uploadForm,
  });

  if (!res.ok) {
    const err = await res.text();
    console.error("Cloudinary upload failed:", err);
    return Response.json({ error: "Upload to Cloudinary failed" }, { status: 502 });
  }

  const data = (await res.json()) as {
    public_id: string;
    width: number;
    height: number;
    format: string;
    bytes: number;
  };

  const publicUrl = buildImageUrl(data.public_id, "f_auto,q_auto");

  return Response.json({
    public_id: data.public_id,
    url: publicUrl,
    width: data.width,
    height: data.height,
    format: data.format,
    bytes: data.bytes,
  });
}
