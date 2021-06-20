import 'package:dream_journal/controllers/data_controller.dart';
import 'package:dream_journal/controllers/hive_controller.dart';
import 'package:dream_journal/controllers/theme_controller.dart';
import 'package:dream_journal/utils/colors.dart';
import 'package:dream_journal/utils/enums.dart';
import 'package:dream_journal/utils/helpers.dart';
import 'package:dream_journal/utils/text_style.dart';
import 'package:dream_journal/widgets/add_label_popup.dart';
import 'package:dream_journal/widgets/container_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  AppTheme appTheme;
  LabelController labelController = LabelController();

  void toggleAppTheme(AppTheme appTheme) {
    Provider.of<ThemeController>(context, listen: false)
        .toggleAppTheme(appTheme);
  }

  void setChipValues() {
    appTheme = Provider.of<ThemeController>(context, listen: false).appTheme;
  }

  //dark mode chips
  List<Widget> buildDarkModeChips() {
    List<Widget> choices = [];
    AppTheme.values.forEach((item) {
      choices.add(Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ChoiceChip(
          label: Text(toBeginningOfSentenceCase(
              describeEnum(item))), //Enum to string, First letter capital
          selected: appTheme == item,
          onSelected: (selected) {
            setState(() {
              appTheme = item;
              toggleAppTheme(appTheme);
            });
          },
        ),
      ));
    });
    return choices;
  }

  List<Widget> buildAllLabelsChip() {
    DataController data = Provider.of<DataController>(context, listen: false);

    List<Widget> selection = [];
    data.getLabels().forEach((label) {
      selection.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: Chip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          label: Text(label),
          onDeleted: () {
            setState(() {
              data.getLabels().removeWhere((element) => label == element);
              data.updateLabels(data.getLabels());
            });
          },
        ),
      ));
    });
    return selection;
  }

  @override
  void initState() {
    setChipValues();
    super.initState();
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
            title: null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Manage Labels',
                      style: Theme.of(context).brightness == Brightness.dark
                          ? ContainerCardTitle.dark
                          : ContainerCardTitle.light,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        '+ Label',
                        style: InfoCardLeading.dark,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              AddLabelDialog(isFromSettings: true),
                        );
                      },
                    ),
                  ],
                ),

                spacer(height: 6.0),
                // Text(
                //   'Long press to edit/delete',
                //   style: ContainerCardSubTitle.light,
                // ),
                Consumer<DataController>(builder: (context, data, child) {
                  return Wrap(
                    children: buildAllLabelsChip(),
                  );
                })
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
