import 'package:act_tracker/style/style_color.dart';
import 'package:act_tracker/style/style_size.dart';
import 'package:act_tracker/widgets/text/primary_title_text.dart';
import 'package:act_tracker/widgets/text/sub_title_text.dart';
import 'package:flutter/material.dart';

class UserDetailsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: StyleColor.cardBackgroundColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 10,
                color: StyleColor.shadowColor,
              ),
            ],
          ),
          child: Icon(
            Icons.person_outline,
            size: StyleSize.largeIconSize,
            color: StyleColor.iconColor,
          ),
        ),
        PrimaryTitle(
          title: "Jamal Bhuyan",
          size: StyleSize.titleSize,
        ),
        SizedBox(
          height: 8,
        ),
        SubTitle(
          title: "Midfeilder",
          size: StyleSize.subTitleSize,
        ),
        SizedBox(
          height: 8,
        ),
        SubTitle(
          title: "Age: 29",
          size: StyleSize.subTitleSize,
        ),
      ],
    );
  }
}
