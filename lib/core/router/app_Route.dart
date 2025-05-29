import 'package:firebase_app/core/router/routes.dart';
import 'package:firebase_app/feature/home/home.dart';
import 'package:firebase_app/feature/home/homepage.dart';
import 'package:firebase_app/feature/login/logic/cubit/login_cubit.dart';
import 'package:firebase_app/feature/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/add_medication/ui/add_medication.dart';
import '../../feature/login/login.dart';
import '../../feature/register/register.dart';

class App_Route {
  Route generatorRoute(RouteSettings settings) {
    switch (settings.name) {
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
        return MaterialPageRoute(builder: (_) => Home());
      case Routes.home_page1:
        return MaterialPageRoute(builder: (_) => Home_page());
      case Routes.add_medication:
        return MaterialPageRoute(builder: (_) => AddMedicationScreen());
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
