import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

class ButtonWidght extends StatelessWidget {
  const ButtonWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
