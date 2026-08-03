import * as orderRepo from "../repositories/order.repository.js";
import * as cartRepo from "../repositories/cart.repository.js";
import { AppError } from "../middlewares/error.middleware.js";

export const getUserOrders = async (userId) => {
  return orderRepo.findByUser(userId);
};

export const getById = async (id, userId) => {
  const order = await orderRepo.findById(id, userId);
  if (!order) throw new AppError("Order not found", 404);
  return order;
};

export const create = async (userId, data) => {
  const cart = await cartRepo.findByUser(userId);
  if (cart.items.length === 0) throw new AppError("Cart is empty", 400);

  const orderNumber = "ORD-" + Date.now() + "-" + Math.random().toString(36).substring(2, 6).toUpperCase();
  const orderId = await orderRepo.create({
    user_id: userId,
    order_number: orderNumber,
    total: cart.total,
    shipping_address_id: data.shipping_address_id,
    payment_method: data.payment_method,
    notes: data.notes,
  });

  for (const item of cart.items) {
    await orderRepo.addOrderItem(orderId, item.product_id, item.quantity, item.price);
  }

  await cartRepo.clearByUser(userId);
  return orderRepo.findById(orderId, userId);
};