import 'package:firebase_app/core/router/routes.dart';
import 'package:firebase_app/feature/home/homepage.dart';
import 'package:firebase_app/feature/login/logic/cubit/login_cubit.dart';
import 'package:firebase_app/feature/medication/medication.dart';
import 'package:firebase_app/feature/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/add_medication/add_medication.dart';
import '../../feature/add_medication/logic/cubit/add_medication_cubit.dart';
import '../../feature/login/login.dart';
import '../../feature/register/register.dart';
import '../../feature/spalsh_page/ui/splash.dart';

class App_Route {
  Route generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.medicineAnimationScreen_page:
        return MaterialPageRoute(builder: (_) => MedicineAnimationScreen());
      case Routes.login_page:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: Login(),
                ));
      case Routes.register_page:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: Register(),
          ),
        );
      case Routes.home_page:
        return MaterialPageRoute(builder: (_) => Home_page());
      case Routes.home_page1:
        return MaterialPageRoute(builder: (_) => Home_page());
      case Routes.add_medication:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddMedicationCubit(),
                  child: AddMedicationScreen(),
                ));
      case Routes.medication:
        return MaterialPageRoute(builder: (_) => MedicationsListScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text(
                      "Not Fount Page",
                      style: TextStyle(
                          fontSize: 18.dg,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                  ),
                ));
    }
  }
}
