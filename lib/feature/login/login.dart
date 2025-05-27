import 'package:firebase_app/core/theme/colors.dart';
import 'package:firebase_app/core/widght/Spacer.dart';
import 'package:firebase_app/feature/login/ui/chickBox.dart';
import 'package:firebase_app/feature/login/ui/top_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widght/ButtonWidght.dart';
import '../../core/widght/textFromFieldLogin.dart';
import 'ui/buttonWidght.dart';
import 'ui/select_SignIn.dart';
import 'ui/signInOther.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Top_AppBar(),
                  Select_SignIn(),
                  SpacerWidght(
                    height: 20.h,
                  ),
                  const TextfromFieldWidght(),
                  const SpacerWidght(
                    height: 25,
                  ),
                  const TextfromFieldWidght(
                    hintText: "Password",
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: ColorsApp.second_Text_Color_Black,
                      size: 30,
                    ),
                    icons: Icons.lock_outline_rounded,
                  ),
                  SpacerWidght(
                    height: 20.h,
                  ),
                  const ChickBox(),
                  SpacerWidght(
                    height: 20.h,
                  ),
                  ElevatedButtonWidght(
                    onPressed: () {},
                  ),
                  SpacerWidght(
                    height: 12.h,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Text(
                      "or connect with",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: ColorsApp.three_Text_Color_Black,
                          fontSize: 16.sp),
                    ),
                  ),
                  SpacerWidght(
                    height: 13.h,
                  ),
                  const SignInOther(),
                ],
              ),
            ),
            const ButtonWidght()
          ],
        ),
      ),
    );
  }
}
