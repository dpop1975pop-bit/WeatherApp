using Newtonsoft.Json.Linq;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Net.Http;
using System.Windows.Forms;
using WeatherApp.controller;
using WeatherApp.model;
using WeatherApp.controller;
namespace WeatherApp
{
    public partial class Form1 : Form
    {
        DbConnection db = new DbConnection();

        public Form1()
        {
            InitializeComponent();


        }
        private void Form1_Load(object sender, EventArgs e)
        {
            comboBox3.Items.AddRange(new string[] {
                "Наблюдения", "Прогнозы", "Города", "Страны", "Источники",
                "Категории", "Значения показателей", "Единицы измерения",
                "Пользователи", "Избранные локации"
            });
            comboBox3.SelectedIndex = 0;
            comboBox3.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox3 == null) return;
            string selectedTable = comboBox3.SelectedItem?.ToString();
            if (string.IsNullOrEmpty(selectedTable)) return;

            string sql = "";

            if (selectedTable == "Наблюдения")
            {
                sql = "SELECT o.id AS \"Код\", c.name AS \"Город\", iv.value AS \"Погода\", o.measurement_date AS \"Дата\", o.temperature AS \"Температура\", o.humidity AS \"Влажность\", o.pressure AS \"Давление\", o.wind_speed AS \"Ветер\", o.wind_direction AS \"Направление\", o.cloudiness AS \"Облачность\", o.precipitation AS \"Осадки\", o.visibility AS \"Видимость\" FROM observations o JOIN cities c ON o.city_id = c.id JOIN indicator_values iv ON o.condition_value_id = iv.id;";
            }
            else if (selectedTable == "Прогнозы")
            {
                sql = "SELECT f.id AS \"Код\", c.name AS \"Город\", iv.value AS \"Погода\", f.forecast_date AS \"На когда\", f.created_date AS \"Когда создан\", f.temperature AS \"Температура\", f.humidity AS \"Влажность\", f.pressure AS \"Давление\", f.wind_speed AS \"Ветер\", f.wind_direction AS \"Направление\", f.cloudiness AS \"Облачность\", f.precipitation AS \"Осадки\", f.visibility AS \"Видимость\" FROM forecasts f JOIN cities c ON f.city_id = c.id JOIN indicator_values iv ON f.condition_value_id = iv.id;";
            }
            else if (selectedTable == "Города")
            {
                sql = "SELECT c.id AS \"Код\", c.name AS \"Город\", co.name AS \"Страна\", c.latitude AS \"Широта\", c.longitude AS \"Долгота\", c.timezone AS \"Часовой пояс\" FROM cities c JOIN countries co ON c.country_id = co.id;";
            }
            else if (selectedTable == "Страны")
            {
                sql = "SELECT id AS \"Код\", name AS \"Страна\" FROM countries;";
            }
            else if (selectedTable == "Источники")
            {
                sql = "SELECT s.id AS \"Код\", s.name AS \"Название\", s.api_url AS \"API\", u.unit AS \"Единица темп.\" FROM sources s LEFT JOIN units u ON s.id_unit = u.id;";
            }
            else if (selectedTable == "Категории")
            {
                sql = "SELECT id AS \"Код\", name AS \"Категория\" FROM categories;";
            }
            else if (selectedTable == "Значения показателей")
            {
                sql = "SELECT iv.id AS \"Код\", c.name AS \"Категория\", iv.value AS \"Значение\" FROM indicator_values iv JOIN categories c ON iv.category_id = c.id;";
            }
            else if (selectedTable == "Единицы измерения")
            {
                sql = "SELECT id AS \"Код\", parameter AS \"Параметр\", unit AS \"Единица\", coefficient AS \"Коэф.\" FROM units;";
            }
            else if (selectedTable == "Пользователи")
            {
                sql = "SELECT u.id AS \"Код\", u.name AS \"Имя\", u.email AS \"Email\", c.name AS \"Локация\" FROM users u LEFT JOIN cities c ON u.location_id = c.id;";
            }
            else if (selectedTable == "Избранные локации")
            {
                sql = "SELECT u.name AS \"Пользователь\", c.name AS \"Город\" FROM user_locations ul JOIN users u ON ul.user_id = u.id JOIN cities c ON ul.location_id = c.id;";
            }

            try
            {
                using (NpgsqlConnection conn = db.GetConnection())
                {
                    conn.Open();
                    using (NpgsqlCommand cmd = new NpgsqlCommand(sql, conn))
                    {
                        using (NpgsqlDataAdapter adapter = new NpgsqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);
                            dataGridView2.DataSource = dt;
                            MessageBox.Show("Загружено строк: " + dt.Rows.Count);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private async void btnAddCity_Click(object sender, EventArgs e)
        {
            string cityName = txtCityName.Text.Trim();
            if (string.IsNullOrEmpty(cityName)) { MessageBox.Show("Введите название!"); return; }

            try
            {
                string encodedName = Uri.EscapeDataString(cityName);
                string url = $"https://nominatim.openstreetmap.org/search?q={encodedName}&format=json&limit=1";

                using (HttpClient client = new HttpClient())
                {
                    client.DefaultRequestHeaders.Add("User-Agent", "WeatherApp/1.0");
                    string response = await client.GetStringAsync(url);
                    JArray data = JArray.Parse(response);

                    if (data.Count == 0) { MessageBox.Show("Город не найден!"); return; }

                    double lat = double.Parse(data[0]["lat"].ToString(), System.Globalization.CultureInfo.InvariantCulture);
                    double lon = double.Parse(data[0]["lon"].ToString(), System.Globalization.CultureInfo.InvariantCulture);
                    string foundName = data[0]["display_name"].ToString().Split(',')[0];

                    DbConnection db = new DbConnection();
                    using (NpgsqlConnection conn = db.GetConnection())
                    {
                        conn.Open();
                        string sql = "INSERT INTO cities (country_id, name, latitude, longitude, timezone) VALUES (1, @name, @lat, @lon, 'Europe/Moscow')";
                        using (NpgsqlCommand cmd = new NpgsqlCommand(sql, conn))
                        {
                            cmd.Parameters.AddWithValue("@name", foundName);
                            cmd.Parameters.AddWithValue("@lat", lat);
                            cmd.Parameters.AddWithValue("@lon", lon);
                            cmd.ExecuteNonQuery();
                        }
                    }
                    MessageBox.Show($"Город {foundName} добавлен!");
                    txtCityName.Clear();
                }
            }
            catch (Exception ex) { MessageBox.Show("Ошибка: " + ex.Message); }
        }

        private void btnCurrentWeather_Click(object sender, EventArgs e)
        {
            try
            {
                WeatherController controller = new WeatherController();
                dataGridView2.DataSource = controller.UpdateAllCitiesWeather();
                MessageBox.Show("Погода обновлена для всех городов!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }
    }
}
