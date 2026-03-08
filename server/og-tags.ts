import { db } from "./db";
import { eq } from "drizzle-orm";
import { posts, siteSettings, places, realEstateListings, villas, shopProducts } from "@shared/schema";
import { execSync } from "child_process";
import path from "path";
import fs from "fs";
import os from "os";

const DEFAULT_OG_IMAGE = "https://vungtau.blog/og-image-wide.jpg";
const DEFAULT_OG_IMAGE_WIDTH = 991;
const DEFAULT_OG_IMAGE_HEIGHT = 630;

interface OgData {
  title: string;
  description: string;
  image: string;
  imageWidth?: number;
  imageHeight?: number;
  url: string;
  video?: string;
}

const VIDEO_EXTENSIONS = /\.(mp4|webm|mov|avi|mkv)(\?|$)/i;

function isVideoUrl(url: string): boolean {
  return VIDEO_EXTENSIONS.test(url);
}

function extractFirstImage(content: string): string | null {
  const mdRegex = /!\[([^\]]*)\]\(([^)]+)\)/g;
  let match;
  const mdUrls = new Set<string>();
  while ((match = mdRegex.exec(content)) !== null) {
    const alt = match[1] || "";
    const src = match[2];
    mdUrls.add(src);
    if (alt === "동영상" || alt === "video" || isVideoUrl(src)) continue;
    return src;
  }

  const imgMatch = content.match(/<img[^>]+src=["']([^"']+)["']/i);
  if (imgMatch && !isVideoUrl(imgMatch[1])) return imgMatch[1];

  const urlRegex = /(https?:\/\/[^\s"'<>)]+\/objects\/uploads\/[^\s"'<>)]+)/g;
  let urlMatch;
  while ((urlMatch = urlRegex.exec(content)) !== null) {
    const url = urlMatch[1];
    if (mdUrls.has(url) || isVideoUrl(url)) continue;
    return url;
  }

  return null;
}

function extractFirstVideo(content: string): string | null {
  const mdRegex = /!\[([^\]]*)\]\(([^)]+)\)/g;
  let match;
  while ((match = mdRegex.exec(content)) !== null) {
    const alt = match[1] || "";
    const src = match[2];
    if (alt === "동영상" || alt === "video" || isVideoUrl(src)) return src;
  }
  return null;
}

function stripContent(content: string): string {
  let text = content;
  text = text.replace(/!\[[^\]]*\]\([^)]+\)/g, "");
  text = text.replace(/<[^>]*>/g, "");
  text = text.replace(/&nbsp;/g, " ");
  text = text.replace(/\s+/g, " ");
  return text.trim();
}

async function generateVideoThumbnail(videoUrl: string, postId: number): Promise<string | null> {
  try {
    const tmpDir = os.tmpdir();
    const outPath = path.join(tmpDir, `thumb_${postId}_${Date.now()}.jpg`);
    execSync(`ffmpeg -y -i "${videoUrl}" -ss 0.5 -frames:v 1 -update 1 -q:v 2 "${outPath}"`, { timeout: 30000, stdio: "pipe" });
    if (!fs.existsSync(outPath)) return null;
    const imgBuf = fs.readFileSync(outPath);
    fs.unlinkSync(outPath);
    const metaRes = await fetch("http://localhost:5000/api/uploads/request-url", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name: `thumb_${postId}.jpg`, size: imgBuf.length, contentType: "image/jpeg" }),
    });
    if (!metaRes.ok) return null;
    const metaData = await metaRes.json() as { uploadURL: string; objectPath: string };
    const putRes = await fetch(metaData.uploadURL, { method: "PUT", body: imgBuf, headers: { "Content-Type": "image/jpeg" } });
    if (!putRes.ok) return null;
    await db.update(posts).set({ imageUrl: metaData.objectPath }).where(eq(posts.id, postId));
    console.log(`Auto-generated thumbnail for post ${postId}:`, metaData.objectPath);
    return metaData.objectPath;
  } catch (err) {
    console.error(`Thumbnail generation failed for post ${postId}:`, err);
    return null;
  }
}

async function getPostOgData(postId: number): Promise<OgData | null> {
  try {
    const [post] = await db.select().from(posts).where(eq(posts.id, postId)).limit(1);
    if (!post) return null;

    const contentText = stripContent(post.content).slice(0, 200);
    let postImage = post.imageUrl || extractFirstImage(post.content);
    const postVideo = extractFirstVideo(post.content);

    if (!postImage && postVideo) {
      const thumbUrl = await generateVideoThumbnail(postVideo, post.id);
      if (thumbUrl) {
        postImage = `https://vungtau.blog${thumbUrl}`;
      }
    }

    if (postImage && !postImage.startsWith("http")) {
      postImage = `https://vungtau.blog${postImage}`;
    }

    const image = postImage || DEFAULT_OG_IMAGE;

    return {
      title: `${post.title} - 붕따우 도깨비`,
      description: contentText || "베트남 붕따우 여행의 모든것",
      image,
      imageWidth: postImage ? undefined : DEFAULT_OG_IMAGE_WIDTH,
      imageHeight: postImage ? undefined : DEFAULT_OG_IMAGE_HEIGHT,
      url: `https://vungtau.blog/board/${post.id}`,
      video: postVideo || undefined,
    };
  } catch {
    return null;
  }
}

