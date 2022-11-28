import { BaseController } from "../types/base.controller";
import { Request, Response } from "express";
import { createalumnoschema } from "../models/alumno.models";
import  AlumnoService  from "../services/alumno.service";
import { HttpError } from "../types/custom.error";
import { any } from "joi";


class AlumnoController extends BaseController {
/**
   * It validates the request body against the CreateProfesorSchema, then calls the profesrService.create
   * function, and finally sends the response
   * @param {Request | any} req - Request | any:
   * @param {Response} res - Response - The response object that will be returned to the client.
   */
    async create (req: Request | any, res: Response) {
        try {
            const valiData = await createalumnoschema.validateAsync(req.body)
            this.responseHandler(res, await AlumnoService.create(valiData), 200);
            console.log(valiData);
        } catch (error) {
            this.errorHandler(res, error);
        }
    }
}



export default new AlumnoController();
