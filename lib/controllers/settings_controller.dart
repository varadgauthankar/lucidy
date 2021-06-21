import 'package:hive/hive.dart';
import 'package:lucidy/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  bool isRealityCheck = false;
  bool isMorningReminder = false;
  bool isBeforeBedReminder = false;

  TimeOfDay morningReminderTime = TimeOfDay(hour: 7, minute: 0);
  TimeOfDay beforeBedTime = TimeOfDay(hour: 23, minute: 0);
  Frequency frequency = Frequency.four;

  String message = '';
  final messageController = TextEditingController(text: 'Are you dreaming?');

  Box box = Hive.box('settings');

  SettingsController() {
    isRealityCheck = box.get('isRealityCheck') ?? isRealityCheck;
    isMorningReminder = box.get('isMorningReminder') ?? isMorningReminder;
    isBeforeBedReminder = box.get('isBeforeBedReminder') ?? isBeforeBedReminder;
    morningReminderTime = box.get('morningReminderTime') ?? morningReminderTime;
    beforeBedTime = box.get('beforeBedTime') ?? beforeBedTime;
    frequency = box.get('frequency') ?? frequency;
    message = box.get('message') ?? message;
  }

  setIsRealityCheck(bool value) {
    this.isRealityCheck = value;
    box.put('isRealityCheck', value);
    notifyListeners();
  }

  setIsMorningReminder(bool value) {
    this.isMorningReminder = value;
    box.put('isMorningReminder', value);
    notifyListeners();
  }

  setIsBeforeBedReminder(bool value) {
    this.isBeforeBedReminder = value;
    box.put('isBeforeBedReminder', value);
    notifyListeners();
  }

  setMorningReminderTime(TimeOfDay time) {
    this.morningReminderTime = time;
    box.put('morningReminderTime', time);
    notifyListeners();
  }

  setBeforeBedTime(TimeOfDay time) {
    this.beforeBedTime = time;
    box.put('beforeBedTime', time);

    notifyListeners();
  }

  setFrequency(Frequency frequency) {
    this.frequency = frequency;
    box.put('frequency', frequency);
    notifyListeners();
  }

  setMessage(String text) {
    this.message = text;
    box.put('message', text);
    notifyListeners();
  }
}
