import 'package:flutter/material.dart';

Widget spacer({double height = 0, double width = 0}) {
  return SizedBox(height: height, width: width);
}

Color getOverLayColor(BuildContext context, Color color) {
  return Color.alphaBlend(ElevationOverlay.overlayColor(context, 2), color);
}

void showMySnackBar(BuildContext context, {String content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}

Widget nothing() {
  return SizedBox.shrink();
}

void toPage(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (contex) => page));
}

bool isThemeDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark ? true : false;
}

TimeOfDay getTimeFromString(String time) {
  var timeofDay = TimeOfDay(
      hour: int.parse(time.split(":")[0]),
      minute: int.parse(time.split(":")[1]));
  print('timeofDay: $timeofDay');
  return timeofDay;
}
