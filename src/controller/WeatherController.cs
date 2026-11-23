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
                // Генерируем все данные
                double temp = Math.Round(rnd.NextDouble() * 30 - 5, 1);
                double wind = Math.Round(rnd.NextDouble() * 10, 1);
                int windDir = rnd.Next(0, 360);
                int humidity = rnd.Next(40, 95);
                int pressure = rnd.Next(730, 770);
                int cloudiness = rnd.Next(0, 100);
                double precipitation = Math.Round(rnd.NextDouble() * 5, 1);
                double visibility = Math.Round(rnd.NextDouble() * 10 + 2, 1);

                // Передаем строго в том же порядке, что и в WeatherRepository!
                repo.AddWeatherRecord(city.Id, temp, humidity, pressure, wind, windDir, cloudiness, precipitation, visibility);
            }

            return repo.GetAllActualWeather();
        }
    }
}
