# E-Commerce API

Node.js/Express REST API with MySQL, JWT authentication, layered architecture.

## Quick Start

```bash
npm install
mysql -u root -p < src/sql/schema.sql
mysql -u root -p < src/sql/seed.sql
npm run dev
```

## Project Structure

```
src/
├── server.js              # Entry point
├── app.js                 # Express app setup
├── config/                # env.js, database.js, upload.js
├── controllers/           # Route handlers
├── services/              # Business logic
├── repositories/          # SQL queries
├── routes/                # Endpoint definitions
├── middlewares/           # Auth, validation, error handling
├── validators/            # Input validation
├── utils/                 # Helpers
└── sql/                   # Schema, seed, views
```

---

## Complete API Reference with Code Examples

### Authentication

#### Register a new user
```bash
curl -X POST http://localhost:3000/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "first_name": "John",
    "last_name": "Doe",
    "username": "johndoe",
    "email": "john@example.com",
    "password": "secure123",
    "phone": "1234567890"
  }'
```
**Response 201:**
```json
{
  "success": true,
  "message": "Registration successful",
  "data": {
    "user": { "id": 1, "first_name": "John", "email": "john@example.com", ... },
    "token": "eyJhbGciOiJIUzI1NiIs..."
  }
}
```

#### Login
```bash
curl -X POST http://localhost:3000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email": "john@example.com", "password": "secure123"}'
```
**Response:**
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIs...",
    "user": { "id": 1, "email": "john@example.com", "username": "johndoe", "role": "user" }
  }
}
```

---

## Users

### List all users
```bash
curl -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/users
```
**Response:**
```json
{
  "success": true,
  "message": "Success",
  "data": [
    { "id": 1, "first_name": "John", "last_name": "Doe", "username": "johndoe", "email": "john@example.com", "role": "user", "status": "active", "created_at": "2026-07-14T..." }
  ]
}
```

### Get current user
```bash
curl -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/users/me
```
**Response:**
```json
{
  "success": true,
  "message": "Success",
  "data": { "id": 1, "first_name": "John", "email": "john@example.com", "role": "user" }
}
```

### Get user by ID
```bash
curl -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/users/1
```

### Update user
```bash
curl -X PUT http://localhost:3000/api/v1/users/1 \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"first_name": "Johnny", "phone": "0987654321"}'
```
**Response:**
```json
{
  "success": true,
  "message": "User updated",
  "data": { "id": 1, "first_name": "Johnny", "phone": "0987654321", ... }
}
```

### Delete user
```bash
curl -X DELETE -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/users/1
```
**Response:**
```json
{ "success": true, "message": "User deleted successfully" }
```

---

## Categories

### List all categories
```bash
curl http://localhost:3000/api/v1/categories
```
**Response:**
```json
{
  "success": true,
  "message": "Success",
  "data": [
    { "id": 1, "name": "Electronics", "slug": "electronics", "description": "Electronic devices", "parent_id": null }
  ]
}
```

### Get category by ID
```bash
curl http://localhost:3000/api/v1/categories/1
```

### Create category
```bash
curl -X POST http://localhost:3000/api/v1/categories \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"name": "Accessories", "slug": "accessories", "description": "Phone accessories"}'
```
**Response 201:**
```json
{
  "success": true,
  "message": "Created successfully",
  "data": { "id": 4, "name": "Accessories", "slug": "accessories", "description": "Phone accessories", "parent_id": null }
}
```

### Update category
```bash
curl -X PUT http://localhost:3000/api/v1/categories/4 \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"name": "Gadgets", "description": "Electronic gadgets"}'
```
**Response:**
```json
{
  "success": true,
  "message": "Category updated",
  "data": { "id": 4, "name": "Gadgets", "slug": "accessories", "description": "Electronic gadgets", "parent_id": null }
}
```

### Delete category
```bash
curl -X DELETE -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/categories/4
```
**Response:**
```json
{ "success": true, "message": "Category deleted successfully" }
```

---

## Products

### List products with filters
```bash
curl "http://localhost:3000/api/v1/products?category_id=1&featured=true&search=headphones&min_price=10&max_price=100&page=1&limit=20"
```
**Response:**
```json
{
  "success": true,
  "message": "Success",
  "data": [
    {
      "id": 1,
      "name": "Wireless Headphones",
      "slug": "wireless-headphones",
      "price": "79.99",
      "category_name": "Electronics",
      "stock": 50,
      "featured": 1
    }
  ]
}
```

### Get product by ID
```bash
curl http://localhost:3000/api/v1/products/1
```

### Create product
```bash
curl -X POST http://localhost:3000/api/v1/products \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{
    "name": "Bluetooth Speaker",
    "slug": "bluetooth-speaker",
    "description": "Portable waterproof speaker",
    "price": 49.99,
    "category_id": 1,
    "stock": 30,
    "sku": "BT-001",
    "featured": true
  }'
