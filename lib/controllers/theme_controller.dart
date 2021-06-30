import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  final String key = "AppTheme";
  Box box = Hive.box('settings');

  ThemeMode themeMode;

  ThemeController() {
    themeMode = ThemeMode.values[box.get(key, defaultValue: ThemeMode.light)];
  }

  toggleAppTheme(ThemeMode themeMode) {
    this.themeMode = themeMode;
    box.put(key, themeMode.index);
    notifyListeners();
  }
}
