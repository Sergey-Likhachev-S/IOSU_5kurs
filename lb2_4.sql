CREATE OR REPLACE FUNCTION avg_trail_duration_by_difficulty(difficulty_name VARCHAR) 
RETURNS NUMERIC AS $$
DECLARE 
    avg_duration NUMERIC;
BEGIN
    SELECT AVG(t.trail_duration) INTO avg_duration
    FROM trails t
    JOIN difficulty d ON t.difficulty_id = d.id
    WHERE d.name = difficulty_name;

    IF avg_duration IS NULL THEN
        RETURN 0; -- Возвращает 0, если маршрутов с таким уровнем сложности нет.
    END IF;

    RETURN avg_duration;
END;
$$ LANGUAGE plpgsql;

-- Пример вызова:
SELECT avg_trail_duration_by_difficulty('Сложный');


