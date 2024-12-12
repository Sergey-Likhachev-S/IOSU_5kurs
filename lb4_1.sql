CREATE OR REPLACE FUNCTION prevent_trail_deletion()
RETURNS TRIGGER AS $$
BEGIN
    -- Проверяем, есть ли активные походы, связанные с маршрутом, который удаляется
    IF EXISTS (
        SELECT 1
        FROM treks
        WHERE trail_id = OLD.id 
          AND trek_status_id = (SELECT id FROM trek_status WHERE name = 'В процессе')
    ) THEN
        RAISE EXCEPTION 'Невозможно удалить маршрут, связанный с активными походами.';
    END IF;

    RETURN OLD; -- Обязательное возвращение удаляемой строки
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_trail_delete
BEFORE DELETE ON trails
FOR EACH ROW
EXECUTE FUNCTION prevent_trail_deletion();


-- Создаем маршрут
INSERT INTO trails (id, name, description, trail_lenght, trail_duration, height_difference, 
                    water_avaibability, difficulty_id, trail_type_id, start_coordinates, end_coordinates)
VALUES (999, 'Тестовый маршрут', 'Для проверки триггера', 10.0, 2.0, 100.0, TRUE, 1, 1, 
        'POINT(55.7558 37.6173)', 'POINT(55.7558 37.6173)');

-- Создаем активный поход, связанный с этим маршрутом
INSERT INTO treks (id, start_date, end_date, distance, spend_time, trek_status_id, trail_id)
VALUES (999, current_timestamp, NULL, 10.0, 3600, (SELECT id FROM trek_status WHERE name = 'В процессе'), 999);

-- Пытаемся удалить маршрут
DELETE FROM trails WHERE id = 999;

