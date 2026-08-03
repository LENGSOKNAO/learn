import * as addressRepo from "../repositories/address.repository.js";
import { AppError } from "../middlewares/error.middleware.js";

export const getUserAddresses = async (userId) => {
  return addressRepo.findByUser(userId);
};

export const create = async (data) => {
  return addressRepo.create(data);
};

export const update = async (id, userId, fields) => {
  const address = await addressRepo.findById(id);
  if (!address) throw new AppError("Address not found", 404);
  return addressRepo.update(id, userId, fields);
};

export const remove = async (id, userId) => {
  const deleted = await addressRepo.remove(id, userId);
  if (!deleted) throw new AppError("Address not found", 404);
  return deleted;
};