import 'package:dream_journal/utils/helpers.dart';
import 'package:dream_journal/utils/text_style.dart';
import 'package:flutter/material.dart';

class DreamCard extends StatelessWidget {
  final Function oneTap;
  final String title;
  final String subTitle;
  final String date;
  const DreamCard({Key key, this.oneTap, this.title, this.subTitle, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: oneTap,
          splashColor: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: Theme.of(context).brightness == Brightness.dark
                      ? CardDate.dark
                      : CardDate.light,
                ),
                spacer(height: 6.0, width: 0),
                Text(
                  title,
                  style: Theme.of(context).brightness == Brightness.dark
                      ? CardTitle.dark
                      : CardTitle.light,
                ),
                spacer(height: 6.0, width: 0),
                Text(
                  subTitle,
                  style: Theme.of(context).brightness == Brightness.dark
                      ? CardSubTitle.dark
                      : CardSubTitle.light,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
