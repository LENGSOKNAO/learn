import { Router } from "express";
import * as userController from "../controllers/user.controller.js";
import { authenticate } from "../middlewares/auth.middleware.js";
import { adminOnly } from "../middlewares/admin.middleware.js";

const route = Router();

route.get("/users", authenticate, userController.list);
route.get("/users/me", authenticate, userController.getMe);
route.get("/users/:id", authenticate, userController.getById);
route.put("/users/:id", authenticate, userController.update);
route.delete("/users/:id", authenticate, userController.destroy);

export default route;