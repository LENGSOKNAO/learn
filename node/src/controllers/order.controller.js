import * as orderService from "../services/order.service.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { success, created } from "../utils/response.js";

export const list = asyncHandler(async (req, res) => {
  const orders = await orderService.getUserOrders(req.user.id);
  success(res, orders);
});

export const getById = asyncHandler(async (req, res) => {
  const order = await orderService.getById(req.params.id, req.user.id);
  success(res, order);
});

export const create = asyncHandler(async (req, res) => {
  const order = await orderService.create(req.user.id, req.body);
  created(res, order);
});