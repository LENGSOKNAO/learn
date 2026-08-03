import pool from "../config/database.js";

/**
 * Get all products with optional filters and pagination.
 * @param {Object} filters - { category_id, featured, search, min_price, max_price }
 * @param {Object} pagination - { limit, offset }
 * @returns {Promise<Array>} Array of product objects with category_name
 */
export const findAll = async (filters = {}, pagination = {}) => {
  let sql = "SELECT p.*, c.name AS category_name FROM products p LEFT JOIN categories c ON p.category_id = c.id WHERE 1=1";
  const params = [];

  if (filters.category_id) { sql += " AND p.category_id = ?"; params.push(filters.category_id); }
  if (filters.featured) { sql += " AND p.featured = ?"; params.push(filters.featured); }
  if (filters.search) { sql += " AND (p.name LIKE ? OR p.description LIKE ?)"; params.push(`%${filters.search}%`, `%${filters.search}%`); }
  if (filters.min_price) { sql += " AND p.price >= ?"; params.push(filters.min_price); }
  if (filters.max_price) { sql += " AND p.price <= ?"; params.push(filters.max_price); }

  sql += " ORDER BY p.created_at DESC";
  if (pagination.limit) {
    sql += " LIMIT ? OFFSET ?";
    params.push(pagination.limit, pagination.offset);
  }

  const [rows] = await pool.query(sql, params);
  return rows;
};

/**
 * Find a product by ID with its category name.
 * @param {number} id - Product ID
 * @returns {Promise<Object|undefined>} Product with category_name or undefined
 */
export const findById = async (id) => {
  const [rows] = await pool.query(
    "SELECT p.*, c.name AS category_name FROM products p LEFT JOIN categories c ON p.category_id = c.id WHERE p.id = ?",
    [id]
  );
  return rows[0];
};

/**
 * Create a new product.
 * @param {Object} data - { name, slug, description, price, compare_price, category_id, image, images, stock, sku, featured }
 * @returns {Promise<Object>} Created product
 */
export const create = async (data) => {
  const { name, slug, description, price, compare_price, category_id, image, images, stock, sku, featured } = data;
  const [result] = await pool.query(
    `INSERT INTO products (name, slug, description, price, compare_price, category_id, image, images, stock, sku, featured)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
    [name, slug, description, price, compare_price || null, category_id || null, image, images ? JSON.stringify(images) : null, stock || 0, sku, featured || false]
  );
  return findById(result.insertId);
};

/**
 * Update product fields dynamically. Handles images JSON serialization.
 * @param {number} id - Product ID
 * @param {Object} fields - Key-value pairs of fields to update
 * @returns {Promise<Object|undefined>} Updated product or undefined
 */
export const update = async (id, fields) => {
  if (fields.images && typeof fields.images === "object") {
    fields.images = JSON.stringify(fields.images);
  }
  const keys = Object.keys(fields);
  if (keys.length === 0) return;
  const setClause = keys.map((k) => `${k} = ?`).join(", ");
  const values = keys.map((k) => fields[k]);
  await pool.query(`UPDATE products SET ${setClause} WHERE id = ?`, [...values, id]);
  return findById(id);
};

/**
 * Delete a product by ID.
 * @param {number} id - Product ID
 * @returns {Promise<boolean>} True if deleted, false if not found
 */
export const remove = async (id) => {
  const [result] = await pool.query("DELETE FROM products WHERE id = ?", [id]);
  return result.affectedRows > 0;
};