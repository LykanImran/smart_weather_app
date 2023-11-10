import 'package:flutte_app/models/weather_model.dart';
import 'package:flutte_app/widgets/other_day_card.dart';
import 'package:flutter/material.dart';

class OtherDays extends StatelessWidget {
  WeatherModel weather;
  OtherDays({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: weather.daily!.time!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return OtherDayCard(
            daily: weather.daily!,
            index: index,
          );
        });
  }
}