export function injectOgTags(html: string, og: OgData): string {
  html = html.replace(
    /<meta property="og:title" content="[^"]*"\s*\/?>/,
    `<meta property="og:title" content="${escapeHtml(og.title)}" />`
  );
  html = html.replace(
    /<meta property="og:description" content="[^"]*"\s*\/?>/,
    `<meta property="og:description" content="${escapeHtml(og.description)}" />`
  );
  const imageMetaExtra = [];
  if (og.imageWidth && og.imageHeight) {
    imageMetaExtra.push(`<meta property="og:image:width" content="${og.imageWidth}" />`);
    imageMetaExtra.push(`<meta property="og:image:height" content="${og.imageHeight}" />`);
  }

  html = html.replace(
    /<meta property="og:image" content="[^"]*"\s*\/?>/,
    `<meta property="og:image" content="${escapeHtml(og.image)}" />\n    ${imageMetaExtra.join("\n    ")}`
  );
  const imgType = og.image.match(/\.png(\?|$)/i) ? "image/png" : og.image.match(/\.gif(\?|$)/i) ? "image/gif" : og.image.match(/\.webp(\?|$)/i) ? "image/webp" : "image/jpeg";
  html = html.replace(
    /<meta property="og:image:type" content="[^"]*"\s*\/?>/,
    `<meta property="og:image:type" content="${imgType}" />`
  );
  html = html.replace(
    /<meta property="og:url" content="[^"]*"\s*\/?>/,
    `<meta property="og:url" content="${escapeHtml(og.url)}" />`
  );
  html = html.replace(
    /<meta property="og:type" content="[^"]*"\s*\/?>/,
    `<meta property="og:type" content="article" />`
  );
  if (og.video) {
    const videoMeta = `\n    <meta property="og:video" content="${escapeHtml(og.video)}" />\n    <meta property="og:video:type" content="video/mp4" />\n    <meta property="og:video:width" content="720" />\n    <meta property="og:video:height" content="1280" />`;
    html = html.replace(
      /<meta property="og:locale" content="ko_KR"\s*\/?>/,
      `<meta property="og:locale" content="ko_KR" />${videoMeta}`
    );
  }
  html = html.replace(
    /<meta name="twitter:title" content="[^"]*"\s*\/?>/,
    `<meta name="twitter:title" content="${escapeHtml(og.title)}" />`
  );
  html = html.replace(
    /<meta name="twitter:description" content="[^"]*"\s*\/?>/,
    `<meta name="twitter:description" content="${escapeHtml(og.description)}" />`
  );
  html = html.replace(
    /<meta name="twitter:image" content="[^"]*"\s*\/?>/,
    `<meta name="twitter:image" content="${escapeHtml(og.image)}" />`
  );
  html = html.replace(
    /<title>[^<]*<\/title>/,
    `<title>${escapeHtml(og.title)}</title>`
  );

  return html;
}

function escapeHtml(str: string): string {
  return str.replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
}

function isAccessibleImagePath(p: string): boolean {
  if (!p) return false;
  if (p.startsWith("http")) return true;
  if (p.startsWith("/@fs/") || p.startsWith("/attached_assets/")) return false;
  return true;
}

async function getPlaceOgDataById(placeId: number): Promise<OgData | null> {
  try {
    const [place] = await db.select().from(places).where(eq(places.id, placeId)).limit(1);
    if (!place) return null;
    let image: string | null = null;
    if (place.mainImage && isAccessibleImagePath(place.mainImage)) {
      image = place.mainImage;
    } else if (place.images && place.images.length > 0) {
      const found = place.images.find(img => isAccessibleImagePath(img));
      if (found) image = found;
    }
    if (image && !image.startsWith("http")) {
      image = `https://vungtau.blog${image}`;
    }
    if (!image) image = DEFAULT_OG_IMAGE;
    const desc = place.description ? stripContent(place.description).slice(0, 200) : "베트남 붕따우 여행 관광명소";
    return {
      title: `${place.name} - 붕따우 도깨비`,
      description: desc,
      image,
      imageWidth: image === DEFAULT_OG_IMAGE ? DEFAULT_OG_IMAGE_WIDTH : undefined,
      imageHeight: image === DEFAULT_OG_IMAGE ? DEFAULT_OG_IMAGE_HEIGHT : undefined,
      url: `https://vungtau.blog/guide?p=${placeId}`,
    };
  } catch {
    return null;
  }
}

