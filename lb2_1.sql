CREATE OR REPLACE FUNCTION count_trails_by_difficulty(difficulty_name VARCHAR) 
RETURNS INT AS $$
DECLARE 
    trail_count INT;
BEGIN
    SELECT COUNT(*) INTO trail_count
    FROM trails t
    JOIN difficulty d ON t.difficulty_id = d.id
    WHERE d.name = difficulty_name;
    RETURN trail_count;
END;
$$ LANGUAGE plpgsql;

-- Пример вызова:
SELECT count_trails_by_difficulty('Средний');
  
