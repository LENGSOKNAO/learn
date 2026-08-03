import * as productRepo from "../repositories/product.repository.js";
import { getPagination } from "../utils/pagination.js";
import { AppError } from "../middlewares/error.middleware.js";

export const getAll = async (filters, query) => {
  const pagination = getPagination(query);
  const products = await productRepo.findAll(filters, pagination);
  return { products, pagination };
};

export const getById = async (id) => {
  const product = await productRepo.findById(id);
  if (!product) throw new AppError("Product not found", 404);
  return product;
};

export const create = async (data) => {
  return productRepo.create(data);
};

export const update = async (id, fields) => {
  const product = await productRepo.findById(id);
  if (!product) throw new AppError("Product not found", 404);
  return productRepo.update(id, fields);
};

export const remove = async (id) => {
  const deleted = await productRepo.remove(id);
  if (!deleted) throw new AppError("Product not found", 404);
  return deleted;
};