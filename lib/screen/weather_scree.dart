import 'package:flutter/material.dart';
import '../Models/weather_models.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherInfoBody({super.key, required this.weatherModel});

  DecorationImage getWeatherBackground(String condition) {
    String lowerCondition = condition.toLowerCase();

    if (lowerCondition.contains('sunny') || lowerCondition.contains('clear')) {
      return DecorationImage(
        image: NetworkImage('https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800'),
        fit: BoxFit.cover,
      );
    } else if (lowerCondition.contains('cloudy') || lowerCondition.contains('overcast')) {
      return DecorationImage(
        image: NetworkImage('https://images.unsplash.com/photo-1419833479618-c595710caa63?w=800'),
        fit: BoxFit.cover,
      );
    } else if (lowerCondition.contains('rain') || lowerCondition.contains('drizzle')) {
      return DecorationImage(
        image: NetworkImage('https://images.unsplash.com/photo-1428592953211-077101b2021b?w=800'),
        fit: BoxFit.cover,
      );
    } else if (lowerCondition.contains('storm') || lowerCondition.contains('thunder')) {
      return DecorationImage(
        image: NetworkImage('https://images.unsplash.com/photo-1465146344425-f00d5f5c8f07?w=800'),
        fit: BoxFit.cover,
      );
    }

    return DecorationImage(
      image: NetworkImage('https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800'),
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: getWeatherBackground(weatherModel.condition),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back, color: Colors.white, size: 28),
                          Spacer(),
                          Text(
                            'Weather App',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.search, color: Colors.white, size: 28),
                        ],
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
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
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Updated at ${weatherModel.date}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          "https:${weatherModel.icon}",
                                          height: 80,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(Icons.wb_sunny, size: 80, color: Colors.white);
                                          },
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "${weatherModel.temp}°C",
                                          style: const TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
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
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Max: ${weatherModel.maxTemp} °C",
                                          style: TextStyle(color: Colors.white70, fontSize: 16),
                                        ),
                                        Text(
                                          "Min: ${weatherModel.minTemp} °C",
                                          style: TextStyle(color: Colors.white70, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            SizedBox(
                              height: 300,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: weatherModel.forecast.length,
                                itemBuilder: (context, index) {
                                  final day = weatherModel.forecast[index];
                                  return Container(
                                    width: 160,
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 10,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          day['date'] ?? 'N/A',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Image.network(
                                          "https:${day['day']['condition']['icon']}",
                                          height: 60,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(Icons.wb_sunny, size: 60, color: Colors.yellow);
                                          },
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          "${day['day']['avgtemp_c']?.round() ?? 'N/A'}°C",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "Max: ${day['day']['maxtemp_c']?.round() ?? 'N/A'}°C",
                                          style: const TextStyle(fontSize: 14, color: Colors.white70),
                                        ),
                                        Text(
                                          "Min: ${day['day']['mintemp_c']?.round() ?? 'N/A'}°C",
                                          style: const TextStyle(fontSize: 14, color: Colors.white70),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          day['day']['condition']['text'] ?? 'N/A',
                                          style: const TextStyle(fontSize: 12, color: Colors.white60),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
       );
   }
}
