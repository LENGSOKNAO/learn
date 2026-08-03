import * as paymentService from "../services/payment.service.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { success, created } from "../utils/response.js";

export const listByOrder = asyncHandler(async (req, res) => {
  const payments = await paymentService.getByOrder(req.params.orderId);
  success(res, payments);
});

export const create = asyncHandler(async (req, res) => {
  const payment = await paymentService.create(req.body);
  created(res, payment);
});