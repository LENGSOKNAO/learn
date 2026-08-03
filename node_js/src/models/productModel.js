const connectDB = require("../config/db");

async function getAll() {
  const db = await connectDB();
  const [rows] = await db.query("SELECT * FROM products");
  await db.end();
  return rows;
}

async function getById(id) {
  const db = await connectDB();
  const [rows] = await db.query("SELECT * FROM products WHERE id = ?", [id]);
  await db.end();
  return rows[0];
}

async function create(name, price) {
  const db = await connectDB();
  const [result] = await db.query(
    "INSERT INTO products (name, price) VALUES (?, ?)",
    [name, price]
  );
  await db.end();
  return { id: result.insertId, name, price };
}

async function update(id, name, price) {
  const db = await connectDB();
  await db.query(
    "UPDATE products SET name = ?, price = ? WHERE id = ?",
    [name, price, id]
  );
  await db.end();
  return { id, name, price };
}

async function remove(id) {
  const db = await connectDB();
  await db.query("DELETE FROM products WHERE id = ?", [id]);
  await db.end();
}

module.exports = { getAll, getById, create, update, remove };
