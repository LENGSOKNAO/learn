import pool from "../config/database.js";

/**
 * Retrieve all users (excluding passwords).
 * @returns {Promise<Array>} Array of user objects
 */
export const findAll = async () => {
  const [rows] = await pool.query("SELECT id, first_name, last_name, username, email, role, status, created_at FROM users");
  return rows;
};

/**
 * Find a single user by their ID.
 * @param {number} id - User ID
 * @returns {Promise<Object|undefined>} User object or undefined
 */
export const findById = async (id) => {
  const [rows] = await pool.query("SELECT id, first_name, last_name, username, email, role, status, created_at FROM users WHERE id = ?", [id]);
  return rows[0];
};

/**
 * Find a user by email (includes password for authentication).
 * @param {string} email - User email
 * @returns {Promise<Object|undefined>} User object with password or undefined
 */
export const findByEmail = async (email) => {
  const [rows] = await pool.query("SELECT * FROM users WHERE email = ?", [email]);
  return rows[0];
};

/**
 * Create a new user with dynamic fields.
 * @param {Object} data - User fields as key-value pairs
 * @returns {Promise<Object>} Created user with insert ID
 */
export const create = async (data) => {
  const keys = Object.keys(data);
  const values = Object.values(data);
  const [result] = await pool.query(
    `INSERT INTO users (${keys.join(", ")}) VALUES (${keys.map(() => "?").join(", ")})`,
    values
  );
  return { id: result.insertId, ...data };
};

/**
 * Update user fields dynamically.
 * @param {number} id - User ID
 * @param {Object} fields - Key-value pairs of fields to update
 * @returns {Promise<Object|undefined>} Updated user or undefined
 */
export const update = async (id, fields) => {
  const keys = Object.keys(fields);
  if (keys.length === 0) return;
  const setClause = keys.map((k) => `${k} = ?`).join(", ");
  const values = keys.map((k) => fields[k]);
  await pool.query(`UPDATE users SET ${setClause} WHERE id = ?`, [...values, id]);
  return findById(id);
};

/**
 * Delete a user by ID.
 * @param {number} id - User ID
 * @returns {Promise<boolean>} True if deleted, false if not found
 */
export const remove = async (id) => {
  const [result] = await pool.query("DELETE FROM users WHERE id = ?", [id]);
  return result.affectedRows > 0;
};