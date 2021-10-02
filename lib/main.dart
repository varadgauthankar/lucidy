import 'package:lucidy/constants/hive_boxes.dart';
import 'package:lucidy/controllers/data_controller.dart';
import 'package:lucidy/controllers/hive_controller.dart';
import 'package:lucidy/controllers/settings_controller.dart';
import 'package:lucidy/controllers/theme_controller.dart';
import 'package:lucidy/modals/dream.dart';
import 'package:lucidy/pages/home_page.dart';
import 'package:lucidy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DreamAdapter());
  Hive.registerAdapter(DreamInfoAdapter());
  await Hive.openBox<Dream>(kDreamsBox);
  await Hive.openBox<String>(kLabelsBox);
  await Hive.openBox(kSettingsBox);
  LabelController.initLabels();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataController()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => SettingsController()),
      ],
      child: Consumer<ThemeController>(
        builder: (context, themeController, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: MyColors.primary,
              colorScheme: ColorScheme.light(secondary: MyColors.accent),
              primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: MyColors.white,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: MyColors.primary,
              colorScheme: ColorScheme.dark(secondary: MyColors.accent),
              primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: MyColors.darkGrey,
            ),
            themeMode: themeController.themeMode,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
