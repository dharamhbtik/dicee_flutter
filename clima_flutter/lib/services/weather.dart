import '../utilities/constants.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var uri = Uri.https("api.openweathermap.org", "data/2.5/weather",
        {"q": cityName, "appid": weatherAPIKey, "units": "metric"});
    var nw = NetworkHelper(uri);
    var data = await nw.getData();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    print("getting location");
    await loc.getCurrentLocation();
    var nw = NetworkHelper(
      Uri.https("api.openweathermap.org", "data/2.5/weather", {
        "lat": loc.latitude.toString(),
        "lon": loc.longitude.toString(),
        "appid": weatherAPIKey,
        "units": "metric"
      }),
    );
    var weatherData = await nw.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
