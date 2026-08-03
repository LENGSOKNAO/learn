import { Router } from "express";
import * as reviewController from "../controllers/review.controller.js";
import { authenticate } from "../middlewares/auth.middleware.js";

const route = Router();

route.get("/products/:productId/reviews", reviewController.listByProduct);
route.post("/products/:productId/reviews", authenticate, reviewController.create);
route.delete("/reviews/:id", authenticate, reviewController.destroy);

export default route;