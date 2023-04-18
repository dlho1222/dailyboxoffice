import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//
class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String selectedDate = (DateFormat("2023년 04월 09일").format(DateTime.now()));
  Future selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selected != null) {
      setState(() {
        selectedDate = (DateFormat("yyyy년 MM월 dd일").format(selected));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => selectDate(context),
      child: Text(
        selectedDate,
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
