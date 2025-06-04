import 'package:firebase_app/core/theme/colors.dart';
import 'package:firebase_app/core/widght/ButtonWidght.dart';
import 'package:firebase_app/feature/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/widght/Spacer.dart';

class SelectSignIn extends StatelessWidget {
  const SelectSignIn({
    super.key,
    required this.registerCubit,
  });
  final RegisterCubit registerCubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state is RegisterLoading_Login
                  ? Lottie.asset(
                      'assets/images/Animationspalsh.json', // ضع ملف JSON هنا
                      width: 100.w,
                      height: 35.h,
                      repeat: true,
                    )
                  : ElevatedButtonWidght(
                      onPressed: () {
                        if (registerCubit.formKey.currentState!.validate()) {
                          registerCubit.signInWithEmailAndPassword(
                              email: registerCubit.controller_email.text,
                              password: registerCubit.controller_password.text,
                              context: context);
                        }
                      },
                      horizontal: 32.w,
                      vertical: 8.h,
                      radius: 30,
                      fontSize: 13,
                      width: 90.w,
                    ),
              SpacerWidght(
                width: 5.w,
              ),
              state is RegisterLoading
                  ? Lottie.asset(
                      'assets/images/Animationspalsh.json', // ضع ملف JSON هنا
                      width: 100.w,
                      height: 35.h,
                      repeat: true,
                    )
                  : ElevatedButtonWidght(
                      onPressed: () {
                        if (registerCubit.formKey.currentState!.validate()) {
                          registerCubit.createUserWithEmailAndPassword(
                              email: registerCubit.controller_email.text,
                              password: registerCubit.controller_password.text,
                              context: context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم التحقق بنجاح')),
                          );
                        }
                      },
                      horizontal: 32.w,
                      vertical: 8.h,
                      radius: 30,
                      name: "انشاء حساب",
                      foregroundColor: ColorsApp.main_Color_Blue,
                      backgroundColor: ColorsApp.colors1_Contanir,
                      fontSize: 14,
                      width: 90.w,
                    ),
            ],
          ),
        );
      },
    );
  }
}
