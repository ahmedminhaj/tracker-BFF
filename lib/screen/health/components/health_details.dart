import 'package:act_tracker/screen/health/components/date_selector.dart';
import 'package:act_tracker/screen/health/components/health_info_details.dart';
import 'package:act_tracker/screen/health/components/user_details_info.dart';
import 'package:flutter/material.dart';

class HealthDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      
      child: SingleChildScrollView(
              child: Column(
          children: [
            UserDetailsInfo(),
            SizedBox(
              height: 10,
            ),
            DateSelector(),
            HealthInfoDetails(),
          ],
        ),
      ),
    );
  }
}
