import Joi from "joi";

export const CreateProductSchema = Joi.object({
  name: Joi.string().required(),
  description: Joi.string(),
  price: Joi.number().required(),
  size: Joi.string().required(),
  stock: Joi.number().required(),
});
