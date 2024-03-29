import 'package:lucidy/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarTitleStyle {
  static const lightDark = TextStyle(
    color: MyColors.white,
    fontWeight: FontWeight.w600,
  );
}

class CardTitle {
  static const light = TextStyle(
    color: MyColors.black,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static const dark = TextStyle(
    color: MyColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );
}

class CardSubTitle {
  static const light = TextStyle(
    color: MyColors.black,
    fontSize: 16,
  );

  static const dark = TextStyle(
    color: MyColors.white,
    fontSize: 16,
  );
}

class CardDate {
  static const light = TextStyle(
    color: MyColors.accentVarient,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const dark = TextStyle(
    color: MyColors.accent,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}

class CardLabel {
  static const light = TextStyle(
    color: MyColors.darkGrey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const dark = TextStyle(
    color: MyColors.darkGrey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}

class InfoCardTitle {
  static const light = TextStyle(
    color: MyColors.accentVarient,
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );

  static const dark = TextStyle(
    color: MyColors.accent,
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );
}

class InfoCardLeading {
  static const light = TextStyle(
    color: MyColors.lightGrey,
    fontSize: 14,
    fontWeight: FontWeight.w900,
  );

  static const dark = TextStyle(
    color: MyColors.lightGrey,
    fontSize: 14,
    fontWeight: FontWeight.w900,
  );
}

//Container card styles

class ContainerCardTitle {
  static const light = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: MyColors.accentVarient,
  );
  static const dark = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: MyColors.accent,
  );
}

class ContainerCardSubTitle {
  static const light = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: MyColors.black,
  );
  static const dark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: MyColors.white,
  );
}

//buttons
class MyButtonStyle {
  static const danger = TextStyle(
    color: MyColors.error,
    fontWeight: FontWeight.w600,
  );
  static const primary = TextStyle(
    color: MyColors.accentVarient,
    fontWeight: FontWeight.w600,
  );
  static const normalDark = TextStyle(
    color: MyColors.white,
    fontWeight: FontWeight.w600,
  );
  static const normalLight = TextStyle(
    color: MyColors.primary,
    fontWeight: FontWeight.w600,
  );
}

//statistic card
class StatisticsCardTitle {
  static const light = TextStyle(
    color: MyColors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static const dark = TextStyle(
    color: MyColors.white,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
}

class StatisticsCardValue {
  static const light = TextStyle(
    color: MyColors.accentVarient,
    fontWeight: FontWeight.w800,
    fontSize: 30,
  );

  static const dark = TextStyle(
    color: MyColors.accent,
    fontWeight: FontWeight.w800,
    fontSize: 30,
  );
}

//tile
class TileTitle {
  static const light = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: MyColors.black,
  );

  static const dark = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: MyColors.white,
  );
}

class TileSubtitle {
  static const light = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: MyColors.black,
  );

  static const dark = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: MyColors.white,
  );
}

class MyListTileStyle {
  static const dark = TextStyle(
    color: MyColors.white,
  );
  static const light = TextStyle(
    color: MyColors.darkGrey,
  );
}
