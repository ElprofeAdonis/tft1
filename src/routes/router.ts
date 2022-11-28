import { Application } from "express";
import exampleRouter from "./example";
<<<<<<< HEAD
import alumnoRouter from "./alumno";
=======
import profesorRouter from "./profesor";
>>>>>>> main

export default function router(app: Application): void {
  /**
   * Every source are specifed here
   */
  app.use("/", exampleRouter);
<<<<<<< HEAD
  app.use("/alumno", alumnoRouter);
=======
  app.use("/profesor", profesorRouter);
>>>>>>> main
}
