import 'package:dream_journal/utils/text_style.dart';
import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  final String label;
  final Color color;

  const MyChip({Key key, this.label, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.0),
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        label,
        style: cardLabel.light,
      ),
    );
  }
}
