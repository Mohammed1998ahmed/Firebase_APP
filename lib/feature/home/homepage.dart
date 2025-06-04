import 'package:firebase_app/core/helper/extension.dart';
import 'package:firebase_app/core/router/routes.dart';
import 'package:firebase_app/core/theme/colors.dart';
import 'package:firebase_app/core/widght/ButtonWidght.dart';
import 'package:firebase_app/core/widght/Spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/continarWidght.dart';
import 'ui/next_Dose.dart';
import 'ui/the_Dose_Ttaken.dart';
import 'ui/top_AppBar.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              topAppBar(
                context: context,
              ),
              ContainerWidght(),
              SpacerWidght(
                height: 15.h,
              ),
              next_Dose(),
              SpacerWidght(
                height: 20.h,
              ),
              ElevatedButtonWidght(
                onPressed: () {
                  context.pushNamed(Routes.add_medication);
                },
                horizontal: 145.h,
                name: "اضافة دواء",
              ),
              SpacerWidght(
                height: 20.h,
              ),
              ContainerWidght(
                alignment: Alignment.centerLeft,
                name: " التفاصيل",
                color: ColorsApp.main_Color_Black,
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
              ),
              ContainerWidght(
                alignment: Alignment.center,
                name: 'تفاصيل الدواء',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
              SpacerWidght(
                height: 20.h,
              ),
              the_Dose_Ttaken(),
              SpacerWidght(
                height: 20.h,
              ),
              // زر التأكيد
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // قم بتسجيل التأكيد في Firebase
                  },
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text(
                    'تم تناول الدواء',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
