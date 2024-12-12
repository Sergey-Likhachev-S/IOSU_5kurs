CREATE OR REPLACE FUNCTION set_trek_dates()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.start_date IS NULL THEN
        NEW.start_date = current_timestamp;
    END IF;
    IF NEW.end_date IS NULL THEN
        NEW.end_date = NEW.start_date + INTERVAL '1 day';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_trek_insert
BEFORE INSERT ON treks
FOR EACH ROW
EXECUTE FUNCTION set_trek_dates();

-- Добавление похода без указания времени
INSERT INTO treks (id, distance, spend_time, trek_status_id, trail_id)
VALUES (1001, 15.0, 7200, (SELECT id FROM trek_status WHERE name = 'Планируется'), 1);

-- Проверка данных в таблице treks
SELECT * FROM treks WHERE id = 1001;
