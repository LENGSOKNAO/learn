import * as userService from "../services/user.service.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { success, noContent } from "../utils/response.js";

export const list = asyncHandler(async (req, res) => {
  const users = await userService.getAll();
  success(res, users);
});

export const getMe = asyncHandler(async (req, res) => {
  const user = await userService.getById(req.user.id);
  success(res, user);
});

export const getById = asyncHandler(async (req, res) => {
  const user = await userService.getById(req.params.id);
  success(res, user);
});

export const update = asyncHandler(async (req, res) => {
  const user = await userService.update(req.params.id, req.body);
  success(res, user, "User updated");
});

export const destroy = asyncHandler(async (req, res) => {
  await userService.remove(req.params.id);
  noContent(res, "User deleted successfully");
});