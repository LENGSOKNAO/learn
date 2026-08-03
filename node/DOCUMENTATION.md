# E-Commerce API — Complete Documentation

## Architecture Overview

The project follows a **layered architecture** with 5 layers:

```
HTTP Request
    |
    v
[Routes]          -> Define endpoints & attach middleware
    |
    v
[Middlewares]     -> Auth, validation, error handling
    |
    v
[Controllers]     -> Parse request, call service, send response
    |
    v
[Services]        -> Business logic, orchestration
    |
    v
[Repositories]    -> Raw SQL queries (data access)
    |
    v
[Database]        -> MySQL connection pool
```

---

## Layer-by-Layer Documentation

### 1. Entry Points

#### `src/server.js`
Starts the server. Calls `ensureUploadDir()` to create the `uploads/` directory, then listens on the configured port.

#### `src/app.js`
Creates the Express app, registers middleware (JSON parsing, URL encoding), mounts all routes under `/api/v1`, then adds 404 handler and global error handler.

---

### 2. Config Layer (`src/config/`)

| File | Purpose |
|------|---------|
| `env.js` | Loads `.env` via dotenv, exports a single config object with `port`, `db`, `jwt`, and `upload` settings |
| `database.js` | Creates and exports a MySQL2 connection pool using `env.db` config |
| `upload.js` | Exports `uploadConfig` with upload directory path, max file size, and allowed MIME types |

---

### 3. Utils Layer (`src/utils/`)

| File | Exports | Purpose |
|------|---------|---------|
| `asyncHandler.js` | `asyncHandler(fn)` | Wraps async route handlers so errors are caught and forwarded to `next(err)` |
| `hash.js` | `hashPassword()`, `comparePassword()` | Wraps bcrypt for password hashing/verification |
| `jwt.js` | `generateToken()`, `verifyToken()` | Creates and verifies JWT tokens using config secret |
| `pagination.js` | `getPagination(query)` | Parses `page` and `limit` from query params, returns `{ page, limit, offset }` |
| `response.js` | `success()`, `created()`, `noContent()`, `paginated()` | Standardized JSON response helpers |
| `upload.js` | `ensureUploadDir()`, `validateFile()` | Creates uploads directory, validates file size/type |

---

### 3. Middlewares Layer (`src/middlewares/`)

| Middleware | File | Purpose |
|-----------|------|---------|
| `authenticate` | `auth.middleware.js` | Extracts Bearer token from `Authorization` header, verifies JWT, sets `req.user` |
| `adminOnly` | `admin.middleware.js` | Checks `req.user.role === "admin"`, returns 403 if not |
| `validate(schema)` | `validate.middleware.js` | Calls a validation function, returns 400 with error message if validation fails |
| `handleUpload` | `upload.middleware.js` | Validates uploaded file size and type |
| `errorHandler` | `error.middleware.js` | Global error handler — catches all errors, logs them, returns `{ success: false, message }` |
| `notFound` | `notFound.middleware.js` | Catches unmatched routes, returns 404 |
| `AppError` | `error.middleware.js` | Custom error class with `status` property for HTTP status codes |

---

### 3. Validators Layer (`src/validators/`)

Each validator exports a function that takes `data` and returns `{ error: string|null, value: data }`.

| Validator | File | Checks |
|-----------|------|--------|
| `loginSchema` | `auth.validation.js` | Email + password required |
| `registerSchema` | `auth.validation.js` | Email, password (min 6 chars), username required |
| `updateUserSchema` | `user.validation.js` | Only allows specific fields to be updated |
| `productSchema` | `product.validation.js` | Name, slug, price required |
| `orderSchema` | `order.validation.js` | Shipping address required |

---

### 3. Middlewares Layer (`src/middlewares/`)

| Middleware | File | What it does |
|-----------|------|-------------|
| `authenticate` | `auth.middleware.js` | Reads `Authorization: Bearer <token>`, verifies JWT, sets `req.user` |
| `adminOnly` | `admin.middleware.js` | Checks `req.user.role === "admin"`, returns 403 if not |
| `validate(schema)` | `validate.middleware.js` | Runs a validator function on `req.body`, returns 400 on failure |
| `handleUpload` | `upload.middleware.js` | Validates uploaded file (size + type) |
| `errorHandler` | `error.middleware.js` | Global catch-all: returns `{ success: false, message }` with proper status |
| `notFound` | `notFound.middleware.js` | Returns 404 for unmatched routes |
| `AppError` | `error.middleware.js` | Custom error class with `status` property |

---

### 4. Validators Layer (`src/validators/`)

Each validator is a function that receives `data` and returns `{ error: string|null, value: data }`. Used by `validate.middleware.js` to reject invalid requests before they reach controllers.

---

### 5. Controllers Layer (`src/controllers/`)

Controllers are thin — they:
1. Extract data from `req` (body, params, query, user)
2. Call the corresponding service
3. Use response helpers (`success`, `created`, `noContent`) to send standardized JSON

All controllers use `asyncHandler` to avoid try/catch repetition.

