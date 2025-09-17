import { prisma } from "../../database/prisma";
import bcrypt from "bcryptjs";
import { signAccessToken, signRefreshToken } from "../../utils/jwt";

export default defineEventHandler(async (event) => {
  try {
    const body = await readBody(event);
    const { email, password } = body;

    if (!email || !password) {
      throw createError({
        statusCode: 400,
        message: "Email and password required",
      });
    }

    const user = await prisma.user.findUnique({ where: { email } });
    if (!user) {
      throw createError({ statusCode: 401, message: "Invalid credentials" });
    }

    const validPassword = await bcrypt.compare(password, user.password);
    if (!validPassword) {
      throw createError({ statusCode: 401, message: "Invalid credentials" });
    }

    // Generate tokens
    const accessToken = signAccessToken(user);
    const refreshToken = signRefreshToken(user);

    // Set cookies
    setCookie(event, "accessToken", accessToken, {
      httpOnly: true,
      sameSite: "strict",
      secure: process.env.NODE_ENV === "production",
      path: "/",
      maxAge: 60 * 15, // 15 minutes
    });

    setCookie(event, "refreshToken", refreshToken, {
      httpOnly: true,
      sameSite: "strict",
      secure: process.env.NODE_ENV === "production",
      path: "/",
      maxAge: 60 * 60 * 24 * 7, // 7 days
    });

    return {
      message: "Login successful",
      user: {
        id: user.userId,
        fullname: user.fullname,
        email: user.email,
        role: user.role,
      },
    };
  } catch (error) {
    // console.error("Login Error:", error);
    throw createError({
      statusCode: error.statusCode || 500,
      statusMessage: error.statusMessage || "Login Server Error",
      message: error.message || "An unexpected error occurred during login",
    });
  }
});
