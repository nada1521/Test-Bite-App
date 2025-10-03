import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MapsServices {
  MapsServices();
  Placemark? currentPlace;

  Future<Placemark> fetchUserAddress() async {
    Position? position = await getCurrentLocation();

    await getAddressFromCoordinates(position!);

    return currentPlace!;
  }

  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // التأكد من أن الخدمة مفعلة
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // لو الخدمة مش مفعلة
      log('Location services are disabled.');
      return null;
    }

    // طلب إذن الوصول
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permission denied.');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permission is permanently denied.');
      return null;
    }

    // جلب الإحداثيات
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromCoordinates(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        currentPlace = place;
        log("Country: ${place.country}");
        log("City: ${place.locality}");
        log("Governorate: ${place.administrativeArea}");
        log("street: ${place.subAdministrativeArea}");
        log("street: ${place.subLocality}");
        log("street: ${place.subThoroughfare}");
        log("street: ${place.name}");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
