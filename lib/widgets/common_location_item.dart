import 'package:flutter/material.dart';
import 'package:weatherly/models/location_weather_model.dart';

class CommonLocationItem extends StatelessWidget {
  const CommonLocationItem({super.key, required this.locationWeatherModel});
  final LocationWeatherModel locationWeatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 71,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red[600]!,
            Colors.purple[300]!,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            const SizedBox(
              width: 25,
            ),
            Text(
              locationWeatherModel.cityName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              '${locationWeatherModel.temp.round()}°C',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.network(
              locationWeatherModel.imageUrl,
              cacheHeight: 44,
              cacheWidth: 44,
            ),
          ],
        ),
      ),
    );
  }
}
