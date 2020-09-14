import 'package:intl/intl.dart';

class DateUtil{
  static String getFormattedDatetime(DateTime dateTime){
    return DateFormat("EEEE, MMM d, y").format(dateTime);
  }

  static String getDateFormate(DateTime dateTime){
    return DateFormat("MMM y").format(dateTime);
  }

  static String formaterWithDay(DateTime dateTime){
    return DateFormat("dd MMM y").format(dateTime);
  }
}