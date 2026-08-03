import * as cartService from "../services/cart.service.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { success, created } from "../utils/response.js";

export const getCart = asyncHandler(async (req, res) => {
  const cart = await cartService.getCart(req.user.id);
  success(res, cart);
});

export const addItem = asyncHandler(async (req, res) => {
  const { product_id, quantity } = req.body;
  const cart = await cartService.addItem(req.user.id, product_id, quantity);
  created(res, cart);
});

export const updateItem = asyncHandler(async (req, res) => {
  const cart = await cartService.updateItem(req.params.id, req.user.id, req.body.quantity);
  success(res, cart, "Cart updated");
});

export const removeItem = asyncHandler(async (req, res) => {
  const cart = await cartService.removeItem(req.params.id, req.user.id);
  success(res, cart, "Item removed");
});