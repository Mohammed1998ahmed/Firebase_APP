import 'package:firebase_app/feature/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../core/widght/Spacer.dart';
import 'forgot_Password.dart';
import 'selectSignIn.dart';
import 'signInByOther.dart';

class ClipPath2 extends StatelessWidget {
  const ClipPath2({
    super.key,
    required this.registerCubit2,
  });
  final RegisterCubit registerCubit2;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ClipPath(
          clipper: CustomClip2(),
          child: Container(
            width: 375.w,
            height: 420.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: ColorsApp.colors1_Contanir,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpacerWidght(
                      height: 50.h,
                    ),
                    Forgot_Password(),
                    SpacerWidght(
                      height: 10.h,
                    ),
                    SelectSignIn(
                      registerCubit: registerCubit2,
                    ),
                    SpacerWidght(
                      height: 10.h,
                    ),
                    Container(
                      child: Text(
                        "تسجيل الدخول باستخدام معرف اللمس",
                        style: TextStyle(
                            color: ColorsApp.main_Color_Black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SpacerWidght(
                      height: 10.h,
                    ),
                    Container(
                      width: 69.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorsApp.four_Color_Blue,
                      ),
                      child: Icon(
                        Icons.fingerprint,
                        color: ColorsApp.colors1_Contanir,
                        size: 50,
                      ),
                    ),
                    SpacerWidght(
                      height: 3.h,
                    ),
                    Container(
                      child: Text(
                        "أو تواصل مع",
                        style: TextStyle(
                            color: ColorsApp.main_Color_Black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SpacerWidght(
                      height: 5.h,
                    ),
                    SignInByOther(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // البدء من الزاوية العلوية اليسرى
    path.lineTo(0, size.height * 0.40);
    path.quadraticBezierTo(
        0, size.height * 0.33, size.width * 0.15, size.height * 0.28);

    // رسم خط مستقيم إلى الزاوية العلوية اليمنى
    path.lineTo(size.width, 0);

    // // إنشاء منحنى أو قص عند الطرف العلوي
    // path.quadraticBezierTo(
    //     size.width * 0.98, size.height * 0.10, size.width, size.height * 0.15);

    // إكمال الشكل إلى الزاوية السفلية اليمنى
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
