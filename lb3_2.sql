SELECT 
    et.name AS equipment_type,
    e.name AS equipment_name,
    e.price,
    SUM(e.price) OVER (PARTITION BY et.name) AS total_price_per_type
FROM equipment e
JOIN equipment_type et ON e.equipment_type_id = et.id;


SELECT * FROM equipment e 