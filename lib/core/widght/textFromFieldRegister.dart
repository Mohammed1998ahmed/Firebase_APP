import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class TextFromFieldWidght extends StatelessWidget {
  const TextFromFieldWidght({
    super.key,
    this.controller,
    this.width,
    this.height,
    this.fillColor,
    this.radius,
    this.colorBorder,
    this.hintText,
    this.hintStyle,
    this.iconsuffix,
    this.validator,
    this.keyboardType,
  });
  final TextEditingController? controller;
  final double? width, height;
  final Color? fillColor;
  final double? radius;
  final Color? colorBorder;
  final String? hintText;
  final TextStyle? hintStyle;
  final IconData? iconsuffix;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 312.w,
      height: height ?? 50.h,
      child: Column(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              validator: validator ?? null,
              decoration: InputDecoration(
                  fillColor: fillColor ?? ColorsApp.fief_Text_Color_Black,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius ?? 10.0),
                    borderSide: BorderSide(color: ColorsApp.main_Color_Blue),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: ColorsApp.main_Color_Blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: colorBorder ?? ColorsApp.four_Text_Color_Black),
                  ),
                  hintText: hintText ?? "Email Addres",
                  hintTextDirection: TextDirection.ltr,
                  hintStyle: hintStyle ??
                      TextStyle(
                        color: ColorsApp.four_Text_Color_Black,
                        fontSize: 15.sp,
                      ),
                  suffixIcon: Icon(
                    iconsuffix ?? Icons.email_outlined,
                    color: ColorsApp.four_Text_Color_Black,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
