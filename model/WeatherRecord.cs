using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeatherApp.model
{
    public class WeatherRecord
    {
        public int CityId { get; set; }
        public double Temperature { get; set; }
        public int Humidity { get; set; }
        public int Pressure { get; set; }
        public double WindSpeed { get; set; }
        public int WindDirection { get; set; }
        public int Cloudiness { get; set; }
        public double Precipitation { get; set; }
        public double Visibility { get; set; }
    }
}
