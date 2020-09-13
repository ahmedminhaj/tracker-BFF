import 'package:act_tracker/screen/home/components/user_details.dart';
import 'package:act_tracker/screen/home/components/user_icon.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.fromLTRB(30, 40, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            color: Colors.grey[400],
          ),
        ],
      ),
      child: Row(
        children: [
          UserIcon(),
          SizedBox(
            width: 10,
          ),
          UserDetails(),
        ],
      ),
    );
  }
}
