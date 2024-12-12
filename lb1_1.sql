CREATE VIEW detailed_trails_view AS
SELECT 
    t.id AS trail_id,
    t.name AS trail_name,
    t.description AS trail_description,
    t.trail_lenght AS length_km,
    t.trail_duration AS duration_hours,
    d.name AS difficulty,
    tt.name AS activity_type
FROM trails t
JOIN difficulty d ON t.difficulty_id = d.id
JOIN trail_type tt ON t.trail_type_id = tt.id;


SELECT * FROM detailed_trails_view 