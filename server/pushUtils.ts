import webpush from "web-push";
import { db } from "./db";
import { pushSubscriptions, users } from "@shared/schema";
import { eq } from "drizzle-orm";

const vapidPublicKey = process.env.PUSH_PUB || "";
const vapidPrivateKey = process.env.PUSH_PRIV || "";
const vapidSubject = "mailto:admin@vungtau.blog";

let pushConfigured = false;
if (vapidPublicKey && vapidPrivateKey) {
  try {
    webpush.setVapidDetails(vapidSubject, vapidPublicKey, vapidPrivateKey);
    pushConfigured = true;
  } catch (e) {}
}

const PUSH_OPTIONS = { TTL: 86400 };

export async function sendAdminPushNotifications(title: string, body: string, url: string = "/admin/chat") {
  if (!pushConfigured) return;
  try {
    const adminUsers = await db.select({ id: users.id }).from(users).where(eq(users.isAdmin, true));
    const ADMIN_ID_ENV = process.env.ADMIN_USER_ID || "";
    const envAdminIds = ADMIN_ID_ENV ? ADMIN_ID_ENV.split(",").map(id => id.trim()) : [];
    const allAdminIds = Array.from(new Set([...adminUsers.map(u => u.id), ...envAdminIds].filter(Boolean)));

    const allSubs = await db.select().from(pushSubscriptions);
    const adminSubs = allSubs.filter(sub => allAdminIds.includes(sub.userId));

    const payload = JSON.stringify({ title, body, url });

    const targets = adminSubs.length > 0 ? adminSubs : allSubs;
    for (const sub of targets) {
      try {
        await webpush.sendNotification(
          { endpoint: sub.endpoint, keys: { p256dh: sub.p256dh, auth: sub.auth } },
          payload,
          PUSH_OPTIONS
        );
      } catch (err: any) {
        if (err.statusCode === 410 || err.statusCode === 404) {
          await db.delete(pushSubscriptions).where(eq(pushSubscriptions.endpoint, sub.endpoint));
        }
      }
    }
  } catch (err) {
    console.error("[PUSH-ADMIN] error:", err);
  }
}
