// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:intl/intl.dart';
// // import 'package:timezone/data/latest.dart' as tz;
// // import 'package:timezone/timezone.dart' as tz;
// import 'package:workmanager/workmanager.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// class Notify {
//   static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   static final FlutterTts flutterTts = FlutterTts();

//   /// إعداد الإشعارات
//   static Future<void> initializeNotifications() async {
//     const androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const initializationSettings = InitializationSettings(
//       android: androidSettings,
//     );

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   /// إعدادات النطق الصوتي
//   static Future<void> speak(String text) async {
//     await flutterTts.setLanguage("ar-SA");
//     await flutterTts.setPitch(1.0);
//     await flutterTts.setSpeechRate(0.5);
//     await flutterTts.speak(text);
//   }

//   /// تحويل الوقت لصيغة 12 ساعة
//   static String normalizeTimeFormat(String timeStr) {
//     try {
//       DateTime dateTime = DateFormat('HH:mm').parse(timeStr);
//       return DateFormat('hh:mm a').format(dateTime);
//     } catch (e) {
//       print('خطأ في تحليل الوقت: $timeStr - $e');
//       return timeStr;
//     }
//   }

//   /// الوظيفة الأساسية التي يتم استدعاؤها من WorkManager
//   static Future<void> checkAndNotifyFromFirebase() async {
//     final now = DateTime.now();
//     // final today = DateFormat('yyyy-MM-dd').format(now);
//     final user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       final snapshot = await _firestore
//           .collection('medications')
//           .where('userId', isEqualTo: user.uid)
//           .get();

//       for (var doc in snapshot.docs) {
//         final data = doc.data();
//         final name = data['name'] ?? 'الدواء';
//         final startDateStr = data['startDate'];
//         final endDateStr = data['endDate'];
//         final String notes = data['notes'] ?? '';

//         final List<dynamic> doseTimes = data['doseTimes'];

//         // تحقق من صلاحية التاريخ
//         if (startDateStr == null || endDateStr == null || doseTimes.length <= 0)
//           continue;

//         DateTime startDate = DateTime.parse(startDateStr);
//         DateTime endDate = DateTime.parse(endDateStr);
//         if (now.isBefore(startDate) || now.isAfter(endDate)) continue;

//         for (String timeStr in doseTimes) {
//           try {
//             DateTime doseTime = DateFormat('HH:mm').parse(timeStr);
//             DateTime fullDoseDateTime = DateTime(
//               now.year,
//               now.month,
//               now.day,
//               doseTime.hour,
//               doseTime.minute,
//             );

//             final difference = fullDoseDateTime.difference(now).inMinutes;

//             if (difference >= 0 && difference <= 1) {
//               await speak("يرجى تناول دواء $name $notes الآن ");
//               await _showNotification(name, normalizeTimeFormat(timeStr));
//             }
//           } catch (e) {
//             print("خطأ في تحليل الوقت $timeStr: $e");
//           }
//         }
//       }
//     } else {
//       print("user Login");
//     }
//     // final snapshot = await _firestore.collection('medications').get();
//   }

//   /// إرسال إشعار لجرعة معينة
//   static Future<void> _showNotification(
//       String medicineName, String timeStr) async {
//     const androidDetails = AndroidNotificationDetails(
//       'channel_id',
//       'Medicine Reminder',
//       channelDescription: 'تذكير بتناول الأدوية',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const notificationDetails = NotificationDetails(android: androidDetails);

//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'تذكير بـ $medicineName',
//       'حان موعد الدواء الساعة $timeStr',
//       notificationDetails,
//     );
//   }
// }

// // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //     FlutterLocalNotificationsPlugin();

// void initializeNotifications() {
//   const AndroidInitializationSettings androidSettings =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   const InitializationSettings initSettings =
//       InitializationSettings(android: androidSettings);

//   flutterLocalNotificationsPlugin.initialize(initSettings);
// }

