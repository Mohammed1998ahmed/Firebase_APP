import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

class ContainerWidght extends StatelessWidget {
  const ContainerWidght({
    super.key,
    this.name,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.alignment,
  });
  final String? name;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.center,
      child: Text(
        name ?? "دوائي",
        style: TextStyle(
            color: color ?? ColorsApp.main_Color_Black,
            fontWeight: fontWeight ?? FontWeight.w800,
            fontSize: fontSize ?? 35.sp),
      ),
    );
  }
}
