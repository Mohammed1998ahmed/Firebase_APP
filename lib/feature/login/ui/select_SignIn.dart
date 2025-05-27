import 'package:firebase_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widght/Spacer.dart';

class Select_SignIn extends StatelessWidget {
  const Select_SignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: ScreenUtil().screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: ColorsApp.main_Color_Blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp),
                ),
              ),
              SpacerWidght(
                height: 2.h,
              ),
              Container(
                width: 48.w,
                height: 1.h,
                color: ColorsApp.main_Color_Blue,
              )
            ],
          ),
          SpacerWidght(
            width: 30.w,
          ),
          Container(
            child: Text(
              "Register",
              style: TextStyle(
                  color: ColorsApp.second_Text_Color_Black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
