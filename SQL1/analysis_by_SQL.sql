
-- 1. Monthly item sales (item price only; excludes freight).
SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(i.price) AS item_sales,
    COUNT(DISTINCT o.order_id) AS orders
FROM olist_orders_dataset o
LEFT JOIN olist_order_items_dataset i
    ON o.order_id = i.order_id
GROUP BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
ORDER BY month;

-- 2. Category sales (translation table makes labels easier to read).
SELECT
    COALESCE(
        t.product_category_name_english,
        p.product_category_name,
        'unknown'
    ) AS category,
    SUM(i.price) AS item_sales,
    COUNT(*) AS items_sold
FROM olist_order_items_dataset i
JOIN olist_products_dataset p
    ON i.product_id = p.product_id
LEFT JOIN product_category_name_translation t
    ON p.product_category_name = t.product_category_name
GROUP BY category
ORDER BY item_sales DESC
LIMIT 10;

-- 3. Late delivery rate among delivered orders that have both delivery dates.
SELECT
    COUNT(*) AS delivered_orders,
    SUM(
        CASE
            WHEN order_delivered_customer_date > order_estimated_delivery_date
            THEN 1
            ELSE 0
        END
    ) AS late_orders,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN order_delivered_customer_date > order_estimated_delivery_date
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS late_delivery_rate_pct
FROM olist_orders_dataset
WHERE order_status = 'delivered'
    AND order_delivered_customer_date IS NOT NULL
    AND order_estimated_delivery_date IS NOT NULL;

-- 4. Orders by customer state.
SELECT
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC
LIMIT 10;

-- 5. Review score by late/on-time delivery.
WITH review_scores AS (
    SELECT
        order_id,
        AVG(review_score) AS avg_review_score
    FROM olist_order_reviews_dataset
    GROUP BY order_id
),
delivery_status AS (
    SELECT
        order_id,
        CASE
            WHEN order_delivered_customer_date > order_estimated_delivery_date
            THEN 'Late'
            ELSE 'On Time'
        END AS delivery_status
    FROM olist_orders_dataset
    WHERE order_status = 'delivered'
        AND order_delivered_customer_date IS NOT NULL
        AND order_estimated_delivery_date IS NOT NULL
)
SELECT
    d.delivery_status,
    COUNT(*) AS total_orders,
    ROUND(AVG(r.avg_review_score), 2) AS avg_review_score
FROM delivery_status d
JOIN review_scores r
    ON d.order_id = r.order_id
GROUP BY d.delivery_status
ORDER BY avg_review_score;

SELECT
    COALESCE(
        t.product_category_name_english,
        p.product_category_name,
        'unknown'
    ) AS category,
    COUNT(*) AS items_sold,
    SUM(i.price) AS item_sales
FROM olist_order_items_dataset i
JOIN olist_products_dataset p
    ON i.product_id = p.product_id
LEFT JOIN product_category_name_translation t
    ON p.product_category_name = t.product_category_name
WHERE COALESCE(
        t.product_category_name_english,
        p.product_category_name,
        'unknown'
    ) = 'bed_bath_table'
GROUP BY category;