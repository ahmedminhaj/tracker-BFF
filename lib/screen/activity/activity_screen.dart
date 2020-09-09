import 'package:act_tracker/screen/home/home_screen.dart';
import 'package:act_tracker/widgets/appbar/screen_appbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityScreen extends StatelessWidget {
  goBack() {
    Get.to(HomeScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppbar(context, "Activity Log",),
      
    );
  }
}
