import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

Future<String> getCityFromCoordinates(double latitude, double longitude) async {
  debugPrint("Lang || Long : $latitude $longitude");
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    debugPrint("Placemarks length ${placemarks.length}");

    int len = placemarks.length;
    if (len > 0) {
      debugPrint("place mark epty -------->");
      Placemark first = placemarks[0];
      String loc = first.locality!;
      // debugPrint("first ---> ${first.country}");
      // debugPrint("first ---> ${first.name}");
      // debugPrint("first ---> ${first.street}");
      // debugPrint("first ---> ${first.locality}");

      return loc; // This will give you the city name
    } else {
      debugPrint("Location Not Found -------->");
      return "Location not found";
    }
  } catch (e) {
    return "Error: $e";
  }
}

String getReadableDate(String date) {
  String iso8601DateString = date;

  DateTime dateTime = DateTime.parse(iso8601DateString);
  // String formattedDate = DateFormat('EEEE, MMM d, y, hh:mm a').format(dateTime);
  String formattedDate = DateFormat('dd, MMM, yyyy').format(dateTime);

  return formattedDate;
}
