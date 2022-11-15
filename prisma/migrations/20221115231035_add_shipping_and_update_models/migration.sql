/*
  Warnings:

  - The values [DELIVERED] on the enum `OrderState` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `shippingId` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `trackCode` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `address` on the `Shipping` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Shipping` table. All the data in the column will be lost.
  - You are about to drop the column `phoneCode` on the `Shipping` table. All the data in the column will be lost.
  - You are about to drop the column `phoneNumber` on the `Shipping` table. All the data in the column will be lost.
  - You are about to drop the column `postalCode` on the `Shipping` table. All the data in the column will be lost.
  - You are about to drop the column `references` on the `Shipping` table. All the data in the column will be lost.
  - You are about to drop the column `shippingId` on the `User` table. All the data in the column will be lost.
  - Added the required column `contactId` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `company` to the `Shipping` table without a default value. This is not possible if the table is not empty.
  - Added the required column `deliverDate` to the `Shipping` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderCode` to the `Shipping` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderId` to the `Shipping` table without a default value. This is not possible if the table is not empty.
  - Added the required column `trackCode` to the `Shipping` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ShippingState" AS ENUM ('IN_TRANSIT', 'DELIVERED', 'UNKNOW');

-- AlterEnum
BEGIN;
CREATE TYPE "OrderState_new" AS ENUM ('NEW', 'PROCCESSING', 'SHIPPED', 'CANCELED');
ALTER TABLE "Order" ALTER COLUMN "state" DROP DEFAULT;
ALTER TABLE "Order" ALTER COLUMN "state" TYPE "OrderState_new" USING ("state"::text::"OrderState_new");
ALTER TYPE "OrderState" RENAME TO "OrderState_old";
ALTER TYPE "OrderState_new" RENAME TO "OrderState";
DROP TYPE "OrderState_old";
ALTER TABLE "Order" ALTER COLUMN "state" SET DEFAULT 'NEW';
COMMIT;

-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_shippingId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_shippingId_fkey";

-- DropIndex
DROP INDEX "User_shippingId_key";

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "shippingId",
DROP COLUMN "trackCode",
ADD COLUMN     "contactId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Shipping" DROP COLUMN "address",
DROP COLUMN "email",
DROP COLUMN "phoneCode",
DROP COLUMN "phoneNumber",
DROP COLUMN "postalCode",
DROP COLUMN "references",
ADD COLUMN     "company" TEXT NOT NULL,
ADD COLUMN     "deliverDate" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "orderCode" TEXT NOT NULL,
ADD COLUMN     "orderId" INTEGER NOT NULL,
ADD COLUMN     "trackCode" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "shippingId";

-- CreateTable
CREATE TABLE "Contact" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "phoneCode" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "references" TEXT,
    "userId" INTEGER,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShippingHistory" (
    "id" SERIAL NOT NULL,
    "shippingId" INTEGER NOT NULL,
    "comment" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ShippingHistory_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES "Contact"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShippingHistory" ADD CONSTRAINT "ShippingHistory_shippingId_fkey" FOREIGN KEY ("shippingId") REFERENCES "Shipping"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
