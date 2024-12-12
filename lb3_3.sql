SELECT 
    id AS trail_id,
    name AS trail_name,
    height_difference,
    RANK() OVER (ORDER BY height_difference DESC) AS rank_height
FROM trails;
