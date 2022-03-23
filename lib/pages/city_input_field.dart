import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/bloc/weather_bloc.dart';
import 'package:flutter_cubit_bloc/cubit/weather_cubit.dart';
import 'package:flutter_cubit_bloc/data/weather_repository.dart';

class CityInputField extends StatelessWidget {
  const CityInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.search),
        ));
  }

  void submitCityName(BuildContext context, String cityName) {
    // final bloc = WeatherBloc(FakeWeatherRepository());
    // bloc.add(GetWeather(cityName: cityName));
    BlocProvider.of<WeatherBloc>(context).add(GetWeather(cityName: cityName));

    // print(cityName);
    // context.read<WeatherCubit>().getWeather(cityName);
  }
}
