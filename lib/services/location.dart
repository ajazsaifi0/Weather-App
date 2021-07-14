import 'package:geolocator/geolocator.dart';

import 'dart:async';

class Location {
  Position position;
  double latitude;
  double longitude;
  String currentLocation;
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          currentLocation = "Permission Denied";
        } else {
          position = await Geolocator.getCurrentPosition(
                  forceAndroidLocationManager: true,
                  desiredAccuracy: LocationAccuracy.lowest)
              .timeout(Duration(seconds: 2));
          print(position.latitude);
          print(position.longitude);
        }
      } else {
        position = await Geolocator.getCurrentPosition(
                forceAndroidLocationManager: true,
                desiredAccuracy: LocationAccuracy.lowest)
            .timeout(Duration(seconds: 2));
        print(position.latitude);
        print(position.longitude);
      }
    } catch (e) {
      print(e);
    }
  }
}
