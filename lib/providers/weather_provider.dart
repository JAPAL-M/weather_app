import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{

  // ignore: non_constant_identifier_names
  WeatherModels? _WeatherData;
  // ignore: non_constant_identifier_names
  set WeatherData(WeatherModels? weather){
    _WeatherData = weather;
      notifyListeners();
  }
  // ignore: non_constant_identifier_names
  WeatherModels? get WeatherData => _WeatherData;

}