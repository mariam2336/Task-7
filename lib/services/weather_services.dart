import 'package:dio/dio.dart';

import '../Models/weather_models.dart';


class WeatherService {
  late WeatherModel weatherModel;

  Dio dio = Dio();
  String baseurl = "http://api.weatherapi.com/v1";
  String keyy = "d77728242aa347e6b94215653232209";

  bool isload = true;

  Future<WeatherModel> getWeatherDAta({required String citName}) async {
    Response r = await dio.get(
      "${baseurl}/forecast.json?key=${keyy}&q=${citName}&days=4&aqi=no&alerts=no",
    );
    weatherModel = WeatherModel.fromJson(r.data);
    return weatherModel;
  }
}
