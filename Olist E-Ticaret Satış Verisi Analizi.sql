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