```
**Response 201:**
```json
{
  "success": true,
  "message": "Created successfully",
  "data": { "id": 4, "name": "Bluetooth Speaker", "price": "49.99", "stock": 30, ... }
}
```

### Update product
```bash
curl -X PUT http://localhost:3000/api/v1/products/4 \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"price": 39.99, "stock": 75}'
```
**Response:**
```json
{
  "success": true,
  "message": "Product updated",
  "data": { "id": 4, "name": "Bluetooth Speaker", "price": "39.99", "stock": 75, ... }
}
```

### Delete product
```bash
curl -X DELETE -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/products/4
```
**Response:**
```json
{ "success": true, "message": "Product deleted successfully" }
```

---

## Reviews

### Get reviews for a product
```bash
curl http://localhost:3000/api/v1/products/1/reviews
```
**Response:**
```json
{
  "success": true,
  "message": "Success",
  "data": [
    { "id": 1, "product_id": 1, "user_id": 1, "rating": 5, "comment": "Great product!", "username": "johndoe" }
  ]
}
```

### Create/update review
```bash
curl -X POST http://localhost:3000/api/v1/products/1/reviews \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"rating": 4, "comment": "Good quality"}'
```
**Response 201:**
```json
{
  "success": true,
  "message": "Created successfully",
  "data": { "id": 2, "product_id": 1, "user_id": 1, "rating": 4, "comment": "Good quality" }
}
```
*Note: If the user already reviewed this product, it updates instead of creating a duplicate.*

### Delete review
```bash
curl -X DELETE -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/reviews/2
```
**Response:**
```json
{ "success": true, "message": "Review deleted successfully" }
```

---

## Addresses

### List user addresses
```bash
curl -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/addresses
```

### Create address
```bash
curl -X POST http://localhost:3000/api/v1/addresses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{
    "label": "Home",
    "address_line1": "123 Main St",
    "city": "New York",
    "state": "NY",
    "postal_code": "10001",
    "is_default": true
  }'
