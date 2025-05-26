import 'package:firebase_app/core/theme/colors.dart';
import 'package:firebase_app/core/widght/Spacer.dart';
import 'package:firebase_app/core/widght/circalarSignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpacerWidght(
                    height: 50.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: ColorsApp.main_Color_Black,
                          fontWeight: FontWeight.w400,
                          fontSize: 40.sp),
                    ),
                  ),
                  SpacerWidght(height: 14.h),
                  Container(
                    width: 233.w,
                    height: 72.h,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        // النمط الأساسي
                        children: [
                          TextSpan(
                              text: "By signing in you are agreeing \n \nour ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: ColorsApp.three_Text_Color_Black,
                                  fontSize: 16.sp)),
                          TextSpan(
                              text: " Term and privacy policy",
                              style: TextStyle(
                                  color: ColorsApp.main_Color_Blue,
                                  fontSize: 16.sp)),
                        ],
                      ),
                    ),
                  ),
                  SpacerWidght(
                    height: 30.h,
                  ),
                  Container(
                    height: 35.h,
                    width: ScreenUtil().screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: ColorsApp.main_Color_Blue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.sp),
                              ),
                            ),
                            SpacerWidght(
                              height: 2.h,
                            ),
                            Container(
                              width: 48.w,
                              height: 1.h,
                              color: ColorsApp.main_Color_Blue,
                            )
                          ],
                        ),
                        SpacerWidght(
                          width: 30.w,
                        ),
                        Container(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: ColorsApp.second_Text_Color_Black,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpacerWidght(
                    height: 20.h,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: ColorsApp.second_Text_Color_Black,
                          size: 30,
                        ),
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                            color: ColorsApp.second_Text_Color_Black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp)),
                  ),
                  SpacerWidght(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: ColorsApp.second_Text_Color_Black,
                          size: 30,
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: ColorsApp.second_Text_Color_Black,
                          size: 30,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: ColorsApp.second_Text_Color_Black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp)),
                  ),
                  SpacerWidght(
                    height: 20.h,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked = newValue ?? false;
                            });
                          },
                        ),
                        Text(
                          "Remember password",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  SpacerWidght(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ColorsApp.main_Color_Blue, // تغيير لون الزر
                      foregroundColor:
                          ColorsApp.colors1_Contanir, // تغيير لون النص
                      padding: EdgeInsets.symmetric(
                          horizontal: 135.w, vertical: 15.h), // تعديل الأبعاد
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // تعديل الحواف
                      ),
                      elevation: 5, // تعديل الظل والارتفاع
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18, // تعديل حجم الخط
                        fontWeight: FontWeight.bold, // تعديل سمك الخط
                      ),
                    ),
                  ),
                  SpacerWidght(
                    height: 12.h,
                  ),
                  Container(
                    child: Text(
                      "or connect with",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: ColorsApp.three_Text_Color_Black,
                          fontSize: 16.sp),
                    ),
                  ),
                  SpacerWidght(
                    height: 13.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularWidght(
                        assetName: 'assets/images/f.png',
                        color: ColorsApp.circular_1,
                      ),
                      CircularWidght(
                        assetName: 'assets/images/in.png',
                        color: ColorsApp.circular_1,
                      ),
                      CircularWidght(
                        assetName: 'assets/images/p.png',
                        color: ColorsApp.circular_2,
                      ),
                      CircularWidght(
                        assetName: 'assets/images/in.png',
                        color: ColorsApp.circular_3,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: 219.5.h,
                ),
                Positioned(
                  left: 55.w,
                  bottom: 20.h,
                  child: Container(
                    alignment: Alignment.center,
                    width: 300.w,
                    height: 219.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/buttom.png"))),
                  ),
                ),
                Positioned(
                  top: 85.h,
                  child: ClipPath(
                    clipper: ConcaveClipper(),
                    child: Container(
                      width: 414.w,
                      height: 150.h,
                      color: ColorsApp.three_Color_Blue,
                    ),
                  ),
                ),
                Positioned(
                  left: 165.w,
                  top: 100.h,
                  child: Container(
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width / 2, 90, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
