using System;
using System.Collections.Generic;
using System.Data;
using Npgsql;

namespace WeatherApp.model
{
    public class WeatherRepository
    {
        private DbConnection db = new DbConnection();

        // 1. Запись (ВСЕ параметры на месте)
        // Теперь принимает один параметр - объект WeatherRecord
        public void AddWeatherRecord(WeatherRecord record)
        {
            using (NpgsqlConnection conn = db.GetConnection())
            {
                conn.Open();
                string sql = @"
                    INSERT INTO observations 
                    (city_id, condition_value_id, source_id, measurement_date, temperature, humidity, pressure, wind_speed, wind_direction, cloudiness, precipitation, visibility) 
                    VALUES 
                    (@cityId, 1, 1, NOW(), @temp, @hum, @press, @wind, @windDir, @cloud, @precip, @vis)";

                using (NpgsqlCommand cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@cityId", record.CityId);
                    cmd.Parameters.AddWithValue("@temp", record.Temperature);
                    cmd.Parameters.AddWithValue("@hum", record.Humidity);
                    cmd.Parameters.AddWithValue("@press", record.Pressure);
                    cmd.Parameters.AddWithValue("@wind", record.WindSpeed);
                    cmd.Parameters.AddWithValue("@windDir", record.WindDirection);
                    cmd.Parameters.AddWithValue("@cloud", record.Cloudiness);
                    cmd.Parameters.AddWithValue("@precip", record.Precipitation);
                    cmd.Parameters.AddWithValue("@vis", record.Visibility);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // 2. Получить все города
        public List<(int Id, string Name)> GetAllCities()
        {
            var cities = new List<(int Id, string Name)>();
            using (NpgsqlConnection conn = db.GetConnection())
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT id, name FROM cities", conn))
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                        cities.Add((reader.GetInt32(0), reader.GetString(1)));
                }
            }
            return cities;
        }

        // 3. Получить свежую погоду для всех
        public DataTable GetAllActualWeather()
        {
            using (NpgsqlConnection conn = db.GetConnection())
            {
                conn.Open();
                string sql = @"
                    SELECT 
                        o.measurement_date AS ""Дата измерения"",
                        c.name AS ""Город"",
                        o.temperature AS ""Температура"",
                        o.humidity AS ""Влажность"",
                        o.pressure AS ""Давление"",
                        o.wind_speed AS ""Ветер"",
                        o.wind_direction AS ""Направление"",
                        o.cloudiness AS ""Облачность"",
                        o.precipitation AS ""Осадки"",
                        o.visibility AS ""Видимость""
                    FROM observations o
                    JOIN cities c ON o.city_id = c.id
                    WHERE o.measurement_date = (
                        SELECT MAX(o2.measurement_date) FROM observations o2 WHERE o2.city_id = o.city_id
                    )
                    ORDER BY c.name;";

                using (NpgsqlCommand cmd = new NpgsqlCommand(sql, conn))
                using (NpgsqlDataAdapter adapter = new NpgsqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
        }
    }
}