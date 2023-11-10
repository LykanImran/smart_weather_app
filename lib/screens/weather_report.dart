import 'package:flutte_app/models/weather_model.dart';
import 'package:flutte_app/providers/location_provider.dart';
import 'package:flutte_app/services/database_services.dart';
import 'package:flutte_app/widgets/loading.dart';
import 'package:flutte_app/widgets/other_days.dart';
import 'package:flutte_app/widgets/today_temp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherReport extends StatelessWidget {
  WeatherReport({super.key});
  late WeatherModel weather;

  Future<WeatherModel> getData(BuildContext context) async {
    LocationProvider locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    weather = await DatabaseServices.getWeather(
        context,
        locationProvider.latitude.toString(),
        locationProvider.longitude.toString());
    return weather;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          weather = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                TodayTemp(
                  weather: weather,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: OtherDays(
                    weather: weather,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Loading(),
          );
        }
        return Container();
      },
    );
  }
}
