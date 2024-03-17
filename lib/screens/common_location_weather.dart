import 'package:flutter/material.dart';
import 'package:weatherly/models/location_weather_model.dart';
import 'package:weatherly/widgets/common_location_list.dart';
import 'package:weatherly/widgets/liner_gradnet_widget.dart';

class CommonLocationWeatehr extends StatelessWidget {
  const CommonLocationWeatehr({super.key, required this.locationList});
  final List<LocationWeatherModel> locationList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
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
        ),
        elevation: 0.0,
        foregroundColor: Colors.white,
        title: const Text("Common locations"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: LinerGradentWidget(
        condition: locationList[0].condition,
        child: CommonLocationList(
          locationList: locationList,
        ),
      ),
    );
  }
}
