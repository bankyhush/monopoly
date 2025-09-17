import { prisma } from "../database/prisma.js";

import { verifyAccessToken } from "./jwt.js";

export async function getAuthUser(event) {
  try {
    const token = getCookie(event, "accessToken");
    if (!token) return null;

    const payload = verifyAccessToken(token);
    if (!payload?.sub) return null;

    const user = await prisma.user.findUnique({
      where: { id: Number(payload.sub) },
      select: { id: true, email: true, role: true, name: true },
    });
    return user;
  } catch {
    return null;
  }
}
