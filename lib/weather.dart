import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  // @override
  // void initState() {
  //   super.initState();
  //   getWeatherData(cityController.text);
  // }

  final cityController = TextEditingController();
  Future<WeatherModel> getWeatherData(String cityName) async {
    final queryParameters = {
      'key': '5e1ceb88348943ad9a8233508242501',
      'q': cityName,
      'aqi': 'no'
    };
    final uri =
        Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200)
      return WeatherModel.fromJson(jsonDecode(response.body));
    else {
      throw Exception("can't get the weather");
    }
  }

  WeatherModel weatherModel = WeatherModel(cityName: '', temp_c: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: cityController,
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () async {
                  weatherModel =
                      await getWeatherData(cityController.text.toString());
                  setState(() {});
                },
                child: Text('Search')),
            SizedBox(
              height: 24,
            ),
            Text(weatherModel.cityName),
            SizedBox(
              height: 24,
            ),
            Text(weatherModel.temp_c.toString()),
          ],
        ),
      ),
    );
  }
}

class WeatherModel {
  final String cityName;
  final double temp_c;
  WeatherModel({this.cityName = '', this.temp_c = 0});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cityName: json['location']['name'], temp_c: json['current']['temp_c']);
  }
}
