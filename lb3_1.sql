SELECT 
    id AS trail_id,
    name AS trail_name,
    trail_duration,
    ROW_NUMBER() OVER (ORDER BY trail_duration DESC) AS row_num
FROM trails;
