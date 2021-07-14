import 'package:geolocator/geolocator.dart';
import 'package:climate/services/networking.dart';

const apikey = '67fab6ae4d56ffb8b29af7a6acc01a2e';

class WeatherModel {
  double lat;
  double long;
  getCurrentLocation() async {
    try {
      Position p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest,
          forceAndroidLocationManager: true);
      this.lat = p.latitude;
      this.long = p.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getCityWeather(String cityname) async {
    NetworkHelper networkHelper = NetworkHelper(''
        'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric');
    var WeatherData = await networkHelper.getData();
    return WeatherData;
  }

  Future<dynamic> getLocationWeather() async {
    await getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${this.lat}&lon=${this.long}&appid=$apikey&units=metric');
    var WeatherData = await networkHelper.getData();
    return WeatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '☁';
    } else if (condition == 400) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍♀️';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time ';
    } else if (temp > 20) {
      return "Time for 🩳 and 👕";
    } else if (temp < 10) {
      return "you will need 🧥 and 🧣";
    } else {
      return 'bring a 🧥 just in case';
    }
  }
}
