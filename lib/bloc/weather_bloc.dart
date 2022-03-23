import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc/data/weather_repository.dart';
import 'package:meta/meta.dart';

import 'package:flutter_cubit_bloc/data/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositiry _weatherRepositiry;
  WeatherBloc(
    this._weatherRepositiry,
  ) : super(const WeatherInitial()) {
    on<WeatherEvent>(
      (event, emit) async {
        if (event is GetWeather) {
          try {
            emit(const WeatherLoading());
            print('test');
            final weather =
                await _weatherRepositiry.fetchWeather(event.cityName);
            emit(WeatherLoaded(weather));
          } on NetworkException {
            emit(const WeatherError(
                "Couldn't fetch weather.Is the deveice online?"));
          }
        }
      },
    );
  }
}
