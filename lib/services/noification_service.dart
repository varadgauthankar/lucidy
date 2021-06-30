import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:lucidy/utils/enums.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  int timeFrequency = 2;
  List<TimeOfDay> times = []; //time to show notificaton
  TimeOfDay time = TimeOfDay(hour: 0, minute: 0);
  int id = 10; // starting notification id's from 10

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService();

  init() async {
    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_notification');

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // morning and before night reminders notification
  Future scheduleNotification(
      {String title, String description, int id, TimeOfDay time}) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'reminder',
      'Reminder Notification',
      'Notification sent as reminder',
      importance: Importance.defaultImportance,
      enableVibration: true,
    );

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      description,
      notificationTime(time),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    print('notification set at $time');
  }

  // for reality check notification
  Future scheduleFrequentNotification({
    String title,
    String description,
    Frequency frequency,
    TimeOfDay startTime,
    TimeOfDay endTime,
  }) async {
    // Enum to int
    switch (frequency) {
      case Frequency.one:
        timeFrequency = 1;
        break;
      case Frequency.two:
        timeFrequency = 2;
        break;
      case Frequency.four:
        timeFrequency = 4;
        break;
      case Frequency.six:
        timeFrequency = 6;
        break;
    }

    // generate list of times to show notification
    for (time = startTime; time.hour != endTime.hour;) {
      DateTime timeFromDateTime = DateTime(2021, 1, 1, time.hour, time.minute)
          .add(Duration(hours: timeFrequency));

      if (timeFromDateTime.day == 1 && timeFrequency == 6) {
        time = TimeOfDay(
            hour: timeFromDateTime.hour, minute: timeFromDateTime.minute);
        times.add(time);
        startTime = time;
      } else
        break;
    }

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'realityCheck',
      'Reality Check Notification',
      'Notification sent as reality check',
      importance: Importance.defaultImportance,
      enableVibration: true,
    );

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    // iterate through times list and set notification for each time
    // Havent found a good way to do it yet:(
    for (TimeOfDay time in times) {
      flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        description,
        notificationTime(time),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      print('notification set at $time');
      id++;
    }
  }

  // get notification time in TZdateTime format
  tz.TZDateTime notificationTime(TimeOfDay time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, time.hour, time.minute);

    return scheduledDate;
  }

  // cancel notifications by id, used by reminders
  void cancelNotification({int id}) {
    flutterLocalNotificationsPlugin.cancel(id);
    print('$id canceled');
  }

  // delete reality check notification
  // reality check id starting from 10
  // there cannot be more than 24 notifs
  // so ending loop at 34
  void cancelScheduledNotification() {
    for (int i = 10; i <= 34; i++) {
      flutterLocalNotificationsPlugin.cancel(id);
    }
  }

  Future<List<PendingNotificationRequest>> getPendingNotification() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    return pendingNotificationRequests;
  }
}
