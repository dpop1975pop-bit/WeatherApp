-- 1. Справочник Стран
CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Справочник Городов (привязан к стране)
CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    country_id INTEGER REFERENCES countries(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    latitude NUMERIC(9,6) NOT NULL,
    longitude NUMERIC(9,6) NOT NULL,
    timezone VARCHAR(50)
);

-- 3. Категории (Облачность, Осадки и т.д.)
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 4. Значения показателей (безоблачно, дождь и т.д.)
CREATE TABLE indicator_values (
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
    value VARCHAR(50) NOT NULL
);

-- 5. Единицы измерения
CREATE TABLE units (
    id SERIAL PRIMARY KEY,
    parameter VARCHAR(50) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    coefficient NUMERIC(10,4) NOT NULL
);

-- 6. Источники
CREATE TABLE sources (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    api_url VARCHAR(255),
    id_unit INTEGER REFERENCES units(id)
);

-- 7. Пользователи
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(50),
    location_id INTEGER REFERENCES cities(id),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    temperature_unit_id INTEGER REFERENCES units(id)
);

-- 8. Наблюдения (Факт)
CREATE TABLE observations (
    id SERIAL PRIMARY KEY,
    city_id INTEGER REFERENCES cities(id),
    condition_value_id INTEGER REFERENCES indicator_values(id),
    source_id INTEGER REFERENCES sources(id),
    measurement_date TIMESTAMP NOT NULL,
    temperature NUMERIC(4,1),
    humidity INTEGER,
    pressure INTEGER,
    wind_speed NUMERIC(4,1),
    wind_direction INTEGER,
    cloudiness INTEGER,
    precipitation NUMERIC(4,1),
    visibility NUMERIC(4,1)
);

-- 9. Прогнозы
CREATE TABLE forecasts (
    id SERIAL PRIMARY KEY,
    city_id INTEGER REFERENCES cities(id),
    condition_value_id INTEGER REFERENCES indicator_values(id),
    source_id INTEGER REFERENCES sources(id),
    forecast_date TIMESTAMP NOT NULL,
    created_date TIMESTAMP NOT NULL,
    temperature NUMERIC(4,1),
    humidity INTEGER,
    pressure INTEGER,
    wind_speed NUMERIC(4,1),
    wind_direction INTEGER,
    cloudiness INTEGER,
    precipitation NUMERIC(4,1),
    visibility NUMERIC(4,1)
);

-- 10. Избранные локации (связь пользователей и городов)
CREATE TABLE user_locations (
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    location_id INTEGER REFERENCES cities(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, location_id)
);

-- ==========================================
-- ЗАПОЛНЕНИЕ ДАННЫМИ (INSERT)
-- ==========================================

-- Страны
INSERT INTO countries (id, name) VALUES (1, 'Россия') 

-- Города
INSERT INTO cities (id, country_id, name, latitude, longitude, timezone) VALUES
(1, 1, 'Москва', 55.755800, 37.617300, 'Europe/Moscow'),
(2, 1, 'Санкт-Петербург', 59.934300, 30.335100, 'Europe/Moscow'),
(3, 1, 'Владивосток', 43.115500, 131.885500, 'Asia/Vladivostok'),
(4, 1, 'Казань', 55.788740, 49.122140, 'Europe/Moscow'),
(5, 1, 'Череповец', 59.133330, 37.900000, 'Europe/Moscow')


-- Категории
INSERT INTO categories (id, name) VALUES
(1, 'Облачность'),
(2, 'Осадки')


-- Значения показателей
INSERT INTO indicator_values (id, category_id, value) VALUES
(1, 1, 'Безоблачно'),
(2, 1, 'Малооблачно'),
(3, 1, 'Пасмурно'),
(4, 2, 'Нет'),
(5, 2, 'Дождь'),
(6, 2, 'Снег')


-- Единицы измерения
INSERT INTO units (id, parameter, unit, coefficient) VALUES
(1, 'Температура', '°C', 1.0),
(2, 'Температура', '°F', 0.5555),
(3, 'Давление', 'мм рт.ст.', 1.0)


-- Источники
INSERT INTO sources (id, name, api_url, id_unit) VALUES
(1, 'OpenWeather', 'https://api.openweathermap.org', 1),
(2, 'Gismeteo', 'https://api.gismeteo.ru', 1)


-- Пользователи
INSERT INTO users (id, email, name, location_id, temperature_unit_id) VALUES
(1, 'ivan@mail.ru', 'Иван', 1, 1),
(2, 'petr@mail.ru', 'Пётр', 2, 1)


-- Наблюдения (Тестовые данные)
INSERT INTO observations (id, city_id, condition_value_id, source_id, measurement_date, temperature, humidity, pressure, wind_speed, wind_direction, cloudiness, precipitation, visibility) VALUES
(1, 1, 1, 1, '2026-10-07 12:00:00', 8.5, 78, 745, 3.2, 180, 90, 1.2, 10),
(2, 1, 5, 1, '2026-10-07 15:00:00', 8.1, 80, 744, 3.5, 190, 95, 0.8, 8),
(3, 2, 1, 2, '2026-10-07 15:00:00', 6.0, 65, 750, 2.0, 90, 20, 0.0, 15),
(4, 3, 6, 1, '2026-10-07 16:00:00', -2.0, 88, 752, 4.5, 270, 100, 2.5, 6)


-- Прогнозы
INSERT INTO forecasts (id, city_id, condition_value_id, source_id, forecast_date, created_date, temperature, humidity, pressure, wind_speed, wind_direction, cloudiness, precipitation, visibility) VALUES
(1, 1, 5, 1, '2026-10-08 12:00:00', '2026-10-07 08:00:00', 7.0, 75, 746, 4.0, 200, 85, 2.0, 9),
(2, 1, 1, 2, '2026-10-09 12:00:00', '2026-10-07 08:00:00', 9.5, 60, 748, 2.5, 150, 30, 0.0, 12)


-- Избранные локации
INSERT INTO user_locations (user_id, location_id) VALUES (1, 1), (1, 2), (2, 3) 

-- Синхронизация счетчиков (чтобы новые записи создавались с правильными ID)
SELECT setval('countries_id_seq', (SELECT MAX(id) FROM countries));
SELECT setval('cities_id_seq', (SELECT MAX(id) FROM cities));
SELECT setval('categories_id_seq', (SELECT MAX(id) FROM categories));
SELECT setval('indicator_values_id_seq', (SELECT MAX(id) FROM indicator_values));
SELECT setval('units_id_seq', (SELECT MAX(id) FROM units));
SELECT setval('sources_id_seq', (SELECT MAX(id) FROM sources));
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('observations_id_seq', (SELECT MAX(id) FROM observations));
SELECT setval('forecasts_id_seq', (SELECT MAX(id) FROM forecasts));