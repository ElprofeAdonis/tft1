import { Application } from "express";
import exampleRouter from "./example";
import alumnoRouter from "./alumno";

export default function router(app: Application): void {
  /**
   * Every source are specifed here
   */
  app.use("/", exampleRouter);
  app.use("/alumno", alumnoRouter);
}
