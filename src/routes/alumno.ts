import { Router } from "express";
import alumnoController from "../controllers/alumno.controller";

export default Router()
.post("/", (req, res) => alumnoController.create(req, res));


