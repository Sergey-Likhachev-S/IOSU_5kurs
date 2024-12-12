SELECT 
    id AS achievement_id,
    name AS achievement_name,
    LEAD(name) OVER (ORDER BY name) AS next_achievement
FROM achievements;
