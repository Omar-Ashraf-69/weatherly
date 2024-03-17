import 'package:flutter/material.dart';
import 'package:weatherly/models/location_weather_model.dart';
import 'package:weatherly/widgets/common_location_item.dart';

class CommonLocationList extends StatelessWidget {
  const CommonLocationList({super.key, required this.locationList});
  final List<LocationWeatherModel> locationList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locationList.length,
      itemBuilder: (context, index) => CommonLocationItem(
        locationWeatherModel: locationList[index],
      ),
    );
  }
}
