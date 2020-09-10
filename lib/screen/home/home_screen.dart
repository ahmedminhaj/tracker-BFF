import 'package:act_tracker/controller/location_controller.dart';
import 'package:act_tracker/screen/activity/activity_screen.dart';
import 'package:act_tracker/screen/health/health_screen.dart';
import 'package:act_tracker/widgets/appbar/screen_appbar.dart';
import 'package:act_tracker/widgets/button/route_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationController locationController = Get.put(LocationController());
  @override
  void initState() {
    super.initState();
    locationController.fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppbar(context, "Zerometry BFF"),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<LocationController>(
                init: LocationController(),
                builder: (_) {
                  return Column(
                    children: [
                      Center(
                        child: Text(
                          (_.userLocation.value.address != null)
                              ? "Now at ${_.userLocation.value.address}"
                              : "Turn on GPS to find location",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black54,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text((_.userLocation.value.position != null) ?
                        "${_.userLocation.value.position} for last ${_.userLocation.value.stayTime}sec" : "",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RouteButton(
                buttonTitle: "Activity log",
                routeLink: () {
                  Get.to(
                    ActivityScreen(),
                  );
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RouteButton(
                buttonTitle: "Health Details",
                routeLink: () {
                  Get.to(
                    HealthScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
