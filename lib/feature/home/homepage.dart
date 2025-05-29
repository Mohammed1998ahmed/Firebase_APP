import 'package:firebase_app/core/helper/extension.dart';
import 'package:firebase_app/core/router/routes.dart';
import 'package:firebase_app/core/theme/colors.dart';
import 'package:firebase_app/core/widght/ButtonWidght.dart';
import 'package:firebase_app/core/widght/Spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "دوائي",
                style: TextStyle(
                    color: ColorsApp.main_Color_Black,
                    fontWeight: FontWeight.w800,
                    fontSize: 35.sp),
              ),
            ),
            SpacerWidght(
              height: 15.h,
            ),
            Container(
              width: 400.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: ColorsApp.sax_Color_Blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SpacerWidght(
                    width: 20.w,
                  ),
                  Icon(
                    Icons.notifications_active,
                    size: 60.dg,
                    color: ColorsApp.three_Color_Blue,
                  ),
                  SpacerWidght(
                    width: 30.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "جرعة قادمة",
                          style: TextStyle(
                              color: ColorsApp.main_Color_Black,
                              fontWeight: FontWeight.w600,
                              fontSize: 25.sp),
                        ),
                      ),
                      Container(
                        child: Text(
                          "ص",
                          style: TextStyle(
                              color: ColorsApp.main_Color_Black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp),
                        ),
                      )
                    ],
                  ),
                  SpacerWidght(
                    width: 60.w,
                  ),
                  Container(
                    child: Text(
                      "8:00 ص",
                      style: TextStyle(
                          color: ColorsApp.main_Color_Black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp),
                    ),
                  ),
                ],
              ),
            ),
            SpacerWidght(
              height: 20.h,
            ),
            ElevatedButtonWidght(
              onPressed: () {
                context.pushNamed(Routes.add_medication);
              },
              horizontal: 145.h,
              name: "اضافة دواء",
            ),
            SpacerWidght(
              height: 20.h,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                " التفاصيل",
                style: TextStyle(
                    color: ColorsApp.main_Color_Black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp),
              ),
            ),
            Center(
              child: Text(
                'تفاصيل الدواء',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // بطاقة معلومات الدواء
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.medication, color: Colors.red, size: 30),
                      const SizedBox(width: 10),
                      Text(
                        'بانادول',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '8:00 ص',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('مرة واحدة يومياً'),
                  const Divider(height: 24),

                  // معلومات إضافية
                  _infoRow('الكمية', 'قرص واحد'),
                  _infoRow('المدة', '5 أيام'),
                  _infoRow('نوع الجرعة', 'عن طريق الفم'),
                  _infoRow('ملاحظات الطبيب', 'يُؤخذ بعد الأكل'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // زر التأكيد
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // قم بتسجيل التأكيد في Firebase
                },
                icon: const Icon(Icons.check, color: Colors.white),
                label: const Text(
                  'تم تناول الدواء',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // عنصر صف للمعلومة
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}
