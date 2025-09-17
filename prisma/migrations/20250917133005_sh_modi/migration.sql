/*
  Warnings:

  - The `profit` column on the `user` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `deposit` column on the `user` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `withdrawal` column on the `user` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `bonus` column on the `user` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `planamount` column on the `user` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "public"."user" ALTER COLUMN "account_type" SET DEFAULT 'standard',
ALTER COLUMN "current_trader" SET DEFAULT 'NONE',
ALTER COLUMN "win_rate" SET DEFAULT 'NONE',
ALTER COLUMN "trade_status" SET DEFAULT 'NONE',
ALTER COLUMN "trader_profit" SET DEFAULT 'NONE',
ALTER COLUMN "copiers" SET DEFAULT 'NONE',
DROP COLUMN "profit",
ADD COLUMN     "profit" DECIMAL(18,2) NOT NULL DEFAULT 0.00,
DROP COLUMN "deposit",
ADD COLUMN     "deposit" DECIMAL(18,2) NOT NULL DEFAULT 0.00,
DROP COLUMN "withdrawal",
ADD COLUMN     "withdrawal" DECIMAL(18,2) NOT NULL DEFAULT 0.00,
DROP COLUMN "bonus",
ADD COLUMN     "bonus" DECIMAL(18,2) NOT NULL DEFAULT 0.00,
DROP COLUMN "planamount",
ADD COLUMN     "planamount" DECIMAL(18,2) NOT NULL DEFAULT 0.00;
