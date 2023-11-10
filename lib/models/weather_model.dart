import 'package:flutter/material.dart';

class WeatherModel {
  Current? today;
  Daily? daily;
  WeatherModel({this.today, this.daily});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    debugPrint("=== Full Json $json ===");
    int currCode = 0;

    WeatherModel weather = WeatherModel(
        today: Current.fromJson(json['current']),
        daily: Daily.fromJson(json['daily']));

    currCode = weather.daily!.weathercode![3];
    weather.today!.weatherCode = currCode;
    return weather;
  }
}

class Daily {
  List<String>? time;
  List<int>? weathercode;
  List<double>? temperature2mMax;
  List<double>? temperature2mMin;

  Daily({
    this.time,
    this.weathercode,
    this.temperature2mMax,
    this.temperature2mMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    debugPrint("=== Daily Json $json ===");
    return Daily(
      time: json['time'].cast<String>(),
      weathercode: json['weathercode'].cast<int>(),
      temperature2mMax: json['temperature_2m_max'].cast<double>(),
      temperature2mMin: json['temperature_2m_min'].cast<double>(),
    );
  }
}

class Current {
  String? time;
  int? interval;
  double? temp;
  int? weatherCode;

  Current({this.time, this.interval, this.temp, this.weatherCode});

  factory Current.fromJson(Map<String, dynamic> json) {
    debugPrint("=== Current Json $json ===");

    return Current(
      time: json['time'],
      interval: json['interval'],
      temp: json['temperature_2m'],
    );
  }
}
