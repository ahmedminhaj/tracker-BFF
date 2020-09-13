import 'package:act_tracker/style/style_color.dart';
import 'package:act_tracker/style/style_size.dart';
import 'package:act_tracker/widgets/text/primary_title_text.dart';
import 'package:act_tracker/widgets/text/sub_title_text.dart';
import 'package:flutter/material.dart';

class HealthInfoFeild extends StatelessWidget {
  final String infoFeildTitle, infoFeildValue;

  const HealthInfoFeild({Key key, this.infoFeildTitle, this.infoFeildValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 80,
      margin: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 6,
      ),
      padding: EdgeInsets.all(10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryTitle(
            title: infoFeildValue,
            size: StyleSize.titleSize,
          ),
          SubTitle(
            title: infoFeildTitle,
            size: StyleSize.bodyTextSize,
          ),
        ],
      ),
    );
  }
}
