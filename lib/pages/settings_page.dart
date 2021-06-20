import 'package:dream_journal/controllers/hive_controller.dart';
import 'package:dream_journal/utils/colors.dart';
import 'package:dream_journal/utils/enums.dart';
import 'package:dream_journal/utils/helpers.dart';
import 'package:dream_journal/utils/text_style.dart';
import 'package:dream_journal/widgets/container_card.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  AppTheme appTheme;

  //dark mode chips
  List<Widget> buildDarkModeChips() {
    List<Widget> choices = [];
    AppTheme.values.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(toBeginningOfSentenceCase(
              describeEnum(item))), //Enum to string, First letter capital
          selected: appTheme == item,
          onSelected: (selected) {
            setState(() {
              appTheme = item;
              // toggleAppTheme(appTheme);
            });
          },
        ),
      ));
    });
    return choices;
  }

  List<Widget> buildAllLabelsChip() {
    LabelController labelController = LabelController();
    var labelsFromBox = labelController.getLabels();

    List<Widget> choices = [];
    labelsFromBox.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: Chip(
          label: Text(item),
          onDeleted: () {},
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          //theme
          ContainerCard(
            title: 'Appearance',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacer(height: 6.0),
                Text(
                  'Dark Mode',
                  style: ContainerCardSubTitle.light,
                ),
                Wrap(
                  children: buildDarkModeChips(),
                )
              ],
            ),
          ),

          //manage lables
          ContainerCard(
            title: 'Manage Labels',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacer(height: 6.0),
                // Text(
                //   'Long press to edit/delete',
                //   style: ContainerCardSubTitle.light,
                // ),
                Wrap(
                  children: buildAllLabelsChip(),
                )
              ],
            ),
          ),

          //data stuff
          ContainerCard(
            title: 'Data',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacer(height: 6.0),
                // Text(
                //   'Long press to edit/delete',
                //   style: ContainerCardSubTitle.light,
                // ),
                TextButton(
                  onPressed: () {},
                  child: Text('Backup'),
                  style: TextButton.styleFrom(
                    backgroundColor: MyColors.lightGrey.withOpacity(0.3),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Restore'),
                  style: TextButton.styleFrom(
                    backgroundColor: MyColors.lightGrey.withOpacity(0.3),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'DELETE ALL DATA',
                    style: MyButtonStyle.danger,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: MyColors.lightGrey.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
