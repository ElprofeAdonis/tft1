import Joi from "joi";

export const createalumnoschema = Joi.object({
    nombre: Joi.string().required(),
    codigo: Joi.number().required(),
    cedula: Joi.number().required(),
    email: Joi.string().required(),
    password: Joi.string().required()
});

