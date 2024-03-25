import 'package:flutter/material.dart';
import 'package:weatherly/models/location_weather_model.dart';
import 'package:weatherly/screens/common_location_weather.dart';
import 'package:weatherly/services/weather_services.dart';

Widget leadingIcon(context) {
  return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () async {
        final List<LocationWeatherModel> locationWeatherList =
            await WeatherService().getLocationWeather();
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CommonLocationWeatehr(
              locationList: locationWeatherList,
            ),
          ),
        );
      });
}
