import 'package:dream_journal/modals/dream.dart';
import 'package:dream_journal/utils/colors.dart';
import 'package:dream_journal/utils/helpers.dart';
import 'package:dream_journal/utils/text_style.dart';
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
        'label': 'LUCID',
        'value': dreamInfo.isLucid,
        'color': MyColors.blue,
      },
      {
        'label': 'PARALYSIS',
        'value': dreamInfo.isSleepParalysis,
        'color': MyColors.redAlt,
      },
      {
        'label': 'NIGHTMARE',
        'value': dreamInfo.isNightMare,
        'color': MyColors.indigo,
      },
    ];

    List<Widget> trueChips = [];

    for (var item in chips) {
      bool value = item['value'];
      Color color = item['color'];
      String label = item['label'];

      if (value) {
        trueChips.add(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Chip(
              label: Text(
                label,
                style: IsLucidLabelStyle.light,
              ),
              backgroundColor: color.withOpacity(0.2),
            ),
          ),
        );
      }
    }

    return trueChips;
  }

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
          onTap: oneTap,
          splashColor: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          DateFormat('EEE, dd MMM')
                              .format(dreamInfo.dateCreated),
                          style: Theme.of(context).brightness == Brightness.dark
                              ? CardDate.dark
                              : CardDate.light,
                        ),
                        spacer(width: 4.0),
                        dreamInfo.isFavorite
                            ? Icon(
                                EvaIcons.star,
                                color: MyColors.yellow,
                                size: 20,
                              )
                            : nothing(),
                      ],
                    ),
                    Row(
                      children: buildLabels(),
                    ),
                  ],
                ),
                spacer(height: 4.0),
                Text(
                  title,
                  style: Theme.of(context).brightness == Brightness.dark
                      ? CardTitle.dark
                      : CardTitle.light,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  description,
                  style: Theme.of(context).brightness == Brightness.dark
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
