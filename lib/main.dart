import 'package:lucidy/controllers/data_controller.dart';
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
  await Hive.openBox<Dream>('dreams');
  await Hive.openBox<List<String>>('labels');
  await Hive.openBox('settings');
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
              accentColor: MyColors.accent,
              primarySwatch: Colors.deepPurple,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: MyColors.primary,
              accentColor: MyColors.accent,
              primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: MyColors.darkGrey,
            ),
            themeMode: themeController.themeModeFromEnum(),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