// void initializeTimeZone() {
//   tz.initializeTimeZones();
//   tz.setLocalLocation(
//       tz.getLocation('Asia/Damascus')); // استبدل بالمنطقة الزمنية المناسبة
//                             }
// ////// background

// void callbackDispatcher() {
//   Workmanager().executeTask((taskName, inputData) async {
//     await Firebase.initializeApp();
//     await Notify.checkAndNotifyFromFirebase();
//     return Future.value(true);
//   });
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:intl/intl.dart';
// // import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// class Notify {
//   static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   static final FlutterTts flutterTts = FlutterTts();

//   /// تهيئة الإشعارات
//   static Future<void> initializeNotifications() async {
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initSettings =
//         InitializationSettings(android: androidSettings);

//     await flutterLocalNotificationsPlugin.initialize(initSettings);
//     // tz.initializeTimeZones();
//     // final location = tz.local;
//     // tz.setLocalLocation(location);
//   }

//   /// إعدادات النطق الصوتي
//   static Future<void> speak(String text) async {
//     await flutterTts.setLanguage("ar-SA");
//     await flutterTts.setPitch(1.0);
//     await flutterTts.setSpeechRate(0.5);
//     await flutterTts.speak(text);
//   }

//   /// جدولة الإشعارات للأدوية من Firebase
//   static Future<void> scheduleAllNotificationsFromFirebase() async {
//     final user = FirebaseAuth.instance.currentUser;
//     print("****************************************************");
//     if (user == null) {
//       print("لم يتم تسجيل الدخول.");
//       return;
//     }

//     final now = DateTime.now();

//     final snapshot = await _firestore
//         .collection('medications')
//         .where('userId', isEqualTo: user.uid)
//         .get();

//     int notificationId = 0;

//     for (var doc in snapshot.docs) {
//       final data = doc.data();
//       final name = data['name'] ?? 'دواء';
//       final startDateStr = data['startDate'];
//       final endDateStr = data['endDate'];
//       final String notes = data['notes'] ?? '';
//       final List<dynamic> doseTimes = data['doseTimes'];

//       if (startDateStr == null || endDateStr == null || doseTimes.isEmpty) {
//         continue;
//       }

//       final startDate = DateTime.parse(startDateStr);
//       final endDate = DateTime.parse(endDateStr);

//       for (DateTime date = startDate;
//           !date.isAfter(endDate);
//           date = date.add(Duration(days: 1))) {
//         for (String timeStr in doseTimes) {
//           print(
//             int.parse(timeStr[0]).toString() +
//                 "90909000000000000000000" +
//                 int.parse(timeStr[1]).toString() +
//                 "*****************" +
//                 timeStr +
//                 "*****************",
//           );
//           try {
//             final time = DateTime(
//               now.year,
//               now.month,
//               now.day,
//               int.parse(timeStr[0]),
//               int.parse(timeStr[1]),
//             );

//             // final time = DateFormat('HH:mm').parse(timeStr);
//             final scheduledDate = DateTime(
//               date.year,
//               date.month,
//               date.day,
//               time.hour,
//               time.minute,
//             );

// // طباعة القيم للتحقق منها
//             print('الوقت المُدخل: $time');
//             print('التاريخ المُجدول: $scheduledDate');
//             print('الوقت الحالي: $now');

//             if (scheduledDate.isAfter(now)) {
//               print('سيتم جدولة الإشعار في: $scheduledDate');
//               await scheduleNotification(
//                 id: notificationId++,
//                 medicineName: name,
//                 notes: notes,
//                 dateTime: scheduledDate,
//               );
//             } else {
//               print('التاريخ المُحدد قديم ولن يتم جدولة الإشعار.');
//             }
//           } catch (e) {
//             print("خطأ في تحليل الوقت $timeStr: $e");
//           }
//         }
//       }
//     }
//   }

