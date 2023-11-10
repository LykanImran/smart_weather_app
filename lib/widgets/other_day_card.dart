import 'package:flutte_app/models/weather_code_model.dart';
import 'package:flutte_app/models/weather_model.dart';
import 'package:flutte_app/utils/helpers.dart';
import 'package:flutte_app/utils/styles.dart';
import 'package:flutte_app/utils/weather_code.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OtherDayCard extends StatelessWidget {
  Daily daily;
  int index;
  OtherDayCard({super.key, required this.daily, required this.index});

  @override
  Widget build(BuildContext context) {
    int code = daily.weathercode![index];
    WeatherCodeModel wc = getWeatherInfoFromCode(code);
    return SizedBox(
      width: 180,
      // height: 100,
      child: Card(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            wc.icon,
            //  width: 50,
            height: 80,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "${daily.temperature2mMax![index]} \u2103",
            style:
                popinsFont.copyWith(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 4,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              wc.description,
              style: tempNowStyle.copyWith(fontSize: 20, color: Colors.black),
            ),
          ),
          const SizedBox(height: 3.5),
          Align(
            alignment: Alignment.center,
            child: Text(
              getReadableDate(daily.time![index]),
              style: tempNowStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }
}
