import * as addressService from "../services/address.service.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { success, created, noContent } from "../utils/response.js";

export const list = asyncHandler(async (req, res) => {
  const addresses = await addressService.getUserAddresses(req.user.id);
  success(res, addresses);
});

export const create = asyncHandler(async (req, res) => {
  const data = { ...req.body, user_id: req.user.id };
  const address = await addressService.create(data);
  created(res, address);
});

export const update = asyncHandler(async (req, res) => {
  const address = await addressService.update(req.params.id, req.user.id, req.body);
  success(res, address, "Address updated");
});

export const destroy = asyncHandler(async (req, res) => {
  await addressService.remove(req.params.id, req.user.id);
  noContent(res, "Address deleted successfully");
});