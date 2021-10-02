import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:lucidy/utils/text_style.dart';

class NoDreams extends StatelessWidget {
  const NoDreams({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenDimension = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/no_dreams.svg',
            height: screenDimension.height * .15,
          ),
          spacer(height: 12),
          Text(
            'No dreams yet!',
            style: isThemeDark(context)
                ? StatisticsCardTitle.dark
                : StatisticsCardTitle.light,
          )
        ],
      ),
    );
  }
}
