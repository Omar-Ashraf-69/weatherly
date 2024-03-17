import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/cuibts/weather_cubit.dart';
import 'package:weatherly/cuibts/weather_states.dart';
import 'package:weatherly/helpers/filter_hourly_data.dart';
import 'package:weatherly/widgets/hour_weather_list.dart';

class HourListContainer extends StatelessWidget {
  const HourListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit,WeatherStates>(

      builder:(context, state) => SizedBox(
          height: 115,
          width: double.infinity,
          child: HourList(
            hoursModel: filterHourlyData(BlocProvider.of<WeatherCubit>(context)
                .weatherModel!
                .days[BlocProvider.of<WeatherCubit>(context).index]
                .hours),
          ),
        ),);
  }
}