import 'package:dream_journal/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTitle {
  static const light = TextStyle(
    color: MyColors.black,
    fontSize: 22,
    fontWeight: FontWeight.w900,
  );

  static const dark = TextStyle(
    color: MyColors.white,
    fontSize: 22,
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
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const dark = TextStyle(
    color: MyColors.accent,
    fontSize: 12,
    fontWeight: FontWeight.w600,
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
