// 0	Clear sky
// 1, 2, 3	Mainly clear, partly cloudy, and overcast
// 45, 48	Fog and depositing rime fog
// 51, 53, 55	Drizzle: Light, moderate, and dense intensity
// 56, 57	Freezing Drizzle: Light and dense intensity
// 61, 63, 65	Rain: Slight, moderate and heavy intensity
// 66, 67	Freezing Rain: Light and heavy intensity
// 71, 73, 75	Snow fall: Slight, moderate, and heavy intensity
// 77	Snow grains
// 80, 81, 82	Rain showers: Slight, moderate, and violent
// 85, 86	Snow showers slight and heavy
// 95 *	Thunderstorm: Slight or moderate
// 96, 99 *	Thunderstorm with slight and heavy hail

import 'package:flutte_app/models/weather_code_model.dart';
import 'package:flutte_app/utils/constants.dart';

WeatherCodeModel getWeatherInfoFromCode(int weatherCode) {
  String description;
  String icon = clearSky;

  if (weatherCode == 0) {
    description = "Clear sky";
    icon = clearSky;
  } else if (weatherCode == 1) {
    description = "Mainly clear";
    icon = clearSky;
  } else if (weatherCode == 2) {
    description = "Partly cloudy";
    icon = partlyCloud;
  } else if (weatherCode == 3) {
    description = "Overcast";
    icon = partlyCloud;
  } else if (weatherCode == 45) {
    description = "Fog";
    icon = fog;
  } else if (weatherCode == 48) {
    description = "Depositing rime fog";
    icon = fog;
  } else if (weatherCode == 51) {
    description = "Drizzle: Light intensity";
    icon = fog;
  } else if (weatherCode == 53) {
    description = "Drizzle: Moderate intensity";
    icon = fog;
  } else if (weatherCode == 55) {
    description = "Drizzle: Dense intensity";
    icon = fog;
  } else if (weatherCode == 56) {
    description = "Freezing Drizzle: Light intensity";
    icon = fog;
  } else if (weatherCode == 57) {
    description = "Freezing Drizzle: Dense intensity";
  } else if (weatherCode == 61) {
    description = "Rain: Slight intensity";
    icon = cloudStorm;
  } else if (weatherCode == 63) {
    description = "Rain: Moderate intensity";
    icon = cloudStorm;
  } else if (weatherCode == 65) {
    description = "Rain: Heavy intensity";
    icon = stormShower;
  } else if (weatherCode == 66) {
    description = "Freezing Rain: Light intensity";
    icon = stormShower;
  } else if (weatherCode == 67) {
    description = "Freezing Rain: Heavy intensity";
    icon = stormShower;
  } else if (weatherCode == 71) {
    description = "Snow fall: Slight intensity";
    icon = snow;
  } else if (weatherCode == 73) {
    description = "Snow fall: Moderate intensity";
    icon = snow;
  } else if (weatherCode == 75) {
    description = "Snow fall: Heavy intensity";
    icon = snow;
  } else if (weatherCode == 77) {
    description = "Snow grains";
    icon = snow;
  } else if (weatherCode == 80) {
    description = "Rain showers: Slight intensity";
    icon = cloudStorm;
  } else if (weatherCode == 81) {
    description = "Rain showers: Moderate intensity";
    icon = partlyShower;
  } else if (weatherCode == 82) {
    description = "Rain showers: Violent intensity";
    icon = partlyShower;
  } else if (weatherCode == 85) {
    description = "Snow showers: Slight intensity";
    icon = snowSun;
  } else if (weatherCode == 86) {
    description = "Snow showers: Heavy intensity";
    icon = snowSun;
  } else if (weatherCode == 95) {
    description = "Thunderstorm: Slight";
    icon = stormShower;
  } else if (weatherCode == 96) {
    description = "Thunderstorm with slight hail";
    icon = stormShower;
  } else if (weatherCode == 99) {
    description = "Thunderstorm with heavy hail";
    icon = stormShower;
  } else {
    description = "Unknown description";
    icon = stormShower;
  }

  return WeatherCodeModel(
      code: weatherCode.toString(), description: description, icon: icon);
}
