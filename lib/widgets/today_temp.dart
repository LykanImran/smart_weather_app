import 'package:flutte_app/models/weather_code_model.dart';
import 'package:flutte_app/models/weather_model.dart';
import 'package:flutte_app/utils/helpers.dart';
import 'package:flutte_app/utils/styles.dart';
import 'package:flutte_app/utils/weather_code.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TodayTemp extends StatelessWidget {
  WeatherModel weather;
  TodayTemp({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    WeatherCodeModel wc = getWeatherInfoFromCode(weather.today!.weatherCode!);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                // color: Colors.red,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Lottie.asset(
                      wc.icon,
                      width: 140,
                      height: 140,
                      fit: BoxFit.fill,
                    ),
                    //const SizedBox(height: 20),
                    Text(
                      "${weather.today!.temp} \u2103",
                      style: popinsFont.copyWith(
                          fontSize: 45, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  wc.description,
                  style:
                      tempNowStyle.copyWith(fontSize: 25, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  getReadableDate(weather.today!.time!),
                  style: tempNowStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
