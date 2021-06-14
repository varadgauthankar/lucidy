import 'package:dream_journal/controllers/data_controller.dart';
import 'package:dream_journal/modals/dream.dart';
import 'package:dream_journal/pages/home_page.dart';
import 'package:dream_journal/utils/colors.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataController()),
      ],
      child: MaterialApp(
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
        themeMode: ThemeMode.light,
        home: HomePage(),
      ),
    );
  }
}
