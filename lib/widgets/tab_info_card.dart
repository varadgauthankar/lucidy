import 'package:lucidy/utils/colors.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:flutter/material.dart';

class TabInfoCard extends StatelessWidget {
  final Widget child;
  const TabInfoCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Material(
        color: Theme.of(context).brightness == Brightness.dark
            ? getOverLayColor(
                context, MyColors.darkGrey) //get overlay color, material rules.
            : MyColors.white,
        elevation: 3,
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child,
        ),
      ),
    );
  }
}
