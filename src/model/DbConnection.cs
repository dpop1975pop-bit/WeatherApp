using System;
using System.Configuration;
using Npgsql;

namespace WeatherApp.model
{
    public class DbConnection
    {
        public NpgsqlConnection GetConnection()
        {
            // Берем строку подключения из нашего XML файла db.config
            string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            return new NpgsqlConnection(connString);
        }
    }
}
