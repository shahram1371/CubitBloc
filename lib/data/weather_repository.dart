import 'dart:math';

import 'package:flutter_cubit_bloc/data/model/weather.dart';

abstract class WeatherRepositiry {
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepositiry {
  @override
  Future<Weather> fetchWeather(String cityName) {
    return Future.delayed(const Duration(seconds: 1), () {
      final random = Random();
      if (random.nextBool()) {
        throw NetworkException();
      }
      return Weather(cityName: cityName, temperatureCelsius: 20+random.nextInt(15)+random.nextDouble());
    });
  }
}

class NetworkException implements Exception {}
