import 'package:hive/hive.dart';
import 'package:lucidy/constants/hive_boxes.dart';
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

  Box box = Hive.box(kSettingsBox);

  // box keys
  String isRealityCheckKey = 'isRealityCheck';
  String isMorningReminderKey = 'isMorningReminder';
  String isBeforeBedReminderKey = 'isBeforeBedReminder';
  String morningReminderTimeKey = 'morningReminderTime';
  String beforeBedReminderTimeKey = 'beforeBedReminderTime';
  String messageKey = 'message';
  String frequencyKey = 'frequency';

  SettingsController() {
    isRealityCheck = box.get(isRealityCheckKey, defaultValue: isRealityCheck);
    isMorningReminder =
        box.get(isMorningReminderKey, defaultValue: isMorningReminder);
    isBeforeBedReminder =
        box.get(isBeforeBedReminderKey, defaultValue: isBeforeBedReminder);
    morningReminderTime = getTimeFromString(
            box.get(morningReminderTimeKey, defaultValue: '7:00')) ??
        morningReminderTime;
    beforeBedTime = getTimeFromString(
            box.get(beforeBedReminderTimeKey, defaultValue: '23:00')) ??
        beforeBedTime;
    message = box.get(messageKey, defaultValue: message);
    frequency = Frequency.values[box.get(frequencyKey, defaultValue: 2)];
    messageController.text = box.get(messageKey, defaultValue: message);
  }

  setIsRealityCheck(bool value) {
    this.isRealityCheck = value;
    box.put(isRealityCheckKey, value);
    notifyListeners();
  }

  setIsMorningReminder(bool value) {
    this.isMorningReminder = value;
    box.put(isMorningReminderKey, value);
    notifyListeners();
  }

  setIsBeforeBedReminder(bool value) {
    this.isBeforeBedReminder = value;
    box.put(isBeforeBedReminderKey, value);
    notifyListeners();
  }

  setMorningReminderTime(TimeOfDay time) {
    this.morningReminderTime = time;
    box.put(isMorningReminderKey, '${time.hour}:${time.minute}');
    notifyListeners();
  }

  setBeforeBedTime(TimeOfDay time) {
    this.beforeBedTime = time;
    box.put(beforeBedReminderTimeKey, '${time.hour}:${time.minute}');
    notifyListeners();
  }

  setFrequency(Frequency frequency) {
    this.frequency = frequency;
    box.put(frequencyKey, frequency.index);
    notifyListeners();
  }

  setMessage(String text) {
    this.message = text;
    box.put(messageKey, text);
    notifyListeners();
  }
}
