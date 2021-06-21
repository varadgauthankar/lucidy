import 'package:flutter/material.dart';

Future<TimeOfDay> selectTime(BuildContext context) async {
  var pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  return pickedTime;
}
