import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Forgot_Password extends StatelessWidget {
  const Forgot_Password({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forgot Password",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
