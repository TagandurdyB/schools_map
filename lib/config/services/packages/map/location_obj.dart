part of 'location_service.dart';

class LocationObj {
  final double latitude;
  final double longitude;
  LocationObj({required this.latitude, required this.longitude});

  @override
  String toString() =>
      'LocationObj(latitude: $latitude, longitude: $longitude)';
}
