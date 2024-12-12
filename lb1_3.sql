CREATE VIEW available_equipment_view AS
SELECT 
    e.id AS equipment_id,
    e.name AS equipment_name,
    e.description AS equipment_description,
    et.name AS equipment_type,
    e.price AS price_per_day,
    er.name AS rental_provider
FROM equipment e
JOIN equipment_type et ON e.equipment_type_id = et.id
JOIN equipment_rental er ON e.rental_id = er.id
WHERE e.equipment_status_id = (
    SELECT id FROM equipment_status WHERE name = 'Доступно'
);

SELECT * FROM available_equipment_view
