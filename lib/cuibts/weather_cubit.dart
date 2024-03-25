import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/cuibts/weather_states.dart';
import 'package:weatherly/models/weather_model.dart';
import 'package:weatherly/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherModel? weatherModel;
  final ScrollController scrollController = ScrollController();

  String errorMessage = '';
  int index = 0;
  WeatherCubit() : super(InitialWeatherState());
  getWeatherCubit([String cityName = 'banha']) async {
    emit(LoadingWeatherState());
    try {
      weatherModel = await WeatherService().getWeather(cityName: cityName);
      index = 0;
      emit(SuccessWeatherState());
    } catch (e) {
      emit(ErrorWeatherState(errorMessage: e.toString()));
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  changeHomeScreenState(indx) {
    index = indx;

    scrollController.jumpTo(0.0);

    emit(ChangingWeatherState());
  }
}
