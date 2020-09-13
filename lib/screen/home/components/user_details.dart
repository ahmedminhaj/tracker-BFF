
import 'package:act_tracker/widgets/text/primary_title_text.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryTitle(
            title: "Jamal Bhuyan",
            size: 28,
          ),
          PrimaryTitle(
            title: "Midfeilder",
            size: 20,
          ),
        ],
      ),
    );
  }
}