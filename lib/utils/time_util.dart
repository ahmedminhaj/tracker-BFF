import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeUtil{
  static String getFormattedTime(TimeOfDay timeOfDay){
    final now = new DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final format = DateFormat.jm();
    return format.format(dateTime);
  }
}