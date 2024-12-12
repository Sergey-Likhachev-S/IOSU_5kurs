SELECT 
    a.name AS achievement_name,
    COUNT(ap.person_id) AS person_count,
    DENSE_RANK() OVER (ORDER BY COUNT(ap.person_id) DESC) AS rank_popularity
FROM achievements a
LEFT JOIN achievements_person ap ON a.id = ap.achievement_id
GROUP BY a.id, a.name;
