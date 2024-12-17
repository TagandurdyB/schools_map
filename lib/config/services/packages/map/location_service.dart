import 'package:geolocator/geolocator.dart';

part 'location_obj.dart';

class LocationService {
  static Future<LocationObj> getCurrentLocation() async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we can not request permission.');
    }
    final position = await Geolocator.getCurrentPosition();
    return LocationObj(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