async function getPlaceOgData(placeName: string): Promise<OgData | null> {
  try {
    const [place] = await db.select().from(places).where(eq(places.name, placeName)).limit(1);
    if (!place) return null;
    let image: string | null = null;
    if (place.mainImage && isAccessibleImagePath(place.mainImage)) {
      image = place.mainImage;
    } else if (place.images && place.images.length > 0) {
      const found = place.images.find(img => isAccessibleImagePath(img));
      if (found) image = found;
    }
    if (image && !image.startsWith("http")) {
      image = `https://vungtau.blog${image}`;
    }
    if (!image) image = DEFAULT_OG_IMAGE;
    const desc = place.description ? stripContent(place.description).slice(0, 200) : "베트남 붕따우 여행 관광명소";
    return {
      title: `${place.name} - 붕따우 도깨비`,
      description: desc,
      image,
      imageWidth: image === DEFAULT_OG_IMAGE ? DEFAULT_OG_IMAGE_WIDTH : undefined,
      imageHeight: image === DEFAULT_OG_IMAGE ? DEFAULT_OG_IMAGE_HEIGHT : undefined,
      url: `https://vungtau.blog/guide?place=${encodeURIComponent(place.name)}`,
    };
  } catch {
    return null;
  }
}

async function getRealEstateOgDataById(listingId: number): Promise<OgData | null> {
  try {
    const [listing] = await db.select().from(realEstateListings).where(eq(realEstateListings.id, listingId)).limit(1);
    if (!listing) return null;
    let image: string | null = null;
    if (listing.mainImage && isAccessibleImagePath(listing.mainImage)) {
      image = listing.mainImage;
    } else if (listing.images && listing.images.length > 0) {
      const found = listing.images.find(img => isAccessibleImagePath(img));
      if (found) image = found;
    }
    if (image && !image.startsWith("http")) {
      image = `https://vungtau.blog${image}`;
    }
    if (!image) image = DEFAULT_OG_IMAGE;
    const desc = listing.description ? stripContent(listing.description).slice(0, 200) : "베트남 붕따우 부동산 매물";
    return {
      title: `${listing.name} - 붕따우 부동산`,
      description: desc,
      image,
      imageWidth: image === DEFAULT_OG_IMAGE ? DEFAULT_OG_IMAGE_WIDTH : undefined,
      imageHeight: image === DEFAULT_OG_IMAGE ? DEFAULT_OG_IMAGE_HEIGHT : undefined,
      url: `https://vungtau.blog/realestate?p=${listingId}`,
    };
  } catch {
    return null;
  }
}

async function getVillaOgDataById(villaId: number): Promise<OgData | null> {
  try {
    const [villa] = await db.select().from(villas).where(eq(villas.id, villaId)).limit(1);
    if (!villa) return null;
    let image: string | null = null;
    if (villa.mainImage && isAccessibleImagePath(villa.mainImage)) {
      image = villa.mainImage;
    } else if (villa.images && villa.images.length > 0) {
      const found = villa.images.find(img => isAccessibleImagePath(img));
      if (found) image = found;
    }
    if (image && !image.startsWith("http")) {
      image = `https://vungtau.blog${image}`;
    }
    if (!image) image = DEFAULT_OG_IMAGE;
    const parts: string[] = [];
    if (villa.bedrooms) parts.push(`${villa.bedrooms}개 침실`);
    if (villa.maxGuests) parts.push(`최대 ${villa.maxGuests}명`);
    if (villa.weekdayPrice) parts.push(`평일 $${villa.weekdayPrice}`);
    const desc = parts.length > 0 ? parts.join(" | ") : "베트남 붕따우 풀빌라";
    return {
      title: `${villa.name} - 붕따우 풀빌라`,
      description: desc,
      image,
      imageWidth: image === DEFAULT_OG_IMAGE ? DEFAULT_OG_IMAGE_WIDTH : undefined,
      imageHeight: image === DEFAULT_OG_IMAGE ? DEFAULT_OG_IMAGE_HEIGHT : undefined,
      url: `https://vungtau.blog/?villa=${villaId}`,
    };
  } catch {
    return null;
  }
}

