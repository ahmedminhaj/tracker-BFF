import 'package:act_tracker/controller/location_controller.dart';
import 'package:act_tracker/screen/activity/activity_screen.dart';
import 'package:act_tracker/screen/health/health_screen.dart';
import 'package:act_tracker/screen/health_form/health_update_form.dart';
import 'package:act_tracker/screen/home/components/user_card.dart';
import 'package:act_tracker/style/style_color.dart';
import 'package:act_tracker/widgets/card/activity_card.dart';
import 'package:act_tracker/widgets/card/diet_card.dart';
import 'package:act_tracker/widgets/card/health_info_card.dart';
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
      backgroundColor: StyleColor.backgroundColor,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserCard(),
              GetX<LocationController>(
                init: LocationController(),
                builder: (_) {
                  return (_.userLocation.value.address != null)
                      ? ActivityCard(
                          currentLocation: _.userLocation.value.address,
                          currentposition:
                              (_.userLocation.value.distanceFromWork < 20)
                                  ? "in work premise"
                                  : "out of work premise",
                          seemoreLink: () {
                            Get.to(ActivityScreen());
                          },
                        )
                      : ActivityCard(
                          currentLocation: null,
                          currentposition: null,
                          seemoreLink: () {
                            Get.to(ActivityScreen());
                          },
                        );
                },
              ),
              HealthInfoCard(
                seeDetailsLink: () {
                  Get.to(HealthUpdateform());
                },
              ),
              DietCard(),
            ],
          ),
        ),
      ),
    );
  }
}
