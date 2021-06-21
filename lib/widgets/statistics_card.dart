import 'package:lucidy/utils/colors.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:lucidy/utils/text_style.dart';
import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final String title;
  final String value;

  const StatisticsCard({Key key, this.title, this.value}) : super(key: key);

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
            child: Center(
              child: Column(
                children: [
                  Text(
                    value,
                    style: Theme.of(context).brightness == Brightness.dark
                        ? StatisticsCardValue.dark
                        : StatisticsCardValue.light,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).brightness == Brightness.dark
                        ? StatisticsCardTitle.dark
                        : StatisticsCardTitle.light,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StatisticsCard2 extends StatelessWidget {
  final String title1;
  final String title2;
  final String value1;
  final String value2;

  const StatisticsCard2({
    Key key,
    this.title1,
    this.title2,
    this.value1,
    this.value2,
  }) : super(key: key);

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
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            value1,
                            style:
                                Theme.of(context).brightness == Brightness.dark
                                    ? StatisticsCardValue.dark
                                    : StatisticsCardValue.light,
                          ),
                          Text(
                            title1,
                            style:
                                Theme.of(context).brightness == Brightness.dark
                                    ? StatisticsCardTitle.dark
                                    : StatisticsCardTitle.light,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            value2,
                            style:
                                Theme.of(context).brightness == Brightness.dark
                                    ? StatisticsCardValue.dark
                                    : StatisticsCardValue.light,
                          ),
                          Text(
                            title2,
                            style:
                                Theme.of(context).brightness == Brightness.dark
                                    ? StatisticsCardTitle.dark
                                    : StatisticsCardTitle.light,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StatisticsCard3 extends StatelessWidget {
  final String title;
  final Widget child;
  const StatisticsCard3({
    Key key,
    this.title,
    this.child,
  }) : super(key: key);

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: StatisticsCardTitle.light,
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
