import * as reviewService from "../services/review.service.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { success, created, noContent } from "../utils/response.js";

export const listByProduct = asyncHandler(async (req, res) => {
  const reviews = await reviewService.getByProduct(req.params.productId);
  success(res, reviews);
});

export const create = asyncHandler(async (req, res) => {
  const data = { ...req.body, user_id: req.user.id, product_id: req.params.productId };
  const review = await reviewService.upsert(data);
  created(res, review);
});

export const destroy = asyncHandler(async (req, res) => {
  await reviewService.remove(req.params.id);
  noContent(res, "Review deleted successfully");
});