import { Router } from "express";
import productsController from "../controllers/products.controller";

//Definition of every endpoint from source
export default Router()
  .post("/", (req, res) => productsController.create(req, res))
  .get("/", (req, res) => productsController.findAll(req, res));
