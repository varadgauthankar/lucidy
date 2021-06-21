import 'package:dream_journal/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends ChangeNotifier {
  bool isRealityCheck = false;
  bool isMorningReminder = false;
  bool isBeforeBedReminder = false;

  TimeOfDay morningReminderTime = TimeOfDay(hour: 7, minute: 0);
  TimeOfDay beforeBedTime = TimeOfDay(hour: 23, minute: 0);
  Frequency frequency = Frequency.four;

  String message = '';
  final messageController = TextEditingController(text: 'Are you dreaming?');

  setIsRealityCheck(bool value) {
    this.isRealityCheck = value;
    notifyListeners();
  }

  setIsMorningReminder(bool value) {
    this.isMorningReminder = value;
    notifyListeners();
  }

  setIsBeforeBedReminder(bool value) {
    this.isBeforeBedReminder = value;
    notifyListeners();
  }

  setMorningReminderTime(TimeOfDay time) {
    this.morningReminderTime = time;
    notifyListeners();
  }

  setBeforeBedTime(TimeOfDay time) {
    this.beforeBedTime = time;
    notifyListeners();
  }

  setFrequency(Frequency frequency) {
    this.frequency = frequency;
    notifyListeners();
  }

  setMessage(String text) {
    this.message = text;
    notifyListeners();
  }
}
