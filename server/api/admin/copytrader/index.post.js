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
    const body = await readBody(event);

    const {
      name,
      photo,
      noTrades,
      noCopiers,
      status,
      noWins,
      rank,
      strategyDesc,
      noLoss,
      profit,
      loss,
      eDate,
      commission = "100",
      copyTraderVisible = true,
    } = body;

    // Basic validation
    if (!name || !photo || !status) {
      throw createError({
        statusCode: 400,
        message: "Name, photo, and status are required",
      });
    }

    // Create CopyTrader
    const newCopyTrader = await prisma.copyTrader.create({
      data: {
        name,
        photo,
        noTrades,
        noCopiers,
        status,
        noWins,
        rank,
        strategyDesc,
        noLoss,
        profit,
        loss,
        eDate,
        commission,
        copyTraderVisible,
      },
    });

    return {
      success: true,
      message: "CopyTrader created successfully",
      data: newCopyTrader,
    };
  } catch (error) {
    console.error("CopyTrader creation error:", error);

    throw createError({
      statusCode: error.statusCode || 500,
      message: error.message || "CopyTrader Server Error",
    });
  }
});
