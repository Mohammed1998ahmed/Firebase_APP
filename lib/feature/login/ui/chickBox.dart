import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChickBox extends StatefulWidget {
  const ChickBox({super.key});

  @override
  State<ChickBox> createState() => _ChickBoxState();
}

class _ChickBoxState extends State<ChickBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
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
            "تذكر كلمة المرور",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              "هل نسيت كلمة السر",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
