import mysql from "mysql2/promise";
import env from "./env.js";

const pool = mysql.createPool({ ...env.db });

export default pool;