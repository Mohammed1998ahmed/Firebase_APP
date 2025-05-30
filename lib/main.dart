import 'package:bloc/bloc.dart';
import 'package:firebase_app/appRouters.dart';
import 'package:firebase_app/core/helper/bolc_services.dart';
import 'package:firebase_app/notify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'core/router/app_Route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  initializeNotifications();
  initializeTimeZone();
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  await Workmanager().registerPeriodicTask(
    "med_check_task", // اسم المهمة
    "med_check_task",
    frequency: Duration(minutes: 15), // الحد الأدنى على أندرويد
    initialDelay: Duration(seconds: 10),
    constraints: Constraints(
      networkType: NetworkType.connected, // نحتاج الاتصال بالإنترنت
    ),
  );
  // Notify.initializeTimeZones();
  runApp(App_Root(
    app_route: App_Route(),
  ));
}
