import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChickBoxR extends StatefulWidget {
  const ChickBoxR({super.key});

  @override
  State<ChickBoxR> createState() => _ChickBoxRState();
}

class _ChickBoxRState extends State<ChickBoxR> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
