import 'dart:ui';

import 'package:lucidy/modals/dream.dart';
import 'package:lucidy/utils/colors.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:lucidy/utils/text_style.dart';
import 'package:lucidy/widgets/my_chip.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DreamCard extends StatelessWidget {
  final Function oneTap;
  final String title;
  final String description;
  final DreamInfo dreamInfo;
  const DreamCard({
    Key key,
    this.oneTap,
    this.title,
    this.description,
    this.dreamInfo,
  }) : super(key: key);

  List<Widget> buildLabels() {
    var chips = [
      {
        'label': 'Lucid',
        'value': dreamInfo.isLucid,
        'color': MyColors.blue,
      },
      {
        'label': 'Paralysis',
        'value': dreamInfo.isSleepParalysis,
        'color': MyColors.redAlt,
      },
      {
        'label': 'Nightmare',
        'value': dreamInfo.isNightMare,
        'color': MyColors.indigo,
      },
    ];

    List<Widget> trueChips = [];

    for (var item in chips) {
      bool value = item['value'];
      Color color = item['color'];
      String label = item['label'];

      if (value) trueChips.add(MyChip(label: label, color: color));
    }

    return trueChips;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: Material(
        color: isThemeDark(context)
            ? getOverLayColor(
                context, MyColors.darkGrey) //get overlay color, material rules.
            : MyColors.white,
        elevation: 3.0,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: oneTap,
          splashColor: MyColors.accent,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //date
                        Text(
                          DateFormat('EEE, dd MMM')
                              .format(dreamInfo.dateCreated),
                          style: isThemeDark(context)
                              ? CardDate.dark
                              : CardDate.light,
                        ),
                        spacer(width: 4.0),

                        //fav Icon
                        dreamInfo.isFavorite
                            ? Icon(
                                EvaIcons.star,
                                color: MyColors.yellow,
                              )
                            : nothing(),
                      ],
                    ),
                    Wrap(children: buildLabels()),
                  ],
                ),

                spacer(height: 4.0),
                //title
                Text(
                  title,
                  style:
                      isThemeDark(context) ? CardTitle.dark : CardTitle.light,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                //description
                Text(
                  description,
                  style: isThemeDark(context)
                      ? CardSubTitle.dark
                      : CardSubTitle.light,
                  overflow: TextOverflow.fade,
                  maxLines: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
