import 'package:dio/dio.dart';

import '../Models/weather_models.dart';


class WeatherService {
  late WeatherModel weatherModel;

  Dio dio = Dio();
  String baseurl = "http://api.weatherapi.com/v1";
  String keyy = "04505bb62d6540e5a0e233256250509";

  bool isload = true;

  Future<WeatherModel> getWeatherDAta({required String citName}) async {
    Response r = await dio.get(
      "${baseurl}/forecast.json?key=${keyy}&q=${citName}&days=7&aqi=no&alerts=no",
    );
    weatherModel = WeatherModel.fromJson(r.data);
    return weatherModel;
  }
}
