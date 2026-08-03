import pool from "../config/database.js";

/**
 * Get all categories sorted by name.
 * @returns {Promise<Array>} Array of category objects
 */
export const findAll = async () => {
  const [rows] = await pool.query("SELECT * FROM categories ORDER BY name");
  return rows;
};

/**
 * Find a category by its ID.
 * @param {number} id - Category ID
 * @returns {Promise<Object|undefined>} Category object or undefined
 */
export const findById = async (id) => {
  const [rows] = await pool.query("SELECT * FROM categories WHERE id = ?", [id]);
  return rows[0];
};

/**
 * Create a new category.
 * @param {Object} data - { name, slug, description, image, parent_id }
 * @returns {Promise<Object>} Created category
 */
export const create = async (data) => {
  const { name, slug, description, image, parent_id } = data;
  const [result] = await pool.query(
    "INSERT INTO categories (name, slug, description, image, parent_id) VALUES (?, ?, ?, ?, ?)",
    [name, slug, description, image, parent_id || null]
  );
  return findById(result.insertId);
};

/**
 * Update category fields dynamically.
 * @param {number} id - Category ID
 * @param {Object} fields - Key-value pairs of fields to update
 * @returns {Promise<Object|undefined>} Updated category or undefined
 */
export const update = async (id, fields) => {
  const keys = Object.keys(fields);
  if (keys.length === 0) return;
  const setClause = keys.map((k) => `${k} = ?`).join(", ");
  const values = keys.map((k) => fields[k]);
  await pool.query(`UPDATE categories SET ${setClause} WHERE id = ?`, [...values, id]);
  return findById(id);
};

/**
 * Delete a category by ID.
 * @param {number} id - Category ID
 * @returns {Promise<boolean>} True if deleted, false if not found
 */
export const remove = async (id) => {
  const [result] = await pool.query("DELETE FROM categories WHERE id = ?", [id]);
  return result.affectedRows > 0;
};