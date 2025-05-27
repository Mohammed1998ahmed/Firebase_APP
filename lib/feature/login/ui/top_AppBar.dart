import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../core/widght/Spacer.dart';

class Top_AppBar extends StatelessWidget {
  const Top_AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacerWidght(
          height: 50.h,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Login",
            style: TextStyle(
                color: ColorsApp.main_Color_Black,
                fontWeight: FontWeight.w400,
                fontSize: 40.sp),
          ),
        ),
        SpacerWidght(height: 14.h),
        Container(
          width: 233.w,
          height: 72.h,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              // النمط الأساسي
              children: [
                TextSpan(
                    text: "By signing in you are agreeing \n \nour ",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: ColorsApp.three_Text_Color_Black,
                        fontSize: 16.sp)),
                TextSpan(
                    text: " Term and privacy policy",
                    style: TextStyle(
                        color: ColorsApp.main_Color_Blue, fontSize: 16.sp)),
              ],
            ),
          ),
        ),
        SpacerWidght(
          height: 30.h,
        ),
      ],
    );
  }
}
