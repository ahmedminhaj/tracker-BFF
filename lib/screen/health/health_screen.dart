import 'package:act_tracker/screen/health/components/health_details.dart';
import 'package:act_tracker/style/style_color.dart';
import 'package:act_tracker/widgets/appbar/screen_appbar.dart';
import 'package:flutter/material.dart';


class HealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppbar(context, ""),
      body: HealthDetails(),
      backgroundColor: StyleColor.backgroundColor,
    );
  }
}
