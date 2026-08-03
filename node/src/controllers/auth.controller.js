import * as authService from "../services/auth.service.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { success, created } from "../utils/response.js";

export const register = asyncHandler(async (req, res) => {
  const result = await authService.register(req.body);
  created(res, result, "Registration successful");
});

export const login = asyncHandler(async (req, res) => {
  const { email, password } = req.body;
  const result = await authService.login(email, password);
  success(res, result, "Login successful");
});