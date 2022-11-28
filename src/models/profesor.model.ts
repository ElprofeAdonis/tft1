import Joi from "joi";

export const CreateProfesorSchema = Joi.object({
  nombre: Joi.string().required(),
  codigo: Joi.number().required(),
  cedula: Joi.string().required(),
  email: Joi.string().email().required(),
  password: Joi.string().required(),
});
