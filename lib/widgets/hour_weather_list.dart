import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/cuibts/weather_cubit.dart';
import 'package:weatherly/models/weather_model.dart';
import 'package:weatherly/widgets/hour_weather_item.dart';

class HourList extends StatelessWidget {
  const HourList({super.key, required this.hoursModel});

  final List<HourWeatherModel> hoursModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: BlocProvider.of<WeatherCubit>(context).scrollController,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      itemCount: hoursModel.length,
      itemBuilder: (context, index) => HourItem(hour: hoursModel[index]),
    );
  }
}
