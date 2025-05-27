import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class TextfromFieldWidght extends StatelessWidget {
  const TextfromFieldWidght({
    super.key,
    this.hintText,
    this.hintStyle,
    this.controller,
    this.suffixIcon,
    this.icons,
  });
  final String? hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final IconData? icons;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icons ?? Icons.email_outlined,
            color: ColorsApp.second_Text_Color_Black,
            size: 30,
          ),
          suffixIcon: suffixIcon ?? null,
          hintText: hintText ?? "Email Address",
          hintStyle: TextStyle(
              color: ColorsApp.second_Text_Color_Black,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp)),
    );
  }
}
