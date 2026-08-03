import * as categoryRepo from "../repositories/category.repository.js";
import { AppError } from "../middlewares/error.middleware.js";

export const getAll = async () => {
  return categoryRepo.findAll();
};

export const getById = async (id) => {
  const category = await categoryRepo.findById(id);
  if (!category) throw new AppError("Category not found", 404);
  return category;
};

export const create = async (data) => {
  return categoryRepo.create(data);
};

export const update = async (id, fields) => {
  const category = await categoryRepo.findById(id);
  if (!category) throw new AppError("Category not found", 404);
  return categoryRepo.update(id, fields);
};

export const remove = async (id) => {
  const deleted = await categoryRepo.remove(id);
  if (!deleted) throw new AppError("Category not found", 404);
  return deleted;
};