// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationService {
//   Position? position;
//
//   Future<Position?> accessCurrentLocation(
//       {required BuildContext context}) async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       await Geolocator.openLocationSettings();
//     }
//     LocationPermission? permission = await Geolocator.checkPermission();
//
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       await Geolocator.requestPermission();
//     }
//     position = await Geolocator.getCurrentPosition();
//
//     return position;
//   }
//
//   Future<Placemark?> getMyLocationInfo() async {
//     if (position != null) {
//       List<Placemark?> placeMarks = await placemarkFromCoordinates(
//           position!.latitude, position!.longitude);
//
//       return placeMarks[0];
//     }
//     return null;
//   }
// }