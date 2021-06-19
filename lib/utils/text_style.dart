import 'package:dream_journal/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class cardLabel {
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
