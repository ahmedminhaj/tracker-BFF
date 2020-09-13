import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryTitle extends StatelessWidget {
  final String title;
  final num size;

  const PrimaryTitle({
    this.title,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title != null ? title : "",
      style: GoogleFonts.roboto(
        fontSize: size.toDouble(),
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
