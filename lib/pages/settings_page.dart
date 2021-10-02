import 'package:lucidy/controllers/data_controller.dart';
import 'package:lucidy/controllers/hive_controller.dart';
import 'package:lucidy/controllers/theme_controller.dart';
import 'package:lucidy/utils/colors.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:lucidy/utils/text_style.dart';
import 'package:lucidy/widgets/add_label_popup.dart';
import 'package:lucidy/widgets/container_card.dart';
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
  ThemeMode themeMode;
  LabelController labelController = LabelController();

  void toggleAppTheme(ThemeMode themeMode) {
    Provider.of<ThemeController>(context, listen: false)
        .toggleAppTheme(themeMode);
  }

  void setChipValues() {
    themeMode = Provider.of<ThemeController>(context, listen: false).themeMode;
  }

  //dark mode chips
  List<Widget> buildDarkModeChips() {
    List<Widget> choices = [];
    ThemeMode.values.forEach((item) {
      choices.add(Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ChoiceChip(
          label: Text(toBeginningOfSentenceCase(
              describeEnum(item))), //Enum to string, First letter capital
          selected: themeMode == item,
          onSelected: (selected) {
            setState(() {
              themeMode = item;
              toggleAppTheme(themeMode);
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
          onDeleted: () => data.removeLabel(label),
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
        title: Text(
          'Settings',
          style: AppBarTitleStyle.lightDark,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          //theme
          ContainerCard(
            title: 'Appearance',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacer(height: 6.0),
                Text(
                  'Theme',
                  style: isThemeDark(context)
                      ? ContainerCardSubTitle.dark
                      : ContainerCardSubTitle.light,
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
                      style: isThemeDark(context)
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
                TextButton(
                  onPressed: () {},
                  child: Text('Backup',
                      style: isThemeDark(context)
                          ? MyButtonStyle.normalDark
                          : MyButtonStyle.normalLight),
                  style: TextButton.styleFrom(
                    backgroundColor: MyColors.lightGrey.withOpacity(0.3),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Restore',
                      style: isThemeDark(context)
                          ? MyButtonStyle.normalDark
                          : MyButtonStyle.normalLight),
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
