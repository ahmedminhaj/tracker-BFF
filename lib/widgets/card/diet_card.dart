import 'package:act_tracker/widgets/text/primary_title_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DietCard extends StatelessWidget {
  final Function seeDetailsLink;
  DietCard({
    this.seeDetailsLink,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: seeDetailsLink,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                title: "Diet Plan",
                size: 24,
              ),
            ),
            Divider(
              color: Colors.grey[600],
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(text: "Today's diet for lunch "),
                    TextSpan(
                      text:
                          "Chicken breast, Avocado, beetroot, spinach, Quinoa salad",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                child: Text(
                  "see more",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
