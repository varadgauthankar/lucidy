import 'package:dream_journal/utils/colors.dart';
import 'package:dream_journal/utils/helpers.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final Widget child;
  const Tile({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      child: Material(
        color: Theme.of(context).brightness == Brightness.dark
            ? getOverLayColor(
                context, MyColors.darkGrey) //get overlay color, material rules.
            : MyColors.white,
        elevation: 3.0,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: () {},
          splashColor: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
