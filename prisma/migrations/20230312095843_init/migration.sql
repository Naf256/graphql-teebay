/*
  Warnings:

  - You are about to drop the column `type` on the `Product` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Product" DROP COLUMN "type",
ADD COLUMN     "status" TEXT;

-- CreateTable
CREATE TABLE "Catagory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Catagory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CatagoryToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CatagoryToProduct_AB_unique" ON "_CatagoryToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_CatagoryToProduct_B_index" ON "_CatagoryToProduct"("B");

-- AddForeignKey
ALTER TABLE "_CatagoryToProduct" ADD CONSTRAINT "_CatagoryToProduct_A_fkey" FOREIGN KEY ("A") REFERENCES "Catagory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CatagoryToProduct" ADD CONSTRAINT "_CatagoryToProduct_B_fkey" FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