| Controller | Exports | Description |
|-----------|---------|-------------|
| `auth.controller.js` | `register`, `login` | Auth endpoints |
| `user.controller.js` | `list`, `getMe`, `getById`, `update`, `destroy` | User CRUD |
| `category.controller.js` | `list`, `getById`, `create`, `update`, `destroy` | Category CRUD |
| `product.controller.js` | `list`, `getById`, `create`, `update`, `destroy` | Product CRUD with filters |
| `review.controller.js` | `listByProduct`, `create`, `destroy` | Product reviews |
| `address.controller.js` | `list`, `create`, `update`, `destroy` | User addresses |
| `cart.controller.js` | `getCart`, `addItem`, `updateItem`, `removeItem` | Shopping cart |
| `order.controller.js` | `list`, `getById`, `create` | Orders & checkout |
| `payment.controller.js` | `listByOrder`, `create` | Payments |
| `dashboard.controller.js` | `stats` | Admin dashboard stats |

---

### 4. Services Layer (`src/services/`)

Services contain **business logic**. They:
- Call repositories to get data
- Apply business rules (e.g., "check if email exists before registering")
- Throw `AppError` with proper HTTP status codes
- Orchestrate multi-step operations (e.g., `order.service.js` creates order + order items + clears cart)

| Service | Key Logic |
|---------|-----------|
| `auth.service.js` | Register: check duplicate email, hash password, generate JWT. Login: verify credentials, generate JWT |
| `user.service.js` | CRUD with existence checks |
| `category.service.js` | CRUD with existence checks |
| `product.service.js` | List with pagination + filters, CRUD with existence checks |
| `review.service.js` | Upsert (create or update if exists), delete |
| `address.service.js` | CRUD scoped to user |
| `cart.service.js` | Add with quantity merge, update, remove |
| `order.service.js` | Create order from cart items, clear cart after checkout |
| `payment.service.js` | List by order, create |

---

### 5. Repositories Layer (`src/repositories/`)

Repositories contain **raw SQL queries** only — no business logic. Each repository maps to one database table.

| Repository | Table | Key Queries |
|-----------|-------|-------------|
| `user.repository.js` | `users` | `findAll` (excludes password), `findById`, `findByEmail`, `create` (dynamic fields), `update`, `remove` |
| `category.repository.js` | `categories` | `findAll` (ordered by name), `findById`, `create`, `update`, `remove` |
| `product.repository.js` | `products` | `findAll` (with filters: category_id, featured, search, price range + pagination), `findById` (with category name), `create`, `update`, `remove` |
| `review.repository.js` | `reviews` | `findByProduct` (with user info), `findExisting`, `create`, `update` (by product+user), `remove` |
| `address.repository.js` | `addresses` | `findByUser` (default first), `findById`, `create` (with default reset), `update`, `remove` |
| `cart.repository.js` | `cart_items` | `findByUser` (with product details + total calculation), `findCartItem`, `addItem`, `updateQuantity`, `removeItem`, `clearByUser` |
| `order.repository.js` | `orders` + `order_items` | `findByUser` (with items), `findById` (with items), `create`, `addOrderItem` |
| `payment.repository.js` | `payments` | `findByOrder`, `create` |
| `user.repository.js` | `users` | `findAll` (excludes password), `findById`, `findByEmail` (includes password for auth), `create` (dynamic fields), `update`, `remove` |

---

### 5. Controllers Layer (`src/controllers/`)

Controllers are thin handlers that:
1. Extract data from request (`req.body`, `req.params`, `req.query`, `req.user`)
2. Call the appropriate service function
3. Send a standardized response using `success()`, `created()`, or `noContent()`

All controllers use `asyncHandler` to automatically catch errors and forward them to the error middleware.

---

### 6. Routes Layer (`src/routes/`)

`routes/index.js` aggregates all route modules. Each resource route file defines endpoints with middleware chains.

**Public endpoints** (no auth):
- `GET /api/v1/categories`
- `GET /api/v1/categories/:id`
- `GET /api/v1/products`
- `GET /api/v1/products/:id`
- `GET /api/v1/products/:productId/reviews`
- `POST /api/v1/auth/register`
- `POST /api/v1/auth/login`

**Protected endpoints** (require `authenticate` middleware):
- All user endpoints
- Category create/update/delete
- Product create/update/delete
- Review create/delete
- All address, cart, order, payment endpoints

---

### 5. Data Flow Example: Creating an Order

```
POST /api/v1/orders  (with auth token)
        |
        v
[auth.middleware.js]  ->  Verifies JWT, sets req.user
        |
        v
[order.controller.js]  ->  Calls orderService.create(req.user.id, req.body)
        |
        v
[order.service.js]  ->  Calls cartRepo.findByUser(userId)
                     ->  Checks cart is not empty
                     ->  Generates order number
                     ->  Calls orderRepo.create() to insert order
                     ->  For each cart item: calls orderRepo.addOrderItem()
                     ->  Calls cartRepo.clearByUser() to empty cart
                     ->  Returns order with items
        |
        v
[order.controller.js]  ->  Sends 201 response with order data
```

