const express = require("express");
const cors = require("cors");
const path = require("path");
const multer = require("multer");
require("dotenv").config();

const productRoutes = require("./src/routes/productRoutes");
const authRoutes = require("./src/routes/authRoutes");
const errorHandler = require("./src/middleware/errorMiddleware");

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Request logger
app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  next();
});

// File upload config
const storage = multer.diskStorage({
  destination: "src/uploads/",
  filename: (req, file, cb) => {
    cb(null, Date.now() + "-" + file.originalname);
  },
});
const upload = multer({ storage });

// Routes
app.get("/", (req, res) => {
  res.send("Node.js E-commerce API");
});

app.use("/api/products", productRoutes);
app.use("/api/auth", authRoutes);

// File upload endpoint
app.post("/api/upload", upload.single("image"), (req, res) => {
  res.json({ file: req.file });
});

// Error handler
app.use(errorHandler);

module.exports = app;
