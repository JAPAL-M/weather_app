import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
   // ignore: non_constant_identifier_names
   WeatherModels? WeatherData;
  @override
  Widget build(BuildContext context) {
    WeatherData = Provider.of<WeatherProvider>(context, listen: true).WeatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: WeatherData == null ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ) : Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              WeatherData!.getThemeColor(),
                WeatherData!.getThemeColor()[300]!,
                     WeatherData!.getThemeColor()[100]!
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3,),
            Text(
              WeatherData!.location,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              ),
            Text(
              'Updated: ${WeatherData!.date.hour.toInt()}:${WeatherData!.date.minute.toInt()}',
              style: const TextStyle(fontSize: 16),
              ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network('http:${WeatherData!.Icon}'),
                Text(
                  '${WeatherData!.temp.toInt()}',
                  style: const TextStyle(fontSize: 35),
                  ),
                  Column(
                    children: [
                      Text(
                        'max: ${WeatherData!.maxtemp.toInt()}',
                        style: const TextStyle(fontSize: 15),),
                      Text('min: ${WeatherData!.mintemp.toInt()}', style: const TextStyle(fontSize: 15),),
                    ],
                  )
              ],
            ),
            const Spacer(),
            Text(
              WeatherData!.weatherStateName,
              style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 5,),
          ],
        ),
      ),
    );
  }
}
