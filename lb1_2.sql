CREATE VIEW user_achievements_view AS
SELECT 
    p.id AS user_id,
    p.name AS first_name,
    p.surname AS last_name,
    a.name AS achievement_name,
    a.description AS achievement_description
FROM person p
LEFT JOIN achievements_person ap ON p.id = ap.person_id
LEFT JOIN achievements a ON ap.achievement_id = a.id;

SELECT * FROM user_achievements_view