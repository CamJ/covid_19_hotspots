import 'package:geolocator/geolocator.dart';

class Location {
  static final Location _location = Location._internal();
  LocationPermission _permission;

  double latitude;
  double longitude;

  factory Location() {
    return _location;
  }

  Location._internal();

  Future<void> getLocation() async {
    LocationPermission permission = _permission ?? await requestPermission();
    print(permission);
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      latitude = position.latitude;
      longitude = position.longitude;
    }

    return null;
  }

  double getLatitude() {
    return latitude;
  }

  double getLongitude() {
    return longitude;
  }
}
