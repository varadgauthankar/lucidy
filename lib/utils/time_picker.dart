import 'package:flutter/material.dart';

Future<TimeOfDay> selectTime(BuildContext context,
    {TimeOfDay initialTime}) async {
  var pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (pickedTime != null)
    return pickedTime;
  else
    return initialTime;
}
