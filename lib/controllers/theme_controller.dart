import 'package:dream_journal/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  final String key = "AppTheme";

  AppTheme appTheme;

  ThemeController() {
    appTheme = AppTheme.light;
    getThemeFromPrefs();
  }

  toggleAppTheme(AppTheme appTheme) {
    this.appTheme = appTheme;
    saveThemeToPrefs();
    notifyListeners();
  }

  getThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefsData = prefs.getString(key);
    this.appTheme = appThemeEnumFromString(prefsData);
    notifyListeners();
  }

  saveThemeToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, appTheme.toString());
  }

  AppTheme appThemeEnumFromString(String value) {
    return AppTheme.values.firstWhere((e) => e.toString() == value);
  }

  ThemeMode themeModeFromEnum() {
    if (appTheme == AppTheme.light)
      return ThemeMode.light;
    else if (appTheme == AppTheme.dark)
      return ThemeMode.dark;
    else if (appTheme == AppTheme.system)
      return ThemeMode.system;
    else
      return ThemeMode.light;
  }
}
