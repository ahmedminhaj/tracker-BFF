import 'package:act_tracker/controller/location_controller.dart';
import 'package:act_tracker/screen/home/home_screen.dart';
import 'package:act_tracker/widgets/appbar/screen_appbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityScreen extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppbar(
        context,
        "Activity Log",
      ),
      body: Container(
        child: Obx(() => ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  locationController.activityList[index].address,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                subtitle: Text(
                  locationController.activityList[index].position,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Text(
                  "${locationController.activityList[index].stayTime}s",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              separatorBuilder: (_, __) => Divider(),
              itemCount: locationController.activityList.length,
            )),
      ),
    );
  }
}
