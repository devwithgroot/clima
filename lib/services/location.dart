import 'package:geolocator/geolocator.dart';
class Location{
  double? latitude;
  double? longitude;
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,
  );


 Future <void> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print(
            'Location services are disabled. Please enable them in settings.');
        return;
      }

      // Check and request location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print(
            'Location permissions are permanently denied. Cannot request permissions.');
        return;
      }

      // Get the current location if everything is fine
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      latitude= position.latitude;
      longitude=position.longitude;
    } catch (e) {
      print('Failed to get location: $e');
    }
  }


}