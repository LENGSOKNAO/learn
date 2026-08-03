# Node.js Learning Roadmap (0 to 100)

## What is Node.js?

Node.js is a JavaScript runtime that lets you run JavaScript on the server. You can use it to build APIs, websites, admin dashboards, e-commerce backends, chat apps, and more.

---

## Setup

Install Node.js from: https://nodejs.org

Check installation:

```bash
node -v
npm -v
```

Create a project:

```bash
mkdir my-node-app
cd my-node-app
npm init -y
```

---

## JavaScript Basics

### Variables

```js
const name = "John";
let age = 20;

console.log(name, age);
```

### Functions

```js
function add(a, b) {
    return a + b;
}

console.log(add(5, 2));
```

### Arrow Functions

```js
const add = (a, b) => a + b;

console.log(add(5, 2));
```

### Objects

```js
const user = {
    name: "John",
    age: 20
};

console.log(user.name);
```

### Arrays

```js
const numbers = [1, 2, 3];

numbers.forEach(n => console.log(n));
```

### Loops

```js
for (const n of numbers) {
    console.log(n);
}
```

---

## Node.js Core Modules

### File System

Create a file `fs-demo.js`:

```js
const fs = require("fs");

// Write file
fs.writeFileSync("test.txt", "Hello Node.js");

// Read file
const data = fs.readFileSync("test.txt", "utf8");
console.log(data);

// Append file
fs.appendFileSync("test.txt", "\nWelcome!");
```

Run:

```bash
node fs-demo.js
```

### Path Module

```js
const path = require("path");

console.log(path.basename(__filename));
console.log(path.dirname(__filename));
```

### OS Module

```js
const os = require("os");

console.log(os.platform());
console.log(os.cpus().length);
```

### Events

```js
const EventEmitter = require("events");

const event = new EventEmitter();

event.on("hello", () => {
    console.log("Hello Event!");
});

event.emit("hello");
```

### HTTP Server

Create `server.js`:

```js
const http = require("http");

const server = http.createServer((req, res) => {
    res.end("Hello from Node.js Server");
});

server.listen(3000, () => {
    console.log("Server running on port 3000");
});
```

Run:

```bash
node server.js
```

Open: http://localhost:3000

---

## NPM (Node Package Manager)

Install a package:

```bash
npm install express
```

Install nodemon:

```bash
npm install -g nodemon
```

Run with auto-restart:

```bash
nodemon server.js
```

---

## Express.js

Install Express:

```bash
npm install express
```

Create `app.js`:

```js
const express = require("express");

const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
    res.send("Hello Express");
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
```

Run:

```bash
node app.js
```

---

## Routing

```js
app.get("/users", (req, res) => {
    res.send("Get all users");
});

app.post("/users", (req, res) => {
    res.send("Create user");
});

app.put("/users/:id", (req, res) => {
    res.send("Update user");
});

app.delete("/users/:id", (req, res) => {
    res.send("Delete user");
});
```

---

## Middleware

```js
app.use(express.json());

app.use((req, res, next) => {
    console.log(req.method, req.url);
    next();
});
```

---

## REST API CRUD

Create `crud.js`:

```js
const express = require("express");

const app = express();
app.use(express.json());

let products = [
    { id: 1, name: "Nike Shoes", price: 100 }
];

// GET all products
app.get("/products", (req, res) => {
    res.json(products);
});

// GET single product
app.get("/products/:id", (req, res) => {
    const product = products.find(p => p.id == req.params.id);
    res.json(product);
});

// CREATE product
app.post("/products", (req, res) => {
    const product = {
        id: products.length + 1,
        name: req.body.name,
        price: req.body.price
    };

    products.push(product);
    res.json(product);
});

// UPDATE product
app.put("/products/:id", (req, res) => {
    const product = products.find(p => p.id == req.params.id);

    if (product) {
        product.name = req.body.name;
        product.price = req.body.price;
    }

    res.json(product);
});

// DELETE product
app.delete("/products/:id", (req, res) => {
    products = products.filter(p => p.id != req.params.id);
    res.json({ message: "Product deleted" });
});

app.listen(3000, () => {
    console.log("Server running on port 3000");
});
```

Run:

```bash
node crud.js
```

---

## MySQL with Node.js

Install MySQL package:

```bash
npm install mysql2
```

Create `db.js`:

```js
const mysql = require("mysql2/promise");

async function connectDB() {
    const db = await mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "shop"
    });
    return db;
}

module.exports = connectDB;
```

Create table in MySQL:

