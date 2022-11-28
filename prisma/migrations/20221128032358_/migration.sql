/*
  Warnings:

  - A unique constraint covering the columns `[cedula]` on the table `alumno` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `alumno` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[password]` on the table `alumno` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cedula]` on the table `profesor` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `profesor` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[password]` on the table `profesor` will be added. If there are existing duplicate values, this will fail.
  - Changed the type of `cedula` on the `alumno` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `cedula` on the `profesor` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "alumno" DROP COLUMN "cedula",
ADD COLUMN     "cedula" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "profesor" DROP COLUMN "cedula",
ADD COLUMN     "cedula" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "alumno_cedula_key" ON "alumno"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "alumno_email_key" ON "alumno"("email");

-- CreateIndex
CREATE UNIQUE INDEX "alumno_password_key" ON "alumno"("password");

-- CreateIndex
CREATE UNIQUE INDEX "profesor_cedula_key" ON "profesor"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "profesor_email_key" ON "profesor"("email");

-- CreateIndex
CREATE UNIQUE INDEX "profesor_password_key" ON "profesor"("password");
