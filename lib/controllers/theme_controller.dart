import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  final String key = "AppTheme";
  Box box = Hive.box('settings');

  ThemeMode themeMode = ThemeMode.light;

  ThemeController() {
    themeMode = ThemeMode.light;
  }

  toggleAppTheme(ThemeMode themeMode) {
    this.themeMode = themeMode;
    box.put(key, themeMode.index);
    notifyListeners();
  }
}
