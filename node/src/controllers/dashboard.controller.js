import pool from "../config/database.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { success } from "../utils/response.js";

export const stats = asyncHandler(async (req, res) => {
  const [[{ totalUsers }]] = await pool.query("SELECT COUNT(*) AS totalUsers FROM users");
  const [[{ totalProducts }]] = await pool.query("SELECT COUNT(*) AS totalProducts FROM products");
  const [[{ totalOrders }]] = await pool.query("SELECT COUNT(*) AS totalOrders FROM orders");
  const [[{ totalRevenue }]] = await pool.query("SELECT COALESCE(SUM(total), 0) AS totalRevenue FROM orders WHERE status != 'cancelled'");

  success(res, { totalUsers, totalProducts, totalOrders, totalRevenue });
});