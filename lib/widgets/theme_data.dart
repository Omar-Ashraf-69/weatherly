import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/cuibts/weather_cubit.dart';
import 'package:weatherly/main.dart';

ThemeData appTheme(context) {
  return ThemeData(
    appBarTheme: AppBarTheme(
      color: LinearGradient(colors: [
        getWeatherColor(
          BlocProvider.of<WeatherCubit>(context)
              .weatherModel
              ?.days[BlocProvider.of<WeatherCubit>(context).index]
              .condition,
        )[900]!,
      ]).colors.first,
      shadowColor: Colors.transparent,
      titleTextStyle: const TextStyle(
        //color: Color.fromARGB(255, 33, 27, 27),
        color: Colors.white,
        fontSize: 20,
      ),
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(),
      bodyLarge: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.black,
    ),
    scaffoldBackgroundColor: getWeatherColor(
      BlocProvider.of<WeatherCubit>(context)
          .weatherModel
          ?.days[BlocProvider.of<WeatherCubit>(context).index]
          .condition,
    ),
    primarySwatch: getWeatherColor(
      BlocProvider.of<WeatherCubit>(context)
          .weatherModel
          ?.days[BlocProvider.of<WeatherCubit>(context).index]
          .condition,
    ),
  );
}
