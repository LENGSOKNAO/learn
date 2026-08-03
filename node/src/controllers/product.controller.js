import * as productService from "../services/product.service.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { success, created, noContent } from "../utils/response.js";

export const list = asyncHandler(async (req, res) => {
  const result = await productService.getAll(req.query, req.query);
  success(res, result.products);
});

export const getById = asyncHandler(async (req, res) => {
  const product = await productService.getById(req.params.id);
  success(res, product);
});

export const create = asyncHandler(async (req, res) => {
  const product = await productService.create(req.body);
  created(res, product);
});

export const update = asyncHandler(async (req, res) => {
  const product = await productService.update(req.params.id, req.body);
  success(res, product, "Product updated");
});

export const destroy = asyncHandler(async (req, res) => {
  await productService.remove(req.params.id);
  noContent(res, "Product deleted successfully");
});