async function getShopProductOgDataById(productId: number): Promise<OgData | null> {
  try {
    const [product] = await db.select().from(shopProducts).where(eq(shopProducts.id, productId)).limit(1);
    if (!product) return null;
    let image: string | null = null;
    if (product.image && isAccessibleImagePath(product.image)) {
      image = product.image;
    } else if (product.images && product.images.length > 0) {
      const found = product.images.find(img => img && isAccessibleImagePath(img));
      if (found) image = found;
    }
    if (image && !image.startsWith("http")) {
      image = `https://vungtau.blog${image}`;
    }
    if (!image) image = DEFAULT_OG_IMAGE;
    const parts: string[] = [];
    if (product.brand) parts.push(product.brand);
    if (product.price) parts.push(`${product.price.toLocaleString()}원`);
    if (product.quantity) parts.push(product.quantity);
    const benefits = (product.benefits || []) as string[];
    if (benefits.length > 0) parts.push(benefits.slice(0, 2).join(", "));
    const desc = parts.length > 0 ? parts.join(" | ") : "베트남 프리미엄 제품";
    return {
      title: `${product.name} - 붕따우 쇼핑`,
      description: desc,
      image,
      imageWidth: image === DEFAULT_OG_IMAGE ? DEFAULT_OG_IMAGE_WIDTH : undefined,
      imageHeight: image === DEFAULT_OG_IMAGE ? DEFAULT_OG_IMAGE_HEIGHT : undefined,
      url: `https://vungtau.blog/diet?product=${productId}`,
    };
  } catch {
    return null;
  }
}

export async function getOgDataForPath(urlPath: string): Promise<OgData | null> {
  const villaMatch = urlPath.match(/^\/?(\?|$)/);
  if (villaMatch) {
    try {
      const url = new URL(urlPath, "https://vungtau.blog");
      const villaId = url.searchParams.get("villa");
      if (villaId) {
        return getVillaOgDataById(parseInt(villaId, 10));
      }
    } catch {}
  }
  const boardMatch = urlPath.match(/^\/board\/(\d+)/);
  if (boardMatch) {
    const postId = parseInt(boardMatch[1], 10);
    return getPostOgData(postId);
  }
  const realEstateMatch = urlPath.match(/^\/realestate/);
  if (realEstateMatch) {
    try {
      const url = new URL(urlPath, "https://vungtau.blog");
      const listingId = url.searchParams.get("p");
      if (listingId) {
        return getRealEstateOgDataById(parseInt(listingId, 10));
      }
    } catch {}
  }
  const shopMatch = urlPath.match(/^\/diet/);
  if (shopMatch) {
    try {
      const url = new URL(urlPath, "https://vungtau.blog");
      const productId = url.searchParams.get("product");
      if (productId) {
        return getShopProductOgDataById(parseInt(productId, 10));
      }
    } catch {}
  }
  const guideMatch = urlPath.match(/^\/guide/);
  if (guideMatch) {
    try {
      const url = new URL(urlPath, "https://vungtau.blog");
      const placeId = url.searchParams.get("p");
      if (placeId) {
        return getPlaceOgDataById(parseInt(placeId, 10));
      }
      const placeName = url.searchParams.get("place");
      if (placeName) {
        return getPlaceOgData(decodeURIComponent(placeName));
      }
    } catch {}
  }
  return null;
}

export async function getSeoSettings(): Promise<Record<string, string>> {
  try {
    const rows = await db.select().from(siteSettings);
    const map: Record<string, string> = {};
    rows.forEach(r => { map[r.key] = r.value; });
    return map;
  } catch {
    return {};
  }
}

export function injectSeoMeta(html: string, settings: Record<string, string>): string {
  const seoTitle = settings["seo_title"];
  const seoDesc = settings["seo_description"];
  const seoKeywords = settings["seo_keywords"];

  if (seoTitle) {
    html = html.replace(/<title>[^<]*<\/title>/, `<title>${escapeHtml(seoTitle)}</title>`);
    html = html.replace(/<meta property="og:title" content="[^"]*"\s*\/?>/, `<meta property="og:title" content="${escapeHtml(seoTitle)}" />`);
    html = html.replace(/<meta name="twitter:title" content="[^"]*"\s*\/?>/, `<meta name="twitter:title" content="${escapeHtml(seoTitle)}" />`);
  }
  if (seoDesc) {
    html = html.replace(/<meta name="description" content="[^"]*"\s*\/?>/, `<meta name="description" content="${escapeHtml(seoDesc)}" />`);
    html = html.replace(/<meta property="og:description" content="[^"]*"\s*\/?>/, `<meta property="og:description" content="${escapeHtml(seoDesc)}" />`);
    html = html.replace(/<meta name="twitter:description" content="[^"]*"\s*\/?>/, `<meta name="twitter:description" content="${escapeHtml(seoDesc)}" />`);
  }
  if (seoKeywords) {
    html = html.replace(/<meta name="keywords" content="[^"]*"\s*\/?>/, `<meta name="keywords" content="${escapeHtml(seoKeywords)}" />`);
  }
  return html;
}

