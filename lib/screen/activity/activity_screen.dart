import 'package:act_tracker/controller/location_controller.dart';
import 'package:act_tracker/widgets/appbar/screen_appbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppbar(
        context,
        "Activity Log",
      ),
      body: Container(
        child: 
        Obx(() => ListView.separated(
              itemBuilder: (context, index) => ListTile(
                leading: Text(
                  locationController.activityList[index].fetchTime,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                title: Text(
                  locationController.activityList[index].address,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                subtitle: Text(
                  "${locationController.activityList[index].position} for last ${Duration(seconds:locationController.activityList[index].stayTime).inMinutes}m ${locationController.activityList[index].stayTime % 60}s",
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
