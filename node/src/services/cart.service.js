import * as cartRepo from "../repositories/cart.repository.js";

export const getCart = async (userId) => {
  return cartRepo.findByUser(userId);
};

export const addItem = async (userId, productId, quantity) => {
  const existing = await cartRepo.findCartItem(userId, productId);
  if (existing) {
    const newQty = existing.quantity + (quantity || 1);
    await cartRepo.updateQuantity(existing.id, userId, newQty);
  } else {
    await cartRepo.addItem(userId, productId, quantity || 1);
  }
  return cartRepo.findByUser(userId);
};

export const updateItem = async (id, userId, quantity) => {
  await cartRepo.updateQuantity(id, userId, quantity);
  return cartRepo.findByUser(userId);
};

export const removeItem = async (id, userId) => {
  await cartRepo.removeItem(id, userId);
  return cartRepo.findByUser(userId);
};