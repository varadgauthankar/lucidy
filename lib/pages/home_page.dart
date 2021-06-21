import 'package:lucidy/controllers/hive_controller.dart';
import 'package:lucidy/pages/about_app_page.dart';
import 'package:lucidy/pages/settings_page.dart';
import 'package:lucidy/pages/statistics_page.dart';
import 'package:lucidy/pages/tools_page.dart';
import 'package:lucidy/utils/colors.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:lucidy/widgets/dream_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucidy/pages/dream_detail.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isThemeDark = false;

  DreamController dreamController;

  @override
  void initState() {
    dreamController = DreamController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dreams'),
      ),
      drawer: Drawer(
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
                color: MyColors.black,
              ),
              title: Text('Settings'),
              onTap: () => toPage(context, SettingsPage()),
            ),
            ListTile(
              leading: Icon(
                EvaIcons.optionsOutline,
                color: MyColors.black,
              ),
              title: Text('Lucid dream tools'),
              onTap: () => toPage(context, ToolsPage()),
            ),
            ListTile(
              leading: Icon(
                EvaIcons.pieChartOutline,
                color: MyColors.black,
              ),
              title: Text('Statistics'),
              onTap: () => toPage(context, StatisticsPage()),
            ),
            ListTile(
              leading: Icon(
                EvaIcons.infoOutline,
                color: MyColors.black,
              ),
              title: Text('About app'),
              onTap: () => toPage(context, AboutPage()),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: dreamController.box.listenable(),
              builder: (context, dreams, widget) {
                var dreamsList = dreams.values.toList();
                if (dreams.isNotEmpty) {
                  return ListView.builder(
                    itemCount: dreamsList.length,
                    itemBuilder: (context, index) {
                      var dream = dreamsList[index];
                      return DreamCard(
                        title: dream.title,
                        description: dream.description,
                        dreamInfo: dream.dreamInfo,
                        oneTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DreamDetail(
                              dream: dream,
                              isEdit: true,
                              dreamKey: dream.key,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Text('EMPTY JUST LIKE MY LIFE');
                }
              },
            ),
          ),
        ],
      ),

      //FAB
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DreamDetail(
                  isEdit: false,
                  dream: null,
                ),
              ));
        },
        elevation: 8,
        child: Icon(
          EvaIcons.plusOutline,
          color: MyColors.black,
        ),
      ),
    );
  }
}
