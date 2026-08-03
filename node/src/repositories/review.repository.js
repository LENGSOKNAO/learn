import pool from "../config/database.js";

/**
 * Get all reviews for a product with user info.
 * @param {number} productId - Product ID
 * @returns {Promise<Array>} Array of reviews with username and profile_image
 */
export const findByProduct = async (productId) => {
  const [rows] = await pool.query(
    "SELECT r.*, u.username, u.profile_image FROM reviews r JOIN users u ON r.user_id = u.id WHERE r.product_id = ? ORDER BY r.created_at DESC",
    [productId]
  );
  return rows;
};

/**
 * Check if a user has already reviewed a product.
 * @param {number} productId - Product ID
 * @param {number} userId - User ID
 * @returns {Promise<Object|undefined>} Existing review or undefined
 */
export const findExisting = async (productId, userId) => {
  const [rows] = await pool.query("SELECT * FROM reviews WHERE product_id = ? AND user_id = ?", [productId, userId]);
  return rows[0];
};

/**
 * Create a new review.
 * @param {Object} data - { product_id, user_id, rating, comment }
 * @returns {Promise<Object>} Created review
 */
export const create = async (data) => {
  const { product_id, user_id, rating, comment } = data;
  const [result] = await pool.query(
    "INSERT INTO reviews (product_id, user_id, rating, comment) VALUES (?, ?, ?, ?)",
    [product_id, user_id, rating, comment]
  );
  const [rows] = await pool.query("SELECT * FROM reviews WHERE id = ?", [result.insertId]);
  return rows[0];
};

/**
 * Update an existing review by product and user.
 * @param {number} productId - Product ID
 * @param {number} userId - User ID
 * @param {Object} fields - { rating, comment }
 * @returns {Promise<Object>} Updated review
 */
export const update = async (productId, userId, fields) => {
  await pool.query("UPDATE reviews SET rating = ?, comment = ? WHERE product_id = ? AND user_id = ?",
    [fields.rating, fields.comment, productId, userId]);
  const [rows] = await pool.query("SELECT * FROM reviews WHERE product_id = ? AND user_id = ?", [productId, userId]);
  return rows[0];
};

/**
 * Delete a review by ID.
 * @param {number} id - Review ID
 * @returns {Promise<boolean>} True if deleted, false if not found
 */
export const remove = async (id) => {
  const [result] = await pool.query("DELETE FROM reviews WHERE id = ?", [id]);
  return result.affectedRows > 0;
};