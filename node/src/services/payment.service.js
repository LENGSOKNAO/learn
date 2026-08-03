import * as paymentRepo from "../repositories/payment.repository.js";

export const getByOrder = async (orderId) => {
  return paymentRepo.findByOrder(orderId);
};

export const create = async (data) => {
  return paymentRepo.create(data);
};