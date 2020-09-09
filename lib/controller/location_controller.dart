import 'dart:async';
import 'dart:math';

import 'package:act_tracker/model/location_model.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:location/location.dart';

class LocationController extends GetxController {
  final userLocation = UserLocation().obs;

  geo.Position currentLocation;
  String currentAddress, currentPosition;
  double distance;
  var location = Location();
  var time = 10;
  var timeList = [30, 40, 20, 50, 60];

  findLocation() async {
    currentLocation = await getCurrentLocation();
    currentAddress = await getCurrentAddress(currentLocation);
    distance = await getDistance();
    currentPosition = getCurrentPosition(distance);
    time = timeList[Random().nextInt(timeList.length)];
    print(time);
    print(distance);
    print(currentAddress);
    print(currentPosition);
    // updateUserLocation();
    updateUserAddress();
    updateUserDistanceFromWork();
    updateUserPosition();
    updateUserStayTime();
  }

  Future<geo.Position> getCurrentLocation() async {
    geo.Position position = await geo.Geolocator()
        .getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.high);
    return position;
  }

  getDistance() async {
    geo.Position currentPos = await getCurrentLocation();
    print(currentPos);
    if (currentPos != null) {
      double distanceInMeters = await geo.Geolocator().distanceBetween(
          23.751328, 90.3790379, currentPos.latitude, currentPos.longitude);

      return distanceInMeters;
    } else {
      return 0.0;
    }
  }

  getCurrentAddress(geo.Position currentloc) async {
    if (currentloc != null) {
      try {
        List<geo.Placemark> p = await geo.Geolocator().placemarkFromCoordinates(
            currentloc.latitude, currentloc.longitude);

        geo.Placemark place = p[0];
        return "${place.subLocality}";
      } catch (e) {
        print(e);
      }
    } else {
      return null;
    }
  }

  getCurrentPosition(double distanceFromWrok) {
    if (distanceFromWrok < 20) {
      return "in work premise";
    } else {
      return "out of work premise";
    }
  }

  updateUserLocation() {
    userLocation.update((value) {
      value.currentAddress = currentAddress;
      value.distanceFromWork = distance;
      value.position = currentPosition;
      value.stayTime = time;
    });
  }

  updateUserAddress() {
    userLocation.update((value) {
      value.currentAddress = currentAddress;
    });
  }

  updateUserStayTime() {
    userLocation.update((value) {
      value.stayTime = time;
    });
  }

  updateUserDistanceFromWork() {
    userLocation.update((value) {
      value.distanceFromWork = distance;
    });
  }

  updateUserPosition() {
    userLocation.update((value) {
      value.position = currentPosition;
    });
  }

  fetchLocation() {
    findLocation();
    var timer = Duration(seconds: time);
    Timer.periodic(timer, (t) {
      findLocation();
    });
  }
}
