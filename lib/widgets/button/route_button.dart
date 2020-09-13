import 'package:act_tracker/style/style_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RouteButton extends StatelessWidget {
  final Function routeLink;
  final String buttonTitle;

  const RouteButton({Key key, this.routeLink, this.buttonTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: StyleColor.buttonColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 5,
            color: StyleColor.shadowColor,
          ),
        ],
      ),
      child: InkWell(
        onTap: routeLink,
        child: Text(
          buttonTitle,
          style: GoogleFonts.roboto(
            fontSize: 18,
            color: StyleColor.buttonTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
