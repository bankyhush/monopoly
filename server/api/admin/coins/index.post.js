// server/api/admin/coins.js

import { prisma } from "../../../database/prisma";

export default defineEventHandler(async (event) => {
  const body = await readBody(event);

  const {
    coinName,
    coinTitle,
    coinRate,
    photo,
    withMin,
    withMax,
    withInstructions,
    depositInstructions,
    depositAddress,
    percent,
    coinVisible = true,
  } = body;

  // Simple validation
  if (!coinName || !coinTitle || !coinRate || !photo) {
    throw createError({
      statusCode: 400,
      message: "Missing required fields",
    });
  }

  try {
    // Create the coin
    const coin = await prisma.coin.create({
      data: {
        coinName,
        coinTitle,
        coinRate: parseFloat(coinRate),
        photo,
        withMin,
        withMax,
        withInstructions,
        depositInstructions,
        depositAddress,
        percent,
        coinVisible: Boolean(coinVisible),
      },
    });

    // Fetch all users
    const users = await prisma.user.findMany({
      select: { userId: true },
    });

    // Prepare balance entries
    const balances = users.map((u) => ({
      userId: u.userId,
      coinId: coin.coinId,
      availableBalance: 0,
      onOrderBalance: 0,
      stakedBalance: 0,
    }));

    // Create user balances for the new coin
    if (balances.length > 0) {
      await prisma.userBalance.createMany({
        data: balances,
        skipDuplicates: true,
      });
    }

    return {
      success: true,
      message: "New coin created successfully!",
      data: coin,
    };
  } catch (error) {
    console.error("Coin creation error:", error);
    throw createError({
      statusCode: 500,
      message: "Coin Server Error",
    });
  }
});
