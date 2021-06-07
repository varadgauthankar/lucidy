import 'package:dream_journal/utils/helpers.dart';
import 'package:dream_journal/utils/text_style.dart';
import 'package:flutter/material.dart';

class TabInfoCard extends StatelessWidget {
  final Widget child;
  final String title;
  const TabInfoCard({Key key, this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      child: Material(
        // padding: EdgeInsets.all(12.0),
        elevation: 3,

        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.title,
                style: Theme.of(context).brightness == Brightness.dark
                    ? InfoCardTitle.dark
                    : InfoCardTitle.light,
              ),
              spacer(height: 6.0),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
