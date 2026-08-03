import pool from "../config/database.js";

/**
 * Get all addresses for a user, defaults first.
 * @param {number} userId - User ID
 * @returns {Promise<Array>} Array of address objects
 */
export const findByUser = async (userId) => {
  const [rows] = await pool.query("SELECT * FROM addresses WHERE user_id = ? ORDER BY is_default DESC, created_at DESC", [userId]);
  return rows;
};

/**
 * Find an address by its ID.
 * @param {number} id - Address ID
 * @returns {Promise<Object|undefined>} Address object or undefined
 */
export const findById = async (id) => {
  const [rows] = await pool.query("SELECT * FROM addresses WHERE id = ?", [id]);
  return rows[0];
};

/**
 * Reset all addresses for a user to non-default.
 * @param {number} userId - User ID
 */
export const resetDefault = async (userId) => {
  await pool.query("UPDATE addresses SET is_default = FALSE WHERE user_id = ?", [userId]);
};

/**
 * Create a new address. If is_default is true, resets other defaults first.
 * @param {Object} data - { user_id, label, address_line1, address_line2, city, state, postal_code, country, is_default }
 * @returns {Promise<Object>} Created address
 */
export const create = async (data) => {
  const { user_id, label, address_line1, address_line2, city, state, postal_code, country, is_default } = data;
  if (is_default) await resetDefault(user_id);
  const [result] = await pool.query(
    `INSERT INTO addresses (user_id, label, address_line1, address_line2, city, state, postal_code, country, is_default)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
    [user_id, label || "Home", address_line1, address_line2, city, state, postal_code, country || "US", is_default || false]
  );
  return findById(result.insertId);
};

/**
 * Update address fields. Resets other defaults if is_default is set.
 * @param {number} id - Address ID
 * @param {number} userId - User ID (for ownership check)
 * @param {Object} fields - Key-value pairs of fields to update
 * @returns {Promise<Object|undefined>} Updated address or undefined
 */
export const update = async (id, userId, fields) => {
  if (fields.is_default) await resetDefault(userId);
  const keys = Object.keys(fields);
  if (keys.length === 0) return;
  const setClause = keys.map((k) => `${k} = ?`).join(", ");
  const values = keys.map((k) => fields[k]);
  await pool.query(`UPDATE addresses SET ${setClause} WHERE id = ? AND user_id = ?`, [...values, id, userId]);
  return findById(id);
};

/**
 * Delete an address by ID, scoped to user.
 * @param {number} id - Address ID
 * @param {number} userId - User ID (ownership check)
 * @returns {Promise<boolean>} True if deleted, false if not found
 */
export const remove = async (id, userId) => {
  const [result] = await pool.query("DELETE FROM addresses WHERE id = ? AND user_id = ?", [id, userId]);
  return result.affectedRows > 0;
};