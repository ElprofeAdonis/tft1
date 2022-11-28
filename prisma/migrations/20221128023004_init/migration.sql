-- CreateTable
CREATE TABLE "profesor" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigo" INTEGER NOT NULL,
    "cedula" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "profesor_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "profesor_codigo_key" ON "profesor"("codigo");
