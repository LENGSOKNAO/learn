import pool from "../config/database.js";

/**
 * Get all orders for a user with their items.
 * @param {number} userId - User ID
 * @returns {Promise<Array>} Array of orders, each with an items array
 */
export const findByUser = async (userId) => {
  const [rows] = await pool.query("SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC", [userId]);
  for (const order of rows) {
    order.items = await getItems(order.id);
  }
  return rows;
};

/**
 * Find an order by ID, scoped to user.
 * @param {number} id - Order ID
 * @param {number} userId - User ID (ownership check)
 * @returns {Promise<Object|null>} Order with items or null
 */
export const findById = async (id, userId) => {
  const [rows] = await pool.query("SELECT * FROM orders WHERE id = ? AND user_id = ?", [id, userId]);
  const order = rows[0];
  if (!order) return null;
  order.items = await getItems(order.id);
  return order;
};

/**
 * Get all items for an order with product details.
 * @param {number} orderId - Order ID
 * @returns {Promise<Array>} Array of order items with product name and image
 */
export const getItems = async (orderId) => {
  const [rows] = await pool.query(
    "SELECT oi.*, p.name, p.image FROM order_items oi JOIN products p ON oi.product_id = p.id WHERE oi.order_id = ?",
    [orderId]
  );
  return rows;
};

/**
 * Create a new order record.
 * @param {Object} data - { user_id, order_number, total, shipping_address_id, payment_method, notes }
 * @returns {Promise<number>} Inserted order ID
 */
export const create = async (data) => {
  const { user_id, order_number, total, shipping_address_id, payment_method, notes } = data;
  const [result] = await pool.query(
    "INSERT INTO orders (user_id, order_number, total, shipping_address_id, payment_method, notes) VALUES (?, ?, ?, ?, ?, ?)",
    [user_id, order_number, total, shipping_address_id || null, payment_method || null, notes || null]
  );
  return result.insertId;
};

/**
 * Add a product line item to an order.
 * @param {number} orderId - Order ID
 * @param {number} productId - Product ID
 * @param {number} quantity - Quantity ordered
 * @param {number} price - Price at time of order
 */
export const addOrderItem = async (orderId, productId, quantity, price) => {
  await pool.query(
    "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)",
    [orderId, productId, quantity, price]
  );
};