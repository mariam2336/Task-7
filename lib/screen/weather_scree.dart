import 'package:flutter/material.dart';
import '../Models/weather_models.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherInfoBody({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 243),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          weatherModel.cityName,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Updated at ${weatherModel.date}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https:${weatherModel.icon}",
                              height: 80,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.wb_sunny, size: 80, color: Colors.orange);
                              },
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "${weatherModel.temp}°C",
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          weatherModel.condition,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Max: ${weatherModel.maxTemp} °C"),
                            Text("Min: ${weatherModel.minTemp} °C"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection:Axis.horizontal,
                    itemCount: weatherModel.forecast.length > 3 ? 3 : weatherModel.forecast.length,
                    itemBuilder: (context, index) {
                      final day = weatherModel.forecast[index];
                      return Container(
                        width: 160,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(day['date'] ?? 'N/A',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Image.network(
                              "https:${day['day']['condition']['icon']}",
                              height: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.wb_sunny, size: 50, color: Colors.orange);
                              },
                            ),
                            const SizedBox(height: 8),
                            Text("${day['day']['avgtemp_c']?.round() ?? 'N/A'}°C",
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Text("Max: ${day['day']['maxtemp_c']?.round() ?? 'N/A'}°C",
                                style: const TextStyle(fontSize: 12)),
                            Text("Min: ${day['day']['mintemp_c']?.round() ?? 'N/A'}°C",
                                style: const TextStyle(fontSize: 12)),
                            const SizedBox(height: 5),
                            Text(day['day']['condition']['text'] ?? 'N/A',
                                style: const TextStyle(fontSize: 12),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            ),
       );
    }
}
