import 'dart:async';

import 'package:act_tracker/model/location_model.dart';
import 'package:act_tracker/utils/time_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:location/location.dart';

class LocationController extends GetxController {
  final userLocation = UserLocation().obs;
  var activityList = List<UserLocation>().obs;

  geo.Position currentLocation;
  String currentAddress, currentPosition;
  double distance;
  var location = Location();
  var time = 90;

  fetchLocation() {
    findLocation();
    var timer = Duration(seconds: time);
    Timer.periodic(timer, (t) {
      findLocation();
    });
  }

  findLocation() async {
    currentLocation = await getCurrentLocation();
    currentAddress = await getCurrentAddress(currentLocation);
    distance = await getDistance();
    currentPosition = getCurrentPosition(distance);
    if (activityList.length == 0) {
      activityList.add(
        UserLocation(
          address: currentAddress,
          position: currentPosition,
          distanceFromWork: distance,
          stayTime: time,
          fetchTime: TimeUtil.getFormattedTime(TimeOfDay.now()),
        ),
      );
    } else if ((activityList[activityList.length - 1].position == currentPosition) &&
        (activityList[activityList.length - 1].address == currentAddress)) {
      activityList[activityList.length - 1].stayTime = activityList[activityList.length - 1].stayTime + time;
      activityList[activityList.length - 1].fetchTime = TimeUtil.getFormattedTime(TimeOfDay.now());
    } else if ((activityList[activityList.length - 1].position != currentPosition ||
        activityList[activityList.length - 1].address != currentAddress)) {
      activityList.add(
        UserLocation(
          address: currentAddress,
          position: currentPosition,
          distanceFromWork: distance,
          stayTime: time,
          fetchTime: TimeUtil.getFormattedTime(TimeOfDay.now()),
        ),
      );
    }
    print(time);
    print(distance);
    print(currentAddress);
    print(currentPosition);
    updateUserLocation();
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
        return " ${place.name}, ${place.subLocality}";
      } catch (e) {
        print(e);
      }
    } else {
      return null;
    }
  }

  getCurrentPosition(double distanceFromWrok) {
    if (distanceFromWrok < 20 ) {
      return "In work premise";
    } else {
      return "Out of work premise";
    }
  }

  updateUserLocation() {
    userLocation.update((value) {
      value.address = currentAddress;
      value.distanceFromWork = distance;
      value.position = currentPosition;
      value.stayTime = time;
      value.fetchTime = TimeUtil.getFormattedTime(TimeOfDay.now());
    });
  }
}
