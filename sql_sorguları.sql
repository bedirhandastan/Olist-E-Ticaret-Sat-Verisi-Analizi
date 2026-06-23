-- 1. Şehre göre satış
SELECT
    c.customer_city,
    COUNT(DISTINCT o.order_id) AS siparis_sayisi,
    SUM(p.payment_value)       AS toplam_gelir
FROM orders o
JOIN customers      c ON o.customer_id = c.customer_id
JOIN order_payments p ON o.order_id    = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_city
ORDER BY toplam_gelir DESC;

-- 2. Kategori bazlı ortalama fiyat
SELECT
    pc.product_category_name_english AS kategori,
    COUNT(oi.order_id)               AS urun_sayisi,
    AVG(oi.price)                    AS ort_fiyat
FROM order_items oi
JOIN products        pr ON oi.product_id = pr.product_id
JOIN product_category pc ON pr.product_category_name = pc.product_category_name
GROUP BY pc.product_category_name_english
ORDER BY ort_fiyat DESC;