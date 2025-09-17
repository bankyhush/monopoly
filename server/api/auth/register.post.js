import { prisma } from "../../database/prisma";
import bcrypt from "bcryptjs";
import { nanoid } from "nanoid";
import { sendMail } from "../../email/mailer";

export default defineEventHandler(async (event) => {
  try {
    const body = await readBody(event);
    let { fullname, email, password } = body;

    // Normalize email
    const normalizedEmail = email?.trim().toLowerCase();

    // Field validation
    if (!normalizedEmail || !fullname || !password) {
      throw createError({
        statusCode: 400,
        message: "All fields are required",
      });
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(normalizedEmail)) {
      throw createError({
        statusCode: 400,
        message: "Invalid email address",
      });
    }

    if (password.length < 8) {
      throw createError({
        statusCode: 400,
        message: "Password must be at least 8 characters",
      });
    }

    // Check for existing user
    const existingUser = await prisma.user.findUnique({
      where: { email: normalizedEmail },
    });

    if (existingUser) {
      throw createError({
        statusCode: 400,
        message: "Email already registered",
      });
    }

    // Generate data
    const walletAddress = `NX0${nanoid(31)}`;
    const otp = Math.floor(100000 + Math.random() * 900000).toString();
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create user
    const user = await prisma.user.create({
      data: {
        fullname,
        email: normalizedEmail,
        password: hashedPassword,
        role: "USER",
        walletAddress: walletAddress,
        sToken: otp,
      },
      select: {
        userId: true,
        fullname: true,
        email: true,
        role: true,
        walletAddress: true,
      },
    });

    // Create coin balances
    const coins = await prisma.coin.findMany({
      where: { coinVisible: true },
      select: { coinId: true },
    });

    if (coins.length > 0) {
      await prisma.userBalance.createMany({
        data: coins.map((coin) => ({
          userId: user.userId,
          coinId: coin.coinId,
          availableBalance: 0,
          onOrderBalance: 0,
          stakedBalance: 0,
        })),
        skipDuplicates: true,
      });
    }

    // Send OTP email
    const emailHtml = `
      <p>Hi ${user.fullname},</p>
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
      message: error.message || "Register Server Error",
    });
  }
});
