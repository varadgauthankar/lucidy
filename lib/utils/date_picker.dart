import 'package:flutter/material.dart';

Future<DateTime> selectDate(BuildContext context, DateTime date) async {
  final DateTime picked = await showDatePicker(
    context: context,
    initialDate: date,
    firstDate: DateTime(2001),
    lastDate: DateTime.now().add(Duration(days: 365)),
  );
  if (picked != null)
    return picked;
  else
    return date;
}
