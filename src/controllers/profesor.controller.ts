import { BaseController } from "../types/base.controller";
import { Request, Response } from "express";
import { CreateProfesorSchema } from "../models/profesor.model";
import profesorService from "../services/profesor.service";
import { HttpError } from "../types/custom.error";

class ProfesorController extends BaseController {
  /**
   * It validates the request body against the CreateProfesorSchema, then calls the profesrService.create
   * function, and finally sends the response
   * @param {Request | any} req - Request | any:
   * @param {Response} res - Response - The response object that will be returned to the client.
   */
  async create(req: Request | any, res: Response) {
    try {
      const profData = await CreateProfesorSchema.validateAsync(req.body);
      this.responseHandler(res, await profesorService.create(profData), 200);
      console.log(profData);
    } catch (error: any) {
      this.errorHandler(res, error);
    }
  }
}
export default new ProfesorController();
