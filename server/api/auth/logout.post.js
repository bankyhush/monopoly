import { prisma } from "../../database/prisma";

export default defineEventHandler(async (event) => {
  try {
    // Clear cookies (match options used on set)
    setCookie(event, "accessToken", "", {
      maxAge: 0,
      path: "/",
      httpOnly: true,
      sameSite: "strict",
      secure: process.env.NODE_ENV === "production",
    });

    setCookie(event, "refreshToken", "", {
      maxAge: 0,
      path: "/",
      httpOnly: true,
      sameSite: "strict",
      secure: process.env.NODE_ENV === "production",
    });

    return { success: true, message: "Logout successful!" };
  } catch (error) {
    console.error("Logout error:", error);
    throw createError({
      statusCode: 500,
      message: "Logout failed",
    });
  }
});
