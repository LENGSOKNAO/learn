import { Router } from "express";
import * as addressController from "../controllers/address.controller.js";
import { authenticate } from "../middlewares/auth.middleware.js";

const route = Router();

route.get("/addresses", authenticate, addressController.list);
route.post("/addresses", authenticate, addressController.create);
route.put("/addresses/:id", authenticate, addressController.update);
route.delete("/addresses/:id", authenticate, addressController.destroy);

export default route;