//   static Future<void> scheduleNotification({
//     required int id,
//     required String medicineName,
//     required String notes,
//     required DateTime dateTime,
//   }) async {
//     // ضبط الوقت ليكون وفقًا لمنطقة الجهاز الزمنية
//     final now = DateTime.now(); // الحصول على الوقت الحالي للجهاز
//     final scheduledDateTime = DateTime(
//       now.year,
//       now.month,
//       now.day,
//       dateTime.hour,
//       dateTime.minute,
//     );

//     final tz.TZDateTime tzDateTime =
//         tz.TZDateTime.from(scheduledDateTime, tz.local); // استخدام وقت الجهاز

//     final androidDetails = AndroidNotificationDetails(
//       'channel_id',
//       'Medicine Reminder',
//       channelDescription: 'تذكير بتناول الأدوية',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     final notificationDetails = NotificationDetails(android: androidDetails);

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       'تذكير بـ $medicineName',
//       'حان موعد تناول الدواء ${notes.isNotEmpty ? '($notes)' : ''}',
//       tzDateTime,
//       notificationDetails,
//       androidScheduleMode:
//           AndroidScheduleMode.exactAllowWhileIdle, // تأكد من تضمين هذا
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.dateAndTime,
//     );
//   }

//   /// جدولة إشعار معين
//   // static Future<void> scheduleNotification({
//   //   required int id,
//   //   required String medicineName,
//   //   required String notes,
//   //   required DateTime dateTime,
//   // }) async {
//   //   final tz.TZDateTime tzDateTime =
//   //       tz.TZDateTime.from(dateTime, tz.local); // استخدام وقت الجهاز

//   //   final androidDetails = AndroidNotificationDetails(
//   //     'channel_id',
//   //     'Medicine Reminder',
//   //     channelDescription: 'تذكير بتناول الأدوية',
//   //     importance: Importance.max,
//   //     priority: Priority.high,
//   //   );

//   //   final notificationDetails = NotificationDetails(android: androidDetails);

