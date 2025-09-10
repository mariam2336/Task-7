
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/services/weather_services.dart';

import '../../Models/weather_models.dart';
import 'Weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  getWeather({required String city}) async {
    WeatherModel weatherModel = await WeatherService().getWeatherDAta(
      citName: city,
    );

    emit(WeatherLoaded(weatherModel: weatherModel));
   }
}