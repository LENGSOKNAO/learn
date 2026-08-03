import * as categoryService from "../services/category.service.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { success, created, noContent } from "../utils/response.js";

export const list = asyncHandler(async (req, res) => {
  const categories = await categoryService.getAll();
  success(res, categories);
});

export const getById = asyncHandler(async (req, res) => {
  const category = await categoryService.getById(req.params.id);
  success(res, category);
});

export const create = asyncHandler(async (req, res) => {
  const category = await categoryService.create(req.body);
  created(res, category);
});

export const update = asyncHandler(async (req, res) => {
  const category = await categoryService.update(req.params.id, req.body);
  success(res, category, "Category updated");
});

export const destroy = asyncHandler(async (req, res) => {
  await categoryService.remove(req.params.id);
  noContent(res, "Category deleted successfully");
});