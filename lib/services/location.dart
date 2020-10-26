import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Location {
  static final Location _location = Location._internal();
  LocationPermission _permission;

  double latitude;
  double longitude;
  Placemark placemark;

  factory Location() {
    return _location;
  }

  Location._internal();

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest);
    latitude = position.latitude;
    longitude = position.longitude;
    placemark = (await placemarkFromCoordinates(latitude, longitude,
            localeIdentifier: 'en_US'))
        .first;
    print(placemark);
  }

  double getLatitude() {
    return latitude;
  }

  double getLongitude() {
    return longitude;
  }

  String getCity() {
    return placemark.locality;
  }

  String getCountry() {
    return placemark.country;
  }

  String getState() {
    return placemark.administrativeArea;
  }

  // TODO: get County from Current location
  String getCounty() {
    return '';
  }
}
