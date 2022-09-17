import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final dynamic locationWeather;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String weatherIcon;
  late String weatherMessage;
  WeatherModel weather = WeatherModel();
  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = "Error";
        weatherMessage = "Unable to get Weather data";
        return;
      }
      double tmp = weatherData['main']['temp'];
      temperature = tmp.toInt();
      int condition = weatherData['weather'][0]['id'];
      String cityName = weatherData['name'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = '${weather.getMessage(temperature)} in $cityName';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'images/location_background.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        print("cityname is $typedName");
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        print("City data is $weatherData");
                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  weatherMessage,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
