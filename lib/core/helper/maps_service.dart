import 'dart:math';

class MapsService {


  // Calculating the distance between current location
  static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371;

    final dLat = degreesToRadians(lat2 - lat1);
    final dLon = degreesToRadians(lon2 - lon1);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(degreesToRadians(lat1)) *
            cos(degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  static double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}
