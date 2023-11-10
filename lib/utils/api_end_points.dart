String apiKey = "";

String getWeatherApi(String lat, String lon) {
  // String webLink =
  //     "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apiKey&units=metric";
  // String webLink =
  //     "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41";

  String webLink =
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset&timezone=auto&past_days=3";
  return webLink;
}
