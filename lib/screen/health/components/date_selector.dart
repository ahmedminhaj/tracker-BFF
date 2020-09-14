import 'package:act_tracker/style/style_color.dart';
import 'package:act_tracker/utils/date_util.dart';
import 'package:act_tracker/widgets/text/sub_title_text.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime date = DateTime.now();

  Future selectDate(context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2020),
      lastDate: date,
    );

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectDate(context);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: StyleColor.cardBackgroundColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 2,
              color: StyleColor.shadowColor,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubTitle(
              title: DateUtil.formaterWithDay(date),
              size: 18,
            ),
            Icon(
              Icons.calendar_today,
              size: 22,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
