import dotenv from "dotenv";
dotenv.config();

export default {
  port: parseInt(process.env.PORT, 10) || 3000,
  db: {
    host: process.env.DB_HOST || "localhost",
    user: process.env.DB_USER || "root",
    password: process.env.DB_PASSWORD || "",
    database: process.env.DB_NAME || "nodeDB",
    connectionLimit: 10,
  },
  jwt: {
    secret: process.env.JWT_SECRET || "default_secret_change_me",
    expiresIn: "7d",
  },
  upload: {
    maxFileSize: 5 * 1024 * 1024,
    allowedTypes: ["image/jpeg", "image/png", "image/webp"],
  },
};