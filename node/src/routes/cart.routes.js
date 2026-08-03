import { Router } from "express";
import * as cartController from "../controllers/cart.controller.js";
import { authenticate } from "../middlewares/auth.middleware.js";

const route = Router();

route.get("/cart", authenticate, cartController.getCart);
route.post("/cart", authenticate, cartController.addItem);
route.put("/cart/:id", authenticate, cartController.updateItem);
route.delete("/cart/:id", authenticate, cartController.removeItem);

export default route;