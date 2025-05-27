import 'package:firebase_app/feature/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../core/widght/Spacer.dart';
import '../../../core/widght/textFromFieldRegister.dart';
import 'chickBox.dart';
import 'top_AppBar.dart';

class ClipPath1 extends StatefulWidget {
  const ClipPath1({
    super.key,
    required this.registerCubit,
  });
  final RegisterCubit registerCubit;

  @override
  State<ClipPath1> createState() => _ClipPath1State();
}

class _ClipPath1State extends State<ClipPath1> {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني';
    }
    // تحقق من صحة البريد الإلكتروني
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'البريد الإلكتروني غير صحيح';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClip(),
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 500.h,
        decoration: BoxDecoration(
            color: ColorsApp.colors1_Contanir,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))),
        child: Form(
          key: widget.registerCubit.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpacerWidght(
                  height: 10.h,
                ),
                Top_AppBar(),
                SpacerWidght(
                  height: 5.h,
                ),
                TextFromFieldWidght(
                  height: widget.registerCubit.valdatorTextEmail ? 80.h : 50.h,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        widget.registerCubit.chaingeBoolean_EmailT();
                      });
                      return "Please enter your email.";
                    }
                    // تحقق من صحة البريد الإلكتروني
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                      setState(() {
                        widget.registerCubit.chaingeBoolean_EmailT();
                      });
                      return "The email is invalid.";
                    }
                    setState(() {
                      widget.registerCubit.chaingeBoolean_EmailF();
                    });
                    return null;
                  },
                ),
                SpacerWidght(
                  height: 20.h,
                ),
                TextFromFieldWidght(
                  height:
                      widget.registerCubit.valdatorTextPassword ? 80.h : 50.h,
                  hintText: "Password",
                  iconsuffix: Icons.remove_red_eye_outlined,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        widget.registerCubit.chaingeBoolean_PasswprdT();
                      });
                      return "Please enter your password.";
                    }
                    if (value.length < 6) {
                      setState(() {
                        widget.registerCubit.chaingeBoolean_PasswprdT();
                      });
                      return "Password must be at least 6 characters long.";
                    }
                    setState(() {
                      widget.registerCubit.chaingeBoolean_PasswordF();
                    });
                    return null;
                  },
                ),
                SpacerWidght(
                  height: 6.h,
                ),
                ChickBoxR(),
                SpacerWidght(
                  height: 60.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // البدء من الزاوية العلوية اليسرى
    path.lineTo(0, size.height);

    // رسم زاوية حادة في الزاوية السفلية اليسرى
    path.lineTo(size.width * 0.93, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.74, size.width, size.height * 0.70);
    // رسم منحنى سلس باتجاه الزاوية السفلية اليمنى
    // path.quadraticBezierTo(
    //     size.width * 0.95, size.height * 0.75, size.width, size.height * 0.70);

    // إنهاء الشكل عند الزاوية العلوية اليمنى
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
