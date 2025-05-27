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
        Container(
          width: 320.w,
          height: 115,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Rectangle.png"),
                  fit: BoxFit.cover)),
        ),
        SpacerWidght(height: 6.h),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Welcame",
            style: TextStyle(
                color: ColorsApp.main_Color_Black,
                fontWeight: FontWeight.w400,
                fontSize: 30.sp),
          ),
        ),
        SpacerWidght(height: 6.h),
        Container(
          width: 233.w,
          height: 50.h,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              // النمط الأساسي
              children: [
                TextSpan(
                    text: "By signing in you are agreeing our ",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: ColorsApp.three_Text_Color_Black,
                        fontSize: 17.sp)),
                TextSpan(
                    text: " Term and privacy policy",
                    style: TextStyle(
                        color: ColorsApp.main_Color_Blue, fontSize: 17.sp)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
