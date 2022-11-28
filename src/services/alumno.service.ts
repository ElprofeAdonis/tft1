import { alumno } from "@prisma/client"
import client from "../database/client"
import { CustomError, HttpError } from "../types/custom.error"

class AlumnoService {
/**
   * It creates a new Profesor in the database
   * @param {alumno} alumno - The profesor object that you want to create.
   * @returns A promise
   */
    async create (alumno: alumno) {
        const newalumno = await client.alumno.create({
            data:{
                nombre: alumno.nombre,
                codigo: alumno.codigo,
                cedula: alumno.cedula,
                email: alumno.email,
                password: alumno.password

            },
        });
        if (!newalumno) {
            throw new CustomError("Alumno no creado");
        }
        return {message:"Alumno was created succesfully"};
    }
}

export default new AlumnoService();
