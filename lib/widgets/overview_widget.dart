import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/cuibts/weather_cubit.dart';
import 'package:weatherly/cuibts/weather_states.dart';
import 'package:weatherly/widgets/day_list_container.dart';
import 'package:weatherly/widgets/hour_list_container.dart';

class OverViewWidget extends StatelessWidget {
  const OverViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Divider(
            indent: 2,
            endIndent: 2,
            thickness: 1,
          ),
          SizedBox(
            height: 10,
          ),
          HourListContainer(),
          SizedBox(
            height: 25,
          ),
          DayListContainer(),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
