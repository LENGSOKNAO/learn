import { Router } from "express";
import * as orderController from "../controllers/order.controller.js";
import { authenticate } from "../middlewares/auth.middleware.js";

const route = Router();

route.get("/orders", authenticate, orderController.list);
route.get("/orders/:id", authenticate, orderController.getById);
route.post("/orders", authenticate, orderController.create);

export default route;