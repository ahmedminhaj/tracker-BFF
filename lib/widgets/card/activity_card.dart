import 'package:act_tracker/widgets/text/primary_title_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityCard extends StatelessWidget {
  final Function seemoreLink;
  final String currentLocation, currentposition;
  ActivityCard(
      {this.seemoreLink,
      this.currentLocation,
      this.currentposition});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 10,
            color: Colors.grey[400],
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: PrimaryTitle(
              title: "Activity",
              size: 24,
            ),
          ),
          Divider(
            color: Colors.grey[600],
            height: 4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: (currentLocation != null && currentposition != null)
                ? RichText(
                    text: TextSpan(
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(text: "You are now at"),
                        TextSpan(
                          text: " $currentLocation",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        TextSpan(text: " and"),
                        TextSpan(
                          text: " $currentposition",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        // TextSpan(text: " for last 10minutes")
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                      "Turn on GPS & internet to fetch location",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: seemoreLink,
              child: Container(
                child: Text(
                  "see more",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
