import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:lucidy/utils/enums.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
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
  Future<void> scheduleFrequentNotification({
    String title,
    String description,
    Frequency frequency,
    TimeOfDay startTime,
    TimeOfDay endTime,
  }) async {
    int id = 10; // starting notification id's from 10
    int timeFrequency = 2;
    TimeOfDay time = TimeOfDay(hour: 0, minute: 0);
    List<TimeOfDay> times = []; //time to show notifications

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
    // -1 from end time so there won't be 2 notification at same time (before bed and frequent)
    for (time = startTime; time.hour <= endTime.hour - 1;) {
      DateTime timeFromDateTime = DateTime(2021, 1, 1, time.hour, time.minute)
          .add(Duration(hours: timeFrequency));

      time = TimeOfDay(
        hour: timeFromDateTime.hour,
        minute: timeFromDateTime.minute,
      );
      times.add(time);
      startTime = time;

      // stupid way to break loop
      if (timeFrequency == 6) {
        if (time.hour == 19 ||
            time.hour == 20 ||
            time.hour == 21 ||
            time.hour == 22 ||
            time.hour == 23 ||
            time.hour == 24) {
          break;
        }
      } else if (timeFrequency == 4) {
        if (time.hour == 21 ||
            time.hour == 22 ||
            time.hour == 23 ||
            time.hour == 24) {
          break;
        }
      } else if (timeFrequency == 2) {
        if (time.hour == 23 || time.hour == 24) {
          break;
        }
      }
    }

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'realityCheck',
      'Reality Check Notification',
      'Notification sent as reality check',
      importance: Importance.high,
      enableVibration: true,
    );

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    // iterate through times list and set notification for each time
    // Havent found a good way to do it yet:(
    if (times.isNotEmpty) {
      print('NOTIFICATIONS TO SET: ${times.length}');
      for (TimeOfDay time in times) {
        await flutterLocalNotificationsPlugin.zonedSchedule(
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
        print('notification set at $time with id: $id');
        id++;
      }
    } else {
      print('No notifications set');
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
  Future<void> cancelNotification({int id}) async {
    await flutterLocalNotificationsPlugin.cancel(id);
    print('$id canceled');
  }

  // delete reality check notification
  // reality check id starting from 10
  // there cannot be more than 24 notifs
  // so ending loop at 44
  Future<void> cancelScheduledNotification() async {
    for (int i = 10; i <= 50; i++) {
      await flutterLocalNotificationsPlugin.cancel(i);
      print('$i canceled');
    }
  }

  Future<List<PendingNotificationRequest>> getPendingNotification() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    return pendingNotificationRequests;
  }
}
