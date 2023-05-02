/*
  Warnings:

  - You are about to drop the column `borrowId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `buyId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `rentId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `sellId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the `Borrow` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Buy` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Rent` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Sell` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Borrow" DROP CONSTRAINT "Borrow_userId_fkey";

-- DropForeignKey
ALTER TABLE "Buy" DROP CONSTRAINT "Buy_userId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_borrowId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_buyId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_rentId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_sellId_fkey";

-- DropForeignKey
ALTER TABLE "Rent" DROP CONSTRAINT "Rent_userId_fkey";

-- DropForeignKey
ALTER TABLE "Sell" DROP CONSTRAINT "Sell_userId_fkey";

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "borrowId",
DROP COLUMN "buyId",
DROP COLUMN "rentId",
DROP COLUMN "sellId",
ADD COLUMN     "borrowedUserId" INTEGER,
ADD COLUMN     "boughtUserId" INTEGER,
ADD COLUMN     "rentedUserId" INTEGER,
ADD COLUMN     "soldUserId" INTEGER;

-- DropTable
DROP TABLE "Borrow";

-- DropTable
DROP TABLE "Buy";

-- DropTable
DROP TABLE "Rent";

-- DropTable
DROP TABLE "Sell";

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_boughtUserId_fkey" FOREIGN KEY ("boughtUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_soldUserId_fkey" FOREIGN KEY ("soldUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_rentedUserId_fkey" FOREIGN KEY ("rentedUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_borrowedUserId_fkey" FOREIGN KEY ("borrowedUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
