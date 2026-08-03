import pool from "../config/database.js";

export const findByOrder = async (orderId) => {
  const [rows] = await pool.query("SELECT * FROM payments WHERE order_id = ? ORDER BY created_at DESC", [orderId]);
  return rows;
};

export const create = async (data) => {
  const { order_id, amount, method, transaction_id } = data;
  const [result] = await pool.query(
    "INSERT INTO payments (order_id, amount, method, transaction_id) VALUES (?, ?, ?, ?)",
    [order_id, amount, method, transaction_id || null]
  );
  const [rows] = await pool.query("SELECT * FROM payments WHERE id = ?", [result.insertId]);
  return rows[0];
};