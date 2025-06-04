import 'package:firebase_app/core/theme/colors.dart';
import 'package:firebase_app/core/widght/Spacer.dart';
import 'package:firebase_app/feature/login/ui/chickBox.dart';
import 'package:firebase_app/feature/login/ui/top_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../core/widght/ButtonWidght.dart';
import '../../core/widght/textFromFieldLogin.dart';
import 'logic/cubit/login_cubit.dart';
import 'ui/buttonWidght.dart';
import 'ui/select_SignIn.dart';
import 'ui/signInOther.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = LoginCubit.getObject(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.w),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Top_AppBar(),
                        Select_SignIn(),
                        SpacerWidght(
                          height: 20.h,
                        ),
                        TextfromFieldWidght(
                          controller: cubit.controller_email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "الرجاء إدخال بريدك الإلكتروني.";
                            }
                            // تحقق من صحة البريد الإلكتروني
                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if (!emailRegex.hasMatch(value)) {
                              return "الرجاء إدخال بريدك الإلكتروني.";
                            }
                            return null;
                          },
                        ),
                        const SpacerWidght(
                          height: 25,
                        ),
                        TextfromFieldWidght(
                          controller: cubit.controller_password,
                          hintText: "كلمة المرور",
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "الرجاء إدخال كلمة المرور الخاصة بك.";
                            }
                            if (value.length < 6) {
                              return "يجب أن تتكون كلمة المرور من 6 أحرف على الأقل.";
                            }
                            return null;
                          },
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: ColorsApp.second_Text_Color_Black,
                            size: 30,
                          ),
                          icons: Icons.lock_outline_rounded,
                        ),
                        SpacerWidght(
                          height: 20.h,
                        ),
                        const ChickBox(),
                        SpacerWidght(
                          height: 20.h,
                        ),
                        state is LoginLoading
                            ? Lottie.asset(
                                'assets/images/Animationspalsh.json', // ضع ملف JSON هنا
                                width: 150.w,
                                height: 150.h,
                                repeat: true,
                              )
                            : ElevatedButtonWidght(
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.signInWithEmailAndPassword(
                                        email: cubit.controller_email.text,
                                        password:
                                            cubit.controller_password.text,
                                        context: context);
                                  }
                                },
                              ),
                        SpacerWidght(
                          height: 12.h,
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Text(
                            "أو تواصل مع",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorsApp.three_Text_Color_Black,
                                fontSize: 16.sp),
                          ),
                        ),
                        SpacerWidght(
                          height: 13.h,
                        ),
                        const SignInOther(),
                      ],
                    ),
                  ),
                ),
                const ButtonWidght()
              ],
            ),
          ),
        );
      },
    );
  }
}
