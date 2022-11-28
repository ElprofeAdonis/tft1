import { Application } from "express";
import exampleRouter from "./example";
import alumnoRouter from "./alumno";
import profesorRouter from "./profesor";


export default function router(app: Application): void {
  /**
   * Every source are specifed here
   */
  app.use("/", exampleRouter);
  app.use("/alumno", alumnoRouter);
  app.use("/profesor", profesorRouter);
}
