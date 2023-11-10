import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  late double _latitude;
  late double _longitude;
  bool isLocationFetched = false;

  double get latitude => _latitude;
  double get longitude => _longitude;

  // Update the location data
  Future<void> updateLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      Future.error("Location is not enabled.");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      Future.error("Location permission denied forever.");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        Future.error("Location permission denied.");
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _latitude = position.latitude;
    _longitude = position.longitude;
    debugPrint("Lat | Long  :: $_latitude || $_longitude");
    isLocationFetched = true;
    notifyListeners(); // Notify listeners of the change
  }
}
