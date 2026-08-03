const connectDB = require("../config/db");

async function findByEmail(email) {
  const db = await connectDB();
  const [rows] = await db.query("SELECT * FROM users WHERE email = ?", [email]);
  await db.end();
  return rows[0];
}

async function create(name, email, password) {
  const db = await connectDB();
  const [result] = await db.query(
    "INSERT INTO users (name, email, password) VALUES (?, ?, ?)",
    [name, email, password]
  );
  await db.end();
  return { id: result.insertId, name, email };
}

module.exports = { findByEmail, create };
