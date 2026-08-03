USE nodeDB;

-- Product view with average rating
CREATE OR REPLACE VIEW product_summary AS
SELECT
  p.*,
  c.name AS category_name,
  COALESCE(AVG(r.rating), 0) AS avg_rating,
  COUNT(r.id) AS review_count
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
LEFT JOIN reviews r ON r.product_id = p.id
GROUP BY p.id;

-- Order summary view
CREATE OR REPLACE VIEW order_summary AS
SELECT
  o.*,
  u.username,
  u.email,
  COUNT(oi.id) AS item_count
FROM orders o
JOIN users u ON o.user_id = u.id
LEFT JOIN order_items oi ON oi.order_id = o.id
GROUP BY o.id;