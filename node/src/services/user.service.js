import * as userRepo from "../repositories/user.repository.js";
import { AppError } from "../middlewares/error.middleware.js";

export const getAll = async () => {
  return userRepo.findAll();
};

export const getById = async (id) => {
  const user = await userRepo.findById(id);
  if (!user) throw new AppError("User not found", 404);
  return user;
};

export const update = async (id, fields) => {
  const user = await userRepo.findById(id);
  if (!user) throw new AppError("User not found", 404);
  return userRepo.update(id, fields);
};

export const remove = async (id) => {
  const deleted = await userRepo.remove(id);
  if (!deleted) throw new AppError("User not found", 404);
  return deleted;
};