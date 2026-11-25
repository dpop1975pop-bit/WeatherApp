using System;
using System.Data;
using WeatherApp.model;

namespace WeatherApp.controller
{
    public class WeatherController
    {
        private WeatherRepository repo = new WeatherRepository();

        public DataTable UpdateAllCitiesWeather()
        {
            var cities = repo.GetAllCities();
            Random rnd = new Random();

            foreach (var city in cities)
            {
                // 1. Создаем объект и заполняем его данными
                WeatherRecord record = new WeatherRecord
                {
                    CityId = city.Id,
                    Temperature = Math.Round(rnd.NextDouble() * 30 - 5, 1),
                    WindSpeed = Math.Round(rnd.NextDouble() * 10, 1),
                    WindDirection = rnd.Next(0, 360),
                    Humidity = rnd.Next(40, 95),
                    Pressure = rnd.Next(730, 770),
                    Cloudiness = rnd.Next(0, 100),
                    Precipitation = Math.Round(rnd.NextDouble() * 5, 1),
                    Visibility = Math.Round(rnd.NextDouble() * 10 + 2, 1)
                };

                // 2. Передаем объект в репозиторий
                repo.AddWeatherRecord(record);
            }

            // 3. Возвращаем результат
            return repo.GetAllActualWeather();
        }
    }
}
