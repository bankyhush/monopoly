/*
  Warnings:

  - You are about to drop the column `user_type` on the `user` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "public"."user" DROP COLUMN "user_type",
ADD COLUMN     "role" VARCHAR(6) NOT NULL DEFAULT 'USER';
