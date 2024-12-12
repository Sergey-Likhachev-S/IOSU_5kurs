CREATE OR REPLACE FUNCTION calculate_total_rental_cost(equipment_ids INT[])
RETURNS NUMERIC AS $$
DECLARE
    total_cost NUMERIC := 0;
BEGIN
    SELECT SUM(price) INTO total_cost
    FROM equipment
    WHERE id = ANY(equipment_ids);
    RETURN total_cost;
END;
$$ LANGUAGE plpgsql;

SELECT calculate_total_rental_cost(ARRAY[1, 2, 3]);
