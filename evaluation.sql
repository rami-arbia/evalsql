exercice 15 

SELECT *
FROM suppliers
JOIN products ON products.pro_sup_id = suppliers.sup_id
GROUP BY sup_id

exercice 17 

SELECT ord_id, cus_lastname, ord_order_date, SUM(ode_unit_price -(ode_unit_priceode_discount/100))ode_quantity AS total 
FROM orders
JOIN customers ON customers.cus_id = orders.ord_cus_id
JOIN orders_details ON orders_details.ode_ord_id = orders.ord_id
GROUP BY ord_id
ORDER BY total DESC

exercice 21

DELETE FROM products
INNER JOIN orders_details ON products.pro_id = orders_details.ode_id
WHERE pro_cat_id = 9