import pool from "../config/database.js";

/**
 * Get the full cart for a user with product details and total.
 * @param {number} userId - User ID
 * @returns {Promise<{items: Array, total: number}>} Cart with items array and calculated total
 */
export const findByUser = async (userId) => {
  const [rows] = await pool.query(
    `SELECT ci.id AS cart_item_id, ci.quantity, p.id AS product_id, p.name, p.price, p.image, p.stock
     FROM cart_items ci JOIN products p ON ci.product_id = p.id
     WHERE ci.user_id = ? ORDER BY ci.created_at DESC`,
    [userId]
  );
  const total = rows.reduce((sum, item) => sum + Number(item.price) * item.quantity, 0);
  return { items: rows, total };
};

/**
 * Find a specific cart item by user and product.
 * @param {number} userId - User ID
 * @param {number} productId - Product ID
 * @returns {Promise<Object|undefined>} Cart item or undefined
 */
export const findCartItem = async (userId, productId) => {
  const [rows] = await pool.query("SELECT * FROM cart_items WHERE user_id = ? AND product_id = ?", [userId, productId]);
  return rows[0];
};

/**
 * Add a new item to the cart.
 * @param {number} userId - User ID
 * @param {number} productId - Product ID
 * @param {number} quantity - Quantity to add
 */
export const addItem = async (userId, productId, quantity) => {
  await pool.query("INSERT INTO cart_items (user_id, product_id, quantity) VALUES (?, ?, ?)", [userId, productId, quantity]);
};

/**
 * Update the quantity of a cart item.
 * @param {number} id - Cart item ID
 * @param {number} userId - User ID (ownership check)
 * @param {number} quantity - New quantity
 */
export const updateQuantity = async (id, userId, quantity) => {
  await pool.query("UPDATE cart_items SET quantity = ? WHERE id = ? AND user_id = ?", [quantity, id, userId]);
};

/**
 * Remove a single item from the cart.
 * @param {number} id - Cart item ID
 * @param {number} userId - User ID (ownership check)
 */
export const removeItem = async (id, userId) => {
  await pool.query("DELETE FROM cart_items WHERE id = ? AND user_id = ?", [id, userId]);
};

/**
 * Clear all items from a user's cart.
 * @param {number} userId - User ID
 */
export const clearByUser = async (userId) => {
  await pool.query("DELETE FROM cart_items WHERE user_id = ?", [userId]);
};