//   //   await flutterLocalNotificationsPlugin.zonedSchedule(
//   //     id,
//   //     'تذكير بـ $medicineName',
//   //     'حان موعد تناول الدواء ${notes.isNotEmpty ? '($notes)' : ''}',
//   //     tzDateTime,
//   //     notificationDetails,
//   //     androidScheduleMode:
//   //         AndroidScheduleMode.exactAllowWhileIdle, // تأكد من تضمين هذا
//   //     uiLocalNotificationDateInterpretation:
//   //         UILocalNotificationDateInterpretation.absoluteTime,
//   //     matchDateTimeComponents: DateTimeComponents.dateAndTime,
//   //   );
//   // }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Notify {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FlutterTts flutterTts = FlutterTts();

  /// تهيئة الإشعارات
  static Future<void> initializeNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings);

    await flutterLocalNotificationsPlugin.initialize(initSettings);
    tz.initializeTimeZones();
    // استخدام توقيت الجهاز بشكل مباشر
    tz.setLocalLocation(
        tz.getLocation('Asia/Damascus')); // أو يمكنك تجربة 'UTC'
  }

  /// إعدادات النطق الصوتي
  static Future<void> speak(String text) async {
    await flutterTts.setLanguage("ar-SA");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  /// جدولة الإشعارات للأدوية من Firebase
  static Future<void> scheduleAllNotificationsFromFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("❌ لم يتم تسجيل الدخول.");
      return;
    }

    final now = tz.TZDateTime.now(tz.local); // ⏰ توقيت الجهاز الحقيقي

    final snapshot = await _firestore
        .collection('medications')
        .where('userId', isEqualTo: user.uid)
        .get();

    int notificationId = 0;

    for (var doc in snapshot.docs) {
      final data = doc.data();
      final name = data['name'] ?? 'دواء';
      final startDateStr = data['startDate'];
      final endDateStr = data['endDate'];
      final String notes = data['notes'] ?? '';
      final List<dynamic> doseTimes = data['doseTimes'];

      if (startDateStr == null || endDateStr == null || doseTimes.isEmpty) {
        continue;
      }

      final startDate = DateTime.parse(startDateStr);
      final endDate = DateTime.parse(endDateStr);

      for (DateTime date = startDate;
          !date.isAfter(endDate);
          date = date.add(const Duration(days: 1))) {
        for (String timeStr in doseTimes) {
          print("*******************************************");
          print("🔁 التاريخ الحالي في التكرار: $date");
          print("⏰ وقت الجرعة من Firestore: $timeStr");
          try {
            final timeParts = timeStr.split(':');
            final hour = int.parse(timeParts[0]);
            final minute = int.parse(timeParts[1]);

            // ⏳ استخدم توقيت الجهاز الحقيقي (tz)
            final scheduledDate = tz.TZDateTime(
              tz.local,
              date.year,
              date.month,
              date.day,
              hour,
              minute,
            );

            print("📅 التاريخ الكامل المجدول (TZ): $scheduledDate");
            print("🕒 الوقت الحالي (TZ): $now");

            if (scheduledDate.isAfter(now)) {
              print("✅ سيتم جدولة الإشعار في: $scheduledDate");
              await scheduleNotification(
                id: notificationId++,
                medicineName: name,
                notes: notes,
                dateTime: scheduledDate,
              );
            } else {
              print("❌ التاريخ المُحدد قديم ولن يتم جدولة الإشعار.");
            }
          } catch (e) {
            print("⚠️ خطأ في تحليل الوقت $timeStr: $e");
          }
        }
      }
    }
  }

  /// جدولة إشعار معين باستخدام توقيت الجهاز الحقيقي
  static Future<void> scheduleNotification({
    required int id,
    required String medicineName,
    required String notes,
    required DateTime dateTime,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      'channel_id',
      'Medicine Reminder',
      channelDescription: 'تذكير بتناول الأدوية',
      importance: Importance.max,
      priority: Priority.high,
    );

    final notificationDetails = NotificationDetails(android: androidDetails);

    final tzDateTime =
        tz.TZDateTime.from(dateTime, tz.local); // يعتمد على توقيت الجهاز

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'تذكير بـ $medicineName',
      'حان موعد تناول الدواء ${notes.isNotEmpty ? '($notes)' : ''}',
      tzDateTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // uiLocalNotificationDateInterpretation:
      //     UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      '🚀 إشعار فوري',
      'تم عرض هذا الإشعار مباشرة الآن!',
      notificationDetails,
    );
  }

  static Future<void> testNotification() async {
    final now = DateTime.now();
    final scheduled = now.add(Duration(seconds: 10));

    print("⏳ إشعار مجدول لـ: $scheduled");

    await flutterLocalNotificationsPlugin.zonedSchedule(
      10012,
      '🔔 إشعار اختبار',
      'تمت جدولة هذا الإشعار بعد 10 ثوانٍ',
      tz.TZDateTime.from(scheduled, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'test_channel_22',
          'اختبارات',
          channelDescription: 'قناة لاختبار الإشعارات',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // uiLocalNotificationDateInterpretation:
      //     UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, // اختياري
    );
  }

  static Future<void> testNotification1() async {
    final dateTime = DateTime.now().add(Duration(seconds: 10));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      1000,
      '🔔 اختبار فوري',
      'هذا إشعار تجريبي بعد 10 ثوانٍ',
      tz.TZDateTime.from(dateTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'test_channel',
          'اختبارات',
          channelDescription: 'قناة إشعارات للاختبار',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // uiLocalNotificationDateInterpretation:
      //     UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future<void> showInstantNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'instant_channel',
      'إشعارات فورية',
      channelDescription: 'قناة لاختبار الإشعارات الفورية',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      1,
      '🚀 إشعار فوري',
      'تم عرض هذا الإشعار مباشرة الآن!',
      notificationDetails,
    );
  }
}
