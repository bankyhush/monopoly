import { prisma } from "../database/prisma";

export default defineEventHandler(async () => {
  try {
    const user = await prisma.user.findFirst();
    return {
      success: true,
      message: "Database connected ✅",
      user: user || null,
    };
  } catch (error) {
    return {
      success: false,
      message: "Database connection failed ❌",
      error: error.message || error,
    };
  }
});
