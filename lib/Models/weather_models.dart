class WeatherModel {
  final String cityName;
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String icon;
  final List<dynamic> forecast;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.icon,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: json['current']['last_updated'],
        temp: json['current']['temp_c'].toDouble(),
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'].toDouble(),
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'].toDouble(),
        condition: json['current']['condition']['text'],
        icon: "https:${json['current']['condition']['icon']}",
        forecast: json['forecast']['forecastday'],
        );
    }
}
