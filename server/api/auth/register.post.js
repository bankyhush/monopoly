import { prisma } from "../../database/prisma";
import bcrypt from "bcryptjs";
import { nanoid } from "nanoid";
import { sendMail } from "../../email/mailer";

export default defineEventHandler(async (event) => {
  try {
    const body = await readBody(event);
    let { name, email, password } = body;

    // Normalize email
    const normalizedEmail = email?.trim().toLowerCase();

    // Field validation
    if (!normalizedEmail || !name || !password) {
      throw createError({
        statusCode: 400,
        statusMessage: "All fields are required",
      });
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(normalizedEmail)) {
      throw createError({
        statusCode: 400,
        statusMessage: "Invalid email address",
      });
    }

    if (password.length < 8) {
      throw createError({
        statusCode: 400,
        statusMessage: "Password must be at least 8 characters",
      });
    }

    // Check for existing user
    const existingUser = await prisma.user.findUnique({
      where: { email: normalizedEmail },
    });

    if (existingUser) {
      throw createError({
        statusCode: 400,
        statusMessage: "Email already registered",
      });
    }

    // Generate data
    const walletAddress = `NX0${nanoid(31)}`;
    const inviteCode = nanoid(8);
    const otp = Math.floor(100000 + Math.random() * 900000).toString();
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create user
    const user = await prisma.user.create({
      data: {
        name,
        email: normalizedEmail,
        password: hashedPassword,
        role: "USER",
        walletAddress,
        inviteCode,
        otp,
      },
      select: {
        id: true,
        name: true,
        email: true,
        role: true,
        walletAddress: true,
        inviteCode: true,
      },
    });

    // Create coin balances
    const coins = await prisma.coin.findMany({
      where: { coinVisible: true },
      select: { id: true },
    });

    await prisma.userBalance.createMany({
      data: coins.map((coin) => ({
        userId: user.id,
        coinId: coin.id,
        available: 0,
        onOrder: 0,
        staked: 0,
      })),
    });

    // Send OTP email
    const emailHtml = `
      <p>Hi ${user.name},</p>
      <p>Thank you for registering. Please use the OTP below to verify your email:</p>
      <h2>${otp}</h2>
      <p>This code will expire in 10 minutes.</p>
    `;

    await sendMail({
      to: user.email,
      subject: "Verify your email - OTP Code",
      html: emailHtml,
    });

    return {
      message:
        "Registration successful. Please verify email with the OTP sent.",
      user,
    };
  } catch (error) {
    console.error("Registration Error:", error);

    throw createError({
      statusCode: error.statusCode || 500,
      statusMessage: error.statusMessage || "Internal Server Error",
    });
  }
});
