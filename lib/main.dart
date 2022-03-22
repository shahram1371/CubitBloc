import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/cubit/weather_cubit.dart';
import 'package:flutter_cubit_bloc/data/weather_repository.dart';
import 'package:flutter_cubit_bloc/pages/weather_search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(create: 
      (context) => WeatherCubit(FakeWeatherRepository()),
      child: const WeatherSearchPage()),
    );
  }
}
