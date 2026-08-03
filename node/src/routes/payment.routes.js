import { Router } from "express";
import * as paymentController from "../controllers/payment.controller.js";
import { authenticate } from "../middlewares/auth.middleware.js";

const route = Router();

route.get("/orders/:orderId/payments", authenticate, paymentController.listByOrder);
route.post("/payments", authenticate, paymentController.create);

export default route;