import 'package:firebase_app/core/theme/colors.dart';
import 'package:firebase_app/core/widght/Spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widght/circalarSignIn.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
                      ClipPath(
                        clipper: CustomClip(),
                        child: Container(
                          width: ScreenUtil().screenWidth,
                          height: 500.h,
                          decoration: BoxDecoration(
                              color: ColorsApp.colors1_Contanir,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0))),
                          child: Column(
                            children: [
                              SpacerWidght(
                                height: 10.h,
                              ),
                              Container(
                                width: 320.w,
                                height: 115,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Rectangle.png"),
                                        fit: BoxFit.cover)),
                              ),
                              SpacerWidght(height: 6.h),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Welcame",
                                  style: TextStyle(
                                      color: ColorsApp.main_Color_Black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 30.sp),
                                ),
                              ),
                              SpacerWidght(height: 6.h),
                              Container(
                                width: 233.w,
                                height: 50.h,
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    // النمط الأساسي
                                    children: [
                                      TextSpan(
                                          text:
                                              "By signing in you are agreeing our ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: ColorsApp
                                                  .three_Text_Color_Black,
                                              fontSize: 17.sp)),
                                      TextSpan(
                                          text: " Term and privacy policy",
                                          style: TextStyle(
                                              color: ColorsApp.main_Color_Blue,
                                              fontSize: 17.sp)),
                                    ],
                                  ),
                                ),
                              ),
                              SpacerWidght(
                                height: 5.h,
                              ),
                              SizedBox(
                                width: 312.w,
                                height: 50.h,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      fillColor:
                                          ColorsApp.fief_Text_Color_Black,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: ColorsApp.main_Color_Blue),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: ColorsApp.main_Color_Blue),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: ColorsApp
                                                .four_Text_Color_Black),
                                      ),
                                      hintText: "Email Addres",
                                      hintTextDirection: TextDirection.ltr,
                                      hintStyle: TextStyle(
                                        color: ColorsApp.four_Text_Color_Black,
                                        fontSize: 15.sp,
                                      ),
                                      suffixIcon: Icon(
                                        Icons.email_outlined,
                                        color: ColorsApp.four_Text_Color_Black,
                                      )),
                                ),
                              ),
                              SpacerWidght(
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 312.w,
                                height: 50.h,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      fillColor:
                                          ColorsApp.fief_Text_Color_Black,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: ColorsApp.main_Color_Blue),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: ColorsApp.main_Color_Blue),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: ColorsApp
                                                .four_Text_Color_Black),
                                      ),
                                      hintText: "Email Addres",
                                      hintTextDirection: TextDirection.ltr,
                                      hintStyle: TextStyle(
                                        color: ColorsApp.four_Text_Color_Black,
                                        fontSize: 15.sp,
                                      ),
                                      suffixIcon: Icon(
                                        Icons.email_outlined,
                                        color: ColorsApp.four_Text_Color_Black,
                                      )),
                                ),
                              ),
                              SpacerWidght(
                                height: 6.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Container(
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
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 382.h,
                        child: ClipPath(
                          clipper: CustomClip2(),
                          child: Container(
                            width: 375.w,
                            height: 420.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: ColorsApp.colors1_Contanir,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.black.withOpacity(0.3), // لون الظل
                                  spreadRadius: 15, // مدى انتشار الظل
                                  blurRadius: 15, // مقدار التمويه
                                  offset:
                                      Offset(0, 0), // اتجاه الظل (يمين وأسفل)
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 30.h),
                              child: Column(
                                children: [
                                  SpacerWidght(
                                    height: 50.h,
                                  ),
                                  Row(
                                    children: [
                                      Spacer(),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Forgot Password",
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  SpacerWidght(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorsApp
                                              .four_Color_Blue, // تغيير لون الزر
                                          foregroundColor: ColorsApp
                                              .colors1_Contanir, // تغيير لون النص
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 60.w,
                                              vertical: 10.h), // تعديل الأبعاد
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30), // تعديل الحواف
                                          ),
                                          elevation: 5, // تعديل الظل والارتفاع
                                        ),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 13, // تعديل حجم الخط
                                            fontWeight: FontWeight
                                                .bold, // تعديل سمك الخط
                                          ),
                                        ),
                                      ),
                                      SpacerWidght(
                                        width: 1.5.w,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorsApp
                                              .colors1_Contanir, // تغيير لون الزر
                                          foregroundColor: ColorsApp
                                              .colors1_Contanir, // تغيير لون النص
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 45.w,
                                              vertical: 6.h), // تعديل الأبعاد
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30), // تعديل الحواف
                                          ),
                                          elevation: 5, // تعديل الظل والارتفاع
                                        ),
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                              fontSize: 13, // تعديل حجم الخط
                                              fontWeight: FontWeight.bold,
                                              color: ColorsApp
                                                  .main_Color_Black // تعديل سمك الخط
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SpacerWidght(
                                    height: 10.h,
                                  ),
                                  Container(
                                    child: Text(
                                      "Login wit touch ID",
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
                                      "or connect with",
                                      style: TextStyle(
                                          color: ColorsApp.main_Color_Black,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SpacerWidght(
                                    height: 5.h,
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                          ),
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
