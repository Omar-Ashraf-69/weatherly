import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:weatherly/models/location_weather_model.dart';
import 'package:weatherly/models/weather_model.dart';

class WeatherService {
  // https://api.weatherapi.com/v1/forecast.json?key=dcf2e86dce8e4ede80d11030242503&q=cairo&days=7
  // https://api.weatherapi.com/v1/forecast.json?key=dcf2e86dce8e4ede80d11030242503&q=cairo&days=7&aqi=no&alerts=no
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'dcf2e86dce8e4ede80d11030242503';

  WeatherService();

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
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
        Uri url =
            Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
        http.Response response = await http.get(url);

        locationWeatherModel
            .add(LocationWeatherModel.fromJson(jsonDecode(response.body)));
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