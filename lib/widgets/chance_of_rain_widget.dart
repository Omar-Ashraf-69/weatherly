import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/cuibts/weather_cubit.dart';
import 'package:weatherly/cuibts/weather_states.dart';

class ChanceOfRain extends StatelessWidget {
  const ChanceOfRain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white12),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/rainy.png',
              height: 35,
              width: 35,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              'Raining Chance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              '${BlocProvider.of<WeatherCubit>(context).weatherModel!.days[BlocProvider.of<WeatherCubit>(context).index].hours[BlocProvider.of<WeatherCubit>(context).weatherModel!.localTime.hour].chanceOfRaining}%',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
