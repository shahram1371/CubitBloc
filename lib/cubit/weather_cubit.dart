import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_cubit_bloc/data/model/weather.dart';
import 'package:flutter_cubit_bloc/data/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepositiry _weatherRepositiry;
  WeatherCubit(
    this._weatherRepositiry,
  ) : super(const WeatherInitial());
  Future<void> getWeather(String cityName) async {
    try {
      emit(const WeatherLoading());
      final weather = await _weatherRepositiry.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(const WeatherError("Couldn't fetch weather.Is the deveice online?"));
    }
  }
}
