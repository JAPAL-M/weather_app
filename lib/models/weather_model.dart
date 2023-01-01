import 'package:flutter/material.dart';

class WeatherModels {
  String location;
  DateTime date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherStateName;
  // ignore: non_constant_identifier_names
  String Icon;
  WeatherModels(
      {
      required this.location,
      required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherStateName,
      // ignore: non_constant_identifier_names
      required this.Icon,
      });

  factory WeatherModels.getJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModels(
      location: data['location']['name'],
        date: DateTime.parse( data['current']['last_updated']) ,
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_c'],
        mintemp: jsonData['mintemp_c'],
        weatherStateName: data['current']['condition']['text'],
        Icon: data['current']['condition']['icon'],
        );
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (
        
        weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}