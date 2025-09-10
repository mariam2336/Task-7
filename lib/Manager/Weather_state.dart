import '../Models/weather_models.dart';

abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class  WeatherLoaded extends WeatherState{
  final WeatherModel weatherModel;
  WeatherLoaded({required this.weatherModel});


}

final class WeatherFailer extends WeatherState{}