import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RouteButton extends StatelessWidget {
  final Function routeLink;
  final String buttonTitle;

  const RouteButton({Key key, this.routeLink, this.buttonTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 10,
            color: Colors.grey[600],
          ),
        ],
      ),
      child: InkWell(
        onTap: routeLink,
        child: Text(
          buttonTitle,
          style: GoogleFonts.roboto(
            fontSize: 18,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
