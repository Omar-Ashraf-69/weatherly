import 'package:weatherly/models/weather_model.dart';

List<HourWeatherModel> filterHourlyData(List<HourWeatherModel> hourlyData) {
  DateTime now = DateTime.now();
  int currentHour = now.hour;
  int currentDay = now.day;

  // Find the index of the first hour matching the current hour and day
  int indexOfCurrentHour = hourlyData.indexWhere(
      (hour) => hour.time.hour == currentHour && hour.time.day == currentDay);

  // If current hour not found for the current day, return the original list
  if (indexOfCurrentHour == -1) {
    return hourlyData;
  }

  // Return a new list starting from the index of the current hour for the current day
  return hourlyData.sublist(indexOfCurrentHour);
}