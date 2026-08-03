import { Router } from "express";
import authRoutes from "./auth.routes.js";
import userRoutes from "./user.routes.js";
import categoryRoutes from "./category.routes.js";
import productRoutes from "./product.routes.js";
import reviewRoutes from "./review.routes.js";
import addressRoutes from "./address.routes.js";
import cartRoutes from "./cart.routes.js";
import orderRoutes from "./order.routes.js";
import paymentRoutes from "./payment.routes.js";

const router = Router();

router.use(authRoutes);
router.use(userRoutes);
router.use(categoryRoutes);
router.use(productRoutes);
router.use(reviewRoutes);
router.use(addressRoutes);
router.use(cartRoutes);
router.use(orderRoutes);
router.use(paymentRoutes);

export default router;