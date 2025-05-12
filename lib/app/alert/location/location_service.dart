import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService I = LocationService._internal();

  LocationService._internal();

  Position? _lastPosition;

  // current location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location service is off.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // Calculate the distance
  Future<bool> checkMovedMoreThan1Km() async {
    final currentPosition = await getCurrentLocation();

    if (_lastPosition == null) {
      _lastPosition = currentPosition;
      return false;
    }

    final distance = Geolocator.distanceBetween(
      _lastPosition!.latitude,
      _lastPosition!.longitude,
      currentPosition.latitude,
      currentPosition.longitude,
    );

    if (distance >= 1000) {
      _lastPosition = currentPosition;
      return true;
    }
    return false;
  }
}
