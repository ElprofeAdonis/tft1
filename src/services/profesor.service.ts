import { profesor } from "@prisma/client";
import client from "../database/client";
import { HttpError, CustomError } from "../types/custom.error";

class ProfesorService {
  /**
   * It creates a new Profesor in the database
   * @param {Profesor} profesor - The profesor object that you want to create.
   * @returns A promise
   */
  async create(profesor: profesor) {
    const newProfesor = await client.profesor.create({
      data: {
        nombre: profesor.nombre,
        codigo: profesor.codigo,
        cedula: profesor.cedula,
        email: profesor.email,
        password: profesor.password,
      },
    });
    if (!newProfesor) {
      throw new CustomError("No more records");
    }
    return { message: "Profesor was created successfully" };
  }
}

export default new ProfesorService();
