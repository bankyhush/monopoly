/*
  Warnings:

  - The `coin_visible` column on the `coins` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `email_status` column on the `user` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `kyc_status` column on the `user` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "public"."coins" DROP COLUMN "coin_visible",
ADD COLUMN     "coin_visible" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "public"."copytrader" ADD COLUMN     "copytrader_visible" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "public"."news" ADD COLUMN     "news_visible" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "public"."staking_plans" ADD COLUMN     "stakingplans_visible" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "public"."tradingplans" ADD COLUMN     "tradingplans_visible" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "public"."user" DROP COLUMN "email_status",
ADD COLUMN     "email_status" BOOLEAN NOT NULL DEFAULT false,
DROP COLUMN "kyc_status",
ADD COLUMN     "kyc_status" BOOLEAN NOT NULL DEFAULT false;
