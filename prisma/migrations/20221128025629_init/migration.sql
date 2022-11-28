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

-- CreateTable
CREATE TABLE "alumno" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigo" INTEGER NOT NULL,
    "cedula" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "alumno_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "profesor_codigo_key" ON "profesor"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "alumno_codigo_key" ON "alumno"("codigo");