```sql
CREATE DATABASE shop;

USE shop;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);
```

Query data:

```js
const connectDB = require("./db.js");

async function getUsers() {
    const db = await connectDB();
    const [rows] = await db.query("SELECT * FROM users");
    console.log(rows);
}

getUsers();
```

---

## Environment Variables

Install dotenv:

```bash
npm install dotenv
```

Create `.env`:

```env
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=shop
```

Use in code:

```js
require("dotenv").config();

console.log(process.env.PORT);
```

---

## Authentication

Install packages:

```bash
npm install bcryptjs jsonwebtoken
```

Hash password:

```js
const bcrypt = require("bcryptjs");

async function hashPassword(password) {
    const hash = await bcrypt.hash(password, 10);
    console.log(hash);
}

hashPassword("123456");
```

Create JWT token:

```js
const jwt = require("jsonwebtoken");

async function generateToken() {
    const token = jwt.sign(
        { id: 1, email: "test@gmail.com" },
        "secretkey",
        { expiresIn: "1d" }
    );
    console.log(token);
}

generateToken();
```

---

## File Upload

Install Multer:

```bash
npm install multer
```

Upload image:

```js
const multer = require("multer");
const path = require("path");

const storage = multer.diskStorage({
    destination: "uploads/",
    filename: (req, file, cb) => {
        cb(null, Date.now() + "-" + file.originalname);
    }
});

const upload = multer({ storage });

app.post("/upload", upload.single("image"), (req, res) => {
    res.json({ file: req.file });
});
```

---

## MVC Project Structure

```text
src/
├── config/
│   └── db.js
├── controllers/
│   └── productController.js
├── models/
│   └── productModel.js
├── routes/
│   └── productRoutes.js
├── middleware/
│   └── authMiddleware.js
├── uploads/
├── app.js
└── server.js
```

---

## Error Handling

```js
app.use((err, req, res, next) => {
    res.status(500).json({
        message: err.message
    });
});
```

---

## Complete E-commerce Backend

### Install packages

```bash
npm install express mysql2 dotenv bcryptjs jsonwebtoken multer cors
npm install -g nodemon
```

### `server.js`

```js
const express = require("express");
const mysql = require("mysql2/promise");
const cors = require("cors");
require("dotenv").config();

const app = express();

app.use(cors());
app.use(express.json());

async function startServer() {
    const db = await mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME
    });

    // Get products
    app.get("/products", async (req, res) => {
        const [rows] = await db.query("SELECT * FROM products");
        res.json(rows);
    });

    // Add product
    app.post("/products", async (req, res) => {
        const { name, price } = req.body;

        await db.query(
            "INSERT INTO products (name, price) VALUES (?, ?)",
            [name, price]
        );

        res.json({ message: "Product added" });
    });

    app.listen(process.env.PORT, () => {
        console.log(`Server running on port ${process.env.PORT}`);
    });
}

startServer();
```

### MySQL Table

```sql
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10,2)
);
```

Run:

```bash
nodemon server.js
```

---

## Advanced Topics

* Promises & Async/Await
* Event Loop
* Streams & Buffers
* CORS
* Sessions & Cookies
* Rate Limiting
* Pagination, Search & Filtering
* WebSockets (Socket.IO)
* Testing with Jest
* Docker
* Deployment (Render, Railway, VPS, AWS)

---

## Projects to Build

### Beginner

* Calculator API
* Notes API
* Todo API

### Intermediate

* Blog API
* Authentication API
* Student Management System

### Advanced

* E-commerce Backend
* Car Dealership Backend
* Chat App with Socket.IO
* Food Delivery API

---

## 30-Day Study Plan

| Days  | Topics                               |
| ----- | ------------------------------------ |
| 1-3   | JavaScript review, Node.js basics    |
| 4-6   | File System, Path, OS, Events, HTTP  |
| 7-10  | npm, Express.js, Routing, Middleware |
| 11-15 | REST API, CRUD operations            |
| 16-19 | MySQL with mysql2                    |
| 20-22 | Authentication (bcrypt, JWT)         |
| 23-24 | Validation, error handling           |
| 25-26 | File uploads, pagination             |
| 27-28 | MVC architecture                     |
| 29    | Build a complete API                 |
| 30    | Deploy and review                    |

---

## Goal

After completing this roadmap, you will be able to build a real-world Node.js backend for an e-commerce website, including:

* REST APIs
* MySQL database
* Authentication with JWT
* File uploads
* CRUD operations
* MVC architecture
* Deployment
