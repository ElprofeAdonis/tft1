import { Request, Response } from "express";
import exampleService from "../services/example.service";
import { BaseController } from "../types/base.controller";
class OrdersController extends BaseController {
  async create() {}
}

export default new OrdersController();
