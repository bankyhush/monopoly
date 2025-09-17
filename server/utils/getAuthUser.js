import { prisma } from "../database/prisma.js";

import { verifyAccessToken } from "./jwt.js";

export async function getAuthUser(event) {
  try {
    const token = getCookie(event, "accessToken");
    if (!token) return null;

    const payload = verifyAccessToken(token);
    if (!payload?.sub) return null;

    const user = await prisma.user.findUnique({
      where: { userId: Number(payload.sub) },
      select: { userId: true, email: true, role: true, name: true },
    });
    return user;
  } catch {
    return null;
  }
}
