import 'package:act_tracker/screen/health_form/components/form_body.dart';
import 'package:act_tracker/style/style_color.dart';
import 'package:act_tracker/widgets/appbar/screen_appbar.dart';
import 'package:flutter/material.dart';

class HealthUpdateform extends StatefulWidget {
  @override
  _HealthUpdateformState createState() => _HealthUpdateformState();
}

class _HealthUpdateformState extends State<HealthUpdateform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppbar(context, "Update Info"),
      body: FormBody(),
      backgroundColor: StyleColor.backgroundColor,
    );
  }
}