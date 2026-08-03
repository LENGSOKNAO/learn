import { Router } from "express";
import * as categoryController from "../controllers/category.controller.js";
import { authenticate } from "../middlewares/auth.middleware.js";

const route = Router();

route.get("/categories", categoryController.list);
route.get("/categories/:id", categoryController.getById);
route.post("/categories", authenticate, categoryController.create);
route.put("/categories/:id", authenticate, categoryController.update);
route.delete("/categories/:id", authenticate, categoryController.destroy);

export default route;