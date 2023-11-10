import 'package:flutte_app/api_controller/api_manager.dart';
import 'package:flutte_app/models/weather_model.dart';
import 'package:flutte_app/utils/api_end_points.dart';
import 'package:flutter/material.dart';

class DatabaseServices extends ChangeNotifier {
  static Future<WeatherModel> getWeather(
      BuildContext context, String lat, String lon) async {
    debugPrint('Lat || Long ---------  >  ${lat} |$lon');

    String webLink = getWeatherApi(lat, lon);
    WeatherModel weather = WeatherModel();
    debugPrint(' =========================');
    debugPrint(' Fetching Weather Data ');
    debugPrint(' =========================');

    try {
      var data = await ApiManager().callGetApi(context, webLink, false, '');
      debugPrint('===========================');
      debugPrint('Response Data =====>  $data ');
      debugPrint('===========================');

      weather = WeatherModel.fromJson(data);
      var status = data['success'];
      var result = data['result'];
      if (status) {
        debugPrint('>>>>   Order --> :: $result');

        ///Success
        return weather;
      } else {
        //r debugPrint('Status :: $status || Message  :: $message');

        return weather;
      }
    } catch (e) {
      debugPrint('Er>>> $e');
      return weather;
    }
  }
}
