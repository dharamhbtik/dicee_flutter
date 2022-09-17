import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude = 0.0;
  late double latitude = 0.0;
  Future<void> getCurrentLocation() async {
    try {
      //print("Inside get location");
      var position = await Geolocator.getCurrentPosition();
      // print("Location recidved");
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print("You got and error $e");
    }
  }
}
