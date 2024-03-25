import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/cuibts/weather_cubit.dart';
import 'package:weatherly/cuibts/weather_states.dart';
import 'package:weatherly/widgets/action_icon.dart';
import 'package:weatherly/widgets/appbar_title_widget.dart';
import 'package:weatherly/widgets/chance_of_rain_widget.dart';
import 'package:weatherly/widgets/leading_icon.dart';
import 'package:weatherly/widgets/liner_gradnet_widget.dart';
import 'package:weatherly/widgets/overview_widget.dart';
import 'package:weatherly/widgets/search_widget.dart';
import 'package:weatherly/widgets/sun_rise_set_widget.dart';
import 'package:weatherly/widgets/today_weather_info_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        if (state is InitialWeatherState || state is LoadingWeatherState) {
          return const Scaffold(
            body: LinerGradentWidget(
                condition: 'Mist',
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                )),
          );
        } else if (state is SuccessWeatherState ||
            state is ChangingWeatherState) {
          return Scaffold(
            appBar: AppBar(
              titleTextStyle: const TextStyle(color: Colors.white),
              iconTheme: const IconThemeData(color: Colors.white),
              title: appbarTitle(context),
              leading: leadingIcon(context),
              actions: [
                actionIcon(context),
              ],
            ),
            body: SafeArea(
              child: LinerGradentWidget(
                condition: BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .days[BlocProvider.of<WeatherCubit>(context).index]
                    .condition,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TodayInfoContanier(
                        weather: BlocProvider.of<WeatherCubit>(context)
                            .weatherModel!,
                        index: BlocProvider.of<WeatherCubit>(context).index,
                      ),
                      const OverViewWidget(),
                      const SunRiseSetWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      const ChanceOfRain(),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Oops error ${BlocProvider.of<WeatherCubit>(context).errorMessage}",
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchWidget(),
                          ),
                        );
                      },
                      child: const Text(
                        "Try Again",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue,
                        ),
                      )),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
