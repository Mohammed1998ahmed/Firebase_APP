import 'package:bloc/bloc.dart';
import 'package:firebase_app/appRouters.dart';
import 'package:firebase_app/core/helper/bolc_services.dart';
import 'package:firebase_app/core/helper/shared_phreferance.dart';
import 'package:firebase_app/notify.dart';
// import 'package:firebase_app/notify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:workmanager/workmanager.dart';
import 'core/router/app_Route.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesService().init();

  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  // initializeNotifications();

  await Permission.notification.request();
  // initializeTimeZone();
  await Notify.initializeNotifications();
  await Notify.testNotification();
  // await Notify.showInstantNotification();

  // إذا التطبيق مفتوح، نتحقق كل دقيقة
  // Timer.periodic(Duration(minutes: 1), (timer) {
  //   Notify.checkAndNotifyFromFirebase();
  // });

  // // إذا التطبيق بالخلفية، نستخدم Workmanager
  // await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  // await Workmanager().registerPeriodicTask(
  //   "med_check_task", // معرف المهمة
  //   "med_check_task",
  //   frequency: Duration(minutes: 15), // أقل وقت مسموح
  //   initialDelay: Duration(seconds: 10),
  //   constraints: Constraints(
  //     networkType: NetworkType.connected,
  //   ),
  // );

  runApp(App_Root(
    app_route: App_Route(),
  ));
}

// void initializeTimeZone() {
//   tz.initializeTimeZones();
//   tz.setLocalLocation(
//       tz.getLocation('Asia/Damascus')); // استبدل بالمنطقة الزمنية المناسبة
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:permission_handler/permission_handler.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeNotifications();
//   runApp(const MyApp());
// }

// Future<void> initializeNotifications() async {
//   // 🧭 تهيئة المنطقة الزمنية
//   tz.initializeTimeZones();
//   tz.setLocalLocation(tz.getLocation('Asia/Damascus'));

//   // 🛡️ طلب صلاحية الإشعارات
//   await Permission.notification.request();

//   const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
//   const initSettings = InitializationSettings(android: androidInit);

//   await flutterLocalNotificationsPlugin.initialize(initSettings);
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'تجربة إشعار مؤقت',
//       home: const MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   void _scheduleNotification() async {
//     // final now = DateTime.now();
//     // final scheduled = now.add(const Duration(seconds: 15)); // بعد 15 ثانية
//     final now = DateTime.now();
//     final scheduled = now.add(Duration(seconds: 10));
//     final tzScheduled = tz.TZDateTime.from(scheduled, tz.local);

//     print('📆 سيتم إصدار الإشعار عند: $tzScheduled');

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       999,
//       '🚨 اختبار جدولة',
//       'هل سيظهر هذا الإشعار بعد 10 ثواني؟',
//       tz.TZDateTime.from(scheduled, tz.local),
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           'test_channel',
//           'اختبار',
//           channelDescription: 'تجربة إشعار مجدول',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('🔔 إشعار مؤقت')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _scheduleNotification,
//           child: const Text('جدولة إشعار بعد 15 ثانية'),
//         ),
//       ),
//     );
//   }
// }
