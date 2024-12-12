SELECT 
    id AS trail_id,
    name AS trail_name,
    trail_duration,
    COUNT(*) OVER (ORDER BY trail_duration ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) AS trails_shorter,
    COUNT(*) OVER (ORDER BY trail_duration ROWS BETWEEN 1 FOLLOWING AND UNBOUNDED FOLLOWING) AS trails_longer
FROM trails;
