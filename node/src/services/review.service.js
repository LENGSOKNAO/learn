import * as reviewRepo from "../repositories/review.repository.js";
import { AppError } from "../middlewares/error.middleware.js";

export const getByProduct = async (productId) => {
  return reviewRepo.findByProduct(productId);
};

export const upsert = async (data) => {
  const existing = await reviewRepo.findExisting(data.product_id, data.user_id);
  if (existing) {
    return reviewRepo.update(data.product_id, data.user_id, data);
  }
  return reviewRepo.create(data);
};

export const remove = async (id) => {
  const deleted = await reviewRepo.remove(id);
  if (!deleted) throw new AppError("Review not found", 404);
  return deleted;
};