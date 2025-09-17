// server/api/admin/copytrader/index.post.js

import { prisma } from "../../../database/prisma";

export default defineEventHandler(async (event) => {
  const {
    name,
    photo,
    notrades,
    nocopiers,
    status,
    nowins,
    rank,
    strategy_desc,
    noloss,
    profit,
    loss,
    edate,
    commision,
  } = await readBody(event);

  // Validate required fields
  if (
    !name ||
    !photo ||
    !notrades ||
    !nocopiers ||
    !status ||
    !nowins ||
    !rank ||
    !strategy_desc ||
    !noloss ||
    !profit ||
    !loss ||
    !edate ||
    !commision
  ) {
    throw createError({
      statusCode: 400,
      message: "All fields are required!",
    });
  }

  try {
    const newTrader = await prisma.copytrader.create({
      data: {
        name,
        photo,
        notrades,
        nocopiers,
        status,
        nowins,
        rank,
        strategy_desc,
        noloss,
        profit,
        loss,
        edate,
        commision,
      },
    });

    return {
      success: true,
      message: "CopyTrader created successfully!",
      data: newTrader,
    };
  } catch (error) {
    throw createError({
      statusCode: 500,
      message: error.message || "Handler Server error",
    });
  }
});
