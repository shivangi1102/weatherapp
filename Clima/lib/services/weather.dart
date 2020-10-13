import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = 'd41391c43ab8b971e4ba5fead2d3c55a';
const openweather = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcity(String cityName) async {
    Networkhelper networkhelper =
        Networkhelper('$openweather?q=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocation() async {
    Location location = Location();
    await location.getcurrentlocation();

    Networkhelper networkhelper = Networkhelper(
        '$openweather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
