import { Router } from "express";
import profesorController from "../controllers/profesor.controller";

//Definition of every endpoint from source
export default Router().post("/", (req, res) =>
  profesorController.create(req, res)
);
