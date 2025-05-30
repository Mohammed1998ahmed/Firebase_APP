import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Notify {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FlutterTts flutterTts = FlutterTts();

  /// إعداد الإشعارات
  static Future<void> initializeNotifications() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initializationSettings = InitializationSettings(
      android: androidSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// إعدادات النطق الصوتي
  static Future<void> speak(String text) async {
    await flutterTts.setLanguage("ar-SA");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  /// تحويل الوقت لصيغة 12 ساعة
  static String normalizeTimeFormat(String timeStr) {
    try {
      DateTime dateTime = DateFormat('HH:mm').parse(timeStr);
      return DateFormat('hh:mm a').format(dateTime);
    } catch (e) {
      print('خطأ في تحليل الوقت: $timeStr - $e');
      return timeStr;
    }
  }

  /// الوظيفة الأساسية التي يتم استدعاؤها من WorkManager
  static Future<void> checkAndNotifyFromFirebase() async {
    final now = DateTime.now();
    // final today = DateFormat('yyyy-MM-dd').format(now);

    final snapshot = await _firestore.collection('medications').get();

    for (var doc in snapshot.docs) {
      final data = doc.data();
      final name = data['name'] ?? 'الدواء';
      final startDateStr = data['startDate'];
      final endDateStr = data['endDate'];
      final List<dynamic> doseTimes = data['doseTimes'];

      // تحقق من صلاحية التاريخ
      if (startDateStr == null || endDateStr == null || doseTimes == null)
        continue;

      DateTime startDate = DateTime.parse(startDateStr);
      DateTime endDate = DateTime.parse(endDateStr);
      if (now.isBefore(startDate) || now.isAfter(endDate)) continue;

      for (String timeStr in doseTimes) {
        try {
          DateTime doseTime = DateFormat('HH:mm').parse(timeStr);
          DateTime fullDoseDateTime = DateTime(
            now.year,
            now.month,
            now.day,
            doseTime.hour,
            doseTime.minute,
          );

          final difference = fullDoseDateTime.difference(now).inMinutes;

          if (difference >= 0 && difference <= 1) {
            await speak("يرجى تناول دواء $name الآن");
            await _showNotification(name, normalizeTimeFormat(timeStr));
          }
        } catch (e) {
          print("خطأ في تحليل الوقت $timeStr: $e");
        }
      }
    }
  }

  /// إرسال إشعار لجرعة معينة
  static Future<void> _showNotification(
      String medicineName, String timeStr) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'Medicine Reminder',
      channelDescription: 'تذكير بتناول الأدوية',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'تذكير بـ $medicineName',
      'حان موعد الدواء الساعة $timeStr',
      notificationDetails,
    );
  }
}

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

void initializeNotifications() {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initSettings =
      InitializationSettings(android: androidSettings);

  flutterLocalNotificationsPlugin.initialize(initSettings);
}

void initializeTimeZone() {
  tz.initializeTimeZones();
  tz.setLocalLocation(
      tz.getLocation('Asia/Damascus')); // استبدل بالمنطقة الزمنية المناسبة
}
////// background

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    await Firebase.initializeApp();
    await Notify.checkAndNotifyFromFirebase();
    return Future.value(true);
  });
}
