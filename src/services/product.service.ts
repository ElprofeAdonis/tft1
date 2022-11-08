import { Product } from "@prisma/client";
import client from "../database/client";

export type CreateOrUpdateProduct = Omit<Product, "id" | "createdAt">;

class ProductService {
  findAll() {
    return client.product.findMany({
      include: {
        reviews: true,
      },
    });
  }

  /**
   * It creates a new product in the database
   * @param {CreateOrUpdateProduct} product - CreateOrUpdateProduct
   * @returns A promise that resolves to the created product.
   */
  create(product: CreateOrUpdateProduct) {
    return client.product.create({ data: product });
  }

  /**
   * It takes an id and a product, and updates the product with the given id with the given product
   * @param {number} id - The id of the product you want to update.
   * @param {CreateOrUpdateProduct} product - CreateOrUpdateProduct
   * @returns The updated product.
   */
  update(id: number, product: CreateOrUpdateProduct) {
    return client.product.update({ where: { id }, data: product });
  }
}

export default new ProductService();
