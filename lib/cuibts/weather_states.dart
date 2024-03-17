
abstract class WeatherStates {}

class InitialWeatherState extends WeatherStates {}

class LoadingWeatherState extends WeatherStates {}

class SuccessWeatherState extends WeatherStates {

}

class ErrorWeatherState extends WeatherStates {
  final String errorMessage;

  ErrorWeatherState({required this.errorMessage});
}

class ChangingWeatherState extends WeatherStates {}
