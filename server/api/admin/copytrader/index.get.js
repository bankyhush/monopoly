// server/api/admin/copytrader/index.get.js

import { prisma } from "../../../database/prisma";
import { getAuthUser } from "../../../utils/getAuthUser";

export default defineEventHandler(async (event) => {
  const user = await getAuthUser(event);
  if (!user || user.role !== "ADMIN") {
    throw createError({
      statusCode: 403,
      message: "Access denied: vip user only",
    });
  }
  try {
    const data = await prisma.copytrader.findMany({
      orderBy: {
        created_at: "desc",
      },
    });

    return {
      success: true,
      data,
    };
  } catch (error) {
    throw createError({
      statusCode: 500,
      message: error.message || "Internal server error",
    });
  }
});
