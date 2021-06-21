import 'package:lucidy/utils/colors.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:lucidy/utils/text_style.dart';
import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final String title;
  final Widget child;

  const ContainerCard({Key key, this.title, this.child}) : super(key: key);

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
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                title != null
                    ? Text(
                        title,
                        style: Theme.of(context).brightness == Brightness.dark
                            ? ContainerCardTitle.dark
                            : ContainerCardTitle.light,
                      )
                    : nothing(),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
