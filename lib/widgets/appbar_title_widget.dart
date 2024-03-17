import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherly/cuibts/weather_cubit.dart';

Widget appbarTitle(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        BlocProvider.of<WeatherCubit>(context).weatherModel!.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
      Text(
        DateFormat('E h:mm a').format(BlocProvider.of<WeatherCubit>(context).weatherModel!.localTime),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
