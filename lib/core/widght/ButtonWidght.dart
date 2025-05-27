import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class ElevatedButtonWidght extends StatelessWidget {
  const ElevatedButtonWidght({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.horizontal,
    this.vertical,
    this.radius,
    this.name,
  });
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? horizontal;
  final double? vertical;
  final double? radius;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? ColorsApp.main_Color_Blue, // تغيير لون الزر
        foregroundColor:
            foregroundColor ?? ColorsApp.colors1_Contanir, // تغيير لون النص
        padding: EdgeInsets.symmetric(
            horizontal: horizontal ?? 135.w,
            vertical: vertical ?? 15.h), // تعديل الأبعاد
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10), // تعديل الحواف
        ),
        elevation: 5, // تعديل الظل والارتفاع
      ),
      child: Text(
        name ?? "Login",
        style: TextStyle(
          fontSize: 18, // تعديل حجم الخط
          fontWeight: FontWeight.bold, // تعديل سمك الخط
        ),
      ),
    );
  }
}
