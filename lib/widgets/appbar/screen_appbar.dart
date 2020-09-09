import 'package:flutter/material.dart';

AppBar screenAppbar(context, String title) {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.black54,
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black54,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 2.0),
    ),
    elevation: 0.0,
    backgroundColor: Colors.white,
  );
}