```
**Response 201:**
```json
{
  "success": true,
  "message": "Created successfully",
  "data": { "id": 1, "label": "Home", "address_line1": "123 Main St", "city": "New York", "state": "NY", "is_default": true }
}
```

### Update address
```bash
curl -X PUT http://localhost:3000/api/v1/addresses/1 \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"label": "Work", "address_line1": "456 Office Blvd", "is_default": true}'
```
**Response:**
```json
{
  "success": true,
  "message": "Address updated",
  "data": { "id": 1, "label": "Work", "address_line1": "456 Office Blvd", "is_default": true }
}
```

### Delete address
```bash
curl -X DELETE -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/addresses/1
```
**Response:**
```json
{ "success": true, "message": "Address deleted successfully" }
```

---

## Cart

### Get cart
```bash
curl -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/cart
```
**Response:**
```json
{
  "success": true,
  "message": "Success",
  "data": {
    "items": [
      { "cart_item_id": 1, "quantity": 2, "product_id": 1, "name": "Wireless Headphones", "price": "79.99", "image": null, "stock": 50 }
    ],
    "total": 159.98
  }
}
```

### Add item to cart
```bash
curl -X POST http://localhost:3000/api/v1/cart \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"product_id": 1, "quantity": 2}'
```
**Response 201:** Returns full cart with items + total.
*Note: If product already in cart, quantities are merged.*

### Update cart item quantity
```bash
curl -X PUT http://localhost:3000/api/v1/cart/1 \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"quantity": 5}'
```
**Response:**
```json
{
  "success": true,
  "message": "Cart updated",
  "data": {
    "items": [ { "cart_item_id": 1, "quantity": 5, "product_id": 1, "name": "Wireless Headphones", "price": "79.99", "total": 399.95 } ],
    "total": 399.95
  }
}
```

### Remove item from cart
```bash
curl -X DELETE -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/cart/1
```
**Response:**
```json
{
  "success": true,
  "message": "Item removed",
  "data": { "items": [], "total": 0 }
}
```

---

## Orders

### Create order (checkout)
```bash
curl -X POST http://localhost:3000/api/v1/orders \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"shipping_address_id": 1, "payment_method": "credit_card", "notes": "Leave at door"}'
```
**Response 201:**
```json
{
  "success": true,
  "message": "Created successfully",
  "data": {
    "id": 1,
    "order_number": "ORD-1721234567890-A1B2",
    "status": "pending",
    "total": 159.98,
    "payment_method": "credit_card",
    "items": [
      { "product_id": 1, "name": "Wireless Headphones", "quantity": 2, "price": "79.99" }
    ]
  }
}
```
*Note: Cart is automatically cleared after successful order creation.*

### List user orders
```bash
curl -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/orders
```

### Get order by ID
```bash
curl -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/orders/1
```
**Response:**
```json
{
  "success": true,
  "message": "Success",
  "data": {
    "id": 1,
    "order_number": "ORD-1721234567890-A1B2",
    "status": "pending",
    "total": 159.98,
    "payment_status": "pending",
    "items": [
      { "product_id": 1, "name": "Wireless Headphones", "quantity": 2, "price": "79.99" }
    ]
  }
}
```

---

## Payments

### Create payment
```bash
curl -X POST http://localhost:3000/api/v1/payments \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"order_id": 1, "amount": 159.98, "method": "credit_card", "transaction_id": "txn_123abc"}'
```
**Response 201:**
```json
{
  "success": true,
  "message": "Created successfully",
  "data": { "id": 1, "order_id": 1, "amount": "159.98", "method": "credit_card", "status": "pending", "transaction_id": "txn_123abc" }
}
```

### Get payments for an order
```bash
curl -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/orders/1/payments
```

---

## Dashboard (Admin)

### Get stats
```bash
curl -H "Authorization: Bearer <token>" http://localhost:3000/api/v1/dashboard/stats
```
**Response:**
```json
{
  "success": true,
  "message": "Success",
  "data": { "totalUsers": 10, "totalProducts": 25, "totalOrders": 5, "totalRevenue": 1250.00 }
}
```

---

## Full Data Flow Example: Complete Purchase

### Step 1: Register
```bash
curl -X POST http://localhost:3000/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email": "buyer@test.com", "password": "test123", "username": "buyer"}'
```
Save the `token` from the response.

### Step 2: Add address
```bash
curl -X POST http://localhost:3000/api/v1/addresses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"address_line1": "123 Main St", "city": "NYC", "state": "NY", "is_default": true}'
```
Save the `id` from response.

### Step 3: Add items to cart
```bash
curl -X POST http://localhost:3000/api/v1/cart \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"product_id": 1, "quantity": 2}'
```

### Step 4: Checkout
```bash
curl -X POST http://localhost:3000/api/v1/orders \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"shipping_address_id": 1, "payment_method": "credit_card"}'
```

### Step 5: Record payment
```bash
curl -X POST http://localhost:3000/api/v1/payments \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{"order_id": 1, "amount": 159.98, "method": "credit_card", "transaction_id": "txn_abc123"}'
```

---

## How to Expand

### Add a new resource (e.g., "Coupons")

1. **SQL** — Add `coupons` table to `src/sql/schema.sql`
2. **Repository** — Create `src/repositories/coupon.repository.js` with SQL queries
3. **Service** — Create `src/services/coupon.service.js` with business logic
4. **Controller** — Create `src/controllers/coupon.controller.js` with route handlers
5. **Routes** — Create `src/routes/coupon.routes.js` with endpoint definitions
6. **Register** — Add `import couponRoutes from "./coupon.routes.js"` and `router.use(couponRoutes)` in `src/routes/index.js`

### Add a new middleware

Create a file in `src/middlewares/` and apply it in any route file:
```js
route.get("/resource", myMiddleware, controller.handler);
```

### Add a new validator

Create a file in `src/validators/` exporting a function that returns `{ error, value }`, then use it:
```js
route.post("/resource", validate(mySchema), controller.create);
```

---

## Response Format

All responses follow a consistent format:

**Success:**
```json
{ "success": true, "message": "Success", "data": ... }
```

**Created:**
```json
{ "success": true, "message": "Created successfully", "data": ... }
```

**Error:**
```json
{ "success": false, "message": "Error description" }
```

**404:**
```json
{ "success": false, "message": "Route /api/v1/unknown not found" }
```

---

## Error Handling Flow

1. `asyncHandler` catches any thrown error in controllers
2. Error is passed to `next(err)`
3. `errorHandler` middleware catches it
4. If error is `AppError`, uses its `status` property; otherwise defaults to 500
5. Returns `{ success: false, message }` with appropriate HTTP status

---

## How to Expand

### Add a new resource (e.g., "Coupons")

1. **SQL** — Add `coupons` table to `src/sql/schema.sql`
2. **Repository** — Create `src/repositories/coupon.repository.js` with SQL queries
3. **Service** — Create `src/services/coupon.service.js` with business logic
4. **Controller** — Create `src/controllers/coupon.controller.js` with route handlers
5. **Routes** — Create `src/routes/coupon.routes.js` with endpoint definitions
6. **Register** — Add `import couponRoutes from "./coupon.routes.js"` and `router.use(couponRoutes)` in `src/routes/index.js`

### Add a new middleware

Create a file in `src/middlewares/` and apply it in any route file:
```js
route.get("/resource", myMiddleware, controller.handler);
```

### Add a new validator

Create a file in `src/validators/` exporting a function that returns `{ error, value }`, then use it:
```js
route.post("/resource", validate(mySchema), controller.create);
```
