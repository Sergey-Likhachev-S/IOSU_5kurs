SELECT 
    id AS equipment_id,
    name AS equipment_name,
    price,
    AVG(price) OVER (ORDER BY id ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS avg_price_window
FROM equipment;
