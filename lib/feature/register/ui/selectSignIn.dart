import 'package:firebase_app/core/theme/colors.dart';
import 'package:firebase_app/core/widght/ButtonWidght.dart';
import 'package:firebase_app/feature/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widght/Spacer.dart';

class SelectSignIn extends StatelessWidget {
  const SelectSignIn({
    super.key,
    required this.registerCubit,
  });
  final RegisterCubit registerCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButtonWidght(
          onPressed: () {
            if (registerCubit.formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم التحقق بنجاح')),
              );
            }
          },
          horizontal: 50.w,
          vertical: 8.h,
          radius: 30,
          fontSize: 13,
        ),
        SpacerWidght(
          width: 1.5.w,
        ),
        ElevatedButtonWidght(
          onPressed: () {
            if (registerCubit.formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم التحقق بنجاح')),
              );
            }
            if (registerCubit.formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم التحقق بنجاح')),
              );
            }
          },
          horizontal: 42.w,
          vertical: 8.h,
          radius: 30,
          name: "Register",
          foregroundColor: ColorsApp.main_Color_Blue,
          backgroundColor: ColorsApp.colors1_Contanir,
          fontSize: 13,
        ),
      ],
    );
  }
}
