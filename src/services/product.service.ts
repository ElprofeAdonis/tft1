import { Product } from "@prisma/client";
import client from "../database/client";
import { HttpError } from "../types/custom.error";

export type CreateOrUpdateProduct = Omit<Product, "id" | "createdAt">;
function setPaginationPrisma(
  pageSize: number,
  currentPage: number,
  total: number
) {
  const maxPages = Math.round(total / pageSize);
  const isPagesExceed = currentPage < maxPages;
  if (!isPagesExceed) {
    throw new HttpError({ message: "No more records" }, 404);
  }
  return {
    skip: (currentPage - 1) * pageSize,
    take: pageSize,
    nextPage: isPagesExceed ? currentPage + 1 : undefined,
  };
}
class ProductService {
  async findAll(pageSize: number, currentPage: number) {
    const totalResult = await client.product.aggregate({
      _count: {
        id: true,
      },
    });
    const { skip, take, nextPage } = setPaginationPrisma(
      pageSize,
      currentPage,
      totalResult._count.id
    );

    const data = await client.product.findMany({
      skip,
      take,
      include: {
        reviews: true,
      },
    });
    return {
      data,
      currentPage,
      nextPage,
      total: totalResult._count.id,
    };
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
