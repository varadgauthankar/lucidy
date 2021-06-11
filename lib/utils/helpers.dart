import 'package:flutter/material.dart';

Widget spacer({double height = 0, double width = 0}) {
  return SizedBox(height: height, width: width);
}

Color getOverLayColor(BuildContext context, Color color) {
  return Color.alphaBlend(ElevationOverlay.overlayColor(context, 2), color);
}

void snackBar(BuildContext context, {String content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
