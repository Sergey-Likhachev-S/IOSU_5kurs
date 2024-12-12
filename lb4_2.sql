CREATE OR REPLACE FUNCTION validate_trail_coordinates()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.start_coordinates IS NULL THEN
        RAISE EXCEPTION 'Координаты старта маршрута не могут быть пустыми.';
    END IF;
    IF NEW.end_coordinates IS NULL THEN
        RAISE EXCEPTION 'Координаты конца маршрута не могут быть пустыми.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_trail_insert
BEFORE INSERT ON trails
FOR EACH ROW
EXECUTE FUNCTION validate_trail_coordinates();

-- Попытка добавить маршрут без координат
INSERT INTO trails (id, name, description, trail_lenght, trail_duration, height_difference, 
                    water_avaibability, difficulty_id, trail_type_id)
VALUES (1000, 'Маршрут без координат', 'Проверка триггера', 5.0, 1.5, 50.0, FALSE, 2, 2);
