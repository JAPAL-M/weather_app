import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
      return WeatherProvider();
    },
    child: const WeatherApp()
    ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).WeatherData == null ? Colors.blue : Provider.of<WeatherProvider>(context).WeatherData!.getThemeColor()
        ),
      home: HomePage(),
    );
  }
}
