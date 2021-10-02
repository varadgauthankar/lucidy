import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lucidy/pages/about_app_page.dart';
import 'package:lucidy/pages/settings_page.dart';
import 'package:lucidy/pages/statistics_page.dart';
import 'package:lucidy/pages/tools_page.dart';
import 'package:lucidy/utils/colors.dart';
import 'package:lucidy/utils/helpers.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Lucidy'),
            decoration: BoxDecoration(color: MyColors.primary),
          ),
          ListTile(
            leading: Icon(
              EvaIcons.settings2Outline,
              color: isThemeDark(context) ? MyColors.white : MyColors.black,
            ),
            title: Text('Settings'),
            onTap: () => toPage(context, SettingsPage()),
          ),
          ListTile(
            leading: Icon(
              EvaIcons.optionsOutline,
              color: isThemeDark(context) ? MyColors.white : MyColors.black,
            ),
            title: Text('Lucid dream tools'),
            onTap: () => toPage(context, ToolsPage()),
          ),
          ListTile(
            leading: Icon(
              EvaIcons.pieChartOutline,
              color: isThemeDark(context) ? MyColors.white : MyColors.black,
            ),
            title: Text('Statistics'),
            onTap: () => toPage(context, StatisticsPage()),
          ),
          ListTile(
            leading: Icon(
              EvaIcons.infoOutline,
              color: isThemeDark(context) ? MyColors.white : MyColors.black,
            ),
            title: Text('About app'),
            onTap: () => toPage(context, AboutPage()),
          ),
        ],
      ),
    );
  }
}
