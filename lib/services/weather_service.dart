import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  // ignore: non_constant_identifier_names
  String BaseUrl = 'http://api.weatherapi.com/v1';

  // ignore: non_constant_identifier_names
  String ApiKey = '926ca714bdda49c8b10162008222211';
  // ignore: non_constant_identifier_names
  Future<WeatherModels> getWeather({required String CityName}) async {
    Uri url =
        Uri.parse('$BaseUrl/forecast.json?key=$ApiKey&q=$CityName&days=1');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModels weather = WeatherModels.getJson(data);

    return weather;
  }
}
