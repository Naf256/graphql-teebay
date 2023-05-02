/*
  Warnings:

  - You are about to drop the `Catagory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CatagoryToProduct` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_CatagoryToProduct" DROP CONSTRAINT "_CatagoryToProduct_A_fkey";

-- DropForeignKey
ALTER TABLE "_CatagoryToProduct" DROP CONSTRAINT "_CatagoryToProduct_B_fkey";

-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "catagories" TEXT[];

-- DropTable
DROP TABLE "Catagory";

-- DropTable
DROP TABLE "_CatagoryToProduct";
