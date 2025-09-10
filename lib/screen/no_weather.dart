// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
              "No weather  ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ),
        );
    }
}