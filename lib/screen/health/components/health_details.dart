import 'package:act_tracker/screen/health/components/health_info_details.dart';
import 'package:act_tracker/screen/health/components/user_details_info.dart';
import 'package:act_tracker/style/style_color.dart';
import 'package:act_tracker/widgets/button/route_button.dart';
import 'package:flutter/material.dart';

class HealthDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: StyleColor.cardBackgroundColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 1,
            color: StyleColor.shadowColor,
          ),
        ],
      ),
      child: Column(
        children: [
          UserDetailsInfo(),
          RouteButton(
            buttonTitle: "UPDATE DETAILS",
            routeLink: null,
          ),
          SizedBox(
            height: 10,
          ),
          HealthInfoDetails(),
        ],
      ),
    );
  }
}
