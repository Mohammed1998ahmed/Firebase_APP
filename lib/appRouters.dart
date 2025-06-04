import 'package:firebase_app/core/helper/shared_phreferance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/app_Route.dart';
import 'core/router/routes.dart';

class App_Root extends StatelessWidget {
  const App_Root({super.key, required this.app_route});
  final App_Route app_route;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'First App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl, // ضبط الاتجاه إلى اليمين
            child: child!,
          );
        },
        initialRoute: SharedPreferencesService().getBool(key: "user") == true
            ? Routes.home_page
            : Routes.medicineAnimationScreen_page,
        onGenerateRoute: app_route.generatorRoute,
      ),
    );
  }
}
