import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Manager/Weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("Weather App"),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: searchController,
                  onFieldSubmitted: (value) {
                    var weatherCubitVar = BlocProvider.of<WeatherCubit>(context);
                    weatherCubitVar.getWeather(city: value);
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    labelText: "City Name",
                    prefix: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.location_city),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        if (searchController.text.isNotEmpty) {
                          var weatherCubitVar =
                          BlocProvider.of<WeatherCubit>(context);
                          weatherCubitVar.getWeather(city: searchController.text);
                          Navigator.pop(context);
                        }
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
           ),
       );
   }
}
