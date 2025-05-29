import 'package:bloc/bloc.dart';
import 'package:firebase_app/appRouters.dart';
import 'package:firebase_app/core/helper/bolc_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'core/router/app_Route.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  initializeNotifications();
  initializeTimeZone();
  runApp(App_Root(
    app_route: App_Route(),
  ));
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

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
