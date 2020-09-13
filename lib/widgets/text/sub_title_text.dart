import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubTitle extends StatelessWidget {
  final String title;
  final num size;

  const SubTitle({
    this.title,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title != null ? title : "",
      style: GoogleFonts.roboto(
        fontSize: size.toDouble(),
        color: Colors.black45,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
