import 'package:hive/hive.dart';
import 'package:lucidy/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucidy/utils/helpers.dart';

class SettingsController extends ChangeNotifier {
  bool isRealityCheck = false;
  bool isMorningReminder = false;
  bool isBeforeBedReminder = false;

  TimeOfDay morningReminderTime = TimeOfDay(hour: 7, minute: 0);
  TimeOfDay beforeBedTime = TimeOfDay(hour: 23, minute: 0);
  Frequency frequency = Frequency.four;

  String message = 'Are you Dreaming?';
  final messageController = TextEditingController();

  Box box = Hive.box('settings');

  SettingsController() {
    isRealityCheck = box.get('isRealityCheck', defaultValue: isRealityCheck);
    isMorningReminder =
        box.get('isMorningReminder', defaultValue: isMorningReminder);
    isBeforeBedReminder =
        box.get('isBeforeBedReminder', defaultValue: isBeforeBedReminder);
    morningReminderTime = getTimeFromString(
            box.get('morningReminderTime', defaultValue: '7:00')) ??
        morningReminderTime;
    beforeBedTime = getTimeFromString(
            box.get('morningReminderTime', defaultValue: '23:00')) ??
        beforeBedTime;
    message = box.get('message', defaultValue: message);
    frequency = Frequency.values[box.get('frequency', defaultValue: 2)];
    messageController.text = box.get('message', defaultValue: message);
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
    box.put('morningReminderTime', '${time.hour}:${time.minute}');
    notifyListeners();
  }

  setBeforeBedTime(TimeOfDay time) {
    this.beforeBedTime = time;
    box.put('beforeBedTime', '${time.hour}:${time.minute}');
    notifyListeners();
  }

  setFrequency(Frequency frequency) {
    this.frequency = frequency;
    box.put('frequency', frequency.index);
    notifyListeners();
  }

  setMessage(String text) {
    this.message = text;
    box.put('message', text);
    notifyListeners();
  }
}
