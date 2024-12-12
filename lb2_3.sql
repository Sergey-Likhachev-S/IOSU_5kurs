CREATE OR REPLACE FUNCTION add_new_trail(
    trail_name VARCHAR,
    trail_description VARCHAR,
    trail_length DECIMAL,
    trail_duration DECIMAL,
    height_diff DECIMAL,
    water_available BOOLEAN,
    difficulty_id INT,
    trail_type_id INT,
    start_coords GEOGRAPHY,
    end_coords GEOGRAPHY
) RETURNS TEXT AS $$
DECLARE
    new_id INT;
BEGIN
    -- Получаем следующее значение из последовательности для ID
    SELECT nextval('sequence_generator_id') INTO new_id;

    -- Проверка координат
    IF start_coords IS NULL OR end_coords IS NULL THEN
        RETURN 'Ошибка: Координаты старта и финиша не могут быть пустыми.';
    END IF;

    -- Вставка нового маршрута
    INSERT INTO trails (id, name, description, trail_lenght, trail_duration, height_difference, 
                        water_avaibability, difficulty_id, trail_type_id, start_coordinates, end_coordinates)
    VALUES (new_id, trail_name, trail_description, trail_length, trail_duration, height_diff, 
            water_available, difficulty_id, trail_type_id, start_coords, end_coords);

    RETURN 'Маршрут успешно добавлен. ID нового маршрута: ' || new_id;
END;
$$ LANGUAGE plpgsql;

SELECT add_new_trail(
    'Новый маршрут', 
    'Описание маршрута', 
    12.5, 
    6.5, 
    500, 
    TRUE, 
    1, 
    2, 
    'SRID=4326;POINT(55.7558 37.6173)', 
    'SRID=4326;POINT(55.7558 37.6173)'
);


