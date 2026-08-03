import { Router } from "express";
import * as authController from "../controllers/auth.controller.js";
import { validate } from "../middlewares/validate.middleware.js";
import { loginSchema, registerSchema } from "../validators/auth.validation.js";

const route = Router();

route.post("/auth/register", validate(registerSchema), authController.register);
route.post("/auth/login", validate(loginSchema), authController.login);

export default route;