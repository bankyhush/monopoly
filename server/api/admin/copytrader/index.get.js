// server/api/admin/copytrader/index.get.js

import { prisma } from "../../../database/prisma";

export default defineEventHandler(async (event) => {
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
