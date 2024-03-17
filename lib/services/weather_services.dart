import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherly/models/location_weather_model.dart';
import 'package:weatherly/models/weather_model.dart';

class WeatherService {
  Dio dio;
  // https://api.weatherapi.com/v1/forecast.json?key=f1b5be815ddc4c908a7220816242301&q=cairo&days=7

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'dfd4bc244c1b46a79bd181131241703';

  WeatherService(this.dio);

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      throw Exception('Failed to load weather data: ${e.message}');
    } catch (e) {
      log('Error: $e');
      throw Exception('Failed to load weather data ');
    }
  }

  static const List<String> cityNames = [
    'Cairo',
    'Alexandria',
    'Madrid',
    'London',
    'Manchester',
    'New York',
    'California',
    'Berlin',
    'Munich',
    'Moscow',
    'Dubai',
    'Bali',
    'Tokyo',
    'Rome',
  ];
  Future<List<LocationWeatherModel>> getLocationWeather(
      {List<String> cities = cityNames}) async {
    List<LocationWeatherModel> locationWeatherModel = [];
    try {
      for (var city in cities) {
        Response response =
            await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
        locationWeatherModel.add(LocationWeatherModel.fromJson(response.data));
      }
      return locationWeatherModel;
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}







// Future<DayWeatherModel> getDayWeather()async {
  //   try {
  //     Response response =
  //   } catch (e) {

  //   }
  // }
  // Future<HourWeatherModel> getHourWeather(
  //     final String day, String cityName) async {
  //   try {
  //     Response response = await dio
  //         .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=$days");
  //     HourWeatherModel hourWeatherModel =
  //         HourWeatherModel.fromJson(response.data);
  //     return hourWeatherModel;
  //   } on DioException catch (e) {
  //     throw Exception(e.toString());
  //   } catch (e) {
  //     throw (e.toString());
  //   }
  // }