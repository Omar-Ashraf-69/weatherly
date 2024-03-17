import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/cuibts/weather_cubit.dart';
import 'package:weatherly/cuibts/weather_states.dart';
import 'package:weatherly/widgets/day_weather_list.dart';

class DayListContainer extends StatelessWidget {
  const DayListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit,WeatherStates>(

      builder:(context, state) =>  SizedBox(
        height: 80,
        width: double.infinity,
        child: DayList(
          daysModel: BlocProvider.of<WeatherCubit>(context).weatherModel!.days,
        ),
      ),
    );
  }
}
