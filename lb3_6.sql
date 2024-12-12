SELECT 
    id AS equipment_id,
    name AS equipment_name,
    price,
    LAG(name) OVER (ORDER BY price) AS previous_equipment,
    LEAD(name) OVER (ORDER BY price) AS next_equipment
FROM equipment;
