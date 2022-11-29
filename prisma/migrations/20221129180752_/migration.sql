-- CreateTable
CREATE TABLE "profesor" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigo" INTEGER NOT NULL,
    "cedula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "profesor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "alumno" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigo" INTEGER NOT NULL,
    "cedula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "profesorId" INTEGER NOT NULL,
    "clase1Id" INTEGER NOT NULL,
    "calificacionId" INTEGER NOT NULL,

    CONSTRAINT "alumno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "miscurso" (
    "id" SERIAL NOT NULL,
    "nombreCurso" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "periodo" TEXT NOT NULL,
    "fechaInicio" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "archivoClase" TEXT NOT NULL,
    "profesor1Id" INTEGER NOT NULL,

    CONSTRAINT "miscurso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "clase" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigo" INTEGER NOT NULL,
    "fechapublicacion" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "urlarchivoclase" TEXT NOT NULL,
    "urlmeeting" TEXT NOT NULL,
    "cursoId" INTEGER NOT NULL,

    CONSTRAINT "clase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "asignaciones" (
    "id" SERIAL NOT NULL,
    "nombreTarea" TEXT NOT NULL,
    "fechaInicio" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "fechaEntrega" TEXT NOT NULL,
    "urlarchivo" TEXT NOT NULL,
    "claseId" INTEGER NOT NULL,

    CONSTRAINT "asignaciones_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "calificaciones" (
    "id" SERIAL NOT NULL,
    "nombreTarea" TEXT NOT NULL,
    "nombrecalificacion" TEXT NOT NULL,
    "calificacion" INTEGER NOT NULL,
    "asistencia" TEXT NOT NULL,
    "urlarchivo" TEXT NOT NULL,

    CONSTRAINT "calificaciones_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "profesor_codigo_key" ON "profesor"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "profesor_cedula_key" ON "profesor"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "profesor_email_key" ON "profesor"("email");

-- CreateIndex
CREATE UNIQUE INDEX "profesor_password_key" ON "profesor"("password");

-- CreateIndex
CREATE UNIQUE INDEX "alumno_codigo_key" ON "alumno"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "alumno_cedula_key" ON "alumno"("cedula");

-- CreateIndex
CREATE UNIQUE INDEX "alumno_email_key" ON "alumno"("email");

-- CreateIndex
CREATE UNIQUE INDEX "alumno_password_key" ON "alumno"("password");

-- CreateIndex
CREATE UNIQUE INDEX "clase_codigo_key" ON "clase"("codigo");

-- AddForeignKey
ALTER TABLE "alumno" ADD CONSTRAINT "alumno_profesorId_fkey" FOREIGN KEY ("profesorId") REFERENCES "profesor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alumno" ADD CONSTRAINT "alumno_clase1Id_fkey" FOREIGN KEY ("clase1Id") REFERENCES "clase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alumno" ADD CONSTRAINT "alumno_calificacionId_fkey" FOREIGN KEY ("calificacionId") REFERENCES "calificaciones"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "miscurso" ADD CONSTRAINT "miscurso_profesor1Id_fkey" FOREIGN KEY ("profesor1Id") REFERENCES "profesor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "clase" ADD CONSTRAINT "clase_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "miscurso"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "asignaciones" ADD CONSTRAINT "asignaciones_claseId_fkey" FOREIGN KEY ("claseId") REFERENCES "clase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
