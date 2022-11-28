import { Application } from "express";
import exampleRouter from "./example";
import profesorRouter from "./profesor";

export default function router(app: Application): void {
  /**
   * Every source are specifed here
   */
  app.use("/", exampleRouter);
  app.use("/profesor", profesorRouter);
}
