import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String? CityName;

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            onChanged: (data) {
              CityName = data;
            },
            onSubmitted: (data) async {
              CityName = data;

              WeatherService service = WeatherService();

            WeatherModels weather = await  service.getWeather(CityName: CityName!);
            Provider.of<WeatherProvider>(context, listen: false).WeatherData = weather;
            Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
                border: const OutlineInputBorder(),
                label: const Text('Search'),
                suffixIcon: GestureDetector(
                  onTap: () async {

              WeatherService service = WeatherService();

            WeatherModels weather = await  service.getWeather(CityName: CityName!);
            Provider.of<WeatherProvider>(context, listen: false).WeatherData = weather;
            Navigator.pop(context);
                  },
                  child: const Icon(Icons.search)
                  ),
                hintText: 'Enter Name City'),
          ),
        ),
      ),
    );
  }
}
