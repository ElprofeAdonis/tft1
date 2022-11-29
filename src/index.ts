//UNIMOS TODO AQUI, PARA QUE NO HAYA CONFUSIONES
// #1
import { PrismaClient } from '@prisma/client'
import express from 'express'
import { number } from 'joi'

// #2
const prisma = new PrismaClient()

// #3
const app = express()

// #4
app.use(express.json())

//TABLA DE PROFESORES
//POST
//POST CON TRY Y CATCH
app.post('/profesores', async (req, res) => {
    try {
        const newprofesores = await prisma.profesor.create({
            data: req.body
        });
        console.log("Nuevo profesor agregado: ", newprofesores);
        res.json(newprofesores);
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
});


//GET
app.get('/profesores', async (req, res) => {
    const profesores = await prisma.profesor.findMany({include:{alumno:true}});
    console.log("Lista de profesores: ", profesores);
    res.json(profesores);
});
// GET BY CODIGO
app.get('/profesores/:codigo', async (req, res) => {
    const profesores = await prisma.profesor.findUnique({
        where: {
            codigo: Number(req.params.codigo)
        }
    });
    console.log("Profesor encontrado: ", profesores);
    res.json(profesores);
});




//TABLA DE ALUMNO
//POST
app.post('/alumnos', async (req, res) => {
    const newalumnos = await prisma.alumno.create({
        data: req.body
    });
    console.log("Nuevo alumno agregado: ", newalumnos);
    res.json(newalumnos);
});
//GET
app.get("/alumnos", async (req, res) => {
  const alumnos = await prisma.alumno.findMany({include:{profesor1:true, clase2:true, calificacion:true}});;
  res.json(alumnos);
});
//GET BY CODIGO
app.get('/alumnos/:codigo', async (req, res) => {
    const alumnos = await prisma.alumno.findMany({include:{profesor1:true, clase2:true, calificacion:true}});;
    console.log("Alumno encontrado: ", alumnos);
    res.json(alumnos);
});


//TABLA MI CURSO
//POST
app.post('/micurso', async (req, res) => {
    const newmicurso = await prisma.miscurso.create({
        data: req.body
    });
    console.log("Nuevo curso agregado: ", newmicurso);
    res.json(newmicurso);
});
//GET
app.get("/micurso", async (req, res) => {
    const micurso = await prisma.miscurso.findMany({include:{profesor2:true}});
    res.json(micurso);
});
//GET BY ID
app.get('/micurso/:id', async (req, res) => {
    const micurso = await prisma.miscurso.findMany({include:{profesor2:true}});
    res.json(micurso);
});
//TABLA CLASE
//POST
app.post('/clase', async (req, res) => {
    const newclase = await prisma.clase.create({
        data: req.body
    });
    console.log("Nueva clase agregada: ", newclase);
    res.json(newclase);
});
//GET
app.get("/clase", async (req, res) => {
    const clase = await prisma.clase.findMany({include:{miscursos1:true}});
    res.json(clase);
});
//GET BY ID
app.get('/clase/:id', async (req, res) => {
    const clase = await prisma.clase.findMany({include:{miscursos1:true}});
    res.json(clase);
});
//TABLA AISNACIONES
//POST
app.post('/asignaciones', async (req, res) => {
    const newasignaciones = await prisma.asignaciones.create({
        data: req.body
    });
    console.log("Nueva asignacion agregada: ", newasignaciones);
    res.json(newasignaciones);
});
//GET
app.get("/asignaciones", async (req, res) => {
    const asignaciones = await prisma.asignaciones.findMany({include:{clase1:true}});
    res.json(asignaciones);
});
//GET BY ID
app.get('/asignaciones/:id', async (req, res) => {
    const asignaciones = await prisma.asignaciones.findMany({include:{clase1:true}});
    res.json(asignaciones);
});
//TABLA CALIFICACIONES
//POST
app.post('/calificaciones', async (req, res) => {
    const newcalificaciones = await prisma.calificaciones.create({
        data: req.body
    });
    console.log("Nueva calificacion agregada: ", newcalificaciones);
    res.json(newcalificaciones);
});
//GET
app.get("/calificaciones", async (req, res) => {
    const calificaciones = await prisma.calificaciones.findMany({include:{alumno:true}});
    res.json(calificaciones);
});
//GET BY ID
app.get('/calificaciones/:id', async (req, res) => {
    const calificaciones = await prisma.calificaciones.findMany({include:{alumno:true}});
    res.json(calificaciones);
});





















// #6
app.listen(8000, () =>
  console.log('🚀 App corriendo 100%ciento and listening on port 8000'),
)

