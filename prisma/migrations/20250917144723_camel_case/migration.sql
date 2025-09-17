/*
  Warnings:

  - You are about to drop the column `mylink` on the `news` table. All the data in the column will be lost.
  - You are about to drop the column `news_visible` on the `news` table. All the data in the column will be lost.
  - You are about to drop the column `coin_id` on the `trade` table. All the data in the column will be lost.
  - You are about to drop the column `coin_name` on the `trade` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `trade` table. All the data in the column will be lost.
  - You are about to drop the column `expired_time` on the `trade` table. All the data in the column will be lost.
  - You are about to drop the column `trade_result` on the `trade` table. All the data in the column will be lost.
  - You are about to drop the column `trade_signal` on the `trade` table. All the data in the column will be lost.
  - You are about to drop the column `userid` on the `trade` table. All the data in the column will be lost.
  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `account_type` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `activeplan` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `backimage` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `current_trader` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `email_status` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `frontimage` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `kyc_status` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `planamount` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `stoken` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `trade_status` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `trader_profit` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `userid` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `wallet_address` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `win_rate` on the `user` table. All the data in the column will be lost.
  - You are about to drop the `coins` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `copytrader` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `staked_records` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `staking_plans` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tradingplans` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `transactionhistory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_balances` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `coinId` to the `trade` table without a default value. This is not possible if the table is not empty.
  - Added the required column `expiredTime` to the `trade` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tradeResult` to the `trade` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `trade` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sToken` to the `user` table without a default value. This is not possible if the table is not empty.
  - Added the required column `walletAddress` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."news" DROP COLUMN "mylink",
DROP COLUMN "news_visible",
ADD COLUMN     "myLink" VARCHAR(200),
ADD COLUMN     "newsVisible" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "public"."trade" DROP COLUMN "coin_id",
DROP COLUMN "coin_name",
DROP COLUMN "created_at",
DROP COLUMN "expired_time",
DROP COLUMN "trade_result",
DROP COLUMN "trade_signal",
DROP COLUMN "userid",
ADD COLUMN     "coinId" INTEGER NOT NULL,
ADD COLUMN     "coinName" VARCHAR(50),
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "expiredTime" VARCHAR(100) NOT NULL,
ADD COLUMN     "tradeResult" VARCHAR(100) NOT NULL,
ADD COLUMN     "tradeSignal" VARCHAR(50) DEFAULT 'Processing',
ADD COLUMN     "userId" VARCHAR(100) NOT NULL;

-- AlterTable
ALTER TABLE "public"."user" DROP CONSTRAINT "user_pkey",
DROP COLUMN "account_type",
DROP COLUMN "activeplan",
DROP COLUMN "backimage",
DROP COLUMN "created_at",
DROP COLUMN "current_trader",
DROP COLUMN "email_status",
DROP COLUMN "frontimage",
DROP COLUMN "kyc_status",
DROP COLUMN "planamount",
DROP COLUMN "stoken",
DROP COLUMN "trade_status",
DROP COLUMN "trader_profit",
DROP COLUMN "updated_at",
DROP COLUMN "userid",
DROP COLUMN "wallet_address",
DROP COLUMN "win_rate",
ADD COLUMN     "accountType" VARCHAR(50) NOT NULL DEFAULT 'standard',
ADD COLUMN     "activePlan" VARCHAR(100) DEFAULT 'NONE',
ADD COLUMN     "backImage" VARCHAR(100),
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "currentTrader" VARCHAR(50) DEFAULT 'NONE',
ADD COLUMN     "emailStatus" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "frontImage" VARCHAR(100),
ADD COLUMN     "kycStatus" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "planAmount" DECIMAL(18,2) NOT NULL DEFAULT 0.00,
ADD COLUMN     "sToken" VARCHAR(10) NOT NULL,
ADD COLUMN     "tradeStatus" VARCHAR(50) DEFAULT 'NONE',
ADD COLUMN     "traderProfit" VARCHAR(50) DEFAULT 'NONE',
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "userId" SERIAL NOT NULL,
ADD COLUMN     "walletAddress" VARCHAR(100) NOT NULL,
ADD COLUMN     "winRate" VARCHAR(50) DEFAULT 'NONE',
ADD CONSTRAINT "user_pkey" PRIMARY KEY ("userId");

-- DropTable
DROP TABLE "public"."coins";

-- DropTable
DROP TABLE "public"."copytrader";

-- DropTable
DROP TABLE "public"."staked_records";

-- DropTable
DROP TABLE "public"."staking_plans";

-- DropTable
DROP TABLE "public"."tradingplans";

-- DropTable
DROP TABLE "public"."transactionhistory";

-- DropTable
DROP TABLE "public"."user_balances";

-- CreateTable
CREATE TABLE "public"."userBalance" (
    "balanceId" SERIAL NOT NULL,
    "userId" INTEGER,
    "coinId" INTEGER,
    "availableBalance" DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    "onOrderBalance" DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    "stakedBalance" DECIMAL(18,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT "userBalance_pkey" PRIMARY KEY ("balanceId")
);

-- CreateTable
CREATE TABLE "public"."coin" (
    "coinId" SERIAL NOT NULL,
    "coinName" VARCHAR(100) NOT NULL,
    "coinTitle" VARCHAR(100) NOT NULL,
    "coinRate" DECIMAL(10,3) NOT NULL,
    "photo" VARCHAR(200) NOT NULL,
    "withMin" VARCHAR(50) NOT NULL,
    "withMax" VARCHAR(50) NOT NULL,
    "withInstructions" TEXT NOT NULL,
    "depositInstructions" TEXT NOT NULL,
    "depositAddress" VARCHAR(100) NOT NULL DEFAULT 'Please contact support for wallet address',
    "percent" VARCHAR(50) NOT NULL,
    "coinVisible" BOOLEAN NOT NULL DEFAULT true,
    "type" VARCHAR(50),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "coin_pkey" PRIMARY KEY ("coinId")
);

-- CreateTable
CREATE TABLE "public"."copyTrader" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "photo" VARCHAR(255) NOT NULL,
    "noTrades" VARCHAR(100) NOT NULL,
    "noCopiers" VARCHAR(100) NOT NULL,
    "status" VARCHAR(50) NOT NULL,
    "noWins" VARCHAR(100) NOT NULL,
    "rank" VARCHAR(50) NOT NULL,
    "strategyDesc" TEXT NOT NULL,
    "noLoss" VARCHAR(100) NOT NULL,
    "profit" VARCHAR(100) NOT NULL,
    "loss" VARCHAR(50) NOT NULL,
    "eDate" VARCHAR(100) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "commission" VARCHAR(100) NOT NULL DEFAULT '100',
    "copyTraderVisible" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "copyTrader_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."stakedRecord" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "planId" INTEGER NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    "apy" VARCHAR(15) NOT NULL,
    "amount" DECIMAL(18,8) NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lockPeriod" INTEGER NOT NULL,
    "status" VARCHAR(11) DEFAULT 'active',

    CONSTRAINT "stakedRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."stakingPlan" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "coin" VARCHAR(100) NOT NULL,
    "apy" VARCHAR(50) NOT NULL,
    "lockPeriod" INTEGER NOT NULL,
    "minimumAmount" DECIMAL(18,8) NOT NULL DEFAULT 0.00000000,
    "maximumAmount" VARCHAR(100) NOT NULL,
    "type" VARCHAR(15) NOT NULL DEFAULT 'Locked',
    "status" VARCHAR(10) NOT NULL DEFAULT 'true',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "stakingPlanVisible" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "stakingPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."tradingPlan" (
    "id" SERIAL NOT NULL,
    "planName" VARCHAR(50) NOT NULL,
    "planDes" VARCHAR(100) NOT NULL,
    "minIns" VARCHAR(100) NOT NULL,
    "maxIns" VARCHAR(100) NOT NULL,
    "daysDuration" VARCHAR(100) NOT NULL,
    "dailyInterestRate" VARCHAR(100) NOT NULL,
    "status" VARCHAR(50) NOT NULL,
    "tradingPlanVisible" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "tradingPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."transactionHistory" (
    "id" SERIAL NOT NULL,
    "coinId" INTEGER NOT NULL,
    "userId" VARCHAR(100) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "status" VARCHAR(100) NOT NULL,
    "method" VARCHAR(100) NOT NULL,
    "transTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "transId" VARCHAR(100) NOT NULL,
    "amount" VARCHAR(100) NOT NULL,
    "type" VARCHAR(100) NOT NULL,
    "depositInfo" TEXT,
    "withdrawInfo" TEXT,
    "copytradeInfo" TEXT,
    "miningInfo" TEXT,
    "auto" VARCHAR(5),
    "photo" VARCHAR(100),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "transactionHistory_pkey" PRIMARY KEY ("id")
);
