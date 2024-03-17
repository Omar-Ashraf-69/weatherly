import 'package:flutter/material.dart';
import 'package:weatherly/models/weather_model.dart';
import 'package:weatherly/widgets/day_weather_item.dart';

class DayList extends StatelessWidget {
  const DayList({super.key, required this.daysModel});
  final List<DayWeatherModel> daysModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: daysModel.length,
      itemBuilder: (context, index) => DayItem(day: daysModel[index], ind: index),
    );
  }
}
