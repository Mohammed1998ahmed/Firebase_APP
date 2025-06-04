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
    this.validator,
    this.keyboardType,
  });
  final String? hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final IconData? icons;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator ?? null,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icons ?? Icons.email_outlined,
            color: ColorsApp.second_Text_Color_Black,
            size: 30,
          ),
          suffixIcon: suffixIcon ?? null,
          hintText: hintText ?? "عنوان البريد الإلكتروني",
          hintStyle: TextStyle(
              color: ColorsApp.second_Text_Color_Black,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp)),
    );
  }
}
