import 'package:firebase_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class Notify {
  static Future<void> showTestNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('channel_id', 'Medicine Reminder',
            importance: Importance.high, priority: Priority.high);

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'تذكير بتناول الدواء',
      'حان وقت تناول الدواء!',
      details,
    );
  }

  static Future<void> scheduleNotification({required TimeOfDay time}) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledTime = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, time.hour, time.minute);

    // التأكد من أن الوقت ليس في الماضي
    if (scheduledTime.isBefore(now)) {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails('channel_id', 'Medicine Reminder',
              importance: Importance.high, priority: Priority.high);

      const NotificationDetails details =
          NotificationDetails(android: androidDetails);

      scheduledTime = scheduledTime.add(Duration(days: 1));
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'تذكير بتناول الدواء',
        'حان وقت تناول الدواء!',
        scheduledTime,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      ); // ضبطه لليوم التالي
    }
  }
}
