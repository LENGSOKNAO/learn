import { Router } from "express";
import * as productController from "../controllers/product.controller.js";
import { authenticate } from "../middlewares/auth.middleware.js";

const route = Router();

route.get("/products", productController.list);
route.get("/products/:id", productController.getById);
route.post("/products", authenticate, productController.create);
route.put("/products/:id", authenticate, productController.update);
route.delete("/products/:id", authenticate, productController.destroy);

export default route;