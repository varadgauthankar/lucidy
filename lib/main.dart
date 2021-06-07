import 'package:dream_journal/pages/home_page.dart';
import 'package:dream_journal/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      ),
      themeMode: ThemeMode.light,
      home: HomePage(),
    );
  }
}
