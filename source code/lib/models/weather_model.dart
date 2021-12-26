import 'package:flutter/material.dart';

enum WeatherState { rainy, mediumRainy, sunny }

class WeatherModel {
  int degree;
  TimeOfDay time;
  WeatherState weatherState;
  int param1;
  int param2;
  
  WeatherModel({
    required this.degree,
    required this.time,
    required this.weatherState,
    required this.param1,
    required this.param2,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> data) {
    WeatherState state = data["weather"] == "rain"
        ? WeatherState.rainy
        : data["weather"] == "sunny"
            ? WeatherState.sunny
            : WeatherState.mediumRainy;
    String strTime = data["time"];
    TimeOfDay time = TimeOfDay(
      hour: int.parse(strTime.split(".")[0]),
      minute: int.parse(strTime.split(".")[1]),
    );

    return WeatherModel(
      degree: data["degree"],
      time: time,
      weatherState: state,
      param1: data["param1"],
      param2: data["param2"],
    );
  }
}
