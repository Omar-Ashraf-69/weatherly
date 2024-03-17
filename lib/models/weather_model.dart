import 'package:intl/intl.dart';

class WeatherModel {
  final String name;
  final DateTime localTime;
  final List<DayWeatherModel> days;

  WeatherModel({
    required this.name,
    required this.localTime,
    required this.days,
  });

  factory WeatherModel.fromJson(dynamic json) {
    // Parsing daily forecast

    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
    DateTime parsedDate = dateFormat.parse(json['location']['localtime']);

    List<DayWeatherModel> dailyForecast = [];
    for (dynamic forecast in json['forecast']['forecastday']) {
      dailyForecast.add(DayWeatherModel.fromJson(forecast));
    }

    return WeatherModel(
      name: json['location']['name'],
      localTime: parsedDate,
      days: dailyForecast,
    );
  }
}

class DayWeatherModel {
  final double temp;
  final String condition;
  final double wind;
  final int humidity;
  final double feelsLike;
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final String imageUrl;
  final String sunRise;
  final String sunSet;
  final List<HourWeatherModel> hours;

  DayWeatherModel({
    required this.temp,
    required this.condition,
    required this.wind,
    required this.humidity,
    required this.feelsLike,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.imageUrl,
    required this.sunRise,
    required this.sunSet,
    required this.hours,
  });

  factory DayWeatherModel.fromJson(dynamic json) {
    //   List<DayWeatherModel> dailyForecast = [];
    // int i = 0;
    // while (i < 7) {
    //   dailyForecast
    //       .add(DayWeatherModel.fromJson(json['forecast']['forecastday'][i]));
    //   i++;
    // }

    // Parse hourly weather data
    // List<HourWeatherModel> hourlyData = [];
    // int i = 0;
    // while (i < 24) {
    //   hourlyData.add(HourWeatherModel.fromJson(json['hour'][i]));
    //   i++;
    // }
    List<HourWeatherModel> hourlyData = [];

    for (dynamic hourData in json['hour']) {
      hourlyData.add(HourWeatherModel.fromJson(hourData));
    }

    return DayWeatherModel(
      temp: json['day']['avgtemp_c'],
      condition: json['day']['condition']['text'],
      wind: json['day']['maxwind_kph'].toDouble(), // assuming max wind speed
      feelsLike: json['day']['avgtemp_c'], // adjust accordingly
      humidity: json['day']['avghumidity'],
      date: DateTime.parse(json['date']),
      maxTemp: json['day']['maxtemp_c'],
      minTemp: json['day']['mintemp_c'],
      imageUrl: 'https:${json['day']['condition']['icon']}',
      sunRise: json['astro']['sunrise'],
      sunSet: json['astro']['sunset'],
      hours: hourlyData,
    );
  }
}

class HourWeatherModel {
  final DateTime time;
  final double temp;
  final String imageUrl;
  final double feelsLike;
  final int chanceOfRaining;

  HourWeatherModel({
    required this.time,
    required this.feelsLike,
    required this.temp,
    required this.imageUrl,
    required this.chanceOfRaining,
  });

  factory HourWeatherModel.fromJson(json) {
    return HourWeatherModel(
      time: DateTime.parse(json['time']),
      feelsLike: json['feelslike_c'],
      imageUrl: 'https:${json['condition']['icon']}',
      temp: json['temp_c'],
      chanceOfRaining: json['chance_of_rain'],
    );
  }
}
