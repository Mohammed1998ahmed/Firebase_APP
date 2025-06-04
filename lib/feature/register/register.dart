import 'package:firebase_app/core/theme/colors.dart';
import 'package:firebase_app/feature/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/clipPath1.dart';
import 'ui/clipPath2.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = RegisterCubit.getObject(context);
        return Scaffold(
          backgroundColor: ColorsApp.main_Color_Blue,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 900.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: ScreenUtil().screenWidth,
                            height: 800.h,
                          ),
                          ClipPath1(
                            registerCubit: cubit,
                          ),
                          Positioned(
                            top: 382.h,
                            child: ClipPath2(
                              registerCubit2: cubit,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
