class LocationWeatherModel {
  final String cityName;
  final double temp;
  final String imageUrl;
  final String condition;
  LocationWeatherModel( 
      {required this.cityName, required this.temp, required this.imageUrl, required this.condition,});
  factory LocationWeatherModel.fromJson(json) {
    return LocationWeatherModel(
      cityName: json['location']['name'],
      temp: json['current']['temp_c'],
      imageUrl: "https:${json['current']['condition']['icon']}",
      condition:json['current']['condition']['text'],
    );
  }
}
