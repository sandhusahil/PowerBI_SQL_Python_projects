-- ============================================
-- Business Analysis Queries
-- E-commerce Sales Analysis
-- ============================================


-- =====================================================
-- Q1: Monthly Revenue Trend
-- =====================================================

SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    ROUND(SUM(p.price * oi.quantity * (1 - oi.discount)), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY month
ORDER BY month;



-- =====================================================
-- Q2: Monthly Revenue Growth (%)
-- =====================================================

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_date) AS month,
        SUM(p.price * oi.quantity * (1 - oi.discount)) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Completed'
    GROUP BY month
)

SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month))
        / LAG(revenue) OVER (ORDER BY month) * 100,
        2
    ) AS growth_percentage
FROM monthly_revenue;



-- =====================================================
-- Q3: Average Order Value (AOV)
-- =====================================================

SELECT
    ROUND(
        SUM(p.price * oi.quantity * (1 - oi.discount))
        / COUNT(DISTINCT o.order_id),
        2
    ) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed';



-- =====================================================
-- Q4: Revenue by Product Category
-- =====================================================

SELECT
    p.category,
    ROUND(
        SUM(p.price * oi.quantity * (1 - oi.discount)),
        2
    ) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY total_revenue DESC;



-- =====================================================
-- Q5: New vs Repeat Customers
-- =====================================================

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM orders
    WHERE order_status = 'Completed'
    GROUP BY customer_id
)

SELECT
    CASE
        WHEN total_orders = 1 THEN 'New Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM customer_orders
GROUP BY customer_type;



-- =====================================================
-- Q6: Top 10 Customers by Revenue
-- =====================================================

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(
        SUM(p.price * oi.quantity * (1 - oi.discount)),
        2
    ) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC
LIMIT 10;



-- =====================================================
-- Q7: Order Cancellation / Return Percentage
-- =====================================================

SELECT
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN order_status IN ('Cancelled', 'Returned') THEN 1
            ELSE 0
        END
    ) AS problem_orders,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN order_status IN ('Cancelled', 'Returned') THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS problem_order_percentage
FROM orders;



-- =====================================================
-- Q8: Best Selling Products by Revenue
-- =====================================================

SELECT
    p.product_id,
    p.product_name,
    p.category,
    ROUND(
        SUM(p.price * oi.quantity * (1 - oi.discount)),
        2
    ) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 10;
